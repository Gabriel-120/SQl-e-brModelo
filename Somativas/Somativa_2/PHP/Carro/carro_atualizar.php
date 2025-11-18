<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

if ($_SERVER['REQUEST_METHOD'] !== 'POST') { echo 'Requisição inválida.'; exit; }

$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
if ($id <= 0) { echo 'ID inválido.'; exit; }

$placa = $_POST['placa'] ?? '';
$marca = $_POST['marca'] ?? '';
$modelo = $_POST['modelo'] ?? '';
$cor = $_POST['cor'] ?? '';
$ano = $_POST['ano'] ?? '';
$id_cliente = !empty($_POST['id_cliente']) ? intval($_POST['id_cliente']) : null;

$stmt = $conn->prepare("UPDATE Carro SET Placa=?, Marca=?, Modelo=?, Cor=?, Ano=?, Id_cliente=? WHERE Id_carro=?");
if ($stmt === false) { echo 'Erro: '.$conn->error; $conn->close(); exit; }

$stmt->bind_param('sssssii', $placa, $marca, $modelo, $cor, $ano, $id_cliente, $id);
// tipos: 5 strings (placa,marca,modelo,cor,ano) + 2 inteiros (id_cliente, id)
if ($stmt->execute()) {
    echo 'Dados atualizados com sucesso';
    echo "<br><button><a href='carro_listar.php'>Voltar</a></button>";
} else {
    echo 'Erro ao atualizar dados: '.$stmt->error;
}

$stmt->close();
$conn->close();
