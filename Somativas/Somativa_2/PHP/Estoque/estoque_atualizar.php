<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

if ($_SERVER['REQUEST_METHOD'] !== 'POST') { echo 'Requisição inválida.'; exit; }

$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
if ($id <= 0) { echo 'ID inválido.'; exit; }

$nome = $_POST['nome'] ?? '';
$descricao = $_POST['descricao'] ?? '';
$qtde = isset($_POST['qtde']) ? intval($_POST['qtde']) : 0;
$preco = $_POST['preco'] ?? 0;

$stmt = $conn->prepare("UPDATE Estoque SET Qtde=?, Preco=?, Nome=?, Descricao=? WHERE Id_item=?");
if ($stmt === false) { echo 'Erro: '.$conn->error; $conn->close(); exit; }

$stmt->bind_param('idssi', $qtde, $preco, $nome, $descricao, $id);
if ($stmt->execute()) {
    echo 'Dados atualizados com sucesso';
    echo "<br><button><a href='estoque_listar.php'>Voltar</a></button>";
} else {
    echo 'Erro ao atualizar dados: '.$stmt->error;
}

$stmt->close();
$conn->close();
