Feature: Cadastro usuarios

  Background:
    Given url baseUrl

    
  Scenario Outline: <descricao-cenario>
    * def email = Java.type('features.support.utils.Utils').gerarEmailFake()
    * print email
    * def bodyRequest = read('classpath:features/usuarios/dadosTesteUsuario/<body>')

    Given path "/usuarios"
    And request bodyRequest
    When method post
    Then status <status-esperado>
    And print response
    And match response.message == <resposta-esperada>
    And assert responseTime < 5000

    Examples:
      | descricao-cenario               | body                               | status-esperado | resposta-esperada                |
      | Cadastro de usuario com sucesso | cadastrar-usuario-com-sucesso.json | 201             | "Cadastro realizado com sucesso" |

    Examples:
      | descricao-cenario                          | body                             | status-esperado | resposta-esperada                |
      | Cadastrar usuario com e-mail já cadastrado | cadastrar-usuario-existente.json | 400             | "Este email já está sendo usado" |