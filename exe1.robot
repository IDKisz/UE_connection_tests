*** Settings ***
Documentation       Exercise1
Library             ./exe1keywords.py
Test Teardown       detach      ${ue_id}

*** Variables ***
${ue_id}                      5
${cell_id}                    3
${bearer_id}                  7
${trf_id}                     675
${mbps}                       20

${attach_result}            UE-${ue_id} on cell=${cell_id} attached successful.
${detach_result}            UE-${ue_id} detached successfully.
${start_traffic_result}     UE-${ue_id} traffic ${mbps} Mbps on bearer ${bearer_id} with id ${trf_id} has been started
${stop_traffic_result}      UE-${ue_id} traffic on bearer ${bearer_id} with id ${trf_id} has been stopped
${show_traffic_result}      ${mbps}

*** Test Cases ***
Check if UE can be attached
    UE Attach

Check if UE can be detached
    UE Attach
    UE Detach

Check if UE can start traffic
    UE Attach
    Start traffic UE
    Show traffic UE
    UE Detach

Check if UE can stop traffic
    UE Attach
    Start traffic UE
    Show traffic UE
    Stop traffic UE
    UE Detach


*** Keywords ***
UE Attach
    ${response}     attach            ${ue_id}       ${cell_id}
    Should be equal as strings      ${response}       ${attach_result}
UE Detach
    ${response}     detach            ${ue_id}
    Should be equal as strings      ${response}      ${detach_result}
Show traffic UE
    ${response}     show_traffic      ${ue_id}      ${bearer_id}       ${trf_id}
    Should be equal as strings      ${response}      ${show_traffic_result}
Start traffic UE
    ${response}     trf_data_start    ${ue_id}      ${mbps}      ${bearer_id}      ${trf_id}
    Should be equal as strings      ${response}      ${start_traffic_result}
Stop traffic UE
    ${response}     trf_data_stop     ${ue_id}      ${bearer_id}       ${trf_id}
    Should be equal as strings      ${response}      ${stop_traffic_result}

