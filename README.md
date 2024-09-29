
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Documentação - Aplicativo Lista de Livros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f7f7f7;
        }
        h1, h2, h3 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding-left: 0;
        }
        ul li {
            margin-bottom: 10px;
        }
        ul li::before {
            content: "✔️";
            margin-right: 8px;
            color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        pre {
            background-color: #eee;
            padding: 10px;
            border-radius: 5px;
            white-space: pre-wrap;
        }
    </style>
</head>
<body>

    <h1>📚 Aplicativo Lista de Livros</h1>

    <h2>Funcionalidades</h2>
    <ul>
        <li><strong>Consulta de Livros via API:</strong> O aplicativo utiliza a <a href="https://developers.google.com/books" target="_blank">Google Books API</a> (ou qualquer API similar) para pesquisar e obter detalhes sobre livros.</li>
        <li><strong>Lista de Leitura:</strong> Os usuários podem adicionar ou remover livros de sua lista de leitura personalizada.</li>
        <li><strong>Armazenamento Local:</strong> A lista de leitura é armazenada no dispositivo usando <strong>SQLite</strong>, permitindo acesso offline.</li>
        <li><strong>Navegação entre Páginas:</strong> Utiliza rotas para navegar entre a página de pesquisa e a página da lista de leitura.</li>
    </ul>

    <h2>Tecnologias Utilizadas</h2>
    <ul>
        <li><strong>Flutter:</strong> Framework utilizado para o desenvolvimento do aplicativo.</li>
        <li><strong>API Google Books:</strong> Para pesquisa e obtenção de dados dos livros.</li>
        <li><strong>SQLite:</strong> Utilizado para salvar e gerenciar a lista de leitura localmente.</li>
        <li><strong>Gerenciamento de Estado:</strong> Gerenciado com a biblioteca Provider.</li>
    </ul>

    <h2>Integrantes</h2>
    <table>
        <tr>
            <th>Nome</th>
            <th>Função</th>
        </tr>
        <tr>
            <td>Nome 1</td>
            <td>Desenvolvimento</td>
        </tr>
        <tr>
            <td>Nome 2</td>
            <td>UI/UX Design</td>
        </tr>
        <tr>
            <td>Nome 3</td>
            <td>Backend/API</td>
        </tr>
        <tr>
            <td>Nome 4</td>
            <td>Gerenciamento de Projeto</td>
        </tr>
    </table>

</body>
</html>
