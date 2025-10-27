<?php
$nome = $_POST['nome'];
$email = $_POST['email'];
$data = $_POST['data'];

$conn = new mysqli('localhost', 'root', 'senaisp', 'Atividade_Somativa');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO Alunos (Nome, Email, Data_nascimento) VALUES ('$nome', '$email', '$data')";

if ($conn->query($sql) === TRUE) {
    echo "Dados salvos com sucesso";
    echo "<br><button><a href='index.html'>Voltar</a></button>";
} else {
    echo "Erro: " . $conn->error;
}

exit;
$conn->close();