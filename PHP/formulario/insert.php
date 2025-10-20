<?php
$nome = $_POST['nome'];
$email = $_POST['email'];

$conn = new mysqli('localhost', 'root', 'senaisp', 'db_joins');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO usuarios (nome, email) VALUES ('$nome', '$email')";

if ($conn->query($sql) === TRUE) {
    echo "Dados salvos com sucesso";
} else {
    echo "Erro: " . $conn->error;
}

exit;
$conn->close();