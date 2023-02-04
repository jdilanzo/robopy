*** Settings ***
Documentation    A quick live demonstration of Robot Framework.
Library          DemoLib


*** Test Cases ***
Log Hello World
    Log To Console    Hello World!

Variable Should Be Equal To One
    ${x}               Set Variable    1
    Should Be Equal    ${x}    1

Variable Should Be Equal To Two
    ${x}               Set Variable    1
    Should Be Equal    ${x}    2

Random Integer Should Be Between One And Ten
    FOR    ${i}    IN RANGE    10
        ${x}                      Get Random Integer    1    10
        Should Be Greater Than    ${x}    0
        Should Be Less Than       ${x}    11
    END

Divide One By Two Should Be One Half
    ${x}               Divide    ${1}    ${2}
    Should Be Equal    ${x}    ${0.5}

Divide By Zero
    ${x}    Divide    ${1}    ${0}

Divide By Zero Should Raise Exception
    Run Keyword And Expect Error    ZeroDivisionError    Divide    ${1}    ${0}


*** Keywords ***
Get Random Integer
    [Arguments]    ${min}    ${max}
    ${x}      Evaluate    random.randint(${min}, ${max})    random
    RETURN    ${x}

Should Be Greater Than
    [Arguments]    ${first}    ${second}
    IF    ${first} < ${second}
        Fail    msg=${first} < ${second}
    END

Should Be Less Than
    [Arguments]    ${first}    ${second}
    IF    ${first} > ${second}
        Fail    msg=${first} > ${second}
    END
