*** Settings ***

Documentation    Job Application Demo of MBition website

Library        SeleniumLibrary
Library        ScreenCapLibrary

*** Variables ***

${BROWSER}        Chrome

${URL2}         https://mbition.io/jobs/

*** Test Cases ***
MBition Job Search
    Open Job Page
    Accept Cookies
    Jobs
    Find Next Role

Apply New Role
    Open Job Page
    Accept Cookies
    Jobs
    Apply Now
    Application Form

*** Keywords ***

Open Job Page
    # Open a new page of chrome with MBition job page
    Open Browser    ${URL2}    Chrome
    ${PageTitle} =     Get Title
    Title Should Be  ${PageTitle} 
    Maximize Browser Window
    Set Browser Implicit Wait    10


Accept Cookies
    # get Cookies could be used as well and added to other sessions
    # accept cookies 
    Wait Until Element Is Visible    css:#uc-btn-accept-banner
    Click Element    css:#uc-btn-accept-banner  

Jobs
    Click Element    xpath://div[normalize-space()='Experience Level']
    # click drop down menu to select experience level
    Click Element    xpath://label[normalize-space()='Professional']
    # Professional level of experience selected
    Click Element    css:div[class='gsk-dropdownbox aktiv'] a[class='filterbtn']
    # Select location "Berlin"
    Click Element    xpath://div[normalize-space()='Location']
    Click Element    xpath://label[normalize-space()='Berlin']
    # Accept Selected location
    Click Element    css:div[class='gsk-dropdownbox aktiv'] a[class='filterbtn']
    # Reset to default
    Click Element    xpath://div[normalize-space()='Location']
    Click Element    css:div[class='auswahl-sum has-items'] a[class='reset']
    # Choose Berlin as Location
    Click Element    xpath://label[normalize-space()='Berlin']
    # Accept Selected location
    Click Element    css:div[class='gsk-dropdownbox aktiv'] a[class='filterbtn']

Find Next Role
    #Find My desired role
    Scroll Element Into View     xpath://a[normalize-space()='E2E - Test Engineer (all genders)']
    Execute Javascript    window.scrollTo(0, window.scrollY+400)
    Wait Until Element Is Visible    xpath://a[normalize-space()='E2E - Test Engineer (all genders)'] 
    # Verify Role is in the middle of the screen
    Mouse Over    xpath://a[normalize-space()='E2E - Test Engineer (all genders)']
    Get Title
    Close All Browsers
    
Apply Now
    Scroll Element Into View     xpath://a[normalize-space()='E2E - Test Engineer (all genders)']
    Execute Javascript    window.scrollTo(0, window.scrollY+400)
    Wait Until Element Is Visible    xpath://a[normalize-space()='E2E - Test Engineer (all genders)'] 
    #Verify Role is in the middle of the screen
    Click Element    xpath://a[normalize-space()='E2E - Test Engineer (all genders)']
    #Start application process
    Scroll Element Into View     css:.applynow
    Execute Javascript    window.scrollTo(0, window.scrollY+400)
    Click Element        css:.applynow
    Get Title
    # ${url45} =  Execute Javascript  return window.location.href;
    # @{WindowTile} =    Get Window Titles
    
    # Scroll Element Into View     css:div[class='applyform'] h4
    # Execute Javascript    window.scrollTo(0, window.scrollY+250)
Application Form
    # open a new tab
    ${tab1}=        Switch Window    NEW 
    Wait Until Element Contains    xpath://h4[normalize-space()='Application form']    Application form
    #Application form in view
    Scroll Element Into View     xpath://h4[normalize-space()='Application form']
    Execute Javascript    window.scrollTo(0, window.scrollY+400)
    # Filling the Application form
    # First Name is entered
    Input Text    css:input[name='first_name']    Damilola
    # Last Name is entered
    Input Text    css:input[name='last_name']    Ojedokun
    # Email is entered
    Input Text    css:input[name='email']    samuel4luve@yahoo.com
    # Phone Number is entered
    Input Text    css:#phone    +380682805081
    # Location should be set to Berlin
    Element Should Be Visible    css:#location
    Element Should Contain    css:#location    Berlin
    # availabilty
    Input Text    css:#available    Three weeks
    # Salary
    Input Text    css:#salary    Open to negotiations
    # Candidate should have a work permit in a country of application
    Element Should Be Visible    css:#permitger
    Element Should Contain    css:#permitger    yes
    # About the Role {Career website chosen}
    Element Should Be Visible    css:#hearfrom
    Element Should Contain    css:#hearfrom    Career Website
    #Other applied Roles in the company Should be yes
    Element Should Contain    css:#otherprocess    yes
    # Referral
    Input Text    css:#referral    Nancy Fakour
    # Attach application documents
    Element Should Contain    css:#intpos    yes
    Wait Until Element Is Visible    id:document1
    Choose File    id:document1      /Users/temp/MBitionProject/CV DAMILOLA.pdf 
    Wait Until Element Is Visible    id:document4
    Choose File    id:document4    /Users/temp/MBitionProject/Damilola_Ojedokun Letter of Recommendation.pdf
    # Accept Data Privacy Statement
    Click Element    css:#dataprot
    #Click Button    css:#submitButton
    Execute Javascript    window.scrollTo(0, window.scrollY-650)
   # Take Screenshot    name=screenshot
    # Capture Page Screenshot
    # Set Screenshot Directory    /Users/temp/MBitionProject/Images
    ScreenCapLibrary.Take Screenshot    name=screenshot
    ScreenCapLibrary.Set Screenshot Directory    /Users/temp/MBitionProject/Images
    Close Window
    Close All Browsers
    




    


    
    
    
    


    
