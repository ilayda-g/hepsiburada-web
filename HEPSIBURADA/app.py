from flask import Flask, render_template, request
from config import DATABASE_CONFIG
import mysql.connector

app = Flask(__name__)

'''
# Veritabanı bağlantısı
def get_db_connection():
    return mysql.connector.connect(**DATABASE_CONFIG)
'''

# Veritabanı bağlantısı
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="12345678",
    database="e_ticaret"
)


@app.route('/products')
def products():
    # Ürünleri veritabanından çekme ve ilk fotoğrafı ekleme
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT p.*, pi.image_url 
        FROM products p 
        LEFT JOIN (
            SELECT product_id, MIN(id) AS first_image_id 
            FROM product_images 
            GROUP BY product_id
        ) pi_id ON p.id = pi_id.product_id
        LEFT JOIN product_images pi ON pi_id.first_image_id = pi.id
    """)
    products = cursor.fetchall()
    cursor.close()
    
    # HTML şablonuna ürünleri geçirme
    return render_template('products.html', products=products)

# Flask uygulamanızdaki app.py (veya diğer adı) dosyasında:


@app.route('/search')
def search():
    # Kullanıcının arama sorgusunu alın
    query = request.args.get('query')

    if not query:
        query = ""  # Varsayılan değer olarak boş bir dize atıyoruz

    # Veritabanında arama yapmak için gereken kodu buraya ekleyin
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT p.*, pi.image_url 
        FROM products p 
        LEFT JOIN (
            SELECT product_id, MIN(id) AS first_image_id 
            FROM product_images 
            GROUP BY product_id
        ) pi_id ON p.id = pi_id.product_id
        LEFT JOIN product_images pi ON pi_id.first_image_id = pi.id
        WHERE p.name LIKE %s OR p.description LIKE %s OR p.category LIKE %s
    """, ('%' + query + '%', '%' + query + '%', '%' + query + '%'))

    search_results = cursor.fetchall()

    # Kategorileri ve ürünleri al
    cursor.execute("SELECT * FROM categories")
    categories = cursor.fetchall()

    # Yarın Kapımda
    selected_location = request.args.get('location')

    # Konuma göre ürünleri filtrelemek için veritabanı sorgusu
    if selected_location:
        cursor.execute("SELECT * FROM products WHERE location = %s", (selected_location,))
        products = cursor.fetchall()
    else:
        cursor.execute("SELECT * FROM products")
        products = cursor.fetchall()


    cursor.close()

    # Arama sonuçlarını HTML şablonuna geçirin ve göstermek için render edin
    return render_template('search.html', search_results=search_results, categories=categories)


@app.route('/detail/<int:product_id>')
def detail(product_id):
    # Seçilen ürünün detaylarını veritabanından çekme
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products WHERE id = %s", (product_id,))
    product = cursor.fetchone()

    # Ürünün fotoğraflarını product_images tablosundan çekme
    cursor.execute("SELECT image_url FROM product_images WHERE product_id = %s", (product_id,))
    image_records = cursor.fetchall()
    images = [record['image_url'] for record in image_records]
    
    cursor.close()

    # HTML şablonuna ürün detaylarını ve fotoğraflarını geçirme
    return render_template('detail.html', product=product, images=images)



@app.route('/')
def index():
    # Veritabanından fotoğraf URL'lerini al
    cursor = conn.cursor()
    cursor.execute("SELECT photo_url FROM slideshow_photos")
    photo_urls = [row[0] for row in cursor.fetchall()]
    cursor.close()
    
    # HTML şablonuna fotoğraf URL'lerini geçir
    return render_template('index.html', photo_urls=photo_urls)


if __name__ == '__main__':
    app.run(debug=True)
