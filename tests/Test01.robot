*** Settings ***
Documentation    Partial E2e test of MBition website

Library        SeleniumLibrary

*** Variables ***

${BROWSER}        Chrome

${URL}        https://mbition.io/

*** Test Cases ***
MBition Home
    Open Homepage
    Accept Cookies
    Scroll To Products
    List Products
    Go To Jobs
    Meet MBitioneers
    

*** Keywords ***

Open Homepage
    # Open a new instance of chrome with MBition homepage
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10
    Get Title

Accept Cookies
    # Accept cookies
    Wait Until Element Is Visible    css:#uc-btn-accept-banner
    Click Element    css:#uc-btn-accept-banner  

Scroll To Products
    # Checking out the Products
    Execute Javascript     window.scrollTo(0,48000)
    Scroll Element Into View    xpath://span[contains(text(),'Our Products')]
    Execute Javascript    window.scrollTo(0, window.scrollY+300)
    Click Element    xpath://span[contains(text(),'Our Products')]
    Get Title

List Products
    # List of products
    Wait Until Element Is Visible    xpath://h2[normalize-space()='Our products']
    Execute Javascript    window.scrollTo(0, window.scrollY+500)
    # Scroll through the products and take Screenshots
    Capture Page Screenshot
    # Embedded
    Scroll Element Into View    xpath://h2[normalize-space()='Embedded']
    Execute Javascript    window.scrollTo(0, window.scrollY+500)
    Capture Page Screenshot
    # Software Factory
    Scroll Element Into View     xpath://h2[normalize-space()='Software Factory']
    Execute Javascript    window.scrollTo(0, window.scrollY+500)
    Capture Page Screenshot
    # ADAS
    Scroll Element Into View    xpath://h2[normalize-space()='ADAS']
    Execute Javascript    window.scrollTo(0, window.scrollY+500)
    Capture Page Screenshot
    # Cloud Services
    Scroll Element Into View     xpath://h2[normalize-space()='Cloud Services']
    Execute Javascript    window.scrollTo(0, window.scrollY+500)
    Capture Page Screenshot
    # Mobile Applications
    Scroll Element Into View     xpath://h2[normalize-space()='Mobile Apps']
    Execute Javascript    window.scrollTo(0, window.scrollY+500)
    Capture Page Screenshot
   
Go To Jobs
    # Go to list of Jobs
    Execute Javascript    window.scrollTo(0, window.scrollY+1000)
    Wait Until Element Is Visible    css:div[id='work-button'] span[class='elementor-button-text']
    Scroll Element Into View    css:div[id='work-button'] span[class='elementor-button-text']
    Execute Javascript    window.scrollTo(0, window.scrollY+300)
    Click Element    css:div[id='work-button'] span[class='elementor-button-text']

Meet MBitioneers
    # Meet Mbitoneers
    Scroll Element Into View    xpath:(//a)[177]
    Click Element    xpath:(//a)[177]
    Get Title
    Page Should Contain    We create the automotive world of tomorrow
    Scroll Element Into View    xpath://h2[normalize-space()='The MBitioneers']
    Execute Javascript    window.scrollTo(0, window.scrollY+600)
    Capture Page Screenshot
    Click Element    xpath:(//div[@class='overlay-inner'])[1]
    Mouse Over    xpath:(//div[@class='overlay-inner'])[1]
    Capture Page Screenshot
    # Element Text Should Be    xpath:(//div[@class='overlay-inner'])[1]    Nicola von Holleben Master of Laws
    Mouse Over    xpath:(//div[@class='overlay-inner'])[2]
    Capture Page Screenshot
    Mouse Over    xpath:(//div[@class='overlay-inner'])[3]
    Capture Page Screenshot
    Mouse Over    xpath:(//div[@class='overlay-inner'])[4]
    Capture Page Screenshot
    Mouse Over    xpath:(//div[@class='overlay-inner'])[5]
    Capture Page Screenshot
    Mouse Over    xpath:(//div[@class='overlay-inner'])[6]
    Capture Page Screenshot
    Mouse Over    xpath:(//div[@class='overlay-inner'])[7]
    Capture Page Screenshot
    Scroll Element Into View    css:h1[class='elementor-heading-title elementor-size-default']
    Capture Page Screenshot
    Close Browser



Work
# I unfortunately didnt have enough time to finish this

