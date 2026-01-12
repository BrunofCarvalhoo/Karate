Feature: Criar carrinho

  Background:
    * def token = call read('classpath:features/carrinho/autenticacao.feature')

    @criarCarrinho
  Scenario: Criar carrinho com sucesso
    * def requestBody = read('classpath:features/carrinho/dadosTesteCarrinho/criar-carrinho.json')

    Given url baseUrl
    And path "/carrinhos"
    And header Authorization = token.response.authorization
    And request requestBody
    When method post
    Then status 201