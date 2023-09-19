*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${Url}                             http://www.amazon.com.br
${Menu_Eletronicos}                //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')] 
${Header_Eletronicos}              //h1[contains(.,'Eletrônicos e Tecnologia')]
${Texto_Header_Eletronicos}        Eletrônicos e Tecnologia

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${Url} 
    Wait Until Element Is Visible    locator=${Menu_Eletronicos}
    Sleep    5

Entrar no menu "Eletrônicos"
    Click Element    locator=${Menu_Eletronicos}   
    Sleep    5

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         text=${Texto_Header_Eletronicos}
    Sleep    5
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
    Sleep    5
Verificar se aparece a categoria "${Nome_Categoria}"
    Element Should Be Visible    locator=//a[@aria-label='${Nome_Categoria}']
    Sleep    5
    
 Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Input Text    locator=twotabsearchtextbox  text=Xbox Series S
     Sleep      5
 Clicar no botão de pesquisa
     Click Element    locator=nav-search-submit-button
     Sleep    5

 Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Wait Until Element Is Visible    locator=(//span[contains(.,'Console Xbox Series S')])[2]
    
      