<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$result = $conn->query("SELECT c.*, cl.Nome AS Proprietario FROM Carro c LEFT JOIN Cliente cl ON c.Id_cliente = cl.Id_cliente");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Listar Carros</title>
</head>
<body>
    <h2>Carros</h2>
    <div class="table-wrap">
    <table>
        <tr>
            <th>ID</th>
            <th>Placa</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Cor</th>
            <th>Ano</th>
            <th>Proprietário</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $row['Id_carro']; ?></td>
                <td><?php echo htmlspecialchars($row['Placa']); ?></td>
                <td><?php echo htmlspecialchars($row['Marca']); ?></td>
                <td><?php echo htmlspecialchars($row['Modelo']); ?></td>
                <td><?php echo htmlspecialchars($row['Cor']); ?></td>
                <td><?php echo $row['Ano']; ?></td>
                <td><?php echo htmlspecialchars($row['Proprietario']); ?></td>
                <td class="actions">
                    <a href="carro_editar.php?Id_carro=<?php echo $row['Id_carro']; ?>">Editar</a> /
                    <a href="carro_delete.php?Id_carro=<?php echo $row['Id_carro']; ?>" class="delete">Deletar</a>
                </td>
            </tr>
        <?php } ?>
    </table>
    </div>
    <a href="carro_index.php"><button type="button">Novo Carro</button></a>
    <a href="index.php"><button type="button" class="secondary">Pagina Inicial</button></a>
</body>
</html>
<?php $conn->close(); ?>
