*** Settings ***
# Library    SeleniumLibrary
Resource                        ../Resources/Libraries/Libraries-file_resources.robot

*** Keywords ***
Abrir Navegador Com Zoom Personalizado
    [Arguments]    ${SITE_HOT}    ${zoom_fator}=1.0
    [Documentation]    Abre o navegador Chrome com o zoom definido via --force-device-scale-factor.
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${zoom arg}=    Catenate    SEPARATOR=    --force-device-scale-factor=    ${zoom_fator}
    Call Method    ${chrome options}    add_argument    ${zoom arg}
    # Create WebDriver    Chrome    chrome_options=${chrome options}
    Create WebDriver    Chrome    options=${chrome options}
    Go To    ${SITE_HOT}