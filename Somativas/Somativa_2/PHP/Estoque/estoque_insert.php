<?php
$nome = $_POST['nome'] ?? '';
$descricao = $_POST['descricao'] ?? '';
$qtde = isset($_POST['qtde']) ? intval($_POST['qtde']) : 0;
$preco = $_POST['preco'] ?? 0;

$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

$stmt = $conn->prepare("INSERT INTO Estoque (Qtde, Preco, Nome, Descricao) VALUES (?, ?, ?, ?)");
if ($stmt === false) { echo 'Erro: '.$conn->error; $conn->close(); exit; }

$stmt->bind_param('idss', $qtde, $preco, $nome, $descricao);
if ($stmt->execute()) {
    echo 'Item cadastrado com sucesso.';
    echo "<br><button><a href='estoque_index.php'>Voltar</a></button>";
} else {
    echo 'Erro: '.$stmt->error;
}

$stmt->close();
$conn->close();
