<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

if (!isset($_GET['Id_item'])) { echo 'ID não informado.'; exit; }
$id = intval($_GET['Id_item']);

$stmt = $conn->prepare("DELETE FROM Estoque WHERE Id_item = ?");
if ($stmt === false) { echo 'Erro na preparação: '.$conn->error; $conn->close(); exit; }
$stmt->bind_param('i', $id);
if ($stmt->execute()) {
    echo 'Item deletado com sucesso.';
    echo "<br><button><a href='estoque_listar.php'>Voltar</a></button>";
} else {
    echo 'Erro ao deletar: '.$stmt->error;
}

$stmt->close();
$conn->close();
