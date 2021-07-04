# ## Simple web scraper robot
# Opens a web page and stores some content.

*** Settings ***
Documentation     A web scraper robot for students.
...               It Opens a website.
...               It Stores the web page Content as a file in the output directory.
Library           RPA.Browser.Selenium
Library           RPA.FileSystem

*** Variables ***
${URL}=        https://www.w3schools.com/python/

*** Tasks ***
Store Web Page Content
    Open Available Browser    ${URL}
    ${text}=    Get Text    belowtopnav
    Create File
    ...    ${CURDIR}${/}output${/}content.txt
    ...    ${text}
    ...    overwrite=True
    
    [Teardown]    Close Browser
