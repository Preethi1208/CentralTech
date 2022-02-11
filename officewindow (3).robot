*** Settings ***
Library     SeleniumLibrary 
Resource    Keywords.robot 

*** Test Cases ***
Testcase
# Login to officemate website
    Open Browser   https://www.officemate.co.th/en/register       Chrome
    Maximize Browser Window
    Sleep           10s
    Click Element   //a[text()='LOG IN']
      Input Text   //input[@id='txt-loginForm-email']      ${Username} 
      Input Text   //input[@id='txt-loginForm-password']     ${Password}
    Click Element   //button[@name='submitButton']
    Sleep           10s
# Verify search results are found my inputting a search term
    Input Text      //div[@id='btn-searchResultPage']/../div/input      Table
    Click Element        //div[@id='btn-searchResultPage']
    Sleep       5s
# Verify search result is retrieving the correct result
    Page Should Contain     product results found for "Table"
    Scroll Element Into View    //div[@id='btn-searchResultPage']/../div/input
# Verify search result is not displayed for random junk charaacters
    Input Text      //div[@id='btn-searchResultPage']/../div/input      !#&*@
    Click Element        //div[@id='btn-searchResultPage']
    Sleep       10s
    Page Should Contain     ขออภัย! ไม่พบสินค้าที่ตรงกับ "!#&*@"
    Input Text      //div[@id='btn-searchResultPage']/../div/input      Table
#verify typing in search box displays recommendation & select 'folding table from' recommendation
    Sleep   5s
    Click Element   //div[text()=' in Folding Table']
    Sleep   5s
    Page Should Contain     product results found for "Folding Table"
#verify sort by options are changable - 'Sort by default to New Arrival' in the displayed product result page
    Click Element           //*[contains(text(),'product results found for "Folding Table"')]/following-sibling::div/div/div/div[text()='Sort by']
    Click Element    //*[contains(text(),'product results found for "Folding Table"')]/following-sibling::div/div/div[2]/div/div[5]/div
    Close Browser


   