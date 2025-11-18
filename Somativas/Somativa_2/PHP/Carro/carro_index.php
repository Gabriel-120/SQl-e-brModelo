<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$clients = $conn->query("SELECT Id_cliente, Nome FROM Cliente");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Cadastrar Carro</title>
</head>
<body>
    <h2>Cadastrar Carro</h2>
    <form action="carro_insert.php" method="post">
        <label>Placa:</label>
        <input type="text" name="placa" required>

        <label>Marca:</label>
        <input type="text" name="marca" required>

        <label>Modelo:</label>
        <input type="text" name="modelo" required>

        <label>Cor:</label>
        <input type="text" name="cor" required>

        <label>Ano:</label>
        <input type="date" name="ano" required>

        <label>Cliente (proprietário):</label>
        <select name="id_cliente">
            <option value="">-- Selecionar --</option>
            <?php while ($c = $clients->fetch_assoc()) { ?>
                <option value="<?php echo $c['Id_cliente']; ?>"><?php echo htmlspecialchars($c['Nome']); ?></option>
            <?php } ?>
        </select>

        <button type="submit">Enviar</button>
    </form>

    <button type="button" onclick="window.location.href='carro_listar.php'">Listar Carros</button>
</body>
</html>
