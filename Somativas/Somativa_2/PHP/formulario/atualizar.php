<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');

$id = $_POST['Id_cliente'];
$nome = $_POST['nome'];
$cpf = $_POST['cpf'];
$email = $_POST['email'];
$celular = $_POST['celular'];
$cep = $_POST['cep'];
$numero = $_POST['numero'];

$sql = "UPDATE Cliente SET Nome='$nome', CPF='$cpf', Email='$email', Celular='$celular', CEP='$cep', N_endereco='$numero' WHERE Id_cliente=$id";

if ($conn->query($sql) === TRUE) {
    echo "Dados atualizados com sucesso";
    echo "<br><button><a href='index.html'>Voltar</a></button>";
} else {
    echo "Erro ao atualizar dados: " . $conn->error;
}

$conn->close();
?>