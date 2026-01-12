Feature: Livro

    Background:
        Given url baseBookUrl
    
    Scenario: Listar os livros
        * def dadoLivro = read('classpath:features/bookStore/dadosBookStore/dadoBook.json')

        And path "/Books"
        When method get
        Then status 200
        And match response.books == '#[]'
        And match each response.books == dadoLivro
        * def primeiroIsbn = response.books[0].isbn
