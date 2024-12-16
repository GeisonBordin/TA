*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              https://10.100.26.35/
${USER_NAME}        admin
${PASSWORD}         INtelbras@@12

*** Test Cases ***
Verificar se ao preencher corretamente usuário e senha na página de login o switch é acessado
    Dado que eu acesse a pagina de login do Switch
    E preencha usuario e senha corretamente
    E concorde com a política de privacidade e termos de uso
    E clique no botão login

*** Keywords ***
Dado que eu acesse a pagina de login do Switch
    ${chrome_options}=    Create Dictionary    headless=True    disable-gpu=True    no-sandbox=True
    Open Browser    ${URL}    Chrome    options=${chrome_options}
    Click Button      id=details-button
    Click Element     id=proceed-link
    Wait Until Element Is Visible    id=user_name    timeout=10s

E preencha usuario e senha corretamente
    Input Text        id=user_name    ${USER_NAME}
    Input Password    id=password    ${PASSWORD}
    Wait Until Element Is Visible    id=Privacy_policy    timeout=10s

E concorde com a política de privacidade e termos de uso 
    Click Element    id=Privacy_policy
    Click Element    id=Use_terms
    Wait Until Element Is Visible    id=login_button    timeout=10s

E clique no botão login
    Click Button    id=login_button
    Wait Until Page Contains    "Bem-vindo"    timeout=10s
    Close Browser
