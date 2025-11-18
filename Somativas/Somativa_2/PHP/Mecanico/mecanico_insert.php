<?php
$nome = $_POST['nome'] ?? '';
$cpf = $_POST['cpf'] ?? '';
$data_nasc = $_POST['data_nasc'] ?? null;
$salario = $_POST['salario'] ?? 0;
$cep = $_POST['cep'] ?? '';
$n_endereco = $_POST['n_endereco'] ?? '';
$celular = $_POST['celular'] ?? '';
$email = $_POST['email'] ?? '';

$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

$stmt = $conn->prepare("INSERT INTO Mecanico (Salario, Data_nasc, CPF, CEP, Nome, N_endereco, Celular, Email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
if ($stmt === false) { echo 'Erro: '.$conn->error; $conn->close(); exit; }

$stmt->bind_param('dsssssss', $salario, $data_nasc, $cpf, $cep, $nome, $n_endereco, $celular, $email);
if ($stmt->execute()) {
    echo 'Mecânico cadastrado com sucesso.';
    echo "<br><button><a href='mecanico_index.php'>Voltar</a></button>";
} else {
    echo 'Erro: '.$stmt->error;
}

$stmt->close();
$conn->close();
