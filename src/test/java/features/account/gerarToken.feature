Feature: Gerar Token account

    Background: 
    
    Scenario: Gerar Token
        Given url baseUrl
        And path "/GenerateToken"
        And request
            """
            {
            "userName": "#(userName)",
            "password": "#(password)"
            }
            """
        When method post
        Then status 200
        * def tokenGerado = response.token