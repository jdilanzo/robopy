*** Settings ***
Documentation    Enter weekly sales into the RobotSpareBin Industries Intranet
...              (Robocorp demo).
Library          RPA.Browser.Selenium


*** Variables ***
${URL}    https://robotsparebinindustries.com/


*** Tasks ***
Open The Intranet Site And Log In
    Open The Intranet Website
    Log In


*** Keywords ***
Open The Intranet Website
    Open Available Browser    ${URL}

Log In
    Input Text        username    maria
    Input Password    password    thoushallnotpass
    Submit Form
