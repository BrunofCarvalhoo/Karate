Feature: Atualizar livro

    Background: 
        Given url baseBookUrl
        * def usuario = call read('classpath:features/account/cria-account.feature')
        * def userId = usuario.userId
        * def token = usuario.token
        * def listarLivro = call read('classpath:features/bookStore/listar-Livros.feature')
        * def isbnPrimeiro = listarLivro.primeiroIsbn
        * def isbnAtualizar = listarLivro.response.books[1].isbn
        * def isbn = isbnPrimeiro

        Given path '/Books'
        And header Authorization = 'Bearer ' + token
        And request 
        """
        {
            "userId": "#(userId)",
            "collectionOfIsbns": [
                {
                    "isbn": "#(isbnPrimeiro)"
                }
            ]
        }
        """
        When method post
        Then status 201
    
    Scenario Outline: <descricao-cenario>
        * def isbnNovo = <id>
        * def requestAuto = read('classpath:features/bookStore/dadosBookStore/livro-Atualizar.json')

        Given path "/Books/" + isbnPrimeiro
        And header Authorization = 'Bearer ' + token
        And request requestAuto
        When method put
        Then status <status-esperado>


    Examples:
        | descricao-cenario      | id             | status-esperado |
        | Atualizar com sucesso  | isbnAtualizar  | 200             |

    Examples:
        | descricao-cenario      | id             | status-esperado |
        | Atualizar com falha    | '01010101'     | 400             |