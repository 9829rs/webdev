from flask import Flask, request, jsonify, render_template
import MySQLdb

app = Flask(__name__)

# Database connection
db = MySQLdb.connect(host="localhost", user="root", passwd="yourpassword", db="food_delivery_db")

@app.route('/')
def index():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM food_items")
    items = cursor.fetchall()
    return render_template('index.html', items=items)

@app.route('/order', methods=['POST'])
def order():
    order_details = request.form
    cursor = db.cursor()
    for item_id in order_details.getlist('item_ids'):
        cursor.execute("INSERT INTO orders (item_id) VALUES (%s)", (item_id,))
    db.commit()
    return "Order placed successfully!"

@app.route('/admin', methods=['GET'])
def admin():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM orders")
    orders = cursor.fetchall()
    return render_template('admin.html', orders=orders)

if __name__ == '__main__':
    app.run(debug=True)
