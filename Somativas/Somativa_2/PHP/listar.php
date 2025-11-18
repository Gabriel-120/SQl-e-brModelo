<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$result = $conn->query("SELECT * FROM Cliente");
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Listar Clientes</title>
</head>

<body>
    <h2>Clientes</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>Email</th>
            <th>Celular</th>
            <th>CEP</th>
            <th>Numero</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $row['Id_cliente']; ?></td>
                <td><?php echo $row['Nome']; ?></td>
                <td><?php echo $row['CPF']; ?></td>
                <td><?php echo $row['Email']; ?></td>
                <td><?php echo $row['Celular']; ?></td>
                <td><?php echo $row['CEP']; ?></td>
                <td><?php echo $row['N_endereco']; ?></td>
                <td><a href='editar.php?Id_cliente=<?php echo $row['Id_cliente']; ?>'>Editar</a> /
                    <a href='delete.php?Id_cliente=<?php echo $row['Id_cliente']; ?>'>Deletar</a>
                </td>
            </tr>
        <?php } ?>
    </table>

    <a href="index.php"><button type="button">Pagina Inicial</button></a>
    
</body>
</html>
<?php $conn->close(); ?>