import socket
import threading

client=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('127.0.0.1', 5555))

def receive():
  while True:
    try:
      message=client.recv(1024).decode('ascii')
      if(message==''):
        client.send(nickname.encode('ascii'))
        pass
      else:
        print(message)
    except:
      print('An Error Occured...')
      client.close()
      break


def write():
  while(True):
    message=f'{nickname} : {input()}'
    client.send(message.encode('ascii'))

receive_thread=threading.Thread(target=receive)
receive_thread.start()

write_thread=threading.Thread(target=receive)
write_thread.start()
