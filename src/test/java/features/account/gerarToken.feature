Feature: Gerar Token account

    Background: 
        Given url baseUrl
        * def bodyRequest = read('classpath:features/account/dadosAccount/dadoAccount.json')
    Scenario: Gerar Token
       
        And path "/GenerateToken"
        And request bodyRequest
        When method post
        Then status 200
        * def tokenGerado = response.token