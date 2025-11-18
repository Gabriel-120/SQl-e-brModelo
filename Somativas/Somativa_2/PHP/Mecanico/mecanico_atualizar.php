<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

if ($_SERVER['REQUEST_METHOD'] !== 'POST') { echo 'Requisição inválida.'; exit; }

$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
if ($id <= 0) { echo 'ID inválido.'; exit; }

$nome = $_POST['nome'] ?? '';
$cpf = $_POST['cpf'] ?? '';
$data_nasc = $_POST['data_nasc'] ?? null;
$salario = $_POST['salario'] ?? 0;
$cep = $_POST['cep'] ?? '';
$n_endereco = $_POST['n_endereco'] ?? '';
$celular = $_POST['celular'] ?? '';
$email = $_POST['email'] ?? '';

$stmt = $conn->prepare("UPDATE Mecanico SET Salario=?, Data_nasc=?, CPF=?, CEP=?, Nome=?, N_endereco=?, Celular=?, Email=? WHERE Id_mec=?");
if ($stmt === false) { echo 'Erro: '.$conn->error; $conn->close(); exit; }

$stmt->bind_param('dsssssssi', $salario, $data_nasc, $cpf, $cep, $nome, $n_endereco, $celular, $email, $id);
if ($stmt->execute()) {
    echo 'Dados atualizados com sucesso';
    echo "<br><button><a href='mecanico_listar.php'>Voltar</a></button>";
} else {
    echo 'Erro ao atualizar dados: '.$stmt->error;
}

$stmt->close();
$conn->close();
