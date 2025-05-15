import itertools
import string
import getpass
import threading
import sys
import pyfiglet
import colors
import Cracker
from colorama import Fore

def banner(text):
  ban = pyfiglet.figlet_format(text)
  return ban


print(banner('CRACKED......'.format(Fore.CYAN)))
print("{}+ PASSWORD-CRACKER MADE FOR EDUCATIONAL PURPOSE\n+ DONT USE FOR ILLEGAL   INTENT\n+ I WILL NOT BE HELD RESPONSIBLE\n".format(Fore.YELLOW))
username = getpass.getpass('{}+ USERNAME : '.format(
    Fore.GREEN)).lower()
password = getpass.getpass('{}+ PASSWORD : '.format(Fore.GREEN))
if (username == 'yash') and (password == 'admin123'):
    result = Cracker.cracker()
    print('-' * 50)
    print('Done.....')
    with open('logs.txt', 'a') as f:
      f.write("""{}""".format(result))
else:
  print('+ LOGIN FAILED!! PLEASE TRY AGAIN.....')

  
