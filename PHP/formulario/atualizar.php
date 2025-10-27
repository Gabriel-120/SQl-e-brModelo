<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Atividade_Somativa');

$Cod_aluno = $_POST['Cod_aluno'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$data = $_POST['data'];

$sql = "UPDATE Alunos SET Nome='$nome', Email='$email', Data_nascimento='$data' WHERE Cod_aluno=$Cod_aluno";

if ($conn->query($sql) === TRUE) {
    echo "Dados atualizados com sucesso";
    echo "<br><button><a href='index.html'>Voltar</a></button>";
} else {
    echo "Erro ao atualizar dados: " . $conn->error;
}

$conn->close();
?>