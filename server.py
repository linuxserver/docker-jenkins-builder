#!/usr/bin/env python

from http.server import BaseHTTPRequestHandler,HTTPServer

class Hello(BaseHTTPRequestHandler):
  def do_GET(serv):
    serv.send_response(200)
    serv.send_header('Content-type', 'text/html; charset=utf-8')
    serv.end_headers()
    serv.wfile.write(bytes('''
      <!DOCTYPE html>
      <html>
        <head>
          <style>
            * {margin:0;padding:0;}
            #main {
              height:100vh;
              width:100vw;
              display:table-cell;
              vertical-align:middle;
              text-align:center;
              color:#ffffff;font-size:80px;
              font-weight:bold;
              background-image:linear-gradient(to bottom right, #e68523, black);
            }
          </style>
        </head>
        <body>
          <div id="main"> 
            LINUXSERVER CI PAGE
          </div>
        </body>
      </html>
      ''', "utf8"))

server = ('0.0.0.0', 8000)
httpd = HTTPServer(server, Hello)
httpd.serve_forever()
