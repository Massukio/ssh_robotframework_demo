*** Settings ***
Library         SSHLibrary
Suite Setup     Open Connection And Log In
Suite Teardown  Close All Connections

*** Variables ***
${HOST}      test.rebex.net
${USERNAME}  demo
${PASSWORD}  password

*** Test Cases ***
Execute Command And Verify Output
    [Documentation]    Execute Command can be used to run commands on the remote machine.
    ...                The keyword returns the standard output by default.
    ${output}=         Execute Command    echo Hello SSHLibrary!
    Should Be Equal    ${output}          Hello SSHLibrary!

Execute ls Command And Verify Output
    ${output}=         Execute Command    ls
    Should Be Equal    ${output}          aspnet_client\npub\nreadme.txt
    Log                ${output} 
    
*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}