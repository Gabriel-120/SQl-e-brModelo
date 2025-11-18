<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$id = isset($_GET['Id_item']) ? intval($_GET['Id_item']) : 0;
$res = $conn->query("SELECT * FROM Estoque WHERE Id_item = $id");
$row = $res->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Editar Item (Estoque)</title>
</head>
<body>
    <h2>Editar Item (Estoque)</h2>
    <form action="estoque_atualizar.php" method="post">
        <input type="hidden" name="id" value="<?php echo $row['Id_item']; ?>">

        <label>Nome:</label>
        <input type="text" name="nome" value="<?php echo htmlspecialchars($row['Nome']); ?>">

        <label>Descrição:</label>
        <input type="text" name="descricao" value="<?php echo htmlspecialchars($row['Descricao']); ?>">

        <label>Quantidade:</label>
        <input type="number" name="qtde" value="<?php echo $row['Qtde']; ?>">

        <label>Preço:</label>
        <input type="number" step="0.01" name="preco" value="<?php echo $row['Preco']; ?>">

        <input type="submit" value="Atualizar">
    </form>
</body>
</html>
<?php $conn->close(); ?>
