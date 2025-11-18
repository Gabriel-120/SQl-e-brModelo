<?php
$placa = $_POST['placa'] ?? '';
$marca = $_POST['marca'] ?? '';
$modelo = $_POST['modelo'] ?? '';
$cor = $_POST['cor'] ?? '';
$ano = $_POST['ano'] ?? '';
$id_cliente = !empty($_POST['id_cliente']) ? intval($_POST['id_cliente']) : null;

$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

$stmt = $conn->prepare("INSERT INTO Carro (Placa, Marca, Modelo, Cor, Ano, Id_cliente) VALUES (?, ?, ?, ?, ?, ?)");
if ($stmt === false) { echo 'Erro: '.$conn->error; $conn->close(); exit; }

$stmt->bind_param('sssssi', $placa, $marca, $modelo, $cor, $ano, $id_cliente);
if ($stmt->execute()) {
    echo 'Carro cadastrado com sucesso.';
    echo "<br><button><a href='carro_index.php'>Voltar</a></button>";
} else {
    echo 'Erro: '.$stmt->error;
}

$stmt->close();
$conn->close();
