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

    if "hello" in message or "hi" in message:
        reply = "Hello! I'm Baby AI. How can I help you today?"

    elif "your name" in message:
        reply = "My name is Baby AI. I'm your personal AI assistant."

    elif "time" in message:
        from datetime import datetime
        reply = "Current server time is " + datetime.now().strftime("%H:%M")

    elif "date" in message:
        from datetime import datetime
        reply = "Today's date is " + datetime.now().strftime("%B %d, %Y")

    elif "thank" in message:
        reply = "You're welcome."

    else:
        reply = (
            "I understood your message, but I'm not yet connected to a large language model. "
            "Once connected to OpenAI or another AI model, I'll answer intelligently."
        )

    return jsonify({"reply": reply})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
