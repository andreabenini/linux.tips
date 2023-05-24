import socket
import http.server
import socketserver
from http import HTTPStatus

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(HTTPStatus.OK)
        self.end_headers()
        hostName = socket.gethostname()
        hostIP   = socket.gethostbyname(hostName)
        self.wfile.write(bytes('Hello World [{}: {}]\n'.format(hostName, hostIP), 'UTF-8'))

httpd = socketserver.TCPServer(('', 7070), Handler)
httpd.serve_forever()
