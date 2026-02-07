import socket

def tcp_server():
    # 创建 socket 对象
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # 绑定到指定的 IP 和端口
    server_socket.bind(('192.168.0.121', 6009))

    # 开始监听，最大等待连接数为 5
    server_socket.listen(5)
    print("Server is listening on port 6009...")

    while True:
        # 接受客户端连接
        client_socket, client_address = server_socket.accept()
        print(f"Connection from {client_address} established.")

        # 接收数据并回复
        data = client_socket.recv(1024).decode()
        print(f"Received from client: {data}")
        client_socket.send("Hello from server!".encode())

        # 关闭客户端连接
        client_socket.close()

if __name__ == "__main__":
    tcp_server()
