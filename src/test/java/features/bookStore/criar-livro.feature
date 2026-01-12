Feature: Livros

    Background:
        Given url baseBookUrl
        * def usuario = call read('classpath:features/account/cria-account.feature@conta')
        * def userId = usuario.userId
        * def nome = usuario.userLogin
        * def senha = usuario.userPassword
        * def token = usuario.token

    
    Scenario Outline: <descricao-cenario>
        * def listarLivro = call read('classpath:features/bookStore/listar-Livros.feature')
        * def isbnLivro = listarLivro.primeiroIsbn
        * def requestBody = read('classpath:features/bookStore/dadosBookStore/<body>')
        Given path "/Books"
        And header Authorization = 'Bearer ' + token
        And request requestBody
        When method post
        Then status <status-esperado>

    Examples:
        | descricao-cenario        | body        | status-esperado |
        | Criar livro com sucesso  | livro.json  | 201             |

    Examples:
        | descricao-cenario        | body              | status-esperado |
        | Criar livro com falha    | livro-falha.json  | 400             |