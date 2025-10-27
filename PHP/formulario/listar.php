<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Atividade_Somativa');
$result = $conn->query("SELECT * FROM Alunos");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Alunos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Alunos</h2>
    <table> <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Data de Nascimento</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $row['Cod_aluno']; ?></td>
                <td><?php echo $row['Nome']; ?></td>
                <td><?php echo $row['Email']; ?></td>
                <td><?php echo $row['Data_nascimento']; ?></td>
                <td><a href='editar.php?Cod_aluno=<?php echo $row['Cod_aluno']; ?>'>Editar</a></td>
            </tr>
        <?php } ?>
    </table>
    
    <a href="index.html"><button type="button">Pagina Inicial</button></a>

</body>
</html>
<?php $conn->close(); ?>