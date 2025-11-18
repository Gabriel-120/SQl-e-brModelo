<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
if ($conn->connect_error) { die('Connection failed: '.$conn->connect_error); }

if ($_SERVER['REQUEST_METHOD'] !== 'POST') { echo 'Requisição inválida.'; exit; }

$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
if ($id <= 0) { echo 'ID inválido.'; exit; }

$servico = $_POST['servico'] ?? '';
$descricao = $_POST['descricao'] ?? '';
$data_inicio = $_POST['data_inicio'] ?? null;
$data_termino = $_POST['data_termino'] ?? null;
$status = $_POST['status'] ?? 'Ativo';
$id_carro = !empty($_POST['id_carro']) ? intval($_POST['id_carro']) : null;
$id_mec = !empty($_POST['id_mec']) ? intval($_POST['id_mec']) : null;
$id_item = !empty($_POST['id_item']) ? intval($_POST['id_item']) : null;

$stmt = $conn->prepare("UPDATE OS SET Descricao=?, Data_inicio=?, Servico=?, Data_termino=?, Status=?, Id_carro=?, Id_mec=?, Id_item=? WHERE Id_servico=?");
if ($stmt === false) { echo 'Erro: '.$conn->error; $conn->close(); exit; }

$stmt->bind_param('sssssiiii', $descricao, $data_inicio, $servico, $data_termino, $status, $id_carro, $id_mec, $id_item, $id);
if ($stmt->execute()) {
    echo 'Dados atualizados com sucesso';
    echo "<br><button><a href='os_listar.php'>Voltar</a></button>";
} else {
    echo 'Erro ao atualizar dados: '.$stmt->error;
}

$stmt->close();
$conn->close();
