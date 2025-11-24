<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id = $_GET['Id_cliente'];

$stmt = $conn->prepare("DELETE FROM Cliente WHERE Id_cliente = ?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Registro delete com sucesso";
} else {
    echo "Erro ao deletar registro: " . $stmt->error;
}

$stmt->close();
$conn->close();