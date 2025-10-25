import hashlib
import getpass


class User:

  def __init__():
    pass


def get_User():
  print('Welcome to Login Portal.')

  userName = input('Enter your username: ')
  userEmail=input('Enter your email:')
  userPassword = getpass.getpass('Enter your password: ')
  userHash = hashlib.sha256(userPassword.encode('utf-8')).hexdigest()

  return userName, userEmail, userHash


def map_User(userName, userEmail, userHash):
  userMap = {"userName": userName,
             "userEmail:":userEmail,
            "user_Password": userHash}
  return userMap


def login(creds):
  print('Welcome to Login Portal.')
  username=input("USERNAME : ")
  userpassword=hashlib.sha256(getpass.getpass("PASSWORD : ").encode('utf-8')).hexdigest()
  if(creds["userName"]!=username) and (creds["user_Password"]!=userpassword):
    print("Wrong Credentials")
  else :
    print('Done!!')
    
userName, userEmail, userHash = get_User()
creds=map_User(userName, userEmail, userHash)

#print(f'Details :\n {creds}')
login(creds)

#def login(user_Dict):
#  user=input('Username : ')
#  user_Pass=getpass.getpass('Password : ')
