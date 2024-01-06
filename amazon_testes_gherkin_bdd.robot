*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]  Esse teste verifica o menu Eletrônicos do site da Amazon.com.br
    ...              e verifica a catagoria Computadores e Informática  
    [Tags]           menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página



  

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica e busca de um produto
    [Tags]           busca_produtos  lista_busca 
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Playstation"
    E um produto da linha "Playstation" deve ser mostrado na página

