<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');

$id = isset($_GET['Id_carro']) ? intval($_GET['Id_carro']) : 0;
$res = $conn->query("SELECT * FROM Carro WHERE Id_carro = $id");
$row = $res->fetch_assoc();
$clients = $conn->query("SELECT Id_cliente, Nome FROM Cliente");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Editar Carro</title>
</head>
<body>
    <h2>Editar Carro</h2>
    <form action="carro_atualizar.php" method="post">
        <input type="hidden" name="id" value="<?php echo $row['Id_carro']; ?>">

        <label>Placa:</label>
        <input type="text" name="placa" value="<?php echo htmlspecialchars($row['Placa']); ?>"><br>

        <label>Marca:</label>
        <input type="text" name="marca" value="<?php echo htmlspecialchars($row['Marca']); ?>"><br>

        <label>Modelo:</label>
        <input type="text" name="modelo" value="<?php echo htmlspecialchars($row['Modelo']); ?>"><br>

        <label>Cor:</label>
        <input type="text" name="cor" value="<?php echo htmlspecialchars($row['Cor']); ?>"><br>

        <label>Ano:</label>
        <input type="date" name="ano" value="<?php echo $row['Ano']; ?>"><br>

        <label>Cliente (proprietário):</label>
        <select name="id_cliente">
            <option value="">-- Selecionar --</option>
            <?php while ($c = $clients->fetch_assoc()) { ?>
                <option value="<?php echo $c['Id_cliente']; ?>" <?php echo ($c['Id_cliente']==$row['Id_cliente'])? 'selected':''; ?>><?php echo htmlspecialchars($c['Nome']); ?></option>
            <?php } ?>
        </select>

        <input type="submit" value="Atualizar">
    </form>
</body>
</html>
<?php $conn->close(); ?>
