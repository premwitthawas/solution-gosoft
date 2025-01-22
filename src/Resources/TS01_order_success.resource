*** Settings ***
Library    SeleniumLibrary
Variables    ../Poms/localtors/localtor.py
*** Keywords ***
เข้าสู่ระบบด้วยอีเมลและรหัสผ่าน
    [Arguments]    ${email}    ${password}
    Maximize Browser Window
    Wait Until Element Is Visible    locator=${btn_link_login}
    Click Element    locator=${btn_link_login}
    Wait Until Element Is Visible    locator=${input_email_login}
    Input Text    locator=${input_email_login}    text=${email}
    Input Password    locator=${input_password_login}    password=${password}
    Click Element    locator=${btn_summit_login}
ข้ามALL member
    Wait Until Element Is Visible    locator=${btn_cancle_all_member}
    Click Element    locator=${btn_cancle_all_member}
ค้นหา ข้อมูลสินค้า โดยชื่อ สินค้า
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    locator=${input_search_product}
    Input Text    locator=${input_search_product}    text=${product_name}
    Click Button    locator=${btn_search_submit}
ตรวจสอบผลค้นหาของสินค้า
    [Arguments]    ${title}    ${price}
    Wait Until Element Is Visible    locator=${card_title_search}
    Element Text Should Be    locator=${card_title_search}    expected=${title}
    Element Text Should Be    locator=${card_price_search}    expected=${price}
เลือกสินค้า
    Wait Until Element Is Visible    locator=${card_link_product_search}
    ${count_el}=    Get Element Count    locator=${card_link_product_search}
    Log To Console    Count of elements: ${count_el}
    Click Element    locator=${btn_accept_cookie_banner}
    Scroll Element Into View    locator=${card_link_product_search}
    Click Element    locator=${card_link_product_search}
ตรวจสอบรายละเอียดข้อมูลสินค้าก่อนที่เพิ่มในตะกร้า
    [Arguments]    ${title}    ${price}
    Wait Until Element Is Visible    locator=${page_desc_title_price}
    Element Text Should Be    locator=${page_desc_title_product}    expected=${title}
    Element Text Should Be    locator=${page_desc_title_price}    expected=${price}
เพิ่มจำนวนสินค้า
    [Arguments]    ${quantity}
    Input Text    locator=${page_desc_input_quantity_product}    text=${quantity}
ตรวจสอบจำนวนสินค้าก่อนเพิ่มในตะกร้า
    [Arguments]    ${quantity}
    Element Attribute Value Should Be    locator=${page_desc_input_quantity_product}    expected=${quantity}    attribute=value
เพิ่มเข้าตะกร้า
    Click Element    locator=${page_desc_btn_add_cart}
ตรวจสอบสินค้าในตะกร้าและราคา
    [Arguments]    ${title}    ${quantity}    ${price}    ${total}
    Wait Until Element Is Visible    locator=${page_desc_cart_mini_ui}
    Element Text Should Be    locator=${page_desc_cart_mini_ui_product_title}    expected=${title}
    # Element Attribute Value Should Be    locator=${page_desc_cart_mini_ui_product_quantity}    expected=${quantity}    attribute=value
    # Element Text Should Be    locator=${page_desc_cart_mini_ui_product_price}    expected=${price}
    # Element Text Should Be    locator=${page_desc_cart_mini_ui_product_total}    expected=${total}
ไปที่ชำระสินค้า
    Click Element    locator=${page_desc_cart_mini_ui_checkout_btn}
เลือกวิธีจัดส่งสินค้าแบบจัดส่งตามที่อยู่
    Wait Until Element Is Visible    locator=${page_shiping_methode_send_with_address}
    Click Element    locator=${page_shiping_methode_send_with_address}
กรอกรายละเอียดการจัดส่ง
    [Arguments]    ${fname}    ${lname}    ${phone}    ${home_number}    ${moo}    ${prov}    ${amp}    ${tam}    
    Wait Until Element Is Visible       locator=${page_shiping_methode_input_fname}
    Input Text    locator=${page_shiping_methode_input_fname}    text=${fname}
    Input Text    locator=${page_shiping_methode_input_lname}    text=${lname}
    Input Text    locator=${page_shiping_methode_input_phone}    text=${phone}
    Input Text    locator=${page_shiping_methode_input_hnumber}    text=${home_number}
    Input Text    locator=${page_shiping_methode_input_moo}    text=${moo}
    Select From List By Value    ${page_shiping_methode_select_prov}    ${prov}
    Select From List By Value    ${page_shiping_methode_select_amp}    ${amp}
    Select From List By Value    ${page_shiping_methode_select_tam}    ${tam}
    Wait Until Element Is Visible    ${page_shiping_methode_localtion_modal}
    Wait Until Element Is Visible    ${page_shiping_methode_accept_modal}
    Scroll Element Into View    locator=${page_shiping_methode_accept_modal}
    Click Element    locator=${page_shiping_methode_accept_modal}
    Wait Until Element Is Visible    ${page_shiping_methode_confirm_modal}
    Scroll Element Into View    locator=${page_shiping_methode_confirm_modal}
    Click Element    locator=${page_shiping_methode_confirm_modal}
    Scroll Element Into View    locator=${page_shiping_methode_continue_submmit}
    Wait Until Element Is Visible    ${page_shiping_methode_continue_submmit}
    Click Button    locator=${page_shiping_methode_continue_submmit}
ชำระเงินและเลือกวิธีการชำระ
    Wait Until Element Is Visible    locator=${page_payment_crediscard}
    Click Element    locator=${page_payment_crediscard}
ตรวจสอบข้อมูลก่อนชำระเงิน
    [Arguments]    ${address}    ${title}    ${quantity}    ${price}    ${shipping_price}    ${total}
    Element Should Contain   locator=${page_payment_address}    expected=${address}
    Element Should Contain   locator=${page_payment_title}    expected=${title}
    # Element Text Should Be   locator=${page_payment_quantity}    expected=${quantity}
    # Element Text Should Be    locator=${page_payment_price}    expected=${price}
    Element Text Should Be    locator=${page_payment_shipping_price}    expected=${shipping_price}
    # Element Text Should Be    locator=${page_payment_total_price}    expected=${total}
    Sleep    time_=
