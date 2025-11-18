<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (!isset($_GET['Id_cliente'])) {
    echo 'ID não informado.';
    exit;
}

$id = intval($_GET['Id_cliente']);

$stmt = $conn->prepare("DELETE FROM Cliente WHERE Id_cliente = ?");
if ($stmt === false) {
    echo 'Erro na preparação da query: ' . $conn->error;
    $conn->close();
    exit;
}

$stmt->bind_param("i", $id);
if ($stmt->execute()) {
    echo "Registro deletado com sucesso.";
    echo "<br><button><a href='listar.php'>Voltar</a></button>";
} else {
    echo "Erro ao deletar registro: " . $stmt->error;
}

$stmt->close();
$conn->close();
