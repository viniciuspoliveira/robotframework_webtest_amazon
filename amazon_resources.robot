*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome     
${URL}    https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}  //h1[contains(.,'Eletrônicos e Tecnologia')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser


Acessar o home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
    
Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=Eletrônicos e Tecnologia
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Title Should Be    title=Eletrônicos e Tecnologia | Amazon.com.br

Verificar se aparece a categoria "Computadores e Informática"
    Element Should Be Visible    locator=//img[contains(@alt,'Computadores e Informática')]

Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Input Text    locator=//input[contains(@type,'text')]   text=Playstation 5
    
Clicar no botão de pesquisa
    Click Element   locator=nav-search-submit-button

Verificar o resultado da pesquisa,se está listando o produto "Playstation"
    Wait Until Element Is Enabled    locator=//h2[@class='a-size-mini a-spacing-none a-color-base s-line-clamp-4'][contains(.,'Console PlayStation')]


# GHERKIN STEPS


Dado que estou na home page da Amazon.com.br
    Acessar o home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"


Quando pesquisar pelo produto "Playstation"
    Digitar o nome de produto "Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa

E um produto da linha "Playstation" deve ser mostrado na página
    Verificar o resultado da pesquisa,se está listando o produto "Playstation"

