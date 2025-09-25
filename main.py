import os
import threading
from http.server import BaseHTTPRequestHandler, HTTPServer
from bot import Bot

# --- HTTP server for Render ---
class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Bot is running")

def run_http_server():
    port = int(os.getenv("PORT", 8080))  # Render gives PORT via env var
    server = HTTPServer(("", port), SimpleHandler)
    server.serve_forever()

# --- Start HTTP server in background + bot ---
if __name__ == "__main__":
    threading.Thread(target=run_http_server, daemon=True).start()
    app = Bot()
    app.run()
