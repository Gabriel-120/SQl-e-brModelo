<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Atividade_Somativa');

$Cod_aluno = $_GET['Cod_aluno'];
$result = $conn->query("SELECT * FROM Alunos WHERE Cod_aluno = $Cod_aluno");
$row = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Aluno</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<form action="atualizar.php" method="post">
    <input type="hidden" name="Cod_aluno" value="<?php echo $row['Cod_aluno']; ?>">
    
    <label>Nome:</label>
    <input type="text" name="nome" value="<?php echo $row['Nome']; ?>"><br>
    
    <label>Email:</label>
    <input type="text" name="email" value="<?php echo $row['Email']; ?>"><br>
    
    <label>Data de Nascimento:</label>
    <input type="date" name="data" value="<?php echo $row['Data_nascimento']; ?>"><br>
    
    <input type="submit" value="Atualizar">
</form>

</body>
</html>
<?php $conn->close(); // Mova o close para o final ?>