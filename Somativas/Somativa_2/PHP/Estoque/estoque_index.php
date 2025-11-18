<?php ?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Cadastrar Item (Estoque)</title>
</head>
<body>
    <h2>Cadastrar Item (Estoque)</h2>
    <form action="estoque_insert.php" method="post">
        <label>Nome:</label>
        <input type="text" name="nome" required>

        <label>Descrição:</label>
        <input type="text" name="descricao" required>

        <label>Quantidade:</label>
        <input type="number" name="qtde" required>

        <label>Preço:</label>
        <input type="number" step="0.01" name="preco" required>

        <button type="submit">Enviar</button>
    </form>

    <button type="button" onclick="window.location.href='estoque_listar.php'">Listar Estoque</button>
</body>
</html>
