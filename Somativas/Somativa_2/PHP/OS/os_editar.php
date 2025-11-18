<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$id = isset($_GET['Id_servico']) ? intval($_GET['Id_servico']) : 0;
$res = $conn->query("SELECT * FROM OS WHERE Id_servico = $id");
$row = $res->fetch_assoc();
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
    <title>Editar OS</title>
</head>
<body>
    <h2>Editar Ordem de Serviço</h2>
    <form action="os_atualizar.php" method="post">
        <input type="hidden" name="id" value="<?php echo $row['Id_servico']; ?>">

        <label>Serviço:</label>
        <input type="text" name="servico" value="<?php echo htmlspecialchars($row['Servico']); ?>">

        <label>Descrição:</label>
        <input type="text" name="descricao" value="<?php echo htmlspecialchars($row['Descricao']); ?>">

        <label>Data Início:</label>
        <input type="date" name="data_inicio" value="<?php echo $row['Data_inicio']; ?>">

        <label>Data Término:</label>
        <input type="date" name="data_termino" value="<?php echo $row['Data_termino']; ?>">

        <label>Status:</label>
        <select name="status">
            <option value="Ativo" <?php echo ($row['Status']=='Ativo')? 'selected':''; ?>>Ativo</option>
            <option value="Concluido" <?php echo ($row['Status']=='Concluido')? 'selected':''; ?>>Concluido</option>
            <option value="Cancelado" <?php echo ($row['Status']=='Cancelado')? 'selected':''; ?>>Cancelado</option>
        </select>

        <label>Carro:</label>
        <select name="id_carro">
            <option value="">-- Selecionar --</option>
            <?php while ($c = $cars->fetch_assoc()) { ?>
                <option value="<?php echo $c['Id_carro']; ?>" <?php echo ($c['Id_carro']==$row['Id_carro'])? 'selected':''; ?>><?php echo htmlspecialchars($c['Placa']); ?></option>
            <?php } ?>
        </select>

        <label>Mecânico:</label>
        <select name="id_mec">
            <option value="">-- Selecionar --</option>
            <?php while ($m = $mecs->fetch_assoc()) { ?>
                <option value="<?php echo $m['Id_mec']; ?>" <?php echo ($m['Id_mec']==$row['Id_mec'])? 'selected':''; ?>><?php echo htmlspecialchars($m['Nome']); ?></option>
            <?php } ?>
        </select>

        <label>Item (Estoque):</label>
        <select name="id_item">
            <option value="">-- Selecionar --</option>
            <?php while ($it = $items->fetch_assoc()) { ?>
                <option value="<?php echo $it['Id_item']; ?>" <?php echo ($it['Id_item']==$row['Id_item'])? 'selected':''; ?>><?php echo htmlspecialchars($it['Nome']); ?></option>
            <?php } ?>
        </select>

        <input type="submit" value="Atualizar">
    </form>
</body>
</html>
<?php $conn->close(); ?>
