<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>list_book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1, h2 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li::before {
            content: "🔸";
            margin-right: 8px;
        }
        code {
            background-color: #eee;
            padding: 3px 6px;
            border-radius: 3px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>

    <h1>📚 list_book</h1>
    <p>Aplicativo mobile para gerenciar uma lista de livros favoritos. Com funcionalidades de busca de livros via API e armazenamento offline.</p>

    <h2>Funcionalidades</h2>
    <ul>
        <li><strong>Consulta de Livros via API:</strong> O aplicativo se conecta à <a href="https://developers.google.com/books" target="_blank">Google Books API</a> (ou API similar) para pesquisar e obter detalhes dos livros.</li>
        <li><strong>Lista de Leitura:</strong> Adicione e remova livros de uma lista personalizada de leitura.</li>
        <li><strong>Armazenamento Local:</strong> A lista de leitura é armazenada localmente no dispositivo, usando <strong>SQLite</strong>, permitindo o acesso offline.</li>
        <li><strong>Navegação entre Páginas:</strong> Navegue facilmente entre a página de pesquisa e a lista de leitura com rotas do Flutter.</li>
    </ul>

    <h2>🛠️ Tecnologias Utilizadas</h2>
    <ul>
        <li><strong>Flutter:</strong> Framework utilizado para o desenvolvimento do aplicativo mobile.</li>
        <li><strong>Google Books API:</strong> Para realizar a pesquisa e obter dados detalhados dos livros.</li>
        <li><strong>SQLite:</strong> Para salvar e gerenciar a lista de leitura localmente no dispositivo.</li>
        <li><strong>Provider:</strong> Gerenciamento de estado eficiente utilizando a biblioteca Provider.</li>
    </ul>

    <h2>🚀 Como Executar</h2>
    <p>1. Clone o repositório:</p>
    <pre><code>git clone https://github.com/seuusuario/list_book.git
cd list_book</code></pre>
    
    <p>2. Instale as dependências:</p>
    <pre><code>flutter pub get</code></pre>

    <p>3. Execute o aplicativo:</p>
    <pre><code>flutter run</code></pre>

    <h2>👥 Integrantes</h2>
    <table>
        <tr>
            <th>Nome</th>
            <th>Função</th>
        </tr>
        <tr>
            <td><a href="#">Nome 1</a></td>
            <td>Desenvolvimento</td>
        </tr>
        <tr>
            <td><a href="#">Nome 2</a></td>
            <td>UI/UX Design</td>
        </tr>
        <tr>
            <td><a href="#">Nome 3</a></td>
            <td>Backend/API</td>
        </tr>
        <tr>
            <td><a href="#">Nome 4</a></td>
            <td>Gerenciamento de Projeto</td>
        </tr>
    </table>

</body>
</html>
