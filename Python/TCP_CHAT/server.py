import threading
import socket


# MACHINE TO BE HOSTED ON...

host='127.0.0.1' #localhost
port=5555

# SERVER CODE

server=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((host, port))
server.listen()


# CLIENT CODE

clients=[]
nicknames=[]

# Sending a Message

def broadcast(message):
  for client in clients:
    client.send(message)

# Receiving a Message

def handle(client):
  while True:
    try:
      message=client.recv(1024)
      broadcast(message)
    except:
      index=client.index(client)
      client.remove(client)
      client.close()
      nickname=nicknames[index]
      broadcast(f'{nickname} left the chat'.encode('ascii'))
      nicknames.remove(nickname)
      break

def receive():
  while True:
    client, address=server.accept()
    print(f'Connnected with str({address})')

    client.send('NICK : '.encode('ascii'))
    nickname=client.recv(1024).decode('ascii')
    nicknames.append(nickname)

    print(f'Nickname of the client is {nickname}')
    broadcast(f'{nickname} joined the chat'.encode('ascii'))
    client.send('Connected to the server!'.encode('ascii'))

    thread=threading.Thread(target=handle, args=(client,))
    thread.start()


print('SERVER is listening...')
receive()
