<?php
$nome = $_POST['nome'];
$cpf = $_POST['cpf'];
$email = $_POST['email'];
$celular = $_POST['celular'];
$cep = $_POST['cep'];
$numero = $_POST['numero'];

$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO Cliente (Nome, CPF, Email, Celular, CEP, N_endereco) VALUES ('$nome', '$cpf', '$email', '$celular', '$cep', '$numero')";

if ($conn->query($sql) === TRUE) {
    echo "Dados salvos com sucesso";
    echo "<br><button><a href='index.html'>Voltar</a></button>";
} else {
    echo "Erro: " . $conn->error;
}

exit;
$conn->close();