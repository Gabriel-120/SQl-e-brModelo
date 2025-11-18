<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

if (!isset($_GET['Id_mec'])) { echo 'ID não informado.'; exit; }
$id = intval($_GET['Id_mec']);

$stmt = $conn->prepare("DELETE FROM Mecanico WHERE Id_mec = ?");
if ($stmt === false) { echo 'Erro na preparação: '.$conn->error; $conn->close(); exit; }
$stmt->bind_param('i', $id);
if ($stmt->execute()) {
    echo 'Mecânico deletado com sucesso.';
    echo "<br><button><a href='mecanico_listar.php'>Voltar</a></button>";
} else {
    echo 'Erro ao deletar: '.$stmt->error;
}

$stmt->close();
$conn->close();
