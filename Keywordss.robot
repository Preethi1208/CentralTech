*** Settings    ***
Library     SeleniumLibrary 
*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    log  your super secret password is ${password}


*** Variables ***
${Username}  preethia1221@gmail.com
${Password}  Highheels@123