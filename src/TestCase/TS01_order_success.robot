*** Settings ***
Library    SeleniumLibrary
Variables    ../Poms/data/data.py
Resource      ../Resources/TS01_order_success.resource
Test Setup    Open Browser    url=${URL}    browser=${BROWSER}
# Test Teardown    Close Browser
*** Test Cases ***
สั่งซื้ออสินค้าเลือกจัดส่งตามที่อยู่และชำระเงินด้วยบัตรเครดิต
    เข้าสู่ระบบด้วยอีเมลและรหัสผ่าน    email=${EMAIL}    password=${PASSWORD}
    ข้ามALL member
    ค้นหา ข้อมูลสินค้า โดยชื่อ สินค้า    product_name=${PRODUCTNAME}
    ตรวจสอบผลค้นหาของสินค้า    title=${EXPECT_TITLE_SEARCH}    price=${EXPECT_PRICE_SEARCH}
    เลือกสินค้า
    ตรวจสอบรายละเอียดข้อมูลสินค้าก่อนที่เพิ่มในตะกร้า    title=${EXPECT_TITLE_SEARCH}    price=${EXPECT_PRICE_SEARCH}
    เพิ่มจำนวนสินค้า    quantity=5
    ตรวจสอบจำนวนสินค้าก่อนเพิ่มในตะกร้า    quantity=5
    เพิ่มเข้าตะกร้า
    ตรวจสอบสินค้าในตะกร้าและราคา    title=${EXPECT_TITLE_SEARCH}    quantity=5    price=${EXPECT_TOTAL_PRICE}    total=${EXPECT_TOTAL_PRICE}
    ไปที่ชำระสินค้า
    เลือกวิธีจัดส่งสินค้าแบบจัดส่งตามที่อยู่
    กรอกรายละเอียดการจัดส่ง    fname=${DATA_SET_SHIPPING_FNAME}    lname=${DATA_SET_SHIPPING_LNAME}    
    ...    phone=${DATA_SET_SHIPPING_PHONENUMBER}    
    ...    home_number=${DATA_SET_SHIPPING_HOME_NUMBER}    moo=${DATA_SET_SHIPPING_MOO_NUMBER}    
    ...    prov=${DATA_SET_SHIPPING_PROV}    amp=${DATA_SET_SHIPPING_AMP}    tam=${DATA_SET_SHIPPING_TAM}
    ชำระเงินและเลือกวิธีการชำระ
    ตรวจสอบข้อมูลก่อนชำระเงิน    address=${DATA_SET_SHIPPING_FULL_ADDEES}    title=${EXPECT_TITLE_SEARCH}    
    ...    quantity=5    price=${EXPECT_TOTAL_PRICE}    
    ...    shipping_price=${EXPECT_TOTAL_SHIPING}    total=${EXPECT_TOTAL_SUM}