<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$cars = $conn->query("SELECT Id_carro, Placa FROM Carro");
$mecs = $conn->query("SELECT Id_mec, Nome FROM Mecanico");
$items = $conn->query("SELECT Id_item, Nome FROM Estoque");
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Cadastrar OS</title>
</head>
<body>
    <h2>Cadastrar Ordem de Serviço</h2>
    <form action="os_insert.php" method="post">
        <label>Serviço:</label>
        <input type="text" name="servico" required>

        <label>Descrição:</label>
        <input type="text" name="descricao" required>

        <label>Data Início:</label>
        <input type="date" name="data_inicio">

        <label>Data Término:</label>
        <input type="date" name="data_termino">

        <label>Status:</label>
        <select name="status">
            <option value="Ativo">Ativo</option>
            <option value="Concluido">Concluido</option>
            <option value="Cancelado">Cancelado</option>
        </select>

        <label>Carro:</label>
        <select name="id_carro">
            <option value="">-- Selecionar --</option>
            <?php while ($c = $cars->fetch_assoc()) { ?>
                <option value="<?php echo $c['Id_carro']; ?>"><?php echo htmlspecialchars($c['Placa']); ?></option>
            <?php } ?>
        </select>

        <label>Mecânico:</label>
        <select name="id_mec">
            <option value="">-- Selecionar --</option>
            <?php while ($m = $mecs->fetch_assoc()) { ?>
                <option value="<?php echo $m['Id_mec']; ?>"><?php echo htmlspecialchars($m['Nome']); ?></option>
            <?php } ?>
        </select>

        <label>Item (Estoque):</label>
        <select name="id_item">
            <option value="">-- Selecionar --</option>
            <?php while ($it = $items->fetch_assoc()) { ?>
                <option value="<?php echo $it['Id_item']; ?>"><?php echo htmlspecialchars($it['Nome']); ?></option>
            <?php } ?>
        </select>

        <button type="submit">Enviar</button>
    </form>

    <button type="button" onclick="window.location.href='os_listar.php'">Listar OS</button>
</body>
</html>
<?php $conn->close(); ?>
