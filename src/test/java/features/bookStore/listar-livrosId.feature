Feature: Livros ID

    Background: 
        Given url baseBookUrl
        * def listarLivro = call read('classpath:features/bookStore/listar-Livros.feature')
        * def isbnLivro = listarLivro.primeiroIsbn
    
    Scenario Outline: <descricao-cenario>
        * def isbn = <id>
        Given path "/Book/"
        And param ISBN = isbn
        When method get
        Then status <status-esperado>
        

    Examples:
        | descricao-cenario  | id          | status-esperado |
        | Pegar o id sucesso | isbnLivro   | 200             |

    Examples:
        | descricao-cenario  | id          | status-esperado |
        | Pegar o id falha   |  '010101'   | 400             |
