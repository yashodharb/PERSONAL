import sys
import socket
import getpass
from datetime import datetime
import colors

#Date-Time
t1 = datetime.now()


#PORT-SCANNER
def port_Scanner():
  if (len(sys.argv) == 2):
    _TARGET_ = socket.gethostbyname(sys.argv[1])
    print('{}Scanning initiated @ ({}) for + TARGET ({})'.format(
      colors.color.YELLOW, t1, _TARGET_))
  else:
    print(
      '{}Invalid amount of Args --> [SYNTAX : portscanner.py <ip-address>]'.
      format(colors.color.YELLOW))
  print('-' * 44)
  try:
    for ports in range(0, 1023):
      s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      socket.setdefaulttimeout(1)
      result = s.connect_ex((_TARGET_, ports))
      if (result == 0):
        print('{}Port {} is open'.format(colors.color.GREEN, ports))
        print('-' * 44)
        #print('{}Scanning finished in {}'.format(colors.color.BLUE,
        #datetime.now() - t1))
        s.close()
    #else:
    # print('{}Port {} Closed/Hidden due to Firewall, etc'.format(colors.color.RED, ports))

    print('{}Scanning finished in {}'.format(colors.color.BLUE,datetime.now() - t1))

  except:
    KeyboardInterrupt: print('{}\n Exitting Portscanner'.format(
      colors.color.RED))
  sys.exit()
  socket.gaierror: print('{}\n Host-name couldn\'t be resolved'.format(
    colors.color.RED))
  sys.exit()
  socket.error: print('{}\n Server not responding'.format(colors.color.RED))
  sys.exit()


def login():
  username = getpass.getpass('{}USERNAME : '.format(colors.color.CYAN))
  password = getpass.getpass('{}PASSWORD : '.format(colors.color.CYAN))
  if (username == 'yash' and password == 'admin2109'):
    print('{}Logged-In as {}'.format(colors.color.RED, username))
    port_Scanner()
  else:
    print('error, Please try again')
    login()


login()
