import itertools
import string
import getpass
import threading
import sys
import pyfiglet
import colors
import Cracker
from colorama import Fore
import time

def cracker():
  start=time.time()
  print('\n{}+ PASSWORD TO BE TESTED GOES BELOW +'.format(colors.color.BLUE))
  password = getpass.getpass('+ PASSWORD : *')
  chars = string.ascii_letters + string.digits
  attempts = 0
  print('{}\nCRACKING.....'.format(colors.color.RED))
  for length in range(1, 9):
    for guess in itertools.product(chars, repeat=length):
      attempts += 1
      guess = ''.join(guess)
      ##print('{}.format(colors.color.GREEN, guess))
      if (guess == password):
        end=time.time()
        return ("""
PASSWORD     : {}
ATTEMPTS     : {}
TIME ELAPSED : {}
#END\n""".format(guess, attempts, end-start))
