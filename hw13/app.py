from flask import Flask
from src.routes import register_routes
from src.storage import init_storage

app = Flask(__name__)

init_storage()
register_routes(app)

if __name__ == "__main__":
    app.run(debug=True)