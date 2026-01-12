Feature: Gerar token para autenticação

  Background:

    @token
  Scenario: Gerar token
    Given url baseUrl
    And path "/login"
    And request
      """
      {
       "email": "gleisonacademia2026@qa.com",
       "password": "2026academia"
      }
      """
    When method post
    Then response.authorization != null