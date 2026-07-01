from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "name": "Baby AI",
        "status": "online",
        "message": "Baby AI backend is running!"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
