<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$result = $conn->query("SELECT * FROM Mecanico");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Listar Mecânicos</title>
</head>
<body>
    <h2>Mecânicos</h2>
    <div class="table-wrap">
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>Data Nasc</th>
            <th>Salário</th>
            <th>Celular</th>
            <th>Email</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $row['Id_mec']; ?></td>
                <td><?php echo htmlspecialchars($row['Nome']); ?></td>
                <td><?php echo htmlspecialchars($row['CPF']); ?></td>
                <td><?php echo $row['Data_nasc']; ?></td>
                <td><?php echo $row['Salario']; ?></td>
                <td><?php echo htmlspecialchars($row['Celular']); ?></td>
                <td><?php echo htmlspecialchars($row['Email']); ?></td>
                <td class="actions">
                    <a href="mecanico_editar.php?Id_mec=<?php echo $row['Id_mec']; ?>">Editar</a> /
                    <a href="mecanico_delete.php?Id_mec=<?php echo $row['Id_mec']; ?>" class="delete">Deletar</a>
                </td>
            </tr>
        <?php } ?>
    </table>
    </div>
    <a href="mecanico_index.php"><button type="button">Novo Mecânico</button></a>
    <a href="index.php"><button type="button" class="secondary">Pagina Inicial</button></a>
</body>
</html>
<?php $conn->close(); ?>
