<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');

if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo 'Requisição inválida.';
    exit;
}

// O campo enviado pelo formulário é `name="id"` (ver `editar.php`).
// Antes o código usava `Id_cliente`, gerando um índice indefinido em $_POST.
$id = isset($_POST['id']) ? intval($_POST['id']) : 0;
if ($id <= 0) {
    echo 'ID inválido.';
    exit;
}

$nome = isset($_POST['nome']) ? $_POST['nome'] : '';
$cpf = isset($_POST['cpf']) ? $_POST['cpf'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$celular = isset($_POST['celular']) ? $_POST['celular'] : '';
$cep = isset($_POST['cep']) ? $_POST['cep'] : '';
$numero = isset($_POST['numero']) ? $_POST['numero'] : '';

// Usar prepared statement para evitar SQL injection e erros de formatação
$stmt = $conn->prepare("UPDATE Cliente SET Nome = ?, CPF = ?, Email = ?, Celular = ?, CEP = ?, N_endereco = ? WHERE Id_cliente = ?");
if ($stmt === false) {
    echo 'Erro na preparação da query: ' . $conn->error;
    $conn->close();
    exit;
}

$stmt->bind_param('ssssssi', $nome, $cpf, $email, $celular, $cep, $numero, $id);
if ($stmt->execute()) {
    echo "Dados atualizados com sucesso";
    echo "<br><button><a href='index.html'>Voltar</a></button>";
} else {
    echo "Erro ao atualizar dados: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>