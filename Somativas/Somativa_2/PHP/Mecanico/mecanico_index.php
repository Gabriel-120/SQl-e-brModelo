<?php ?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Cadastrar Mecânico</title>
</head>
<body>
    <h2>Cadastrar Mecânico</h2>
    <form action="mecanico_insert.php" method="post">
        <label>Nome:</label>
        <input type="text" name="nome" required>

        <label>CPF:</label>
        <input type="text" name="cpf" required>

        <label>Data de Nascimento:</label>
        <input type="date" name="data_nasc">

        <label>Salário:</label>
        <input type="number" step="0.01" name="salario" required>

        <label>CEP:</label>
        <input type="text" name="cep">

        <label>Número do endereço:</label>
        <input type="text" name="n_endereco">

        <label>Celular:</label>
        <input type="text" name="celular">

        <label>Email:</label>
        <input type="email" name="email">

        <button type="submit">Enviar</button>
    </form>

    <button type="button" onclick="window.location.href='mecanico_listar.php'">Listar Mecânicos</button>
</body>
</html>
