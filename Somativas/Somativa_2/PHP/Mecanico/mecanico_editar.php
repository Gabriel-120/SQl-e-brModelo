<?php
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');
$id = isset($_GET['Id_mec']) ? intval($_GET['Id_mec']) : 0;
$res = $conn->query("SELECT * FROM Mecanico WHERE Id_mec = $id");
$row = $res->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Editar Mecânico</title>
</head>
<body>
    <h2>Editar Mecânico</h2>
    <form action="mecanico_atualizar.php" method="post">
        <input type="hidden" name="id" value="<?php echo $row['Id_mec']; ?>">

        <label>Nome:</label>
        <input type="text" name="nome" value="<?php echo htmlspecialchars($row['Nome']); ?>">

        <label>CPF:</label>
        <input type="text" name="cpf" value="<?php echo htmlspecialchars($row['CPF']); ?>">

        <label>Data de Nascimento:</label>
        <input type="date" name="data_nasc" value="<?php echo $row['Data_nasc']; ?>">

        <label>Salário:</label>
        <input type="number" step="0.01" name="salario" value="<?php echo $row['Salario']; ?>">

        <label>CEP:</label>
        <input type="text" name="cep" value="<?php echo htmlspecialchars($row['CEP']); ?>">

        <label>Número do endereço:</label>
        <input type="text" name="n_endereco" value="<?php echo htmlspecialchars($row['N_endereco']); ?>">

        <label>Celular:</label>
        <input type="text" name="celular" value="<?php echo htmlspecialchars($row['Celular']); ?>">

        <label>Email:</label>
        <input type="email" name="email" value="<?php echo htmlspecialchars($row['Email']); ?>">

        <input type="submit" value="Atualizar">
    </form>
</body>
</html>
<?php $conn->close(); ?>
