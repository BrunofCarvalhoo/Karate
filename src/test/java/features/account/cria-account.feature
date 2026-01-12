Feature: Criar um usuario

    Background:
        Given url baseUrl
    @conta
    Scenario: Criar usuario com sucesso
        * def userName = Java.type('features.support.utils.Utils').gerarNome()
        * def password = "Senha@123!"
        * def bodyRequest = read('classpath:features/account/dadosAccount/dadoAccount.json')

        Given path "/User"
        And request bodyRequest
        When method post
        Then status 201

        * def userId = response.userID
        * def userLogin = userName
        * def userPassword = password
        * def auth = call read('classpath:features/account/gerarToken.feature') { userName: #(userName), password: #(password) }
        * def token = auth.tokenGerado
    
    Scenario: Tentar criar usuario duplicado
        * def userName = Java.type('features.support.utils.Utils').gerarNome()
        * def password = "Senha@123!"
        * def bodyRequest = { "userName": "#(userName)", "password": "#(password)" }

        Given path "/User"
        And request bodyRequest
        When method post
        Then status 201

        Given path "/User"
        And request bodyRequest
        When method post
        Then status 406
        And match response.message == "User exists!"
   

    