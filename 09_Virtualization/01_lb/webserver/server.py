import http.server
import socket

PORT = 8000

class MyHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text")
        self.end_headers()
        hostname = socket.gethostname()
        self.wfile.write(f"Hello from {hostname}\n".encode())

if __name__ == '__main__':
    try:
        server = http.server.HTTPServer(('0.0.0.0', PORT), MyHandler)
        print('Started http server')
        server.serve_forever()
    except KeyboardInterrupt:
        print('^C received, shutting down server')
        server.socket.close()