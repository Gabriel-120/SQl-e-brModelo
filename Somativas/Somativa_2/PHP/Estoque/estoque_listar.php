<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$result = $conn->query("SELECT * FROM Estoque");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Listar Estoque</title>
</head>
<body>
    <h2>Estoque</h2>
    <div class="table-wrap">
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descrição</th>
            <th>Quantidade</th>
            <th>Preço</th>
            <th>Ações</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <tr>
                <td><?php echo $row['Id_item']; ?></td>
                <td><?php echo htmlspecialchars($row['Nome']); ?></td>
                <td><?php echo htmlspecialchars($row['Descricao']); ?></td>
                <td><?php echo $row['Qtde']; ?></td>
                <td><?php echo $row['Preco']; ?></td>
                <td class="actions">
                    <a href="estoque_editar.php?Id_item=<?php echo $row['Id_item']; ?>">Editar</a> /
                    <a href="estoque_delete.php?Id_item=<?php echo $row['Id_item']; ?>" class="delete">Deletar</a>
                </td>
            </tr>
        <?php } ?>
    </table>
    </div>
    <a href="estoque_index.php"><button type="button">Novo Item</button></a>
    <a href="index.php"><button type="button" class="secondary">Pagina Inicial</button></a>
</body>
</html>
<?php $conn->close(); ?>
