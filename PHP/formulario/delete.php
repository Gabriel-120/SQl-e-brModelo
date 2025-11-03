<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Atividade_Somativa');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id = $_GET['Cod_aluno'];

$stmt = $conn->prepare("DELETE FROM Alunos WHERE Cod_aluno = ?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Registro deletado com sucesso";
} else {
    echo "Erro ao deletar registro: " . $stmt->error;
}

$stmt->close();
$conn->close();

