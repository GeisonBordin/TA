*** Settings ***
Library    SeleniumLibrary


*** Variables ***


*** Test Cases ***
Verificar se ao preencher corretamente usuário e senha na página de login o switch é acessado
    Dado que eu acesse a pagina de login do Switch
    E preencha usuario e senha corretamente
    E concorde com a política de privacidade e termos de uso
    E clique no botão login



*** Keywords ***
Dado que eu acesse a pagina de login do Switch
    Open Browser      url=https://10.100.26.35/    browser=Chrome
    Click Button      id=details-button
    Click Element     id=proceed-link
    Sleep    3
    
E preencha usuario e senha corretamente
    Input Text        id=user_name    admin
    Input Password    id=password    INtelbras@@12
    Sleep    3

E concorde com a política de privacidade e termos de uso 
    Click Element    id=Privacy_policy
    Click Element    id=Use_terms
    Sleep    3

E clique no botão login
    Click Button    id=login_button
    Sleep    3
    