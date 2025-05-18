import sys
import socket
from datetime import datetime

#Define the target
t1 = datetime.now()

if (len(sys.argv) == 2):
  TARGET = socket.gethostbyname(sys.argv[1])  #Translate the hostname to ipv4
else:
  print('Invalid amount of arguments')
  print('Syntax : ipscanner <ip>')

#Adding a pretty banner
print('-' * 50)
print('Scanning Target ({}) + {}'.format(sys.argv[1], TARGET))
print('Scanning started at {}'.format(str(t1)))
print('-' * 50)

try:
  for port in range(0, 100):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    socket.setdefaulttimeout(1)
    result = s.connect_ex((TARGET, port))
    if (result == 0):
      print('Port {} open'.format(port))
      print('-'*50)
      print('Scanning done in ({})'.format(str(datetime.now()-t1)))
      s.close()
except:
  KeyboardInterrupt: print(' exiting {}'.format(sys.argv[0]))
  sys.exit()
  socket.gaierror: print('Hostname cannot be resolved, ({}) is not a valid Host')
  sys.exit()
  #socket.error: print('Couldn\'t connect to the server')
  #sys.exit()