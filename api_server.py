from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "message": "Baby AI backend is running!"
    })

@app.route("/chat", methods=["POST"])
def chat():
    data = request.get_json(silent=True) or {}
    message = data.get("message", "").lower()

    if "hello" in message:
        reply = "Hello! I'm Baby AI. Nice to meet you."
    elif "name" in message:
        reply = "My name is Baby AI."
    else:
        reply = "I'm currently running in offline mode."

    return jsonify({"reply": reply})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
