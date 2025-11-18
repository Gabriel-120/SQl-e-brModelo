<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$result = $conn->query("SELECT o.*, c.Placa, m.Nome AS Mecanico, e.Nome AS Item FROM OS o LEFT JOIN Carro c ON o.Id_carro = c.Id_carro LEFT JOIN Mecanico m ON o.Id_mec = m.Id_mec LEFT JOIN Estoque e ON o.Id_item = e.Id_item");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Listar OS</title>
</head>
<body>
    <h2>Ordens de Serviço</h2>
    <div class="table-wrap">
    <table>
        <tr>
            <th>ID</th>
            <th>Serviço</th>
            <th>Descrição</th>
            <th>Data Início</th>
            <th>Data Término</th>
            <th>Status</th>
            <th>Carro</th>
            <th>Mecânico</th>
            <th>Item</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $row['Id_servico']; ?></td>
                <td><?php echo htmlspecialchars($row['Servico']); ?></td>
                <td><?php echo htmlspecialchars($row['Descricao']); ?></td>
                <td><?php echo $row['Data_inicio']; ?></td>
                <td><?php echo $row['Data_termino']; ?></td>
                <td><?php echo htmlspecialchars($row['Status']); ?></td>
                <td><?php echo htmlspecialchars($row['Placa']); ?></td>
                <td><?php echo htmlspecialchars($row['Mecanico']); ?></td>
                <td><?php echo htmlspecialchars($row['Item']); ?></td>
                <td class="actions">
                    <a href="os_editar.php?Id_servico=<?php echo $row['Id_servico']; ?>">Editar</a> /
                    <a href="os_delete.php?Id_servico=<?php echo $row['Id_servico']; ?>" class="delete">Deletar</a>
                </td>
            </tr>
        <?php } ?>
    </table>
    </div>
    <a href="os_index.php"><button type="button">Nova OS</button></a>
    <a href="index.php"><button type="button" class="secondary">Pagina Inicial</button></a>
</body>
</html>
<?php $conn->close(); ?>
