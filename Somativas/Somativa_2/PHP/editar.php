<?php    
$conn = new mysqli('localhost', 'root', 'senaisp', 'Somativa_2');

$Id_cliente = $_GET['Id_cliente'];
$result = $conn->query("SELECT * FROM Cliente WHERE Id_cliente = $Id_cliente");
$row = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Editar Cliente</title>
</head>
<body>
    <form action="atualizar.php" method="post">
        <input type="hidden" name="id" value="<?php echo $row['Id_cliente']; ?>">

        <label>Nome:</label>
        <input type="text" name="nome" value="<?php echo $row['Nome']; ?>"><br>

        <label>CPF:</label>
        <input type="text" name="cpf" value="<?php echo $row['CPF']; ?>"><br>

        <label>Email</label>
        <input type="email" name="email" value="<?php echo $row['Email']; ?>"><br>

        <label>Celular:</label>
        <input type="tel" name="celular" value="<?php echo $row['Celular']; ?>" placeholder="(00) 12345-6789"><br>

        <label>Cep:</label>
        <input type="text" name="cep" value="<?php echo $row['CEP']; ?>" placeholder="xxxxx-xxx"><br>

        <label>Número do endereço</label>
        <input type="number" name="numero" value="<?php echo $row['N_endereco']; ?>"><br>

    <input type="submit" value="Atualizar">
    </form>
</body>
</html>
<?php $conn->close(); ?>