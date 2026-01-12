Feature: Conta 

    Background: 
        Given url baseUrl
        * def dadosUsuario = call read('classpath:features/account/cria-account.feature')
        * def userId = dadosUsuario.userId
        * def token = dadosUsuario.token
    @smoke
    Scenario: Deletar conta criada

        Given path "/User/" + userId
        And header Authorization = 'Bearer ' + token
        When method delete
        Then status 204