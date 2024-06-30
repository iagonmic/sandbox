-- Criação das tabelas
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataCadastro DATE
);

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2),
    Categoria VARCHAR(50)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    Status VARCHAR(20),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE ItensPedido (
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    PRIMARY KEY (PedidoID, ProdutoID),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserção de dados de exemplo
INSERT INTO Clientes (ClienteID, Nome, Email, DataCadastro) VALUES
(1, 'João Silva', 'joao@email.com', '2022-05-15'),
(2, 'Maria Santos', 'maria@email.com', '2023-01-10'),
(3, 'Pedro Oliveira', 'pedro@email.com', '2023-03-22'),
(4, 'Ana Rodrigues', 'ana@email.com', '2022-11-30'),
(5, 'Carlos Ferreira', 'carlos@email.com', '2023-02-14'),
(6, 'Lucia Pereira', 'lucia@email.com', '2022-09-08'),
(7, 'Fernando Costa', 'fernando@email.com', '2023-04-05'),
(8, 'Mariana Alves', 'mariana@email.com', '2022-07-19'),
(9, 'Ricardo Nunes', 'ricardo@email.com', '2023-05-01'),
(10, 'Beatriz Lima', 'beatriz@email.com', '2022-12-25');

INSERT INTO Produtos (ProdutoID, Nome, Preco, Categoria) VALUES
(1, 'Smartphone XYZ', 999.99, 'Eletrônicos'),
(2, 'Notebook ABC', 1499.99, 'Eletrônicos'),
(3, 'Tênis Runner', 129.99, 'Calçados'),
(4, 'Camiseta Básica', 29.99, 'Roupas'),
(5, 'Fones de Ouvido', 89.99, 'Eletrônicos'),
(6, 'Livro "SQL Avançado"', 59.99, 'Livros'),
(7, 'Cafeteira Elétrica', 79.99, 'Eletrodomésticos'),
(8, 'Mochila Escolar', 49.99, 'Acessórios'),
(9, 'Relógio Inteligente', 199.99, 'Eletrônicos'),
(10, 'Cadeira de Escritório', 249.99, 'Móveis');

INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido, Status) VALUES
(1, 1, '2023-01-15', 'Entregue'),
(2, 2, '2023-02-20', 'Entregue'),
(3, 3, '2023-03-25', 'Enviado'),
(4, 4, '2023-04-05', 'Processando'),
(5, 5, '2023-04-10', 'Entregue'),
(6, 1, '2023-05-01', 'Entregue'),
(7, 2, '2023-05-15', 'Enviado'),
(8, 6, '2023-06-01', 'Processando'),
(9, 7, '2023-06-10', 'Enviado'),
(10, 8, '2023-06-15', 'Processando'),
(11, 9, '2023-06-20', 'Processando'),
(12, 10, '2023-06-25', 'Enviado'),
(13, 3, '2023-07-01', 'Entregue'),
(14, 4, '2023-07-05', 'Enviado'),
(15, 5, '2023-07-10', 'Processando');

INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 1, 1, 999.99),
(1, 5, 2, 89.99),
(2, 3, 1, 129.99),
(2, 4, 3, 29.99),
(3, 2, 1, 1499.99),
(3, 6, 1, 59.99),
(4, 7, 1, 79.99),
(4, 8, 2, 49.99),
(5, 9, 1, 199.99),
(5, 10, 1, 249.99),
(6, 1, 1, 999.99),
(7, 3, 2, 129.99),
(8, 5, 1, 89.99),
(8, 6, 1, 59.99),
(9, 2, 1, 1499.99),
(10, 4, 5, 29.99),
(11, 7, 1, 79.99),
(11, 9, 1, 199.99),
(12, 8, 3, 49.99),
(12, 10, 1, 249.99),
(13, 1, 1, 999.99),
(13, 3, 1, 129.99),
(14, 2, 1, 1499.99),
(14, 5, 2, 89.99),
(15, 6, 2, 59.99),
(15, 7, 1, 79.99);