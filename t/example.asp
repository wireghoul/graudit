<%@ ENABLESESSIONSTATE=False Language=JavaScript %>
<!--#include virtual ="/lib/inc/core_lib.asp"-->
<%
xml_holder = String(int_page("","/admin/sign_up/index"))

acc_type_hldr = String(Request.QueryString("acc_type"))

if (String(Request("submit")) !="undefined")
{
open_db()
name_chk = open_rs("SELECT usr FROM usr WHERE usr = '" + String(Request.Form("usr")) +"'")

if (name_chk.EOF && name_chk.BOF)
{
acc_type_hldr = String(Request.Form("acc_type"))
add_session_val("usr",String(Request.Form("usr")))
add_session_val("pass",String(Request.Form("pass")))
add_session_val("pass_hint",sub_char(String(Request.Form("pass_hint")),"'","`") )
add_session_val("acc_type",String(Request.Form("acc_type")))

dest= "su_" + String(Request.Form("acc_type")) + "_step_2.asp"
}

else
{dest = "account_exists.asp"}

name_chk.Close();
name_chk = null;

close_db()

jmp_to("/admin/sign_up/" + dest )
}

type_txt = '<T_ROW><T_CELL WIDTH="50%"><TXT TYPE="P">Account Type</TXT></T_CELL><T_CELL WIDTH="50%"><D_DROP_DOWN><DD_NAME>acc_type</DD_NAME><DD_OPTION><DDO_HEADDING>Customer</DDO_HEADDING><DDO_VAL>cust</DDO_VAL></DD_OPTION><DD_OPTION><DDO_HEADDING>Forum</DDO_HEADDING><DDO_VAL>forum</DDO_VAL></DD_OPTION><DD_OPTION><DDO_HEADDING>Affiliate</DDO_HEADDING><DDO_VAL>aff</DDO_VAL></DD_OPTION><DD_OPTION><DDO_HEADDING>Press Room</DDO_HEADDING><DDO_VAL>press</DDO_VAL></DD_OPTION></D_DROP_DOWN></T_CELL></T_ROW>'
su_txt  = ''

if(acc_type_hldr != "undefined" )
{type_txt = '<DATA_INPUT><D_NAME>acc_type</D_NAME><D_TYPE>hidden</D_TYPE><D_VAL>' + String(Request.QueryString("acc_type")) + '</D_VAL></DATA_INPUT>'}

xml_holder = sub_char(xml_holder,"[acc_type]",type_txt )

transform_xml_doc(xml_holder,"")
deint_page()
%>

