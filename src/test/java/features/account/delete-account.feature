Feature: Conta 

    Background: 
        Given url baseUrl
        * def dadosUsuario = call read('classpath:features/account/cria-account.feature@conta')
        * def userId = dadosUsuario.userId
        * def token = dadosUsuario.token
    
    Scenario: Deletar conta criada

        Given path "/User/" + userId
        And header Authorization = 'Bearer ' + token
        When method delete
        Then status 204
    
    Scenario: Falha ao deletar usuario sem autorizacao
        
        Given path "/User/" + userId
        And header Authorization = 'Bearer token-invalido'
        When method delete
        Then status 401
        And match response.message == "User not authorized!"