import socket

def tcp_client():
    # 创建 socket 对象
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # 连接到服务器
    server_address = ('192.168.0.121', 6009)
    client_socket.connect(server_address)
    print(f"Connected to server at {server_address}.")

    # 发送数据
    message = "Hello from client!"
    client_socket.send(message.encode())

    # 接收服务器回复
    response = client_socket.recv(1024).decode()
    print(f"Received from server: {response}")

    # 关闭连接
    client_socket.close()

if __name__ == "__main__":
    tcp_client()

