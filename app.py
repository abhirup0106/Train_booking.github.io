from flask import Flask, jsonify, request, render_template
import mysql.connector

app = Flask(__name__)

# Connect to the MySQL database
try:
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Abhirup12345",
        database="train_booking",
        port=3307
    )
    cursor = db.cursor(dictionary=True)
except mysql.connector.Error as err:
    print(f"Error while connecting to MySQL: {err}")
    exit(1)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/status', methods=['GET'])
def status():
    cursor.execute("SELECT * FROM seats ORDER BY row_num, seat_id")
    seats = cursor.fetchall()
    return jsonify(seats)

@app.route('/reserve', methods=['POST'])
def reserve():
    seat_count = request.json.get('seats')
    if not seat_count or seat_count < 1:
        return jsonify({"error": "Invalid seat count"}), 400

    cursor.execute("SELECT * FROM seats WHERE status = 'available' ORDER BY row_num, seat_id")
    available_seats = cursor.fetchall()

    if len(available_seats) < seat_count:
        return jsonify({"error": "Not enough seats available"}), 400

    reserved_seats = [seat['seat_id'] for seat in available_seats[:seat_count]]
    cursor.executemany("UPDATE seats SET status = 'reserved' WHERE seat_id = %s", [(seat_id,) for seat_id in reserved_seats])
    db.commit()

    return jsonify({"reserved_seats": reserved_seats})

if __name__ == '__main__':
    app.run(debug=True)
