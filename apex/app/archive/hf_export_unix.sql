set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
 
--application/set_environment
prompt  APPLICATION 172 - Test app
--
-- Application Export:
--   Application:     172
--   Name:            Test app
--   Date and Time:   01:50 Wednesday November 5, 2014
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.1.1.00.23
--   Instance ID:     63117220684466
 
-- Import:
--   Using application builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040100 or as the owner (parsing schema) of the application.
 
-- Application Statistics:
--   Pages:                   21
--     Items:                 86
--     Computations:           1
--     Validations:           27
--     Processes:             45
--     Regions:               60
--     Buttons:               46
--     Dynamic Actions:        2
--   Shared Components
--     Breadcrumbs:            1
--        Entries             18
--     Items:                  2
--     Computations:           0
--     Processes:              0
--     Parent Tabs:            0
--     Tab Sets:               1
--        Tabs:                5
--     NavBars:                1
--     Lists:                  3
--     Shortcuts:              2
--     Themes:                 2
--     Templates:
--        Page:               18
--        List:               32
--        Report:             15
--        Label:              10
--        Region:             45
--     Messages:               0
--     Build Options:          0
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040100 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,7682324930705255));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2011.02.12');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,172);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,172));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,172));
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,172),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,172),
  p_owner => nvl(wwv_flow_application_install.get_schema,'MARIELLE'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Test app'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'M1_TEST'),
  p_page_view_logging => 'YES',
  p_default_page_template=> 139547602857324086 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=> 139548503480324089 + wwv_flow_api.g_id_offset,
  p_default_region_template=> 139554719955324121 + wwv_flow_api.g_id_offset,
  p_error_template=> 139547031797324084 + wwv_flow_api.g_id_offset,
  p_page_protection_enabled_y_n=> 'N',
  p_checksum_salt_last_reset => '20141105015006',
  p_max_session_length_sec=> 28800,
  p_compatibility_mode=> '4.1',
  p_home_link=> 'f?p=&APP_ID.:1:&SESSION.',
  p_flow_language=> 'en-us',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_allow_feedback_yn=> 'N',
  p_date_format=> 'DD.MM.YYYY',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'/i/'),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 122289461820336765 + wwv_flow_api.g_id_offset,
  p_login_url=> '',
  p_logout_url=> 'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1',
  p_application_tab_set=> 1,
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_custom_auth_login_url=> '',
  p_flow_version=> 'release 1.0',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'Y',
  p_browser_frame=>'A',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_csv_encoding=> 'Y',
  p_auto_time_zone=> 'N',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_theme_id => 16,
  p_default_label_template => 139565703798324175 + wwv_flow_api.g_id_offset,
  p_default_report_template => 139563714492324164 + wwv_flow_api.g_id_offset,
  p_default_list_template => 139561327579324151 + wwv_flow_api.g_id_offset,
  p_default_menu_template => 139566021514324176 + wwv_flow_api.g_id_offset,
  p_default_button_template => 139549412510324095 + wwv_flow_api.g_id_offset,
  p_default_chart_template => 139552020821324115 + wwv_flow_api.g_id_offset,
  p_default_form_template => 139552308980324116 + wwv_flow_api.g_id_offset,
  p_default_wizard_template => 139556508535324126 + wwv_flow_api.g_id_offset,
  p_default_tabform_template => 139554719955324121 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>139554719955324121 + wwv_flow_api.g_id_offset,
  p_default_menur_template => 139550805302324109 + wwv_flow_api.g_id_offset,
  p_default_listr_template => 139554719955324121 + wwv_flow_api.g_id_offset,
  p_last_updated_by => 'ADMIN',
  p_last_upd_yyyymmddhh24miss=> '20141105015006',
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 122292670709336829 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 200,
  p_icon_image => '',
  p_icon_subtext=> 'Logout',
  p_icon_target=> '&LOGOUT_URL.',
  p_icon_image_alt=> 'Logout',
  p_icon_height=> 32,
  p_icon_width=> 32,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> 'CURRENT_LOOK_IS_1',
  p_begins_on_new_line=> '',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
prompt  ...application items
--
--application/shared_components/logic/application_items/f101_account_tree_root
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 131894665608027987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'F101_ACCOUNT_TREE_ROOT',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'N',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/fsp_after_login_url
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 122543672685722765 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'FSP_AFTER_LOGIN_URL',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> '',
  p_item_comment=> '');
 
null;
 
end;
/

prompt  ...application level computations
--
 
begin
 
null;
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
--application/shared_components/navigation/tabs/standard/t_operations
wwv_flow_api.create_tab (
  p_id=> 122293470483336840 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 10,
  p_tab_name=> 'T_OPERATIONS',
  p_tab_text => 'Операции',
  p_tab_step => 1,
  p_tab_also_current_for_pages => '2,4,3',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_переводы
wwv_flow_api.create_tab (
  p_id=> 127878257183145973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 15,
  p_tab_name=> 'T_ПЕРЕВОДЫ',
  p_tab_text => 'Переводы',
  p_tab_step => 15,
  p_tab_also_current_for_pages => '',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_analyze
wwv_flow_api.create_tab (
  p_id=> 122310156908337647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 20,
  p_tab_name=> 'T_ANALYZE',
  p_tab_text => 'Анализ',
  p_tab_step => 5,
  p_tab_also_current_for_pages => '6,7,8,9,10,11',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/t_accounts
wwv_flow_api.create_tab (
  p_id=> 127904246821370076 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 30,
  p_tab_name=> 'T_ACCOUNTS',
  p_tab_text => 'Справочники',
  p_tab_step => 20,
  p_tab_also_current_for_pages => '12,18,19,20,16,17',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
--application/shared_components/navigation/tabs/standard/остатки
wwv_flow_api.create_tab (
  p_id=> 130902567614242325 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_tab_set=> 'TS1',
  p_tab_sequence=> 40,
  p_tab_name=> 'Остатки',
  p_tab_text => 'Остатки',
  p_tab_step => 21,
  p_tab_also_current_for_pages => '22',
  p_tab_parent_tabset=>'TS1',
  p_tab_comment  => '');
 
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/accounts_pseudo_tree_all
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 146282307071122845 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'ACCOUNTS_PSEUDO_TREE_ALL',
  p_lov_query=> 'select lpad(b.account_name,(lengthb(b.account_name)+(level-1)*4),''~'') d,'||unistr('\000a')||
'       b.id r'||unistr('\000a')||
'from balance_account b'||unistr('\000a')||
'start with b.parent_id is null'||unistr('\000a')||
'connect by prior b.id=b.parent_id');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/accounts_pseudo_tree_current_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 113592907700174600 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'ACCOUNTS_PSEUDO_TREE_CURRENT_LOV',
  p_lov_query=> 'select lpad(b.account_name,(lengthb(b.account_name)+(level-1)*4),''~'') d,'||unistr('\000a')||
'       b.id r'||unistr('\000a')||
'from balance_account b'||unistr('\000a')||
'WHERE nvl(trunc(b.end_date),SYSDATE) > trunc(SYSDATE)'||unistr('\000a')||
'start with b.parent_id =57'||unistr('\000a')||
'connect by prior b.id=b.parent_id');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/accounts_pseudo_tree_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 127976259077395129 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'ACCOUNTS_PSEUDO_TREE_LOV',
  p_lov_query=> 'select lpad(b.account_name,(lengthb(b.account_name)+(level-1)*4),''~'') d,'||unistr('\000a')||
'       b.id r'||unistr('\000a')||
'from balance_account b'||unistr('\000a')||
'start with b.parent_id =57'||unistr('\000a')||
'connect by prior b.id=b.parent_id');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/balance_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 127835264567159489 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'BALANCE_LOV',
  p_lov_query=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/contractor_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 127835045174153876 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'CONTRACTOR_LOV',
  p_lov_query=> 'select CNTR_NAME display_value, ID return_value '||unistr('\000a')||
'from CONTRACTOR'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/currency_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 127834862011149317 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'CURRENCY_LOV',
  p_lov_query=> 'select SHORT_NAME display_value, ID return_value '||unistr('\000a')||
'from CURRENCY'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/is_applied_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 127835667038188608 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'IS_APPLIED_LOV',
  p_lov_query=> 'select NM display_value, N return_value '||unistr('\000a')||
'from IS_APPL_LOOKUP'||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/op_direction_2lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 131865856638532795 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'OP_DIRECTION_2LOV',
  p_lov_query=> 'select name d, id r'||unistr('\000a')||
'from direction_lookup'||unistr('\000a')||
'where name in (''Доход'',''Расход'')');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/op_direction_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 127834551014127173 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'OP_DIRECTION_LOV',
  p_lov_query=> 'select name d, id r'||unistr('\000a')||
'from direction_lookup');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/period_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 130516257884518889 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'PERIOD_LOV',
  p_lov_query=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq');
 
null;
 
end;
/

--application/shared_components/user_interface/lov/rate_absolut_lov
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 130704251229267751 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'RATE_ABSOLUT_LOV',
  p_lov_query=> 'select cr.rate d, cr.id r'||unistr('\000a')||
'from currency_rate cr');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/shared_components/navigation/trees/accounts_tree
 
begin
 
wwv_flow_api.create_tree (
  p_id=> 127842268272078365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Accounts tree',
  p_type=>'DYNAMIC',
  p_item=>'F101_ACCOUNT_TREE_ROOT',
  p_query=>'select "ID" id, '||unistr('\000a')||
'       "PARENT_ID" pid, '||unistr('\000a')||
'       "ACCOUNT_NAME" name, '||unistr('\000a')||
'       ''f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::NO::P9_ACC_ID:''||ID||'':P9_ACC_NAME:''||ACCOUNT_NAME||'' '' link, '||unistr('\000a')||
'       null a1, '||unistr('\000a')||
'       null a2 '||unistr('\000a')||
'from "#OWNER#"."BALANCE_ACCOUNT"',
  p_levels=>5,
  p_unexpanded_parent=> '<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre02.gif" width="16" height="22" border="0"></a></td>',
  p_unexpanded_parent_last=> '<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre03.gif" width="16" height="22" border="0"></a></td>',
  p_expanded_parent=>'<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre05.gif" width="16" height="22" border="0"></td>',
  p_expanded_parent_last=>'<td><a href="#DRILL_DOWN#"><img src="#IMAGE_PREFIX#Fndtre06.gif" width="16" height="22" border="0"></a></td>',
  p_leaf_node=>'<td align="left"><img src="#IMAGE_PREFIX#Fndtre07.gif" width="16" height="22" border="0"></td>',
  p_leaf_node_last=>'<td align="left"><img src="#IMAGE_PREFIX#Fndtre08.gif" width="16" height="22" border="0"></td>',
  p_name_link_anchor_tag=>'<a href="#LINK#">#NAME#</a>',
  p_name_link_not_anchor_tag=>'#NAME#',
  p_indent_vertical_line=>'<td><img src="#IMAGE_PREFIX#Fndtre09.gif" width="16" height="22" border="0"></td>',
  p_indent_vertical_line_last=>'<td><img src="#IMAGE_PREFIX#Fndtre10.gif" width="16" height="22" border="0"></td>',
  p_drill_up=>'&nbsp;(up)',
  p_before_tree=>'<table border="0" cellspacing="0" cellpadding="0">',
  p_after_tree=>'</table>',
  p_level_1_template=>'<tr>#INDENT#<td colspan="#COLSPAN#" valign="CENTER" class="tiny">#NAME##A1##A2# #DRILL_UP#</td></tr>',
  p_level_2_template=>'<tr>#INDENT#<td colspan="#COLSPAN#" valign="CENTER" class="tiny">#NAME##A1##A2#</td></tr>');
null;
 
end;
/

--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
wwv_flow_api.create_page_group(
  p_id=>127918348765829395 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'Analyze',
  p_group_desc=>'Reports, charts etc.');
 
wwv_flow_api.create_page_group(
  p_id=>127918259024822903 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'DML forms',
  p_group_desc=>'Pages  for inserting, updating or deleting data in DB');
 
wwv_flow_api.create_page_group(
  p_id=>130691167487121040 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'Dictionaries',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>130691455197155376 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'Trash bin',
  p_group_desc=>'');
 
null;
 
end;
/

--application/comments
prompt  ...comments: requires application express 2.2 or higher
--
 
--application/pages/page_00001
prompt  ...PAGE 1: Report Page
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_tab_set => 'TS1'
 ,p_name => 'Report Page'
 ,p_step_title => 'Операции'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Report Page'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 127918259024822903 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<style type="text/css">'||unistr('\000a')||
'.row_has_values_1{'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'.row_has_values_2{'||unistr('\000a')||
' display: none;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20140129171408'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT f.id, f.oper_type,f.op_date,f.account_name,f.EXP,f.inc,f.comments,f.cur,f.rate,f.cntr_name,f.balance_name name'||unistr('\000a')||
'  FROM finance_operations_all_v f'||unistr('\000a')||
' WHERE f.balance_id =nvl(:P1_BALANCE,f.balance_id) 	'||unistr('\000a')||
'   and f.op_date between nvl(:P1_LOW_DT,f.op_date) and nvl(:P1_HI_DT,f.op_date)'||unistr('\000a')||
'   and (decode(f.op_direction,1,f.amount,0)>=:P1_LOW_SUM or decode(f.op_direction,2,f.amount,0)>0 or :P1_LOW_SUM is';

s:=s||' null)'||unistr('\000a')||
'   and (f.oper_type = 1 OR f.oper_type = 2 and :P1_SHOW_TR = 1)'||unistr('\000a')||
'   and (f.oper_type = 2 OR :P1_ACCOUNT_QF IS NULL OR'||unistr('\000a')||
'        f.account_id IN (SELECT ba.ID FROM balance_account ba '||unistr('\000a')||
'                          START WITH ba.ID = :P1_ACCOUNT_QF'||unistr('\000a')||
'                        CONNECT BY PRIOR ba.ID = ba.parent_id'||unistr('\000a')||
'                        )'||unistr('\000a')||
'       )'||unistr('\000a')||
'   and (f.oper_type = 2 OR f.contractor_id=:P1_contracto';

s:=s||'r or :P1_contractor is null)'||unistr('\000a')||
'   and f.cur_id = nvl(:P1_CURRENCY,f.cur_id)'||unistr('\000a')||
'order by OP_DATE DESC;';

wwv_flow_api.create_page_plug (
  p_id=> 122293561120337465 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Журнал операций',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139553807774324119+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'N',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_prn_page_header_alignment=> 'LEFT',
  p_prn_page_footer_alignment=> 'LEFT',
  p_plug_customized=>'1',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'SELECT f.id, f.oper_type,f.op_date,f.account_name,f.EXP,f.inc,f.comments,f.cur,f.rate,f.cntr_name,f.balance_name name'||unistr('\000a')||
'  FROM finance_operations_all_v f'||unistr('\000a')||
' WHERE f.balance_id =nvl(:P1_BALANCE,f.balance_id) 	'||unistr('\000a')||
'   and f.op_date between nvl(:P1_LOW_DT,f.op_date) and nvl(:P1_HI_DT,f.op_date)'||unistr('\000a')||
'   and (decode(f.op_direction,1,f.amount,0)>=:P1_LOW_SUM or decode(f.op_direction,2,f.amount,0)>0 or :P1_LOW_SUM is';

a1:=a1||' null)'||unistr('\000a')||
'   and (f.oper_type = 1 OR f.oper_type = 2 and :P1_SHOW_TR = 1)'||unistr('\000a')||
'   and (f.oper_type = 2 OR :P1_ACCOUNT_QF IS NULL OR'||unistr('\000a')||
'        f.account_id IN (SELECT ba.ID FROM balance_account ba '||unistr('\000a')||
'                          START WITH ba.ID = :P1_ACCOUNT_QF'||unistr('\000a')||
'                        CONNECT BY PRIOR ba.ID = ba.parent_id'||unistr('\000a')||
'                        )'||unistr('\000a')||
'       )'||unistr('\000a')||
'   and (f.oper_type = 2 OR f.contractor_id=:P1_contracto';

a1:=a1||'r or :P1_contractor is null)'||unistr('\000a')||
'   and f.cur_id = nvl(:P1_CURRENCY,f.cur_id)'||unistr('\000a')||
'order by OP_DATE DESC;';

wwv_flow_api.create_worksheet(
  p_id=> 122293766669337468+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_region_id=> 122293561120337465+wwv_flow_api.g_id_offset,
  p_name=> 'Operations',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '10000',
  p_max_row_count_message=> 'This query returns more than 10,000 rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'N',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'N',
  p_show_sort=>'Y',
  p_show_control_break=>'N',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'N',
  p_show_reset=>'N',
  p_show_download=>'Y',
  p_show_help=>'N',
  p_download_formats=>'PDF:RTF',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_icon_view_columns_per_row=>1,
  p_detail_view_enabled_yn=>'N',
  p_owner=>'ADMIN');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 122293864432337489+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>' ',
  p_report_label           =>' ',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_column_link            =>'f?p=&APP_ID.:2:&SESSION.:EDIT:&DEBUG.:2:P2_ID:#ID#',
  p_column_linktext        =>'<img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="">',
  p_column_link_attr       =>'class="row_has_values_#OPER_TYPE#"',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_display_condition      =>'#OPER_TYPE#',
  p_display_condition2     =>'1',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 122294147870337500+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'OP_DATE',
  p_display_order          =>2,
  p_column_identifier      =>'D',
  p_column_label           =>'Дата',
  p_report_label           =>'Дата',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127852753682842158+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> null,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ACCOUNT_NAME',
  p_display_order          =>5,
  p_column_identifier      =>'M',
  p_column_label           =>'Статья',
  p_report_label           =>'Статья',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127852963713842173+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> null,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CNTR_NAME',
  p_display_order          =>7,
  p_column_identifier      =>'O',
  p_column_label           =>'Контрагент',
  p_report_label           =>'Контрагент',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_display_condition_type =>'ITEM_IS_NULL',
  p_display_condition      =>'P1_CONTRACTOR',
  p_display_condition2     =>'-1',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127853062056842173+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> null,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NAME',
  p_display_order          =>8,
  p_column_identifier      =>'P',
  p_column_label           =>'Счет',
  p_report_label           =>'Счет',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_display_condition_type =>'ITEM_IS_NULL',
  p_display_condition      =>'P1_BALANCE',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 122294560293337501+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'COMMENTS',
  p_display_order          =>9,
  p_column_identifier      =>'H',
  p_column_label           =>'Комментарии',
  p_report_label           =>'Комментарии',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130334668435310137+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> null,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'EXP',
  p_display_order          =>10,
  p_column_identifier      =>'Q',
  p_column_label           =>'-',
  p_report_label           =>'-',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130334757215310164+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> null,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'INC',
  p_display_order          =>11,
  p_column_identifier      =>'R',
  p_column_label           =>'+',
  p_report_label           =>'+',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130334849430310164+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> null,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CUR',
  p_display_order          =>12,
  p_column_identifier      =>'S',
  p_column_label           =>'€',
  p_report_label           =>'€',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130334973003310165+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> null,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'RATE',
  p_display_order          =>13,
  p_column_identifier      =>'T',
  p_column_label           =>'Курс',
  p_report_label           =>'Курс',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 532895736528311410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'OPER_TYPE',
  p_display_order          =>14,
  p_column_identifier      =>'U',
  p_column_label           =>'Oper Type',
  p_report_label           =>'Oper Type',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_tz_dependent           =>'N',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:CUR:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 122543844419724031+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'1324926133759439',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>200,
  p_report_columns          =>rc1,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 146265000682140935+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 122543844419724031+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 146265104375140936+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 122543844419724031+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME::APXWS_CC_001';

wwv_flow_api.create_worksheet_rpt(
  p_id => 134646117273108502+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_ALTERNATIVE',
  p_name                    =>'3CARD-R',
  p_report_seq              =>10,
  p_report_alias            =>'1346462',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>200,
  p_report_columns          =>rc1,
  p_sum_columns_on_break    =>'INC:EXP:APXWS_CC_001',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134646419803108506+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134646117273108502+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134646501723108506+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134646117273108502+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134646302550108504+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134646117273108502+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'3CARD-R%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''3CARD-R%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_computation(
  p_id => 134646629944108507+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134646117273108502+wwv_flow_api.g_id_offset,
  p_db_column_name    =>'APXWS_CC_001',
  p_column_identifier =>'C01',
  p_computation_expr  =>'R - Q',
  p_format_mask       =>'',
  p_column_type       =>'NUMBER',
  p_column_label      =>'Diff',
  p_report_label      =>'Diff');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 134647623852110410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_ALTERNATIVE',
  p_name                    =>'Ипотека',
  p_report_seq              =>10,
  p_report_alias            =>'1346477',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>200,
  p_report_columns          =>rc1,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134647929380110410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134647623852110410+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134648010387110410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134647623852110410+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134647831221110410+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134647623852110410+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'%потека%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''%потека%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 134648529740112069+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_ALTERNATIVE',
  p_name                    =>'Росинка',
  p_report_seq              =>10,
  p_report_alias            =>'1346486',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>200,
  p_report_columns          =>rc1,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134648817254112070+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134648529740112069+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134648906067112070+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134648529740112069+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134648727554112070+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134648529740112069+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'Росинка%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Росинка%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 138645903561411214+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_ALTERNATIVE',
  p_name                    =>'Fielder кредит ГПБ',
  p_report_seq              =>10,
  p_report_alias            =>'1386460',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>200,
  p_report_columns          =>rc1,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138646204324411214+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138645903561411214+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138646305017411214+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138645903561411214+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138646116710411214+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138645903561411214+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'=',
  p_expr                    =>'Fielder кредит ГПБ',
  p_condition_sql           =>'"COMMENTS" = #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# = ''Fielder кредит ГПБ''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 138646930919419173+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_ALTERNATIVE',
  p_name                    =>'Fielder (покупка)',
  p_report_seq              =>10,
  p_report_alias            =>'1386470',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>200,
  p_report_columns          =>rc1,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138648616471424955+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138646930919419173+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138648726102424955+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138646930919419173+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138648418237424954+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138646930919419173+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'ACCOUNT_NAME',
  p_operator                =>'=',
  p_expr                    =>'Приобретение авто',
  p_condition_sql           =>'"ACCOUNT_NAME" = #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# = ''Приобретение авто''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138648519932424954+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138646930919419173+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'Fielder%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Fielder%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME::APXWS_CC_001';

wwv_flow_api.create_worksheet_rpt(
  p_id => 114241916177963311+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'MARIELLE_ADMIN',
  p_name                    =>'3CARD-R Кислицын',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP:APXWS_CC_001',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134356809296785181+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114241916177963311+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134356911345785181+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114241916177963311+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134356711865785180+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114241916177963311+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'3CARD-R%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''3CARD-R%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_computation(
  p_id => 134357027431785188+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114241916177963311+wwv_flow_api.g_id_offset,
  p_db_column_name    =>'APXWS_CC_001',
  p_column_identifier =>'C01',
  p_computation_expr  =>'R - Q',
  p_format_mask       =>'',
  p_column_type       =>'NUMBER',
  p_column_label      =>'Diff',
  p_report_label      =>'Diff');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 114323114642152134+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'MARIELLE_ADMIN',
  p_name                    =>'Ипотека',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 114323325950152165+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114323114642152134+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 114323425886152165+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114323114642152134+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 114323207531152155+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114323114642152134+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'%потека%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''%потека%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 114771711992128284+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'MARIELLE_ADMIN',
  p_name                    =>'Нарановича',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 114771907043128289+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114771711992128284+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 114772015663128289+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114771711992128284+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 114771816864128289+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 114771711992128284+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'%арановича%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''%арановича%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 132583328464079752+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'MARIELLE_ADMIN',
  p_name                    =>'Новосибирск:RAC',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 132583524841079758+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 132583328464079752+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 132583617549079758+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 132583328464079752+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 132583409730079758+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 132583328464079752+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'Новосибирск:RAC%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Новосибирск:RAC%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 134592112988642093+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'MARIELLE_ADMIN',
  p_name                    =>'Росинка',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134592313883642104+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134592112988642093+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134592425395642104+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134592112988642093+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 134592231076642100+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 134592112988642093+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'Росинка%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Росинка%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 137671612285135589+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'M',
  p_name                    =>'Росинка, кредит',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 137671926488135592+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 137671612285135589+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 137672029037135592+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 137671612285135589+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 137671701308135592+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 137671612285135589+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'ACCOUNT_NAME',
  p_operator                =>'=',
  p_expr                    =>'Долги in-out',
  p_condition_sql           =>'"ACCOUNT_NAME" = #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# = ''Долги in-out''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 137671830508135592+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 137671612285135589+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'Росинка%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Росинка%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 138645132520410115+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'MARIELLE_ADMIN',
  p_name                    =>'Fielder кредит ГПБ',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138645316025410116+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138645132520410115+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138645415522410116+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138645132520410115+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 138645219082410116+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 138645132520410115+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'=',
  p_expr                    =>'Fielder кредит ГПБ',
  p_condition_sql           =>'"COMMENTS" = #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# = ''Fielder кредит ГПБ''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 139892510077210488+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'M',
  p_name                    =>'Fielder кредит ГПБ (like)',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 139892713371210490+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 139892510077210488+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 139892804336210490+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 139892510077210488+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 139892616087210490+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 139892510077210488+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'Fielder кредит ГПБ%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Fielder кредит ГПБ%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
    rc3 varchar2(32767) := null;
begin
rc3:=rc3||'ID:OP_DATE:ACCOUNT_NAME:EXP:INC:NAME:COMMENTS:CNTR_NAME:';

wwv_flow_api.create_worksheet_rpt(
  p_id => 143456326549847396+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'M',
  p_name                    =>'Germany',
  p_report_seq              =>10,
  p_status                  =>'PRIVATE',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'N',
  p_display_rows            =>200,
  p_report_columns          =>rc3,
  p_sum_columns_on_break    =>'INC:EXP',
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 143456527957847401+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 143456326549847396+wwv_flow_api.g_id_offset,
  p_name                    =>'Расход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'EXP',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("EXP" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0066',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 143456607287847401+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 143456326549847396+wwv_flow_api.g_id_offset,
  p_name                    =>'Доход',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'INC',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("INC" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 143456400011847401+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_worksheet_id => 122293766669337468+wwv_flow_api.g_id_offset,
  p_report_id => 143456326549847396+wwv_flow_api.g_id_offset,
  p_condition_type          =>'FILTER',
  p_allow_delete            =>'Y',
  p_column_name             =>'COMMENTS',
  p_operator                =>'like',
  p_expr                    =>'Germany%',
  p_condition_sql           =>'"COMMENTS" like #APXWS_EXPR#',
  p_condition_display       =>'#APXWS_COL_NAME# #APXWS_OP_NAME# ''Germany%''  ',
  p_enabled                 =>'Y',
  p_column_format           =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122321055329337720 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'BreadCrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 128170165943511776 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Фильтр',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 4,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select cb.name Счет, cb.saldo Остаток,'||unistr('\000a')||
'       sum (saldo) over (order by name) Нараст'||unistr('\000a')||
'from current_balance_new cb     '||unistr('\000a')||
'order by cb.name';

wwv_flow_api.create_report_region (
  p_id=> 130506152747571190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_name=> 'Текущие остатки',
  p_region_name=>'',
  p_template=> 139550225870324103+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_display_column=> 2,
  p_display_point=> 'REGION_POSITION_02',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_condition_type=> 'NEVER',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 139564221719324166+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'QUERY_COLUMNS',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 131120342939812658 + wwv_flow_api.g_id_offset,
  p_region_id=> 130506152747571190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'СЧЕТ',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Счет',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 131120472949812664 + wwv_flow_api.g_id_offset,
  p_region_id=> 130506152747571190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ОСТАТОК',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Остаток',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 131120544539812664 + wwv_flow_api.g_id_offset,
  p_region_id=> 130506152747571190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'НАРАСТ',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Нараст',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 146296316347029941 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 1,
  p_button_sequence=> 10,
  p_button_plug_id => 122293561120337465+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549603525324101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Add',
  p_button_position=> 'RIGHT_OF_IR_SEARCH_BAR',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_ACCOUNT:&P1_ACCOUNT_QF.',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>127986447359495826 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 03-МАЙ-2009 10:47 by HOME_FINANCE');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127982252507468967 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Счет',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>128118261059207537 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CONTRACTOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Лицо',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CONTRACTOR_LOV',
  p_lov=> 'select CNTR_NAME display_value, ID return_value '||unistr('\000a')||
'from CONTRACTOR'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все контрагенты',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>128178245689543733 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_PERIOD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Период',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'PERIOD_LOV',
  p_lov=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130518348581544565 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_HI_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'по',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P1_PERIOD,1),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'MONTH_AND_YEAR',
  p_attribute_08 => '-50:+50',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130530256446244731 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CHOOSE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC:Период;1,Интервал;2',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '1',
  p_attribute_02 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130544250730900089 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'GO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'GO',
  p_prompt=>'Обновить',
  p_source=>'GO',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139550001035324102 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131397551705101147 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_ACCOUNT_QF',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Статья',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'ACCOUNTS_PSEUDO_TREE_LOV',
  p_lov=> 'select lpad(b.account_name,(lengthb(b.account_name)+(level-1)*4),''~'') d,'||unistr('\000a')||
'       b.id r'||unistr('\000a')||
'from balance_account b'||unistr('\000a')||
'start with b.parent_id =57'||unistr('\000a')||
'connect by prior b.id=b.parent_id',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131410157621878125 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_LOW_SUM',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 25,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Sum >',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 40,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>141996711445318047 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_LOW_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 16,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'С',
  p_format_mask=>'DD.MM.YYYY',
  p_source_type=> 'ALWAYS_NULL',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'MONTH_AND_YEAR',
  p_attribute_08 => '-50:+50',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>147042002175415999 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_CURRENCY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Currency',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CURRENCY_LOV',
  p_lov=> 'select SHORT_NAME display_value, ID return_value '||unistr('\000a')||
'from CURRENCY'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-All-',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>532949643417360764 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_name=>'P1_SHOW_TR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 128170165943511776+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'STATIC2:Вкл. переводы;1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => '1',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 146295026774985692 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 1
 ,p_name => 'toggle period'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P1_CHOOSE'
 ,p_triggering_condition_type => 'EQUALS'
 ,p_triggering_expression => '1'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 146295306402985713 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 1
 ,p_event_id => 146295026774985692 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_SHOW'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P1_PERIOD'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
wwv_flow_api.create_page_da_action (
  p_id => 146295511763985721 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 1
 ,p_event_id => 146295026774985692 + wwv_flow_api.g_id_offset
 ,p_event_result => 'FALSE'
 ,p_action_sequence => 20
 ,p_execute_on_page_init => 'Y'
 ,p_action => 'NATIVE_HIDE'
 ,p_affected_elements_type => 'ITEM'
 ,p_affected_elements => 'P1_PERIOD'
 ,p_attribute_01 => 'Y'
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P1_LOW_DT:=GET_MARGIN_DATE(:P1_PERIOD,0);'||unistr('\000a')||
':P1_HI_DT:=GET_MARGIN_DATE(:P1_PERIOD,1);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 130548168784933692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 35,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set date margins',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P1_CHOOSE',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'1',
  p_process_when_type2=>'',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'select t.id'||unistr('\000a')||
'into :F101_ACCOUNT_TREE_ROOT'||unistr('\000a')||
'from balance_account t where t.parent_id is null;'||unistr('\000a')||
'exception '||unistr('\000a')||
'when no_data_found '||unistr('\000a')||
'  then :F101_ACCOUNT_TREE_ROOT:=57;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 131906570594154984 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 45,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set app items',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00002
prompt  ...PAGE 2: Operation DML Form
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_tab_set => 'TS1'
 ,p_name => 'Operation DML Form'
 ,p_step_title => 'Новая операция'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_welcome_text => '<b>Создание новой операции</b>'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 127918259024822903 + wwv_flow_api.g_id_offset
 ,p_javascript_code => 
'function f_setItem (pItem)'||unistr('\000a')||
'{ '||unistr('\000a')||
'  var get = new htmldb_Get(null,&APP_ID.,''APPLICATION_PROCESS=dummy'',&APP_PAGE_ID.);'||unistr('\000a')||
'  get.add(pItem,$x(pItem).value)'||unistr('\000a')||
'  gReturn = get.get();'||unistr('\000a')||
'  get = null;'||unistr('\000a')||
'}'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20131205232444'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122295758074337515 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Operation',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550225870324103+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122321271025337720 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'BreadCrumbs 2',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT ID'||unistr('\000a')||
'     , account_name'||unistr('\000a')||
'     , ''<font color="red">''||decode(grouping(ID),1,''<b>'','''')||sum(EXP)||decode(grouping(ID),1,''</b>'','''')||''</font>'' EXP'||unistr('\000a')||
'     , ''<font color="blue">''||decode(grouping(ID),1,''<b>'','''')||sum(INC)||decode(grouping(ID),1,''</b>'','''')||''</font>'' INC'||unistr('\000a')||
'     , cur, cntr_name, balance_name'||unistr('\000a')||
'  fROM finance_operations_v'||unistr('\000a')||
' WHERE op_date = :P2_OP_DATE'||unistr('\000a')||
'group by grouping sets ((ID,account_';

s:=s||'name,cur, cntr_name, balance_name),())'||unistr('\000a')||
'ORDER BY account_name';

wwv_flow_api.create_report_region (
  p_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_name=> 'Операции за день',
  p_region_name=>'OPREPORT',
  p_template=> 139550225870324103+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 20,
  p_display_column=> 2,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 1,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_report_total_text_format=> 'Total:',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 139541815112164742 + wwv_flow_api.g_id_offset,
  p_region_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:EDIT:&DEBUG.::P2_ID:#ID#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#ed-item.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 139542008910164746 + wwv_flow_api.g_id_offset,
  p_region_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ACCOUNT_NAME',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Account',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 139542112016164746 + wwv_flow_api.g_id_offset,
  p_region_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'EXP',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Exp',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 139542229729164746 + wwv_flow_api.g_id_offset,
  p_region_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'INC',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Inc',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 139542430224164747 + wwv_flow_api.g_id_offset,
  p_region_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'CUR',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Curr',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 139542527562164747 + wwv_flow_api.g_id_offset,
  p_region_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'CNTR_NAME',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Contractor',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 139542619131164747 + wwv_flow_api.g_id_offset,
  p_region_id=> 139541511421164682 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'BALANCE_NAME',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Balance',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 131450058329526591 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 40,
  p_button_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549603525324101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Сохранить',
  p_button_position=> 'BELOW_BOX',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P2_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 122296052158337517 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 20,
  p_button_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549603525324101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Создать',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P2_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 131449851403524572 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 30,
  p_button_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Удалить',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P2_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 122295971081337517 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 10,
  p_button_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'RIGHT_OF_TITLE',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 134645622027053143 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 2,
  p_button_sequence=> 50,
  p_button_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_button_name    => 'COPY',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Copy',
  p_button_position=> 'RIGHT_OF_TITLE',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P2_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>131450748679552245 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:2::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 2,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'SAVE,DELETE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 09-ЯНВ-2010 17:36 by HOME_FINANCE');
 
wwv_flow_api.create_page_branch(
  p_id=>134650103345199089 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&APP_ID.:2:&SESSION.:FROMCOPY:&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>134645622027053143+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 13,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 10-SEP-2012 13:24 by MARIELLE_ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122296543523337542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Код операции',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122296966948337553 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_IS_APPLIED',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 75,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'&nbsp;',
  p_source=>'IS_APPLIED',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'STATIC:<b>оплачено</b>;1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '1',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122297142515337554 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_OP_DIRECTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Направление платежа',
  p_source=>'OP_DIRECTION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_named_lov=> 'OP_DIRECTION_2LOV',
  p_lov=> 'select name d, id r'||unistr('\000a')||
'from direction_lookup'||unistr('\000a')||
'where name in (''Доход'',''Расход'')',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_tag_attributes2=> 'onchange="f_setItem(this.id)"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '2',
  p_attribute_02 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122297341935337556 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_OP_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 35,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'begin'||unistr('\000a')||
'return TO_CHar(sysdate,''DD.MM.YYYY'');'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Дата платежа',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'OP_DATE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 20,
  p_cHeight=> 1,
  p_tag_attributes  => 'onchange="f_setItem(this.id)"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122297751142337556 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_ACCOUNT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '12',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Статья',
  p_source=>'ACCOUNT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'ACCOUNTS_PSEUDO_TREE_CURRENT_LOV',
  p_lov=> 'select lpad(b.account_name,(lengthb(b.account_name)+(level-1)*4),''~'') d,'||unistr('\000a')||
'       b.id r'||unistr('\000a')||
'from balance_account b'||unistr('\000a')||
'WHERE nvl(trunc(b.end_date),SYSDATE) > trunc(SYSDATE)'||unistr('\000a')||
'start with b.parent_id =57'||unistr('\000a')||
'connect by prior b.id=b.parent_id',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'Y',
  p_quick_pick_label_01=>'дк',
  p_quick_pick_value_01=>'12',
  p_quick_pick_label_02=>'перекусы',
  p_quick_pick_value_02=>'28',
  p_quick_pick_label_03=>'гор тр',
  p_quick_pick_value_03=>'7',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122297970856337556 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_AMOUNT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '0',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Сумма',
  p_source=>'AMOUNT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_WITH_CALCULATOR',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 20,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122298759325337558 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_COMMENTS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Комментарии',
  p_source=>'COMMENTS',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 50,
  p_cMaxlength=> 4000,
  p_cHeight=> 5,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122298941786337559 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CURRENCY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 65,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Валюта операции',
  p_source=>'CURRENCY_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CURRENCY_LOV',
  p_lov=> 'select SHORT_NAME display_value, ID return_value '||unistr('\000a')||
'from CURRENCY'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Стоимость единицы валюты (в рублях)';

wwv_flow_api.create_page_item(
  p_id=>122299159379337559 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CUR_RATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 68,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Курс',
  p_source=>'CUR_RATE_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'select RATE||'' (''||TO_CHAR(R.RATE_DATE,''DD Mon YYYY'')||'')'' display_value, ID return_value '||unistr('\000a')||
'from CURRENCY_RATE R'||unistr('\000a')||
'WHERE R.TO_CURRENCY_ID=:P2_CURRENCY'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_lov_cascade_parent_items=> 'P2_CURRENCY',
  p_ajax_optimize_refresh=> 'Y',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122299566512337559 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_CONTRACTOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Контрагент',
  p_source=>'CONTRACTOR_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CONTRACTOR_LOV',
  p_lov=> 'select CNTR_NAME display_value, ID return_value '||unistr('\000a')||
'from CONTRACTOR'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Нет контрагента',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122299751278337559 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_name=>'P2_BALANCE_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 122295758074337515+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Счет',
  p_source=>'BALANCE_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_da_event (
  p_id => 139570832760511460 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 2
 ,p_name => 'Refresh ops'
 ,p_event_sequence => 10
 ,p_triggering_element_type => 'ITEM'
 ,p_triggering_element => 'P2_OP_DIRECTION'
 ,p_bind_type => 'bind'
 ,p_bind_event_type => 'change'
  );
wwv_flow_api.create_page_da_action (
  p_id => 139571120866511465 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_page_id => 2
 ,p_event_id => 139570832760511460 + wwv_flow_api.g_id_offset
 ,p_event_result => 'TRUE'
 ,p_action_sequence => 10
 ,p_execute_on_page_init => 'N'
 ,p_action => 'NATIVE_REFRESH'
 ,p_affected_elements_type => 'REGION'
 ,p_affected_region_id => 139541511421164682 + wwv_flow_api.g_id_offset
 ,p_stop_execution_on_error => 'Y'
 );
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:FINANCE_OPERATIONS:P2_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 131449159106507930 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 11,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'FETCH ROW FINANCE OPERATION BY ID',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'EDIT,FROMCOPY',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:FINANCE_OPERATIONS:P2_ID:ID|IUD';

wwv_flow_api.create_page_process(
  p_id     => 122300071244337561 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 1,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of FINANCE_OPERATIONS',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Невозможно обработать строку таблицы FINANCE_OPERATIONS.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'CREATE,SAVE,DELETE',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> 'Строка обработана.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare '||unistr('\000a')||
' l_new_id integer :="FINANCE_OPERATIONS_SEQ".nextval;'||unistr('\000a')||
'begin'||unistr('\000a')||
'INSERT INTO finance_operations'||unistr('\000a')||
'  (id,is_applied,op_date,comments,cur_rate_id,currency_id'||unistr('\000a')||
'  ,contractor_id,balance_id,op_direction,account_id, amount)'||unistr('\000a')||
'SELECT l_new_id ,is_applied,trunc(sysdate),comments,cur_rate_id,currency_id'||unistr('\000a')||
'  ,contractor_id,balance_id,op_direction,account_id, amount'||unistr('\000a')||
' FROM finance_operations'||unistr('\000a')||
'WHERE ID = :P2_id;'||unistr('\000a')||
':';

p:=p||'P2_id := l_new_id;'||unistr('\000a')||
'-- reset session'||unistr('\000a')||
':P2_BALANCE_ID := null;'||unistr('\000a')||
':P2_OP_DIRECTION := null;'||unistr('\000a')||
':P2_OP_DATE := null;'||unistr('\000a')||
':P2_ACCOUNT := null;'||unistr('\000a')||
':P2_AMOUNT := null;'||unistr('\000a')||
':P2_CURRENCY := null;'||unistr('\000a')||
':P2_CUR_RATE := null;'||unistr('\000a')||
':P2_CONTRACTOR := null;'||unistr('\000a')||
':P2_IS_APPLIED := null;'||unistr('\000a')||
':P2_COMMENTS := null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 134642127400037041 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 11,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'copy OPERATION',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Ошибка копирования операции &P2_ID..',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>134645622027053143 + wwv_flow_api.g_id_offset,
  p_process_when=>'P2_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Операция скопирована. Новый ID=&P2_ID..',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00004
prompt  ...PAGE 4: Success Page
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 4
 ,p_tab_set => 'TS1'
 ,p_name => 'Success Page'
 ,p_step_title => 'Success Page'
 ,p_step_sub_title => 'Success Page'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20090501155937'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p/>'||unistr('\000a')||
'<table>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top">'||unistr('\000a')||
'<img src="#IMAGE_PREFIX#themes/theme_1/Fndokay1.gif" alt="success" />'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td class="fielddata" valign="bottom">'||unistr('\000a')||
'The data has been inserted successfully.'||unistr('\000a')||
'<p/>'||unistr('\000a')||
'<table cellspacing="10" cellpadding="10">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="center">'||unistr('\000a')||
'<a href="f?p=&APP_ID.:2:&SESSION.:::2" class="instructiontext">'||unistr('\000a')||
'<img src="#IMAGE_PREFIX#menu/add_record_64.gif" border=0 width="64" heig';

s:=s||'ht="64" alt="Insert Another" title="Insert Another" /><br>'||unistr('\000a')||
'Insert Another</a>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td align="center">'||unistr('\000a')||
'<a href="f?p=&APP_ID.:1:&SESSION.:::1" class="instructiontext">'||unistr('\000a')||
'<img src="#IMAGE_PREFIX#menu/search_64.gif" border=0 width="64" height="64" alt="View Report" title="View Report" /><br>'||unistr('\000a')||
'View Report</a>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<p/>';

wwv_flow_api.create_page_plug (
  p_id=> 122300773959337564 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Success',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122321670012337722 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'BreadCrumbs 4',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 4
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00005
prompt  ...PAGE 5: Analysis
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 5
 ,p_tab_set => 'TS1'
 ,p_name => 'Analysis'
 ,p_step_title => 'Analysis'
 ,p_step_sub_title => 'Analysis'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 127918348765829395 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20090502201836'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122310366487337647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_plug_name=> 'Reports',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139554431432324121+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 122290442055336772 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 139561030607324151+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122310562351337650 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_plug_name=> 'Charts',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139551721739324114+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_list_template_id=> 139561030607324151+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122321942127337722 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_plug_name=> 'BreadCrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 5
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00007
prompt  ...PAGE 7: Analyze Направление платежа
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 7
 ,p_tab_set => 'TS1'
 ,p_name => 'Analyze Направление платежа'
 ,p_step_title => 'Analyze Направление платежа'
 ,p_step_sub_title => 'Analyze Направление платежа'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_group_id => 127918348765829395 + wwv_flow_api.g_id_offset
 ,p_step_template => 139547911157324088 + wwv_flow_api.g_id_offset
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20100418011101'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'||unistr('\000a')||
'	codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"'||unistr('\000a')||
'	width="#WIDTH#"'||unistr('\000a')||
'	height="#HEIGHT#"'||unistr('\000a')||
'	id="#CHART_NAME#"'||unistr('\000a')||
'	align="">'||unistr('\000a')||
'<param name="movie" value="#IMAGE_PREFIX#flashchart/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:7:&APP_SESSION.:FLOW_FLASH_CHART_R#REGION_ID#">'||unistr('\000a')||
'<param name="qualit';

s:=s||'y" value="high">'||unistr('\000a')||
'<param name="allowScriptAccess" value="sameDomain">'||unistr('\000a')||
'<param name="allowNetworking" value="all">'||unistr('\000a')||
'<param name="scale" value="noscale">'||unistr('\000a')||
'<param name="wmode" value="transparent">'||unistr('\000a')||
''||unistr('\000a')||
'<embed src="#IMAGE_PREFIX#flashchart/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:7:&APP_SESSION.:FLOW_FLASH_CHART_R#REGION_ID#"'||unistr('\000a')||
'       quality="high"'||unistr('\000a')||
'       width="#WIDTH#"'||unistr('\000a')||
'       height="#HEIGHT';

s:=s||'#"'||unistr('\000a')||
'       name="#CHART_NAME#"'||unistr('\000a')||
'       scale="noscale"'||unistr('\000a')||
'       align=""'||unistr('\000a')||
'       allowScriptAccess="sameDomain" '||unistr('\000a')||
'       allowNetworking="all"'||unistr('\000a')||
'       type="application/x-shockwave-flash"'||unistr('\000a')||
'       pluginspage="http://www.macromedia.com/go/getflashplayer"'||unistr('\000a')||
'       wmode="transparent">'||unistr('\000a')||
'</embed>'||unistr('\000a')||
'</object>'||unistr('\000a')||
'#CHART_REFRESH#';

wwv_flow_api.create_page_plug (
  p_id=> 122314153716337687 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Направление платежа',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552020821324115+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'FLASH_CHART',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1 := null;
wwv_flow_api.create_flash_chart(
  p_id => 122314266432337687+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id => 7,
  p_region_id => 122314153716337687+wwv_flow_api.g_id_offset,
  p_default_chart_type  =>'2DPie',
  p_chart_title         =>'',
  p_chart_width         =>600,
  p_chart_height        =>400,
  p_chart_animation     =>'alpha',
  p_display_attr        =>'H:N:V:N:BACK:',
  p_dial_tick_attr      =>'::',
  p_margins             =>':::',
  p_omit_label_interval =>null,
  p_bgtype              =>'TRANSPARENT',
  p_bgcolor1            =>'',
  p_bgcolor2            =>'',
  p_gradient_rotation   =>null,
  p_color_scheme        =>'1',
  p_custom_colors       =>'',
  p_x_axis_title        =>'',
  p_x_axis_min          =>null,
  p_x_axis_max          =>null,
  p_x_axis_grid_spacing =>null,
  p_x_axis_prefix       =>'',
  p_x_axis_postfix      =>'',
  p_x_axis_group_sep    =>'',
  p_x_axis_decimal_place=>null,
  p_y_axis_title        =>'',
  p_y_axis_min          =>null,
  p_y_axis_max          =>null,
  p_y_axis_grid_spacing =>null,
  p_y_axis_prefix       =>'',
  p_y_axis_postfix      =>'',
  p_y_axis_group_sep    =>'N',
  p_y_axis_decimal_place=>null,
  p_async_update        =>'N',
  p_async_time          =>null,
  p_names_font          =>'Verdana:10:#000000',
  p_names_rotation      =>null,
  p_values_font         =>'Verdana:10:#000000',
  p_values_rotation     =>null,
  p_hints_font          =>'Verdana:10:#000000',
  p_legend_font         =>'Verdana:12:#000000',
  p_grid_labels_font    =>'::',
  p_chart_title_font    =>'Verdana:14:#000000',
  p_x_axis_title_font   =>'Verdana:14:#000000',
  p_y_axis_title_font   =>'Verdana:14:#000000',
  p_use_chart_xml       =>'N',
  p_chart_xml           => a1,
  p_attribute_01        =>'',
  p_attribute_02        =>'',
  p_attribute_03        =>'',
  p_attribute_04        =>'',
  p_attribute_05        =>'');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select null l, dl.name "OP_DIRECTION", '||unistr('\000a')||
'      sum(f.amount) "Series 1"'||unistr('\000a')||
'from FINANCE_OPERATIONS f, direction_lookup dl'||unistr('\000a')||
'where f.op_direction = dl.id'||unistr('\000a')||
'and f.op_date between nvl(replace(:P7_LOW_DT,''%''||''null%'',null),f.op_date) and'||unistr('\000a')||
'                            nvl(replace(:P7_HI_DT,''%''||''null%'',null),f.op_date)'||unistr('\000a')||
'group by dl.name'||unistr('\000a')||
'';

wwv_flow_api.create_flash_chart_series(
  p_id => 122315143974337698+wwv_flow_api.g_id_offset,
  p_chart_id => 122314266432337687+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_series_seq                =>10,
  p_series_name               =>'Series 1',
  p_series_query              => a1,
  p_series_query_type         =>'SQL_QUERY',
  p_series_query_parse_opt    =>'PARSE_CHART_QUERY',
  p_series_query_no_data_found=>'No data found.',
  p_series_query_row_count_max=>15);
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122314965454337689 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Charts',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552932574324117+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122323556811337725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'BreadCrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>131734664399880888 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_branch_action=> 'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 5,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 18-APR-2010 01:11 by HOME_FINANCE');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131726649199829245 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_PERIOD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 122314153716337687+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Период',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'PERIOD_LOV',
  p_lov=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'SUBMIT',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131726864914843190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_LOW_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 122314153716337687+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'begin'||unistr('\000a')||
'return sysdate;'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'C',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P7_PERIOD,0),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131727073225845586 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'P7_HI_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 122314153716337687+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'по',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P7_PERIOD,1),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P7_LOW_DT:=GET_MARGIN_DATE(:P7_PERIOD,0);'||unistr('\000a')||
':P7_HI_DT:=GET_MARGIN_DATE(:P7_PERIOD,1);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 131728568292863132 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 7,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'get date margins',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 7
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00009
prompt  ...PAGE 9: Analyze Dynamic
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 9
 ,p_tab_set => 'TS1'
 ,p_name => 'Analyze Dynamic'
 ,p_step_title => 'Динамика расходов'
 ,p_step_sub_title => 'Analyze Дата платежа'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 127918348765829395 + wwv_flow_api.g_id_offset
 ,p_step_template => 139547911157324088 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20101204155539'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122317373750337708 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Charts',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552932574324117+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122323963513337725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'BreadCrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select null link,'||unistr('\000a')||
'     --  last_day(f.op_date),'||unistr('\000a')||
'       to_char(last_day(f.op_date),''Mon-YY'') label,'||unistr('\000a')||
'       sum(f.amount)'||unistr('\000a')||
'from finance_operations f,'||unistr('\000a')||
'     balance_account ba'||unistr('\000a')||
'where f.account_id=ba.id'||unistr('\000a')||
'and f.is_applied=1'||unistr('\000a')||
'--and f.op_direction=1'||unistr('\000a')||
'and f.op_date>=:P9_BEGIN_DT'||unistr('\000a')||
'and (f.account_id=:P9_ACC_ID OR f.account_id IN (SELECT ID FROM BALANCE_ACCOUNT WHERE PARENT_ID = :P9_ACC_ID))'||unistr('\000a')||
'group by last_day(f.op';

s:=s||'_date)'||unistr('\000a')||
'order by 2';

wwv_flow_api.create_page_plug (
  p_id=> 131215466260406864 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Динамика расходов &P9_ACC_NAME.',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552020821324115+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'SIMPLE_CHART',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_options => 'PARSE_CHART_QUERY',
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_plug_chart_font_size => '-1',
  p_plug_chart_max_rows => '40',
  p_plug_chart_num_mask => '999G999G999G990',
  p_plug_chart_scale => '200',
  p_plug_chart_axis => 'ZERO',
  p_plug_chart_show_summary => 'CAVSU',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'RANDOM';

wwv_flow_api.create_generic_attr(
 p_id=>131236963991975875+wwv_flow_api.g_id_offset,
 p_region_id=>131215466260406864+wwv_flow_api.g_id_offset,
 p_attribute_id=>1,
 p_attribute_value=>a);
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<div id="svgRegion"><embed src="f?p=&FLOW_ID.:&FLOW_PAGE_ID.:#SESSION#:FLOW_SVG_CHART_R#REGION_ID#" width="#WIDTH#" height="#HEIGHT#" type="image/svg+xml" /></div><script src="#IMAGE_PREFIX#javascript/plugins.js"></script>';

wwv_flow_api.create_page_plug (
  p_id=> 131215647699486676 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Динамика расходов свг',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552020821324115+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 30,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'SVG_CHART',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'LINE';

wwv_flow_api.create_generic_attr(
 p_id=>131215869259486742+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>2,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Chart 1';

wwv_flow_api.create_generic_attr(
 p_id=>131215971687486781+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>4,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'ENABLE';

wwv_flow_api.create_generic_attr(
 p_id=>131228748379744242+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>7,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'N';

wwv_flow_api.create_generic_attr(
 p_id=>131228853691744245+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>9,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'ARG';

wwv_flow_api.create_generic_attr(
 p_id=>131228970228744245+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>10,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Y';

wwv_flow_api.create_generic_attr(
 p_id=>131229043162744245+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>14,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'PARSE_CHART_QUERY';

wwv_flow_api.create_generic_attr(
 p_id=>131229152983744245+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>16,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>131229262959744245+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>20,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'8';

wwv_flow_api.create_generic_attr(
 p_id=>131229341994744245+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>21,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>131229469002744245+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>22,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>131229549029744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>23,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'8';

wwv_flow_api.create_generic_attr(
 p_id=>131229664383744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>24,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>131229771908744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>25,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>131229842352744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>26,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'14';

wwv_flow_api.create_generic_attr(
 p_id=>131229974339744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>27,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>131230064047744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>28,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>131230151580744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>29,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'400';

wwv_flow_api.create_generic_attr(
 p_id=>131216043760486783+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>30,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'600';

wwv_flow_api.create_generic_attr(
 p_id=>131216165316486783+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>31,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'8';

wwv_flow_api.create_generic_attr(
 p_id=>131230255260744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>35,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>131230358265744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>36,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>131230447051744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>37,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'14';

wwv_flow_api.create_generic_attr(
 p_id=>131230566623744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>38,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>131230672913744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>39,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Arial';

wwv_flow_api.create_generic_attr(
 p_id=>131230755325744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>40,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'14';

wwv_flow_api.create_generic_attr(
 p_id=>131230866506744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>41,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'#000000';

wwv_flow_api.create_generic_attr(
 p_id=>131230968795744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>42,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'AUTO';

wwv_flow_api.create_generic_attr(
 p_id=>131231065406744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>60,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'NO';

wwv_flow_api.create_generic_attr(
 p_id=>131231171365744247+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>64,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'NO';

wwv_flow_api.create_generic_attr(
 p_id=>131231267620744248+wwv_flow_api.g_id_offset,
 p_region_id=>131215647699486676+wwv_flow_api.g_id_offset,
 p_attribute_id=>67,
 p_attribute_value=>a);
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select null link,'||unistr('\000a')||
'       last_day(f.op_date),'||unistr('\000a')||
'       sum(f.amount)'||unistr('\000a')||
'from finance_operations f,'||unistr('\000a')||
'     balance_account ba'||unistr('\000a')||
'where f.account_id=ba.id'||unistr('\000a')||
'and f.is_applied=1'||unistr('\000a')||
'and f.op_direction=1'||unistr('\000a')||
'and f.account_id=12'||unistr('\000a')||
'--and f.op_date>=nvl(replace(:P9_BEGIN_DT,''%null''||''%'',null),f.op_date)'||unistr('\000a')||
'group by last_day(f.op_date)'||unistr('\000a')||
'order by 2';

wwv_flow_api.create_chart_series_attr(
  p_id => 131216254880486851+wwv_flow_api.g_id_offset,
  p_region_id => 131215647699486676+wwv_flow_api.g_id_offset,
  p_series_id => 1,
  p_a001 => a1,
  p_a002 => '15',
  p_a003 => 'No data found.',
  p_a004 => 'Series 1',
  p_a005 => '#0099CC',
  p_a010 => '3',
  p_a011 => 'STRAIGHT',
  p_a012 => '2',
  p_a016 => 'PARSE_CHART_QUERY',
  p_a050 => '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 131236660181974787 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Параметры',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139551721739324114+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 5,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'127842268272078365';

wwv_flow_api.create_page_plug (
  p_id=> 131884558372978538 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Статьи расходов',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> 127842268272078365 + wwv_flow_api.g_id_offset,
  p_plug_source_type=> 'TREE',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>131883249574890857 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_branch_action=> 'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'Y',
  p_branch_comment=> 'Created 22-JUN-2010 23:20 by HOME_FINANCE');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131218247802619131 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_BEGIN_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 131236660181974787+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Begin Dt',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'begin'||unistr('\000a')||
'return trunc(sysdate,''YEAR'');'||unistr('\000a')||
'end;',
  p_source_type=> 'FUNCTION_BODY',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131238244097000539 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P21_RUN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 131236660181974787+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'ОБНОВИТЬ',
  p_prompt=>'Обновить',
  p_source=>'ОБНОВИТЬ',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139550001035324102 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131904667133113541 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_ACC_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 131236660181974787+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131922659606208564 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_ACC_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 131215466260406864+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source=>'select account_name from balance_account where id = :P9_ACC_ID',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 9
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00010
prompt  ...PAGE 10: Analyze Статья
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 10
 ,p_tab_set => 'TS1'
 ,p_name => 'Analyze Статья'
 ,p_step_title => 'Analyze Статья'
 ,p_step_sub_title => 'Analyze Статья'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_group_id => 127918348765829395 + wwv_flow_api.g_id_offset
 ,p_step_template => 139547911157324088 + wwv_flow_api.g_id_offset
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20140108212641'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122318352935337711 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'Reports',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552932574324117+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 122290442055336772 + wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122323169166337723 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'BreadCrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130860163310949793 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'Parameters',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550521396324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select ba.account_name,ba.id,c.short_name "€",sum(F.Amount) expen'||unistr('\000a')||
'from finance_operations f,'||unistr('\000a')||
'     balance_account ba,'||unistr('\000a')||
'     currency c'||unistr('\000a')||
'where f.account_id=ba.id and f.op_direction=2'||unistr('\000a')||
'and c.id = f.currency_id'||unistr('\000a')||
'and f.op_date between nvl(:P10_LOW_DT,f.op_date) and nvl(:P10_HI_DT,f.op_date)'||unistr('\000a')||
'and (f.contractor_id = :P10_CONTRACTOR or :P10_CONTRACTOR IS NULL)'||unistr('\000a')||
'and f.balance_id = nvl(:P10_BALANCE,f.balance_id)';

s:=s||''||unistr('\000a')||
'and f.currency_id = nvl(:P10_CURRENCY,f.currency_id)'||unistr('\000a')||
'group by grouping sets((ba.account_name,ba.id,c.short_name),(c.short_name))'||unistr('\000a')||
'order by sum(F.Amount)';

wwv_flow_api.create_report_region (
  p_id=> 131168146449610970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_name=> 'Income',
  p_region_name=>'',
  p_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 50,
  p_display_column=> 2,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'REPORT_ACCOUNTTREE',
  p_display_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 139563714492324164+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '50',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12"',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12"',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 131168454323611122 + wwv_flow_api.g_id_offset,
  p_region_id=> 131168146449610970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ACCOUNT_NAME',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Статья',
  p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:P1_ACCOUNT_QF,P1_LOW_DT,P1_HI_DT:#ID#,&P10_LOW_DT.,&P10_HIGH_DT.',
  p_column_linktext=>'#ACCOUNT_NAME#',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 132460673163556548 + wwv_flow_api.g_id_offset,
  p_region_id=> 131168146449610970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146299507980273507 + wwv_flow_api.g_id_offset,
  p_region_id=> 131168146449610970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> '€',
  p_column_display_sequence=> 4,
  p_column_heading=> '€',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_when_cond_type=> 'ITEM_IS_NULL',
  p_display_when_condition=> 'P10_CURRENCY',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 131168565779611122 + wwv_flow_api.g_id_offset,
  p_region_id=> 131168146449610970 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'EXPEN',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Сумма',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select case when connect_by_isleaf = 1 then 0'||unistr('\000a')||
'            when level = 1             then 1'||unistr('\000a')||
'            else                           -1'||unistr('\000a')||
'       end as status, '||unistr('\000a')||
'       level, '||unistr('\000a')||
'       "ACCOUNT_NAME" as title, '||unistr('\000a')||
'       null as icon, '||unistr('\000a')||
'       "ID" as value, '||unistr('\000a')||
'       null as tooltip, '||unistr('\000a')||
'       null as link '||unistr('\000a')||
'from "#OWNER#"."BALANCE_ACCOUNT"'||unistr('\000a')||
'start with "ID" = 57'||unistr('\000a')||
'connect by prior "ID" = "PARENT_ID"'||unistr('\000a')||
'order sibl';

s:=s||'ings by "ACCOUNT_NAME"';

wwv_flow_api.create_page_plug (
  p_id=> 146284921015233776 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_plug_name=> 'Expense',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'JSTREE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'REQUEST_EQUALS_CONDITION',
  p_plug_display_when_condition => 'REPORT_ACCOUNTTREE',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'with n as ('||unistr('\000a')||
'select f.account_id, sum(F.Amount) ex'||unistr('\000a')||
'  from finance_operations f'||unistr('\000a')||
'where f.op_direction=1'||unistr('\000a')||
'  and f.op_date between nvl(:P10_LOW_DT,f.op_date) and nvl(:P10_HI_DT,f.op_date)'||unistr('\000a')||
'  and (f.contractor_id = :P10_CONTRACTOR or :P10_CONTRACTOR is null) '||unistr('\000a')||
'  and f.balance_id = nvl(:P10_BALANCE,f.balance_id)'||unistr('\000a')||
'  and f.currency_id = nvl(:P10_CURRENCY,f.currency_id)'||unistr('\000a')||
'group by f.account_id'||unistr('\000a')||
'       )'||unistr('\000a')||
'select cas';

a1:=a1||'e when connect_by_isleaf = 1 then 0 when level = 1 then 1 else -1 end as status,'||unistr('\000a')||
'       level,'||unistr('\000a')||
'       rpad(a.account_name,20,''_'') || ''_'' || lpad(coalesce('||unistr('\000a')||
'         n.ex, '||unistr('\000a')||
'         (select sum(nvl(n.ex,0))'||unistr('\000a')||
'            from n, balance_account a1'||unistr('\000a')||
'           where n.account_id(+) = a1.id'||unistr('\000a')||
'           start with a1.parent_id = a.id'||unistr('\000a')||
'         connect by prior a1.ID = a1.PARENT_ID'||unistr('\000a')||
'         )   '||unistr('\000a')||
'       ),10,';

a1:=a1||'''_'') as title,'||unistr('\000a')||
'       NULL as icon,'||unistr('\000a')||
'       a.id as value,'||unistr('\000a')||
'       a.account_name as tooltip,'||unistr('\000a')||
'       NULL as link'||unistr('\000a')||
'  from n'||unistr('\000a')||
'     , balance_account a'||unistr('\000a')||
' where n.account_id(+) = a.id'||unistr('\000a')||
'   and (n.ex > 0 or (select sum(nvl(n.ex,0))'||unistr('\000a')||
'            from n, balance_account a1'||unistr('\000a')||
'           where n.account_id(+) = a1.id'||unistr('\000a')||
'           start with a1.parent_id = a.id'||unistr('\000a')||
'         connect by prior a1.ID = a1.PARENT_ID'||unistr('\000a')||
'         )';

a1:=a1||' > 0'||unistr('\000a')||
'       )'||unistr('\000a')||
'start with a.id = 57'||unistr('\000a')||
'connect by prior a.ID = a.PARENT_ID';

wwv_flow_api.create_jstree(
  p_id => 146285129999233904+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id => 10,
  p_region_id => 146284921015233776+wwv_flow_api.g_id_offset,
  p_tree_template     =>'apple',
  p_tree_source             =>'',
  p_tree_query             =>a1,
  p_tree_node_title   =>'ACCOUNT_NAME',
  p_tree_node_value   =>'ID',
  p_tree_node_icon   =>'',
  p_tree_node_link   =>'',
  p_tree_node_hints   =>'ID',
  p_tree_start_item   =>'ID',
  p_tree_start_value   =>'57',
  p_tree_button_option   =>'CONTRACT_ALL:EXPAND_ALL',
  p_show_node_link   =>'',
  p_node_link_checksum_type   =>null,
  p_tree_comment          =>'',
  p_show_hints          =>'N',
  p_tree_has_focus          =>'N',
  p_tree_hint_text          =>'',
  p_tree_click_action          =>'S',
  p_selected_node          =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select "OP_DATE",'||unistr('\000a')||
'to_char(op_date,''YYYY-Month'') op_month,'||unistr('\000a')||
'sum(decode(op_direction,1,1,0)) c_exp,'||unistr('\000a')||
'sum(decode(op_direction,2,1,0)) c_inc,'||unistr('\000a')||
'sum(decode(op_direction,1,amount,0)) exp,'||unistr('\000a')||
'sum(decode(op_direction,2,amount,0)) inc'||unistr('\000a')||
'from  FINANCE_OPERATIONS f'||unistr('\000a')||
'where  f.op_date between nvl(:P10_LOW_DT,f.op_date) and nvl(:P10_HI_DT,f.op_date)'||unistr('\000a')||
'  and (f.contractor_id = :P10_CONTRACTOR or :P10_CONTRACTOR is null) '||unistr('\000a')||
'  ';

s:=s||'and f.balance_id = nvl(:P10_BALANCE,f.balance_id)'||unistr('\000a')||
'  and f.currency_id = nvl(:P10_CURRENCY,f.currency_id)'||unistr('\000a')||
'group by rollup(to_char(op_date,''YYYY-Month''),OP_DATE)';

wwv_flow_api.create_report_region (
  p_id=> 146301119510409304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 10,
  p_name=> 'Daily',
  p_region_name=>'',
  p_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 60,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_display_when_condition=> 'REPORT_DAILY',
  p_display_condition_type=> 'REQUEST_EQUALS_CONDITION',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 139563714492324164+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '50',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'themes/theme_1/blue_arrow_down.gif',
  p_query_asc_image_attr=> 'width="13" height="12"',
  p_query_desc_image=> 'themes/theme_1/blue_arrow_up.gif',
  p_query_desc_image_attr=> 'width="13" height="12"',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146301310153409324 + wwv_flow_api.g_id_offset,
  p_region_id=> 146301119510409304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'OP_DATE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Date',
  p_column_alignment=>'L',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146303716103512445 + wwv_flow_api.g_id_offset,
  p_region_id=> 146301119510409304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'OP_MONTH',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Month',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146301417646409324 + wwv_flow_api.g_id_offset,
  p_region_id=> 146301119510409304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'C_EXP',
  p_column_display_sequence=> 3,
  p_column_heading=> '?exp',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146301521442409324 + wwv_flow_api.g_id_offset,
  p_region_id=> 146301119510409304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'C_INC',
  p_column_display_sequence=> 4,
  p_column_heading=> '?inc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146301617816409324 + wwv_flow_api.g_id_offset,
  p_region_id=> 146301119510409304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'EXP',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Exp',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146301718388409324 + wwv_flow_api.g_id_offset,
  p_region_id=> 146301119510409304 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'INC',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Inc',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 146285303312233910 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 10,
  p_button_plug_id => 146284921015233776+wwv_flow_api.g_id_offset,
  p_button_name    => 'CONTRACT_ALL',
  p_button_action  => 'REDIRECT_URL',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Collapse All',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.tree.collapse_all(''tree'||to_char(146281010300981867+wwv_flow_api.g_id_offset)||''');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 146285524497233915 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 10,
  p_button_sequence=> 10,
  p_button_plug_id => 146284921015233776+wwv_flow_api.g_id_offset,
  p_button_name    => 'EXPAND_ALL',
  p_button_action  => 'REDIRECT_URL',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Expand All',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.tree.expand_all(''tree'||to_char(146281010300981867+wwv_flow_api.g_id_offset)||''');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>131136249826902408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_branch_action=> 'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 10-ИЮЛ-2009 00:12 by HOME_FINANCE');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130860451232949847 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_PERIOD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Период',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'PERIOD_LOV',
  p_lov=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130860642063949848 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_LOW_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'begin'||unistr('\000a')||
'return sysdate;'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'C',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P1_PERIOD,0),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130860853560949850 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_CONTRACTOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Лицо',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CONTRACTOR_LOV',
  p_lov=> 'select CNTR_NAME display_value, ID return_value '||unistr('\000a')||
'from CONTRACTOR'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все контрагенты',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130861053894949850 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Счет',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130861269835949851 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_CHOOSE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC:Период;1,Интервал;2',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '1',
  p_attribute_02 => 'NONE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130861672735949851 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_RUN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'ОБНОВИТЬ',
  p_prompt=>'Go',
  p_source=>'ОБНОВИТЬ',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139550001035324102 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130861850882949853 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_HI_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'по',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P1_PERIOD,1),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>146298704460168491 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 10,
  p_name=>'P10_CURRENCY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 11,
  p_item_plug_id => 130860163310949793+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Currency',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CURRENCY_LOV',
  p_lov=> 'select SHORT_NAME display_value, ID return_value '||unistr('\000a')||
'from CURRENCY'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-All-',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P10_LOW_DT:=GET_MARGIN_DATE(:P10_PERIOD,0);'||unistr('\000a')||
':P10_HI_DT:=GET_MARGIN_DATE(:P10_PERIOD,1);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 131132171381889640 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 10,
  p_process_sequence=> 45,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set date margins',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P10_CHOOSE',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'1',
  p_process_when_type2=>'',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P10_LOW_DT:=GET_MARGIN_DATE(1,0);'||unistr('\000a')||
':P10_HI_DT:=GET_MARGIN_DATE(1,1);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 146285824525263175 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 10,
  p_process_sequence=> 55,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set_date_margins_onload',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>':P10_LOW_DT is null or :P10_HI_DT is null',
  p_process_when_type=>'NEVER',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 10
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00011
prompt  ...PAGE 11: Analyze Статья
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 11
 ,p_tab_set => 'TS1'
 ,p_name => 'Analyze Статья'
 ,p_step_title => 'Analyze Статья'
 ,p_step_sub_title => 'Analyze Статья'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_group_id => 127918348765829395 + wwv_flow_api.g_id_offset
 ,p_step_template => 139547911157324088 + wwv_flow_api.g_id_offset
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20100418013007'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'||unistr('\000a')||
'	codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"'||unistr('\000a')||
'	width="#WIDTH#"'||unistr('\000a')||
'	height="#HEIGHT#"'||unistr('\000a')||
'	id="#CHART_NAME#"'||unistr('\000a')||
'	align="">'||unistr('\000a')||
'<param name="movie" value="#IMAGE_PREFIX#flashchart/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:11:&APP_SESSION.:FLOW_FLASH_CHART_R#REGION_ID#">'||unistr('\000a')||
'<param name="quali';

s:=s||'ty" value="high">'||unistr('\000a')||
'<param name="allowScriptAccess" value="sameDomain">'||unistr('\000a')||
'<param name="allowNetworking" value="all">'||unistr('\000a')||
'<param name="scale" value="noscale">'||unistr('\000a')||
'<param name="wmode" value="transparent">'||unistr('\000a')||
''||unistr('\000a')||
'<embed src="#IMAGE_PREFIX#flashchart/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:11:&APP_SESSION.:FLOW_FLASH_CHART_R#REGION_ID#"'||unistr('\000a')||
'       quality="high"'||unistr('\000a')||
'       width="#WIDTH#"'||unistr('\000a')||
'       height="#HEIG';

s:=s||'HT#"'||unistr('\000a')||
'       name="#CHART_NAME#"'||unistr('\000a')||
'       scale="noscale"'||unistr('\000a')||
'       align=""'||unistr('\000a')||
'       allowScriptAccess="sameDomain" '||unistr('\000a')||
'       allowNetworking="all"'||unistr('\000a')||
'       type="application/x-shockwave-flash"'||unistr('\000a')||
'       pluginspage="http://www.macromedia.com/go/getflashplayer"'||unistr('\000a')||
'       wmode="transparent">'||unistr('\000a')||
'</embed>'||unistr('\000a')||
'</object>'||unistr('\000a')||
'#CHART_REFRESH#';

wwv_flow_api.create_page_plug (
  p_id=> 122318943418337711 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Статья',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552020821324115+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 40,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'FLASH_CHART',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1 := null;
wwv_flow_api.create_flash_chart(
  p_id => 122319055823337711+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id => 11,
  p_region_id => 122318943418337711+wwv_flow_api.g_id_offset,
  p_default_chart_type  =>'2DPie',
  p_chart_title         =>'',
  p_chart_width         =>600,
  p_chart_height        =>400,
  p_chart_animation     =>'alpha',
  p_display_attr        =>'H:N:V:N:BACK:',
  p_dial_tick_attr      =>'::',
  p_margins             =>':::',
  p_omit_label_interval =>null,
  p_bgtype              =>'TRANSPARENT',
  p_bgcolor1            =>'',
  p_bgcolor2            =>'',
  p_gradient_rotation   =>null,
  p_color_scheme        =>'1',
  p_custom_colors       =>'',
  p_x_axis_title        =>'',
  p_x_axis_min          =>null,
  p_x_axis_max          =>null,
  p_x_axis_grid_spacing =>null,
  p_x_axis_prefix       =>'',
  p_x_axis_postfix      =>'',
  p_x_axis_group_sep    =>'',
  p_x_axis_decimal_place=>null,
  p_y_axis_title        =>'',
  p_y_axis_min          =>null,
  p_y_axis_max          =>null,
  p_y_axis_grid_spacing =>null,
  p_y_axis_prefix       =>'',
  p_y_axis_postfix      =>'',
  p_y_axis_group_sep    =>'N',
  p_y_axis_decimal_place=>null,
  p_async_update        =>'N',
  p_async_time          =>null,
  p_names_font          =>'Verdana:10:#000000',
  p_names_rotation      =>null,
  p_values_font         =>'Verdana:10:#000000',
  p_values_rotation     =>null,
  p_hints_font          =>'Verdana:10:#000000',
  p_legend_font         =>'Verdana:12:#000000',
  p_grid_labels_font    =>'::',
  p_chart_title_font    =>'Verdana:14:#000000',
  p_x_axis_title_font   =>'Verdana:14:#000000',
  p_y_axis_title_font   =>'Verdana:14:#000000',
  p_use_chart_xml       =>'N',
  p_chart_xml           => a1,
  p_attribute_01        =>'',
  p_attribute_02        =>'',
  p_attribute_03        =>'',
  p_attribute_04        =>'',
  p_attribute_05        =>'');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select null l, ba.account_name,sum(F.Amount) "Series 1"'||unistr('\000a')||
'from finance_operations f,'||unistr('\000a')||
'     balance_account ba'||unistr('\000a')||
'where f.account_id=ba.id and f.op_direction=1'||unistr('\000a')||
'and nvl(f.contractor_id,-1)=nvl(replace(:P11_contractor,''%''||''null%'',null),nvl(f.contractor_id,-1))'||unistr('\000a')||
' and f.balance_id=nvl(replace(:P11_BALANCE,''%''||''null%'',null),f.balance_id)'||unistr('\000a')||
'and f.op_date between nvl(replace(:P11_LOW_DT,''%''||''null%'',null),trunc(';

a1:=a1||'sysdate,''month'')) and'||unistr('\000a')||
'                            nvl(replace(:P11_HI_DT,''%''||''null%'',null),add_months(trunc(sysdate,''MONTH''),1)-1)  '||unistr('\000a')||
'group by ba.account_name'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_flash_chart_series(
  p_id => 122319949000337714+wwv_flow_api.g_id_offset,
  p_chart_id => 122319055823337711+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_series_seq                =>10,
  p_series_name               =>'Series 1',
  p_series_query              => a1,
  p_series_query_type         =>'SQL_QUERY',
  p_series_query_parse_opt    =>'PARSE_CHART_QUERY',
  p_series_query_no_data_found=>'No data found.',
  p_series_query_row_count_max=>15);
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122319757758337712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Charts',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552932574324117+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122324374037337726 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'BreadCrumbs',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130876145705048825 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Parameters',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550521396324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 50,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_02',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<div id="svgRegion"><embed src="f?p=&FLOW_ID.:&FLOW_PAGE_ID.:#SESSION#:FLOW_SVG_CHART_R#REGION_ID#" width="#WIDTH#" height="#HEIGHT#" type="image/svg+xml" /></div><script src="#IMAGE_PREFIX#javascript/plugins.js"></script>';

wwv_flow_api.create_page_plug (
  p_id=> 131194149775654761 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 11,
  p_plug_name=> 'Динамика расходов по статьям:',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552020821324115+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'SVG_CHART',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'LINE';

wwv_flow_api.create_generic_attr(
 p_id=>131194373164655278+wwv_flow_api.g_id_offset,
 p_region_id=>131194149775654761+wwv_flow_api.g_id_offset,
 p_attribute_id=>2,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'Chart 1';

wwv_flow_api.create_generic_attr(
 p_id=>131194470812655295+wwv_flow_api.g_id_offset,
 p_region_id=>131194149775654761+wwv_flow_api.g_id_offset,
 p_attribute_id=>4,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'400';

wwv_flow_api.create_generic_attr(
 p_id=>131194560471655300+wwv_flow_api.g_id_offset,
 p_region_id=>131194149775654761+wwv_flow_api.g_id_offset,
 p_attribute_id=>30,
 p_attribute_value=>a);
end;
/
declare
 a varchar2(32767):=null;
begin
a:=a||'600';

wwv_flow_api.create_generic_attr(
 p_id=>131194667699655300+wwv_flow_api.g_id_offset,
 p_region_id=>131194149775654761+wwv_flow_api.g_id_offset,
 p_attribute_id=>31,
 p_attribute_value=>a);
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select null link,'||unistr('\000a')||
'       to_char(f.op_date,''YYYY-MM''),'||unistr('\000a')||
'       sum(f.amount)'||unistr('\000a')||
'from finance_operations f,'||unistr('\000a')||
'     balance_account ba'||unistr('\000a')||
'where f.account_id=ba.id'||unistr('\000a')||
'and f.account_id=1'||unistr('\000a')||
'and f.is_applied=1'||unistr('\000a')||
'and f.op_direction=1'||unistr('\000a')||
'and f.op_date between :P11_LOW_DT and :P11_HIGH_DT'||unistr('\000a')||
'group by null, to_char(f.op_date,''YYYY-MM'')';

wwv_flow_api.create_chart_series_attr(
  p_id => 131194766186655334+wwv_flow_api.g_id_offset,
  p_region_id => 131194149775654761+wwv_flow_api.g_id_offset,
  p_series_id => 1,
  p_a001 => a1,
  p_a002 => '15',
  p_a003 => 'No data found.',
  p_a004 => 'Series 1',
  p_a005 => '#0099CC',
  p_a010 => '3',
  p_a011 => 'STRAIGHT',
  p_a050 => '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>130880253024079229 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_branch_action=> 'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 29-ИЮН-2009 14:41 by HOME_FINANCE');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130876467105048884 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_PERIOD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 130876145705048825+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Период',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'PERIOD_LOV',
  p_lov=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130876670283048886 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_LOW_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 130876145705048825+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'begin'||unistr('\000a')||
'return sysdate;'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'C',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P11_PERIOD,0),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130876858354048886 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_CONTRACTOR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 2,
  p_item_plug_id => 130876145705048825+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Лицо',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CONTRACTOR_LOV',
  p_lov=> 'select CNTR_NAME display_value, ID return_value '||unistr('\000a')||
'from CONTRACTOR'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все контрагенты',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130877061051048887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 130876145705048825+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Счет',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130877265394048887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_CHOOSE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 130876145705048825+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC:Период;1,Интервал;2',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '1',
  p_attribute_02 => 'NONE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130877647126048887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_RUN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 7,
  p_item_plug_id => 130876145705048825+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'ОБНОВИТЬ',
  p_prompt=>'Обновить',
  p_source=>'ОБНОВИТЬ',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139550001035324102 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130877867735048887 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_HI_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 130876145705048825+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'по',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P11_PERIOD,1),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131744645408979551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 11,
  p_name=>'P11_TOTAL_SUM',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 17,
  p_item_plug_id => 122318943418337711+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Итого',
  p_source=>'select sum(F.Amount)'||unistr('\000a')||
'from finance_operations f,'||unistr('\000a')||
'     balance_account ba'||unistr('\000a')||
'where f.account_id=ba.id and f.op_direction=1'||unistr('\000a')||
'and nvl(f.contractor_id,-1)=nvl(replace(:P11_contractor,''%''||''null%'',null),nvl(f.contractor_id,-1))'||unistr('\000a')||
' and f.balance_id=nvl(replace(:P11_BALANCE,''%''||''null%'',null),f.balance_id)'||unistr('\000a')||
'and f.op_date between nvl(replace(:P11_LOW_DT,''%''||''null%'',null),trunc(sysdate,''month'')) and'||unistr('\000a')||
'                            nvl(replace(:P11_HI_DT,''%''||''null%'',null),add_months(trunc(sysdate,''MONTH''),1)-1)',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P11_LOW_DT:=GET_MARGIN_DATE(:P11_PERIOD,0);'||unistr('\000a')||
':P11_HI_DT:=GET_MARGIN_DATE(:P11_PERIOD,1);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 131126149863855109 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 11,
  p_process_sequence=> 45,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set date margins',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P11_CHOOSE',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'1',
  p_process_when_type2=>'',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 11
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00012
prompt  ...PAGE 12: Статьи
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 12
 ,p_tab_set => 'TS1'
 ,p_name => 'Статьи'
 ,p_step_title => 'Счета'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 130691167487121040 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_step_template => 139547602857324086 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'Просмотр и редактирование счетов доходов и расходов'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20140106181442'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 127966161100291661 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Breadcrumb12',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130830158641286059 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Правка статьи',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select case when connect_by_isleaf = 1 then 0'||unistr('\000a')||
'            when level = 1             then 1'||unistr('\000a')||
'            else                           -1'||unistr('\000a')||
'       end as status, '||unistr('\000a')||
'       level, '||unistr('\000a')||
'       "ACCOUNT_NAME" as title, '||unistr('\000a')||
'       null as icon, '||unistr('\000a')||
'       "ID" as value, '||unistr('\000a')||
'       null as tooltip, '||unistr('\000a')||
'       ''f?p=&APP_ID.:12:''||:APP_SESSION||''::::P12_ID:''||"ID" as link '||unistr('\000a')||
'from "#OWNER#"."BALANCE_ACCOUNT"'||unistr('\000a')||
'start with "PARENT';

s:=s||'_ID" is null'||unistr('\000a')||
'connect by prior "ID" = "PARENT_ID"'||unistr('\000a')||
'order siblings by "ACCOUNT_NAME"';

wwv_flow_api.create_page_plug (
  p_id=> 533919646662860126 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 12,
  p_plug_name=> 'Иерархия статей',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 139555325452324123+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 5,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'JSTREE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select case when connect_by_isleaf = 1 then 0'||unistr('\000a')||
'            when level = 1             then 1'||unistr('\000a')||
'            else                           -1'||unistr('\000a')||
'       end as status, '||unistr('\000a')||
'       level, '||unistr('\000a')||
'       "ACCOUNT_NAME" as title, '||unistr('\000a')||
'       null as icon, '||unistr('\000a')||
'       "ID" as value, '||unistr('\000a')||
'       null as tooltip, '||unistr('\000a')||
'       ''f?p=&APP_ID.:12:''||:APP_SESSION||''::::P12_ID:''||"ID" as link '||unistr('\000a')||
'from "#OWNER#"."BALANCE_ACCOUNT"'||unistr('\000a')||
'start with "PARENT';

a1:=a1||'_ID" is null'||unistr('\000a')||
'connect by prior "ID" = "PARENT_ID"'||unistr('\000a')||
'order siblings by "ACCOUNT_NAME"';

wwv_flow_api.create_jstree(
  p_id => 533919536508860126+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id => 12,
  p_region_id => 533919646662860126+wwv_flow_api.g_id_offset,
  p_tree_template     =>'default',
  p_tree_source             =>'',
  p_tree_query             =>a1,
  p_tree_node_title   =>'ACCOUNT_NAME',
  p_tree_node_value   =>'ID',
  p_tree_node_icon   =>'',
  p_tree_node_link   =>'',
  p_tree_node_hints   =>'ID',
  p_tree_start_item   =>'PARENT_ID',
  p_tree_start_value   =>'',
  p_tree_button_option   =>'CONTRACT_ALL:EXPAND_ALL',
  p_show_node_link   =>'',
  p_node_link_checksum_type   =>null,
  p_tree_comment          =>'',
  p_show_hints          =>'N',
  p_tree_has_focus          =>'',
  p_tree_hint_text          =>'',
  p_tree_click_action          =>'S',
  p_selected_node          =>'P12_ID');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 130830442246286251 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 30,
  p_button_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Apply Changes',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P12_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130830752166286254 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 10,
  p_button_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Отмена',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 533919937891860134 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 10,
  p_button_plug_id => 533919646662860126+wwv_flow_api.g_id_offset,
  p_button_name    => 'CONTRACT_ALL',
  p_button_action  => 'REDIRECT_URL',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Collapse All',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.tree.collapse_all(''tree'||to_char(533919536508860126+wwv_flow_api.g_id_offset)||''');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 533920121770860143 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 10,
  p_button_plug_id => 533919646662860126+wwv_flow_api.g_id_offset,
  p_button_name    => 'EXPAND_ALL',
  p_button_action  => 'REDIRECT_URL',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Expand All',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.widget.tree.expand_all(''tree'||to_char(533919536508860126+wwv_flow_api.g_id_offset)||''');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130830373546286251 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 40,
  p_button_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Create',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P12_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130830570849286251 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 12,
  p_button_sequence=> 20,
  p_button_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> 'P12_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>127843667370078661 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_branch_action=> 'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130831557076286281 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_name=>'P12_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565703798324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130831756396286347 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_name=>'P12_PARENT_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Группа',
  p_source=>'PARENT_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'ACCOUNTS_PSEUDO_TREE_ALL',
  p_lov=> 'select lpad(b.account_name,(lengthb(b.account_name)+(level-1)*4),''~'') d,'||unistr('\000a')||
'       b.id r'||unistr('\000a')||
'from balance_account b'||unistr('\000a')||
'start with b.parent_id is null'||unistr('\000a')||
'connect by prior b.id=b.parent_id',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130831958618286348 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_name=>'P12_ACCOUNT_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Название статьи',
  p_source=>'ACCOUNT_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 160,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130832345434286370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_name=>'P12_END_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'End Date',
  p_format_mask=>'MM/DD/YYYY',
  p_source=>'END_DATE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130832566084286370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 12,
  p_name=>'P12_OP_DIRECTION',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 130830158641286059+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Доход/расход',
  p_source=>'OP_DIRECTION',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'OP_DIRECTION_LOV',
  p_lov=> 'select name d, id r'||unistr('\000a')||
'from direction_lookup',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565703798324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 130832252480286361 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P12_ACCOUNT_NAME not null',
  p_validation_sequence=> 30,
  p_validation => 'P12_ACCOUNT_NAME',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Account Name must have some value.',
  p_associated_item=> 130831958618286348 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:BALANCE_ACCOUNT:P12_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 130832844242286378 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from BALANCE_ACCOUNT',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare '||unistr('\000a')||
'  function get_pk return varchar2 '||unistr('\000a')||
'  is '||unistr('\000a')||
'  begin '||unistr('\000a')||
'    for c1 in (select ACCOUNT_SEQ.nextval next_val'||unistr('\000a')||
'               from dual)'||unistr('\000a')||
'    loop'||unistr('\000a')||
'        return c1.next_val;'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  end; '||unistr('\000a')||
'begin '||unistr('\000a')||
'  :P12_ID := get_pk; '||unistr('\000a')||
'end; ';

wwv_flow_api.create_page_process(
  p_id     => 130833055609286389 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get PK',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to get primary key item value.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130830373546286251 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE_ACCOUNT:P12_ID:ID|IUD';

wwv_flow_api.create_page_process(
  p_id     => 130833243321286393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of BALANCE_ACCOUNT',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table BALANCE_ACCOUNT.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'12';

wwv_flow_api.create_page_process(
  p_id     => 130833470187286393 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 12,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130830570849286251 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 12
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00013
prompt  ...PAGE 13: Balance transfer
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 13
 ,p_tab_set => 'TS1'
 ,p_name => 'Balance transfer'
 ,p_step_title => 'Переводы средств'
 ,p_step_sub_title => 'Переводы средств'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 130691455197155376 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20101125234451'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select tr.id,'||unistr('\000a')||
'       tr.tr_date,'||unistr('\000a')||
'       tr.amount,'||unistr('\000a')||
'       src.name source,'||unistr('\000a')||
'       dest.name destination'||unistr('\000a')||
'from balance_transfer tr,'||unistr('\000a')||
'     balance src,'||unistr('\000a')||
'     balance dest,'||unistr('\000a')||
'     currency c'||unistr('\000a')||
'where tr.src_id=src.id'||unistr('\000a')||
'and   tr.dest_id=dest.id'||unistr('\000a')||
'and tr.currency_id=c.id'||unistr('\000a')||
'and tr.src_id=nvl(replace(:P13_SRC_BALANCE,''%''||''null%'',null),tr.src_id)'||unistr('\000a')||
'and tr.dest_id=nvl(replace(:P13_DEST_BALANCE,''%''||''null%'',null),tr.dest_';

s:=s||'id)'||unistr('\000a')||
'     and tr.tr_date between nvl(replace(GET_MARGIN_DATE(:P13_PERIOD,0),''%''||''null%'',null),tr.tr_date) and'||unistr('\000a')||
'                            nvl(replace(GET_MARGIN_DATE(:P13_PERIOD,1),''%''||''null%'',null),tr.tr_date)'||unistr('\000a')||
'order by tr.tr_date desc';

wwv_flow_api.create_page_plug (
  p_id=> 127875560705139584 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_plug_name=> 'Переводы по счету',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select tr.id,'||unistr('\000a')||
'       tr.tr_date,'||unistr('\000a')||
'       tr.amount,'||unistr('\000a')||
'       src.name source,'||unistr('\000a')||
'       dest.name destination'||unistr('\000a')||
'from balance_transfer tr,'||unistr('\000a')||
'     balance src,'||unistr('\000a')||
'     balance dest,'||unistr('\000a')||
'     currency c'||unistr('\000a')||
'where tr.src_id=src.id'||unistr('\000a')||
'and   tr.dest_id=dest.id'||unistr('\000a')||
'and tr.currency_id=c.id'||unistr('\000a')||
'and tr.src_id=nvl(replace(:P13_SRC_BALANCE,''%''||''null%'',null),tr.src_id)'||unistr('\000a')||
'and tr.dest_id=nvl(replace(:P13_DEST_BALANCE,''%''||''null%'',null),tr.dest_';

a1:=a1||'id)'||unistr('\000a')||
'     and tr.tr_date between nvl(replace(GET_MARGIN_DATE(:P13_PERIOD,0),''%''||''null%'',null),tr.tr_date) and'||unistr('\000a')||
'                            nvl(replace(GET_MARGIN_DATE(:P13_PERIOD,1),''%''||''null%'',null),tr.tr_date)'||unistr('\000a')||
'order by tr.tr_date desc';

wwv_flow_api.create_worksheet(
  p_id=> 127875669636139584+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_region_id=> 127875560705139584+wwv_flow_api.g_id_offset,
  p_name=> 'Переводы по счету',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '10000',
  p_max_row_count_message=> 'This query returns more than 10,000 rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'N',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'N',
  p_show_help=>'Y',
  p_download_formats=>'CSV',
  p_detail_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::P14_ID:#ID#',
  p_detail_link_text=>'<img src="#IMAGE_PREFIX#e2.gif" alt="">',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_detail_view_enabled_yn=>'N',
  p_owner=>'HOME_FINANCE');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127875867028139587+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_worksheet_id => 127875669636139584+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Код',
  p_report_label           =>'Код',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127875959104139589+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_worksheet_id => 127875669636139584+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'TR_DATE',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Дата',
  p_report_label           =>'Дата',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127876061714139589+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_worksheet_id => 127875669636139584+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'AMOUNT',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Сумма',
  p_report_label           =>'Сумма',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127876170676139589+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_worksheet_id => 127875669636139584+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'SOURCE',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Источник',
  p_report_label           =>'Источник',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_display_condition_type =>'ITEM_IS_NULL',
  p_display_condition      =>'P13_SRC_BALANCE',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 127876245492139589+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_worksheet_id => 127875669636139584+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'DESTINATION',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Получатель',
  p_report_label           =>'Получатель',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_display_condition_type =>'ITEM_IS_NULL',
  p_display_condition      =>'P13_DEST_BALANCE',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:TR_DATE:AMOUNT:SOURCE:DESTINATION';

wwv_flow_api.create_worksheet_rpt(
  p_id => 127920250197858129+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_worksheet_id => 127875669636139584+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'1325017240759439',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130622159206665470 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_plug_name=> 'Параметры',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550521396324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 5,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 128182866015031195 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 13,
  p_button_sequence=> 10,
  p_button_plug_id => 127875560705139584+wwv_flow_api.g_id_offset,
  p_button_name    => 'P13_ADD',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139550001035324102+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Добавить',
  p_button_position=> 'RIGHT_OF_IR_SEARCH_BAR',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>128182644383983064 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_branch_action=> 'f?p=&FLOW_ID.:13:&SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 99,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130623072333665540 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_name=>'P13_SRC_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 130622159206665470+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Источник',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'SUBMIT',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130626360160684717 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_name=>'P13_DEST_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 17,
  p_item_plug_id => 130622159206665470+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Получатель',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'SUBMIT',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130656249827785801 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_name=>'P13_PERIOD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 6,
  p_item_plug_id => 130622159206665470+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Период',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'PERIOD_LOV',
  p_lov=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'SUBMIT',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>132393250961040621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 13,
  p_name=>'P13_TOTAL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 27,
  p_item_plug_id => 127875560705139584+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Итого',
  p_source=>'select sum(tr.amount)'||unistr('\000a')||
'from balance_transfer tr,'||unistr('\000a')||
'     balance src,'||unistr('\000a')||
'     balance dest,'||unistr('\000a')||
'     currency c'||unistr('\000a')||
'where tr.src_id=src.id'||unistr('\000a')||
'and   tr.dest_id=dest.id'||unistr('\000a')||
'and tr.currency_id=c.id'||unistr('\000a')||
'and tr.src_id=nvl(replace(:P13_SRC_BALANCE,''%''||''null%'',null),tr.src_id)'||unistr('\000a')||
'and tr.dest_id=nvl(replace(:P13_DEST_BALANCE,''%''||''null%'',null),tr.dest_id)'||unistr('\000a')||
'     and tr.tr_date between nvl(replace(GET_MARGIN_DATE(:P13_PERIOD,0),''%''||''null%'',null),tr.tr_date) and'||unistr('\000a')||
'                            nvl(replace(GET_MARGIN_DATE(:P13_PERIOD,1),''%''||''null%'',null),tr.tr_date);',
  p_source_type=> 'QUERY',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 13
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00014
prompt  ...PAGE 14: Edit Transfer Form
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 14
 ,p_tab_set => 'TS1'
 ,p_name => 'Edit Transfer Form'
 ,p_step_title => 'Правка перевода'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 130691455197155376 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20090626144128'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 127928546829025697 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 14,
  p_plug_name=> 'Правка перевода',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552308980324116+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 127940164078089240 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 14,
  p_plug_name=> 'Breadcrumbs 14',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 127928755534025714 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 14,
  p_button_sequence=> 30,
  p_button_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Сохранить',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P14_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 127929066712025717 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 14,
  p_button_sequence=> 10,
  p_button_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Отмена',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 127928846795025714 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 14,
  p_button_sequence=> 20,
  p_button_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Удалить',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> 'P14_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>127929543601025725 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_branch_action=> 'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127929767620025734 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565703798324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127929949144025773 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_TR_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tr Date',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'TR_DATE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127930345861025786 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_SRC_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Src Id',
  p_source=>'SRC_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'PERIOD_LOV',
  p_lov=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127930756002025786 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_DEST_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Dest Id',
  p_source=>'DEST_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127931146897025786 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_AMOUNT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Amount',
  p_source=>'AMOUNT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_WITH_CALCULATOR',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127931550123025787 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_CURRENCY_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Currency Id',
  p_source=>'CURRENCY_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>127931946708025789 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 14,
  p_name=>'P14_CURR_RATE_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 127928546829025697+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Curr Rate Id',
  p_source=>'CURR_RATE_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 32,
  p_cMaxlength=> 255,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 127930262868025781 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P14_TR_DATE not null',
  p_validation_sequence=> 20,
  p_validation => 'P14_TR_DATE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Tr Date must have some value.',
  p_associated_item=> 127929949144025773 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 127930647702025786 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P14_SRC_ID not null',
  p_validation_sequence=> 30,
  p_validation => 'P14_SRC_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Src Id must have some value.',
  p_associated_item=> 127930345861025786 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 127931063782025786 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P14_DEST_ID not null',
  p_validation_sequence=> 40,
  p_validation => 'P14_DEST_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Dest Id must have some value.',
  p_associated_item=> 127930756002025786 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 127931457186025787 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P14_AMOUNT not null',
  p_validation_sequence=> 50,
  p_validation => 'P14_AMOUNT',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Amount must have some value.',
  p_associated_item=> 127931146897025786 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 127931842339025789 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P14_CURRENCY_ID not null',
  p_validation_sequence=> 60,
  p_validation => 'P14_CURRENCY_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Currency Id must have some value.',
  p_associated_item=> 127931550123025787 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 127932270835025789 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P14_CURR_RATE_ID not null',
  p_validation_sequence=> 70,
  p_validation => 'P14_CURR_RATE_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Curr Rate Id must have some value.',
  p_associated_item=> 127931946708025789 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:BALANCE_TRANSFER:P14_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 127932452191025792 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from BALANCE_TRANSFER',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE_TRANSFER:P14_ID:ID|UD';

wwv_flow_api.create_page_process(
  p_id     => 127932665590025800 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of BALANCE_TRANSFER',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table BALANCE_TRANSFER.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'14';

wwv_flow_api.create_page_process(
  p_id     => 127932853656025800 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 14,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>127928846795025714 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 14
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00015
prompt  ...PAGE 15: Multi Add Balance_transfer
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 15
 ,p_tab_set => 'TS1'
 ,p_name => 'Multi Add Balance_transfer'
 ,p_step_title => 'Добавить перевод'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_group_id => 127918259024822903 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20140108202219'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130694147326209875 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_plug_name=> 'Параметры',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550521396324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 4,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||unistr('\000a')||
'tr.ID ID,'||unistr('\000a')||
'tr.id ID_DISPLAY,'||unistr('\000a')||
'tr.TR_DATE,'||unistr('\000a')||
'tr.SRC_ID,'||unistr('\000a')||
'tr.DEST_ID,'||unistr('\000a')||
'tr.AMOUNT,'||unistr('\000a')||
'tr.CURRENCY_ID,'||unistr('\000a')||
'tr.CURR_RATE_ID'||unistr('\000a')||
'from balance_transfer tr'||unistr('\000a')||
'where tr.src_id=nvl(replace(:P15_SRC_BALANCE,''%''||''null%'',null),tr.src_id)'||unistr('\000a')||
'and tr.dest_id=nvl(replace(:P15_DEST_BALANCE,''%''||''null%'',null),tr.dest_id)'||unistr('\000a')||
'and tr.tr_date between nvl(replace(:P15_LOW_DT,''%''||''null%'',null),tr.tr_date) and'||unistr('\000a')||
'                        nvl(';

s:=s||'replace(:P15_HI_DT,''%''||''null%'',null),tr.tr_date)'||unistr('\000a')||
'and tr.CURRENCY_ID=nvl(replace(:P15_CURRENCY,''%''||''null%'',null),tr.CURRENCY_ID)'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 15,
  p_name=> 'Tabular Form',
  p_region_name=>'',
  p_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_display_column=> 2,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 139563714492324164+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '(null)',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133678418091271529 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CHECK$01',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Select Row',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'CHECKBOX',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s:=s||'FINANCE_OPERATIONS_SEQ';

wwv_flow_api.create_report_columns (
  p_id=> 133673817179271400 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'S',
  p_pk_col_source=> s,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133673904517271411 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ID_DISPLAY',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Код',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_column_width=> '16',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'ID_DISPLAY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133674005524271411 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'TR_DATE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Дата',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'PICK_DATE_DD_MM_YYYY_DOT',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '12',
  p_is_required=> false,
  p_column_default=> 'sysdate',
  p_column_default_type=> 'FUNCTION',
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'TR_DATE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133674116690271411 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'SRC_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Откуда',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>127835264567159489 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_column_default=> '2',
  p_column_default_type=> 'FUNCTION',
  p_lov_display_extra=> 'NO',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'SRC_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133674213369271411 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'DEST_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Куда',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>127835264567159489 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_column_default=> '1',
  p_column_default_type=> 'FUNCTION',
  p_lov_display_extra=> 'NO',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'DEST_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133674315404271411 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'AMOUNT',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Сумма',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'AMOUNT',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133674423561271411 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CURRENCY_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Валюта',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>127834862011149317 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_column_default=> '1',
  p_column_default_type=> 'FUNCTION',
  p_lov_display_extra=> 'NO',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'CURRENCY_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133674518602271411 + wwv_flow_api.g_id_offset,
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CURR_RATE_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Курс',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>130704251229267751 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_column_default=> '1',
  p_column_default_type=> 'FUNCTION',
  p_lov_display_extra=> 'NO',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'CURR_RATE_ID',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 133674925676271439 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 15,
  p_button_sequence=> 40,
  p_button_plug_id => 133673502946271202+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Add Row',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:addRow();',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 133674718574271439 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 15,
  p_button_sequence=> 30,
  p_button_plug_id => 133673502946271202+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Submit',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 133674612340271439 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 15,
  p_button_sequence=> 10,
  p_button_plug_id => 133673502946271202+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 133674832482271439 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 15,
  p_button_sequence=> 20,
  p_button_plug_id => 133673502946271202+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>127949554942138193 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_branch_action=> 'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130694470091209978 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_DEST_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 8,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Получатель',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'SUBMIT',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130694660923209983 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_PERIOD',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Период',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'PERIOD_LOV',
  p_lov=> 'select p.name d,p.id r '||unistr('\000a')||
'from periods p'||unistr('\000a')||
'order by p.seq',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130694855802209983 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_SRC_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 4,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Источник',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'SUBMIT',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130714270237320626 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_CURRENCY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Currency',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'CURRENCY_LOV',
  p_lov=> 'select SHORT_NAME display_value, ID return_value '||unistr('\000a')||
'from CURRENCY'||unistr('\000a')||
'order by 1',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'-Все-',
  p_lov_null_value=> '',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'SUBMIT',
  p_attribute_03 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>533155627637517046 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_LOW_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'begin'||unistr('\000a')||
'return sysdate;'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'C',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P15_PERIOD,0),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>533178739411520456 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_HI_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'по',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'to_char(GET_MARGIN_DATE(:P15_PERIOD,1),''DD.MM.YYYY'')',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_04 => 'button',
  p_attribute_05 => 'N',
  p_attribute_07 => 'NONE',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>533280944521540845 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_CHOOSE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_RADIOGROUP',
  p_lov=> 'STATIC:Период;1,Интервал;2',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565508966324169+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => '1',
  p_attribute_02 => 'NONE',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>533359727945564376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 15,
  p_name=>'P15_RUN',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 130694147326209875+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'ОБНОВИТЬ',
  p_prompt=>'Обновить',
  p_source=>'ОБНОВИТЬ',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139550001035324102 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133675910996271500 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_tabular_form_region_id => 133673502946271202 + wwv_flow_api.g_id_offset,
  p_validation_name => 'TR_DATE must be a valid date',
  p_validation_sequence=> 30,
  p_validation => 'TR_DATE',
  p_validation_type => 'ITEM_IS_DATE',
  p_error_message => '#COLUMN_HEADER# must be a valid date.',
  p_when_button_pressed=> 133674718574271439 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'TR_DATE',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'APEX_DEBUG_MESSAGE.ENABLE_DEBUG_MESSAGES;'||unistr('\000a')||
'apex_debug_message.log_message(''Befor Loop'');'||unistr('\000a')||
'DECLARE'||unistr('\000a')||
'   v_rowno NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'   for i in 1..apex_application.g_f01.count'||unistr('\000a')||
'   loop'||unistr('\000a')||
'      v_rowno := apex_application.g_f01(i);'||unistr('\000a')||
'      apex_debug_message.log_message(''row# selected: ''||v_rowno);'||unistr('\000a')||
'      apex_debug_message.log_message(''f03: ''||apex_application.g_f03(v_rowno));'||unistr('\000a')||
'   end loop;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 133695901588948172 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_process_sequence=> 5,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_process_type=> 'PLSQL',
  p_process_name=> 'debug',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_exec_cond_for_each_row=> 'Y',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE_TRANSFER:ID';

wwv_flow_api.create_page_process(
  p_id     => 133678210369271527 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'MULTI_ROW_DELETE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '#MRD_COUNT# row(s) deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'FOR i IN 1..APEX_APPLICATION.G_FCUD.COUNT LOOP'||unistr('\000a')||
'  /*apex_debug_message.log_message(''i=''||i||'',''||'||unistr('\000a')||
'                                  ''G_FCUD(i)=''||APEX_APPLICATION.G_FCUD(i) ||'||unistr('\000a')||
'                                 -- ''G_F01(i)=''||APEX_APPLICATION.G_F01(i) ||'||unistr('\000a')||
'                                  '''''||unistr('\000a')||
'                                ,TRUE); */'||unistr('\000a')||
'  if (not APEX_APPLICATION.G_F02.exists(i) or APEX_APPLICATIO';

p:=p||'N.G_F02(i) is null) and APEX_APPLICATION.G_FCUD(i) in (''C'',''D'') then'||unistr('\000a')||
'  /* apex_debug_message.log_message(''insert G_F06(i) ''||APEX_APPLICATION.G_F06(i)'||unistr('\000a')||
'                                ,TRUE); */'||unistr('\000a')||
'    insert into balance_transfer '||unistr('\000a')||
'      (TR_DATE,'||unistr('\000a')||
'       SRC_ID,'||unistr('\000a')||
'       DEST_ID,'||unistr('\000a')||
'       AMOUNT,'||unistr('\000a')||
'       CURRENCY_ID,'||unistr('\000a')||
'       CURR_RATE_ID'||unistr('\000a')||
' ) values'||unistr('\000a')||
' ( APEX_APPLICATION.G_F03(i),'||unistr('\000a')||
'   APEX_APPLICATION.G_F04(i),'||unistr('\000a')||
'';

p:=p||'   APEX_APPLICATION.G_F05(i),'||unistr('\000a')||
'   APEX_APPLICATION.G_F06(i),'||unistr('\000a')||
'   APEX_APPLICATION.G_F07(i),'||unistr('\000a')||
'   APEX_APPLICATION.G_F08(i)'||unistr('\000a')||
' );'||unistr('\000a')||
'  elsif APEX_APPLICATION.G_FCUD(i)=''U'' or APEX_APPLICATION.G_F02.exists(i) and APEX_APPLICATION.G_F02(i) is not null then'||unistr('\000a')||
'    update balance_transfer set '||unistr('\000a')||
'       TR_DATE = APEX_APPLICATION.G_F03(i),'||unistr('\000a')||
'       SRC_ID = APEX_APPLICATION.G_F04(i),'||unistr('\000a')||
'       DEST_ID = APEX_APPLICATION.G';

p:=p||'_F05(i),'||unistr('\000a')||
'       AMOUNT = APEX_APPLICATION.G_F06(i),'||unistr('\000a')||
'       CURRENCY_ID = APEX_APPLICATION.G_F07(i),'||unistr('\000a')||
'       CURR_RATE_ID = APEX_APPLICATION.G_F08(i)'||unistr('\000a')||
'    where ID = APEX_APPLICATION.G_F02(i);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'END LOOP;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 146259201422819427 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'upsert TRANSFER',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>133674718574271439 + wwv_flow_api.g_id_offset,
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Transfer(s) saved.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P15_LOW_DT:=GET_MARGIN_DATE(:P15_PERIOD,0);'||unistr('\000a')||
':P15_HI_DT:=GET_MARGIN_DATE(:P15_PERIOD,1);'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 533239222358534448 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 15,
  p_process_sequence=> 35,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set date margins',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P15_CHOOSE',
  p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2',
  p_process_when2=>'1',
  p_process_when_type2=>'',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 15
--
 
begin
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133679406503329028 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 1,
  p_query_column_name=> 'ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133679523599329037 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 2,
  p_query_column_name=> 'ID_DISPLAY',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133679618212329037 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 3,
  p_query_column_name=> 'TR_DATE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133679722488329039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 4,
  p_query_column_name=> 'SRC_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133679828878329039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 5,
  p_query_column_name=> 'DEST_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133679911240329039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 6,
  p_query_column_name=> 'AMOUNT',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133680009572329039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 7,
  p_query_column_name=> 'CURRENCY_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133680116685329039 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133673502946271202 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 8,
  p_query_column_name=> 'CURR_RATE_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00016
prompt  ...PAGE 16: Контрагенты
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 16
 ,p_tab_set => 'TS1'
 ,p_name => 'Контрагенты'
 ,p_step_title => 'Контрагенты'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_group_id => 130691167487121040 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20090817070721'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||unistr('\000a')||
'"ID",'||unistr('\000a')||
'"ID" ID_DISPLAY,'||unistr('\000a')||
'"CNTR_NAME",'||unistr('\000a')||
'"GRP"'||unistr('\000a')||
'from "#OWNER#"."CONTRACTOR"';

wwv_flow_api.create_report_region (
  p_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 16,
  p_name=> 'Список контрагентов',
  p_region_name=>'',
  p_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 139562232648324160+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '(null)',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130808671247932565 + wwv_flow_api.g_id_offset,
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CHECK$01',
  p_column_display_sequence=> 1,
  p_column_heading=> '&nbsp;',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'CHECKBOX',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s:=s||'CURRENCY_SEQ';

wwv_flow_api.create_report_columns (
  p_id=> 130806844973932531 + wwv_flow_api.g_id_offset,
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'S',
  p_pk_col_source=> s,
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'CONTRACTOR',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130806949139932531 + wwv_flow_api.g_id_offset,
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ID_DISPLAY',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Код',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'CONTRACTOR',
  p_ref_column_name=> 'ID_DISPLAY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130807063300932531 + wwv_flow_api.g_id_offset,
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CNTR_NAME',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Наименовение',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'CONTRACTOR',
  p_ref_column_name=> 'CNTR_NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130807168811932531 + wwv_flow_api.g_id_offset,
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'GRP',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Группа',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'CONTRACTOR',
  p_ref_column_name=> 'GRP',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130809345863932589 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 16,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 130807552878932543 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 16,
  p_button_sequence=> 40,
  p_button_plug_id => 130806562734932512+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Добавить',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130807373714932543 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 16,
  p_button_sequence=> 30,
  p_button_plug_id => 130806562734932512+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Сохранить',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130807243233932543 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 16,
  p_button_sequence=> 10,
  p_button_plug_id => 130806562734932512+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Отмена',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130807460083932543 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 16,
  p_button_sequence=> 20,
  p_button_plug_id => 130806562734932512+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Удалить помеченные',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>130809163711932567 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 16,
  p_branch_action=> 'f?p=&APP_ID.:16:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:CONTRACTOR:ID';

wwv_flow_api.create_page_process(
  p_id     => 130808273200932551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 16,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process update.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130807373714932543 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:CONTRACTOR:ID';

wwv_flow_api.create_page_process(
  p_id     => 130808461574932556 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 16,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process delete.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'MULTI_ROW_DELETE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '#MRD_COUNT# row(s) deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:CONTRACTOR:ID';

wwv_flow_api.create_page_process(
  p_id     => 130808754370932565 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 16,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process update.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130807552878932543 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'1';

wwv_flow_api.create_page_process(
  p_id     => 130808964485932565 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 16,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130806562734932512 + wwv_flow_api.g_id_offset,
  p_process_type=> 'ADD_ROWS_TO_TABULAR_FORM',
  p_process_name=> 'AddRows',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to add rows.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130807552878932543 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 16
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00017
prompt  ...PAGE 17: Счета учета
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 17
 ,p_tab_set => 'TS1'
 ,p_name => 'Счета учета'
 ,p_step_title => 'Счета учета'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20090817070721'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||unistr('\000a')||
'"ID",'||unistr('\000a')||
'"NAME",'||unistr('\000a')||
'"CURRENCY_ID",'||unistr('\000a')||
'"OPENING"'||unistr('\000a')||
'from "#OWNER#"."BALANCE"';

wwv_flow_api.create_report_region (
  p_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 17,
  p_name=> 'Список счетов',
  p_region_name=>'',
  p_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 139562232648324160+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '(null)',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_csv_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_dark.gif',
  p_query_asc_image_attr=> 'width="13" height="12" alt=""',
  p_query_desc_image=> 'arrow_up_gray_dark.gif',
  p_query_desc_image_attr=> 'width="13" height="12" alt=""',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130820658650999384 + wwv_flow_api.g_id_offset,
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CHECK$01',
  p_column_display_sequence=> 1,
  p_column_heading=> '&nbsp;',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'CHECKBOX',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s:=s||'CURRENCY_SEQ';

wwv_flow_api.create_report_columns (
  p_id=> 130818856415999356 + wwv_flow_api.g_id_offset,
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'S',
  p_pk_col_source=> s,
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'BALANCE',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130818961977999359 + wwv_flow_api.g_id_offset,
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'NAME',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Название',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'BALANCE',
  p_ref_column_name=> 'NAME',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130819045871999359 + wwv_flow_api.g_id_offset,
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'CURRENCY_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Основная валюта',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'SELECT_LIST_FROM_LOV',
  p_named_lov=>127834862011149317 + wwv_flow_api.g_id_offset,
  p_lov_show_nulls=> 'NO',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'BALANCE',
  p_ref_column_name=> 'CURRENCY_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 130819155721999359 + wwv_flow_api.g_id_offset,
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'OPENING',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Начальное сальдо',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_ref_schema=> 'HOME_FINANCE',
  p_ref_table_name=> 'BALANCE',
  p_ref_column_name=> 'OPENING',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130821358670999401 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 17,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 130819553889999367 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 17,
  p_button_sequence=> 40,
  p_button_plug_id => 130818570057999333+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Добавить',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130819342454999367 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 17,
  p_button_sequence=> 30,
  p_button_plug_id => 130818570057999333+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Сохранить',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130819245944999367 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 17,
  p_button_sequence=> 10,
  p_button_plug_id => 130818570057999333+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Отмена',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130819450442999367 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 17,
  p_button_sequence=> 20,
  p_button_plug_id => 130818570057999333+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Удалить помеченные',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>130821150526999386 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 17,
  p_branch_action=> 'f?p=&APP_ID.:17:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE:ID';

wwv_flow_api.create_page_process(
  p_id     => 130820247902999376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 17,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process update.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130819342454999367 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE:ID';

wwv_flow_api.create_page_process(
  p_id     => 130820462011999383 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 17,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process delete.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'MULTI_ROW_DELETE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '#MRD_COUNT# row(s) deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE:ID';

wwv_flow_api.create_page_process(
  p_id     => 130820772723999386 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 17,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process update.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130819553889999367 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'1';

wwv_flow_api.create_page_process(
  p_id     => 130820956630999386 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 17,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 130818570057999333 + wwv_flow_api.g_id_offset,
  p_process_type=> 'ADD_ROWS_TO_TABULAR_FORM',
  p_process_name=> 'AddRows',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to add rows.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130819553889999367 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 17
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00018
prompt  ...PAGE 18: Список валют
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 18
 ,p_tab_set => 'TS1'
 ,p_name => 'Список валют'
 ,p_step_title => 'Список валют'
 ,p_step_sub_title => 'Список валют'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_group_id => 130691167487121040 + wwv_flow_api.g_id_offset
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20140102220153'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130758156974534408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 18,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select id, full_name, short_name'||unistr('\000a')||
'  from currency';

wwv_flow_api.create_report_region (
  p_id=> 146263022387939023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 18,
  p_name=> 'Currencies',
  p_region_name=>'',
  p_template=> 139550225870324103+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 11,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 139563714492324164+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_prn_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146263313809939041 + wwv_flow_api.g_id_offset,
  p_region_id=> 146263022387939023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 1,
  p_column_heading=> '',
  p_use_as_row_header=> 'N',
  p_column_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::P19_ID:#ID#',
  p_column_linktext=>'<img src="#IMAGE_PREFIX#edit.gif" alt="">',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146263422169939041 + wwv_flow_api.g_id_offset,
  p_region_id=> 146263022387939023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'FULL_NAME',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Name',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146263532109939042 + wwv_flow_api.g_id_offset,
  p_region_id=> 146263022387939023 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'SHORT_NAME',
  p_column_display_sequence=> 3,
  p_column_heading=> '',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 130761053485534620 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 18,
  p_computation_sequence => 1,
  p_computation_item=> 'P19_ID',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> '',
  p_compute_when => 'CREATE',
  p_compute_when_type=>'REQUEST_EQUALS_CONDITION');
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 18
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00019
prompt  ...PAGE 19: Валюта и курсы
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 19
 ,p_tab_set => 'TS1'
 ,p_name => 'Валюта и курсы'
 ,p_step_title => 'Валюта и курсы'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_group_id => 130691167487121040 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20140102215516'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130758258401534409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 19,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130761567615534629 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 19,
  p_plug_name=> 'Edit currency',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139554719955324121+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||unistr('\000a')||
'"ID",'||unistr('\000a')||
'"RATE_DATE",'||unistr('\000a')||
'"RATE"'||unistr('\000a')||
'from "#OWNER#"."CURRENCY_RATE"'||unistr('\000a')||
'where to_currency_id = :P19_ID'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 19,
  p_name=> 'Rates',
  p_region_name=>'',
  p_parent_plug_id=>130761567615534629 + wwv_flow_api.g_id_offset,
  p_template=> 139550225870324103+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_display_when_condition=> 'P19_ID',
  p_display_condition_type=> 'ITEM_IS_NOT_NULL',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 139563714492324164+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '(null)',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146251004154542039 + wwv_flow_api.g_id_offset,
  p_region_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CHECK$01',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Select Row',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'CHECKBOX',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146248418443541953 + wwv_flow_api.g_id_offset,
  p_region_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'T',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'CURRENCY_RATE',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146248600568541959 + wwv_flow_api.g_id_offset,
  p_region_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'RATE_DATE',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Rate Date',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>1,
  p_default_sort_dir=>'desc',
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'DATE_PICKER',
  p_column_width=> '12',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'CURRENCY_RATE',
  p_ref_column_name=> 'RATE_DATE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 146248716456541959 + wwv_flow_api.g_id_offset,
  p_region_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'RATE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Rate',
  p_use_as_row_header=> 'N',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_lov_show_nulls=> 'NO',
  p_column_width=> '10',
  p_is_required=> false,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'CURRENCY_RATE',
  p_ref_column_name=> 'RATE',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 146248814339541989 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 10,
  p_button_plug_id => 146248123117541936+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 146249009861541989 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 20,
  p_button_plug_id => 146248123117541936+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 146249115365541989 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 25,
  p_button_plug_id => 146248123117541936+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Add',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:addRow();',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130761866096534633 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 30,
  p_button_plug_id => 130761567615534629+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549603525324101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Сохранить',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P19_ID',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 146248931280541989 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 30,
  p_button_plug_id => 146248123117541936+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE_RATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549603525324101+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Submit',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130761943141534633 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 20,
  p_button_plug_id => 130761567615534629+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete currency',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_execute_validations=>'Y',
  p_button_condition=> 'P19_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130762142713534633 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 19,
  p_button_sequence=> 10,
  p_button_plug_id => 130761567615534629+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'RIGHT_OF_TITLE',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>146251127665542040 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_branch_action=> 'f?p=&APP_ID.:19:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>130764169261534695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_branch_action=> 'f?p=&APP_ID.:18:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'SAVE,DELETE,CREATE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>130766852072534775 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_branch_action=> 'f?p=&APP_ID.:19:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130762762136534637 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_name=>'P19_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 130761567615534629+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Код',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130762949077534658 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_name=>'P19_SHORT_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 5,
  p_item_plug_id => 130761567615534629+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'/',
  p_source=>'SHORT_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 5,
  p_cMaxlength=> 5,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130763167930534659 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_name=>'P19_FULL_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 3,
  p_item_plug_id => 130761567615534629+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Name',
  p_source=>'FULL_NAME',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 25,
  p_cMaxlength=> 25,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 146249906684542020 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_tabular_form_region_id => 146248123117541936 + wwv_flow_api.g_id_offset,
  p_validation_name => 'RATE_DATE not null',
  p_validation_sequence=> 30,
  p_validation => 'RATE_DATE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 146248931280541989 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'RATE_DATE',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 146250120148542033 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_tabular_form_region_id => 146248123117541936 + wwv_flow_api.g_id_offset,
  p_validation_name => 'RATE_DATE must be a valid date',
  p_validation_sequence=> 30,
  p_validation => 'RATE_DATE',
  p_validation_type => 'ITEM_IS_DATE',
  p_error_message => '#COLUMN_HEADER# must be a valid date.',
  p_when_button_pressed=> 146248931280541989 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'RATE_DATE',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 146250308533542033 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_tabular_form_region_id => 146248123117541936 + wwv_flow_api.g_id_offset,
  p_validation_name => 'RATE not null',
  p_validation_sequence=> 40,
  p_validation => 'RATE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 146248931280541989 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'RATE',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 146250530006542034 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_tabular_form_region_id => 146248123117541936 + wwv_flow_api.g_id_offset,
  p_validation_name => 'RATE must be numeric',
  p_validation_sequence=> 40,
  p_validation => 'RATE',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#COLUMN_HEADER# must be numeric.',
  p_when_button_pressed=> 146248931280541989 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'RATE',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:CURRENCY:P19_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 130763469079534661 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from CURRENCY',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if :P19_ID is NULL then'||unistr('\000a')||
'  insert into currency(ID, short_name,full_name)'||unistr('\000a')||
'    values (currency_seq.nextval,:P19_SHORT_NAME,:P19_FULL_NAME)'||unistr('\000a')||
'  returning ID into :P19_ID;'||unistr('\000a')||
'else'||unistr('\000a')||
'  update currency'||unistr('\000a')||
'     set short_name = :P19_SHORT_NAME'||unistr('\000a')||
'       , full_name = :P19_FULL_NAME'||unistr('\000a')||
'   where ID = :P19_ID;'||unistr('\000a')||
'end if;';

wwv_flow_api.create_page_process(
  p_id     => 146247918007521506 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'upsert CURRENCY',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'SAVE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Currency updated.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:CURRENCY_RATE:ID';

wwv_flow_api.create_page_process(
  p_id     => 146250824548542037 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'MULTI_ROW_DELETE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '#MRD_COUNT# row(s) deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'FOR i IN 1..APEX_APPLICATION.G_FCUD.COUNT LOOP'||unistr('\000a')||
'  apex_debug_message.log_message(''i=''||i||'',''||'||unistr('\000a')||
'                                  ''G_FCUD(i)=''||APEX_APPLICATION.G_FCUD(i) ||'||unistr('\000a')||
'                                  '' G_F03(i)=''||APEX_APPLICATION.G_F03(i) ||'||unistr('\000a')||
'                                  '''''||unistr('\000a')||
'                                ,TRUE); '||unistr('\000a')||
'  if (not APEX_APPLICATION.G_F02.exists(i) or APEX_APPLICATION.G_F';

p:=p||'02(i) is null) and APEX_APPLICATION.G_FCUD(i) in (''C'',''D'') then'||unistr('\000a')||
'  /* apex_debug_message.log_message(''insert G_F06(i) ''||APEX_APPLICATION.G_F06(i)'||unistr('\000a')||
'                                ,TRUE); */'||unistr('\000a')||
'    insert into currency_rate'||unistr('\000a')||
'      (RATE_DATE,'||unistr('\000a')||
'       RATE,'||unistr('\000a')||
'       TO_CURRENCY_ID'||unistr('\000a')||
' ) values'||unistr('\000a')||
' ( APEX_APPLICATION.G_F03(i),'||unistr('\000a')||
'   APEX_APPLICATION.G_F04(i),'||unistr('\000a')||
'   :P19_ID'||unistr('\000a')||
' );'||unistr('\000a')||
'  elsif APEX_APPLICATION.G_FCUD(i)=''U'' or A';

p:=p||'PEX_APPLICATION.G_F02.exists(i) and APEX_APPLICATION.G_F02(i) is not null then'||unistr('\000a')||
'    update currency_rate set'||unistr('\000a')||
'       RATE_DATE = APEX_APPLICATION.G_F03(i),'||unistr('\000a')||
'       RATE = APEX_APPLICATION.G_F04(i)'||unistr('\000a')||
'    where ID = APEX_APPLICATION.G_F02(i);'||unistr('\000a')||
'  end if;'||unistr('\000a')||
'END LOOP;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 146261029388846423 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'upsert CURRENCY_ RATE',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'SAVE,SAVE_RATE',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'delete currency_rate where to_currency_id = :P19_ID;'||unistr('\000a')||
'delete currency where id = :P19_ID;';

wwv_flow_api.create_page_process(
  p_id     => 146262218400900057 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'del CURRENCY',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>130761943141534633 + wwv_flow_api.g_id_offset,
  p_process_when=>'P19_ID',
  p_process_when_type=>'ITEM_IS_NOT_NULL',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> 'Currency and its rates deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'19';

wwv_flow_api.create_page_process(
  p_id     => 130764042276534687 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 50,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'reset page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130761943141534633 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 19
--
 
begin
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 146251521994560552 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 1,
  p_query_column_name=> 'ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 146251728049560554 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 2,
  p_query_column_name=> 'RATE_DATE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 146251828478560554 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 146248123117541936 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 3,
  p_query_column_name=> 'RATE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00020
prompt  ...PAGE 20: Справочники
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 20
 ,p_tab_set => 'TS1'
 ,p_name => 'Справочники'
 ,p_step_title => 'Справочники'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_group_id => 130691167487121040 + wwv_flow_api.g_id_offset
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20090817070721'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130792543497867150 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130852162037807436 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 20,
  p_plug_name=> 'Справочники',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 11,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 130844242597773500 + wwv_flow_api.g_id_offset,
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 20
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00021
prompt  ...PAGE 21: Учет остатков
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 21
 ,p_tab_set => 'TS1'
 ,p_name => 'Учет остатков'
 ,p_step_title => 'Учет остатков'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_html_page_header => 
'<script language="JavaScript" type="text/javascript">'||unistr('\000a')||
'<!--'||unistr('\000a')||
''||unistr('\000a')||
' htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'
 ,p_cache_page_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20101211151801'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130902671042242328 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Edit balance tracking',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139552308980324116+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130906261285242467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select "ID", '||unistr('\000a')||
'"CHECK_DATE",'||unistr('\000a')||
'"BALANCE_ID",'||unistr('\000a')||
'"AMOUNT"'||unistr('\000a')||
'from "#OWNER#"."FACT_BALANCE" '||unistr('\000a')||
'where balance_id = nvl(replace(:P21_BALANCE,''%''||''null%'',null),balance_id)'||unistr('\000a')||
'and CHECK_DATE>=nvl(replace(:P21_LOW_DT,''%''||''null%'',null),CHECK_DATE)'||unistr('\000a')||
'order by CHECK_DATE desc'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 131025769982462643 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_plug_name=> 'Report on FACT_BALANCE',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 5,
  p_plug_display_column=> 3,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select "ID", '||unistr('\000a')||
'"CHECK_DATE",'||unistr('\000a')||
'"BALANCE_ID",'||unistr('\000a')||
'"AMOUNT"'||unistr('\000a')||
'from "#OWNER#"."FACT_BALANCE" '||unistr('\000a')||
'where balance_id = nvl(replace(:P21_BALANCE,''%''||''null%'',null),balance_id)'||unistr('\000a')||
'and CHECK_DATE>=nvl(replace(:P21_LOW_DT,''%''||''null%'',null),CHECK_DATE)'||unistr('\000a')||
'order by CHECK_DATE desc'||unistr('\000a')||
'';

wwv_flow_api.create_worksheet(
  p_id=> 131025947098462645+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_region_id=> 131025769982462643+wwv_flow_api.g_id_offset,
  p_name=> 'Report on FACT_BALANCE',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '10000',
  p_max_row_count_message=> 'This query returns more than 10,000 rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'Y',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'Y',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'Y',
  p_show_search_textbox=>'Y',
  p_show_actions_menu=>'Y',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'C',
  p_show_select_columns=>'Y',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'Y',
  p_show_sort=>'Y',
  p_show_control_break=>'Y',
  p_show_highlight=>'Y',
  p_show_computation=>'Y',
  p_show_aggregate=>'Y',
  p_show_chart=>'Y',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'Y',
  p_show_reset=>'Y',
  p_show_download=>'Y',
  p_show_help=>'Y',
  p_download_formats=>'CSV',
  p_detail_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::P21_ID:#ID#',
  p_detail_link_text=>'<img src="#IMAGE_PREFIX#e2.gif"  border="0">',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_detail_view_enabled_yn=>'N',
  p_owner=>'HOME_FINANCE');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 131026053249462653+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_worksheet_id => 131025947098462645+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Id',
  p_report_label           =>'Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 131026150158462661+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_worksheet_id => 131025947098462645+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CHECK_DATE',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Дата подсчета',
  p_report_label           =>'Дата подсчета',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 131026263549462661+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_worksheet_id => 131025947098462645+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'BALANCE_ID',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Счет',
  p_report_label           =>'Счет',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_display_condition_type =>'ITEM_IS_NULL',
  p_display_condition      =>'P21_BALANCE',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 131026342200462661+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_worksheet_id => 131025947098462645+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'AMOUNT',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Остаток факт',
  p_report_label           =>'Остаток факт',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'ESCAPE_SC',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:CHECK_DATE:BALANCE_ID:AMOUNT';

wwv_flow_api.create_worksheet_rpt(
  p_id => 131032155804480576+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 21,
  p_worksheet_id => 131025947098462645+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'1325206679759440',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>15,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 131068162264943642 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 60,
  p_button_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_button_name    => 'GOTOFACT',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139550001035324102+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cверка',
  p_button_position=> 'BELOW_BOX',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 131060146977866006 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 50,
  p_button_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_button_name    => 'CLR',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139550001035324102+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Очистить поля',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130902842531242362 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 40,
  p_button_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_button_name    => 'CREATE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139550001035324102+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Сохранить новые данные',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P21_ID',
  p_button_condition_type=> 'ITEM_IS_NULL',
  p_database_action=>'INSERT',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130903046334242362 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 20,
  p_button_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_button_name    => 'DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139550001035324102+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Удалить запись',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> 'javascript:confirmDelete(htmldb_delete_message,''DELETE'');',
  p_button_condition=> 'P21_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'DELETE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 130902953099242362 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 21,
  p_button_sequence=> 30,
  p_button_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_button_name    => 'SAVE',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139550001035324102+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Сохранить изменения',
  p_button_position=> 'REGION_TEMPLATE_EDIT',
  p_button_alignment=> 'LEFT',
  p_button_redirect_url=> '',
  p_button_condition=> 'P21_ID',
  p_button_condition_type=> 'ITEM_IS_NOT_NULL',
  p_database_action=>'UPDATE',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>130903872511242379 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_branch_action=> 'f?p=&APP_ID.:21:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130904050873242390 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_prompt=>'Id',
  p_source=>'ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565703798324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130904249372242437 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_CHECK_DATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'begin'||unistr('\000a')||
'return TO_CHar((trunc(sysdate+1)-1/86400),''DD.MM.YYYY HH24:MI'');'||unistr('\000a')||
'end;',
  p_item_default_type=> 'PLSQL_FUNCTION_BODY',
  p_prompt=>'Дата сверки',
  p_format_mask=>'DD.MM.YYYY HH24:MI',
  p_source=>'CHECK_DATE',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 16,
  p_cMaxlength=> 20,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130904667129242451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_BALANCE_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Счет',
  p_source=>'BALANCE_ID',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565931004324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130905058733242451 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_AMOUNT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Остаток по факту',
  p_source=>'AMOUNT',
  p_source_type=> 'DB_COLUMN',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 16,
  p_cMaxlength=> 20,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565803854324176+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131038247979563500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 131025769982462643+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Счет',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131080249413987270 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_LOW_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 131025769982462643+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SYSDATE-30',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Дата начала',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'SYSDATE-30',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 30,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131226973779643611 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_SHOW_FORM',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 70,
  p_item_plug_id => 131025769982462643+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'CLR',
  p_prompt=>'Добавить',
  p_source=>'CLR',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139550001035324102 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>131227160535658698 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 21,
  p_name=>'P21_FLAG',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 80,
  p_item_plug_id => 130902671042242328+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '0',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 130904574015242443 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P21_CHECK_DATE not null',
  p_validation_sequence=> 20,
  p_validation => 'P21_CHECK_DATE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Check Date must have some value.',
  p_validation_condition=> 'CREATE,SAVE',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_associated_item=> 130904249372242437 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 130904965207242451 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P21_BALANCE_ID not null',
  p_validation_sequence=> 30,
  p_validation => 'P21_BALANCE_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Balance Id must have some value.',
  p_validation_condition=> 'CREATE,SAVE',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_associated_item=> 130904667129242451 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 130905354070242453 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P21_AMOUNT not null',
  p_validation_sequence=> 40,
  p_validation => 'P21_AMOUNT',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => 'Amount must have some value.',
  p_validation_condition=> 'CREATE,SAVE',
  p_validation_condition_type=> 'REQUEST_IN_CONDITION',
  p_associated_item=> 130905058733242451 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'F|#OWNER#:FACT_BALANCE:P21_ID:ID';

wwv_flow_api.create_page_process(
  p_id     => 131025067150462634 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'DML_FETCH_ROW',
  p_process_name=> 'Fetch Row from FACT_BALANCE',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to fetch row.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare '||unistr('\000a')||
'  function get_pk return varchar2 '||unistr('\000a')||
'  is '||unistr('\000a')||
'  begin '||unistr('\000a')||
'    for c1 in (select FACT_BAL_SEQ.nextval next_val'||unistr('\000a')||
'               from dual)'||unistr('\000a')||
'    loop'||unistr('\000a')||
'        return c1.next_val;'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
'  end; '||unistr('\000a')||
'begin '||unistr('\000a')||
'  :P21_ID := get_pk; '||unistr('\000a')||
'end; ';

wwv_flow_api.create_page_process(
  p_id     => 130905743752242467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get PK',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to get primary key item value.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>130902842531242362 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:FACT_BALANCE:P21_ID:ID|IUD';

wwv_flow_api.create_page_process(
  p_id     => 130905961607242467 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'DML_PROCESS_ROW',
  p_process_name=> 'Process Row of FACT_BALANCE',
  p_process_sql_clob => p, 
  p_process_error_message=> 'Unable to process row of table FACT_BALANCE.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> 'Action Processed.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P21_ID,P21_CHECK_DATE,P21_BALANCE_ID,P21_AMOUNT';

wwv_flow_api.create_page_process(
  p_id     => 131066162517887017 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_process_sequence=> 40,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Clear form',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'DELETE,CLR',
  p_process_when_type=>'REQUEST_IN_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':P1_flag:=1;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 131227245429663747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 21,
  p_process_sequence=> 45,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set flag',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>131226973779643611 + wwv_flow_api.g_id_offset,
  p_process_when=>'GO',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 21
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00022
prompt  ...PAGE 22: Сверка остатков
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 22
 ,p_tab_set => 'TS1'
 ,p_name => 'Сверка остатков'
 ,p_step_title => 'Сверка остатков'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'HOME_FINANCE'
 ,p_last_upd_yyyymmddhh24miss => '20100109233949'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 130980549880267987 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_plug_name=> 'Breadcrumb',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139550805302324109+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 1,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_01',
  p_plug_source=> s,
  p_plug_source_type=> 'M'|| to_char(122290373555336772 + wwv_flow_api.g_id_offset),
  p_menu_template_id=> 139566021514324176+ wwv_flow_api.g_id_offset,
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select * from fact_balance_tracking'||unistr('\000a')||
'where id = nvl(replace(:P22_BALANCE,''%''||''null%'',null),id)'||unistr('\000a')||
'  and op_date>=nvl(replace(:P22_LOW_DT,''%''||''null%'',null),op_date)'||unistr('\000a')||
'order by op_date';

wwv_flow_api.create_page_plug (
  p_id=> 130980961926274179 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_plug_name=> 'Отчет по остаткам',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 11,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'DYNAMIC_QUERY',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select * from fact_balance_tracking'||unistr('\000a')||
'where id = nvl(replace(:P22_BALANCE,''%''||''null%'',null),id)'||unistr('\000a')||
'  and op_date>=nvl(replace(:P22_LOW_DT,''%''||''null%'',null),op_date)'||unistr('\000a')||
'order by op_date';

wwv_flow_api.create_worksheet(
  p_id=> 130981152314274281+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_region_id=> 130980961926274179+wwv_flow_api.g_id_offset,
  p_name=> 'Сверка остатков',
  p_folder_id=> null, 
  p_alias=> '',
  p_report_id_item=> '',
  p_max_row_count=> '10000',
  p_max_row_count_message=> 'This query returns more than 10,000 rows, please filter your data to ensure complete results.',
  p_no_data_found_message=> 'No data found.',
  p_max_rows_per_page=>'',
  p_search_button_label=>'',
  p_sort_asc_image=>'',
  p_sort_asc_image_attr=>'',
  p_sort_desc_image=>'',
  p_sort_desc_image_attr=>'',
  p_sql_query => a1,
  p_status=>'AVAILABLE_FOR_OWNER',
  p_allow_report_saving=>'N',
  p_allow_save_rpt_public=>'N',
  p_allow_report_categories=>'N',
  p_show_nulls_as=>'-',
  p_pagination_type=>'ROWS_X_TO_Y_OF_Z',
  p_pagination_display_pos=>'BOTTOM_RIGHT',
  p_show_finder_drop_down=>'N',
  p_show_display_row_count=>'N',
  p_show_search_bar=>'N',
  p_show_search_textbox=>'N',
  p_show_actions_menu=>'N',
  p_report_list_mode=>'TABS',
  p_show_detail_link=>'N',
  p_show_select_columns=>'N',
  p_show_rows_per_page=>'Y',
  p_show_filter=>'N',
  p_show_sort=>'N',
  p_show_control_break=>'N',
  p_show_highlight=>'N',
  p_show_computation=>'N',
  p_show_aggregate=>'N',
  p_show_chart=>'N',
  p_show_group_by=>'Y',
  p_show_notify=>'N',
  p_show_calendar=>'N',
  p_show_flashback=>'N',
  p_show_reset=>'N',
  p_show_download=>'N',
  p_show_help=>'N',
  p_download_formats=>'CSV',
  p_allow_exclude_null_values=>'N',
  p_allow_hide_extra_columns=>'N',
  p_icon_view_enabled_yn=>'N',
  p_detail_view_enabled_yn=>'N',
  p_owner=>'HOME_FINANCE');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981267337274300+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'ID',
  p_display_order          =>1,
  p_column_identifier      =>'A',
  p_column_label           =>'Id',
  p_report_label           =>'Id',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'HIDDEN',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981368203274312+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'NAME',
  p_display_order          =>2,
  p_column_identifier      =>'B',
  p_column_label           =>'Счет',
  p_report_label           =>'Счет',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'STRING',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_display_condition_type =>'ITEM_IS_NULL',
  p_display_condition      =>'P22_BALANCE',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981468546274312+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'OP_DATE',
  p_display_order          =>3,
  p_column_identifier      =>'C',
  p_column_label           =>'Дата сверки',
  p_report_label           =>'Дата сверки',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'DATE',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'LEFT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981559095274312+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'IINC',
  p_display_order          =>4,
  p_column_identifier      =>'D',
  p_column_label           =>'Приход',
  p_report_label           =>'Приход',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981645345274314+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'IEXP',
  p_display_order          =>5,
  p_column_identifier      =>'E',
  p_column_label           =>'Расход',
  p_report_label           =>'Расход',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981761641274314+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'CUM_BAL',
  p_display_order          =>6,
  p_column_identifier      =>'F',
  p_column_label           =>'Ост. БД',
  p_report_label           =>'Ост. БД',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981851872274314+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'FACT',
  p_display_order          =>7,
  p_column_identifier      =>'G',
  p_column_label           =>'Ост. факт',
  p_report_label           =>'Ост. факт',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
begin
wwv_flow_api.create_worksheet_column(
  p_id => 130981948738274314+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_db_column_name         =>'UNDERCNT',
  p_display_order          =>8,
  p_column_identifier      =>'H',
  p_column_label           =>'БД-факт',
  p_report_label           =>'БД-факт',
  p_sync_form_label        =>'Y',
  p_display_in_default_rpt =>'Y',
  p_is_sortable            =>'Y',
  p_allow_sorting          =>'Y',
  p_allow_filtering        =>'Y',
  p_allow_highlighting     =>'Y',
  p_allow_ctrl_breaks      =>'Y',
  p_allow_aggregations     =>'Y',
  p_allow_computations     =>'Y',
  p_allow_charting         =>'Y',
  p_allow_group_by         =>'Y',
  p_allow_hide             =>'Y',
  p_others_may_edit        =>'Y',
  p_others_may_view        =>'Y',
  p_column_type            =>'NUMBER',
  p_display_as             =>'TEXT',
  p_display_text_as        =>'WITHOUT_MODIFICATION',
  p_heading_alignment      =>'CENTER',
  p_column_alignment       =>'RIGHT',
  p_rpt_distinct_lov       =>'Y',
  p_rpt_show_filter_lov    =>'D',
  p_rpt_filter_date_ranges =>'ALL',
  p_help_text              =>'');
end;
/
declare
    rc1 varchar2(32767) := null;
begin
rc1:=rc1||'ID:NAME:OP_DATE:IINC:IEXP:CUM_BAL:FACT:UNDERCNT';

wwv_flow_api.create_worksheet_rpt(
  p_id => 130982068402274322+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_session_id  => null,
  p_base_report_id  => null+wwv_flow_api.g_id_offset,
  p_application_user => 'APXWS_DEFAULT',
  p_report_seq              =>10,
  p_report_alias            =>'1325332512759440',
  p_status                  =>'PUBLIC',
  p_category_id             =>null+wwv_flow_api.g_id_offset,
  p_is_default              =>'Y',
  p_display_rows            =>20,
  p_report_columns          =>rc1,
  p_flashback_enabled       =>'N',
  p_calendar_display_column =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 130982272415274339+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_report_id => 130982068402274322+wwv_flow_api.g_id_offset,
  p_name                    =>'Undercnt',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'UNDERCNT',
  p_operator                =>'>',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("UNDERCNT" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>10,
  p_column_font_color       =>'#FF0099',
  p_column_format           =>'');
end;
/
begin
wwv_flow_api.create_worksheet_condition(
  p_id => 130982157365274336+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_worksheet_id => 130981152314274281+wwv_flow_api.g_id_offset,
  p_report_id => 130982068402274322+wwv_flow_api.g_id_offset,
  p_name                    =>'Overcnt',
  p_condition_type          =>'HIGHLIGHT',
  p_allow_delete            =>'Y',
  p_column_name             =>'UNDERCNT',
  p_operator                =>'<',
  p_expr                    =>'0',
  p_expr2                   =>'minutes',
  p_condition_sql           =>' (case when ("UNDERCNT" < to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) ',
  p_condition_display       =>'#APXWS_COL_NAME# < #APXWS_EXPR_NUMBER#  ',
  p_enabled                 =>'Y',
  p_highlight_sequence      =>11,
  p_column_font_color       =>'#0000FF',
  p_column_format           =>'');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<img src=http://127.0.0.1:8080/apex/wwv_flow_file_mgr.get_file?p_security_group_id=1076405388509750&p_flow_id=101&p_fname=DSC_2919.jpg></img>'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 131117853019768258 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 22,
  p_plug_name=> 'shift region',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139551413740324110+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 21,
  p_plug_display_column=> 2,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>130994243234344462 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 22,
  p_branch_action=> '22',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'BRANCH_TO_STEP',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 07-ИЮЛ-2009 09:32 by HOME_FINANCE');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130982462653274351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 22,
  p_name=>'P22_BALANCE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 130980961926274179+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Счет',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_named_lov=> 'BALANCE_LOV',
  p_lov=> 'select NAME display_value, ID return_value '||unistr('\000a')||
'from BALANCE',
  p_lov_display_null=> 'YES',
  p_lov_translated=> 'N',
  p_lov_null_text=>'Все счета',
  p_lov_null_value=> '%null%',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130982671630274358 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 22,
  p_name=>'P22_REFRESH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 130980961926274179+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'Go',
  p_prompt=>'Обновить',
  p_source=>'Go',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139550001035324102 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>130982856248274358 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 22,
  p_name=>'P22_LOW_DT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 45,
  p_item_plug_id => 130980961926274179+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'SYSDATE-30',
  p_item_default_type=> 'PLSQL_EXPRESSION',
  p_prompt=>'Дата начала',
  p_format_mask=>'DD.MM.YYYY',
  p_source=>'SYSDATE-30',
  p_source_type=> 'FUNCTION',
  p_display_as=> 'NATIVE_DATE_PICKER_CLASSIC',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 30,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565601579324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 22
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00024
prompt  ...PAGE 24: Update 
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 24
 ,p_tab_set => 'TS1'
 ,p_name => 'Update '
 ,p_step_title => 'Update '
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'ON'
 ,p_html_page_header => 
'<script language="javascript" type="text/javascript">'||unistr('\000a')||
'function addRowTop() {'||unistr('\000a')||
'  addRow();'||unistr('\000a')||
'  apex.jQuery(gTabForm).find(".highlight-row").last().insertBefore('||unistr('\000a')||
'     apex.jQuery(gTabForm).find(".highlight-row").first());'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'function addTop()'||unistr('\000a')||
'{'||unistr('\000a')||
'  addRow();'||unistr('\000a')||
' '||unistr('\000a')||
'  var mytable=document.getElementById("report_TABUPD");'||unistr('\000a')||
'  mytable.moveRow(mytable.rows.length-1,1) // depending on the report template selected us'||
'e either length-2 or length-1'||unistr('\000a')||
'}'||unistr('\000a')||
'</script>'
 ,p_javascript_code => 
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'MARIELLE_ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20120626172443'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select '||unistr('\000a')||
'"ID",'||unistr('\000a')||
'"ID" ID_DISPLAY,'||unistr('\000a')||
'"TR_DATE",'||unistr('\000a')||
'"SRC_ID",'||unistr('\000a')||
'"DEST_ID",'||unistr('\000a')||
'"AMOUNT",'||unistr('\000a')||
'"CURRENCY_ID",'||unistr('\000a')||
'"CURR_RATE_ID"'||unistr('\000a')||
'from "#OWNER#"."BALANCE_TRANSFER"'||unistr('\000a')||
'';

wwv_flow_api.create_report_region (
  p_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 24,
  p_name=> 'Tabular Form',
  p_region_name=>'TABUPD',
  p_template=> 139550225870324103+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 15,
  p_include_in_reg_disp_sel_yn=> 'Y',
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'UPDATABLE_SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 139563714492324164+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '10',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> '(null)',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No data found.',
  p_query_num_rows_type=> 'ROW_RANGES_IN_SELECT_LIST',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_query_asc_image=> 'apex/builder/dup.gif',
  p_query_asc_image_attr=> 'width="16" height="16" alt="" ',
  p_query_desc_image=> 'apex/builder/ddown.gif',
  p_query_desc_image_attr=> 'width="16" height="16" alt="" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133725522327730771 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'CHECK$01',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Select Row',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'CHECKBOX',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_derived_column=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s:=s||'FINANCE_OPERATIONS_SEQ';

wwv_flow_api.create_report_columns (
  p_id=> 133718900376730671 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'ID',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'HIDDEN',
  p_column_width=> '16',
  p_is_required=> false,
  p_pk_col_source_type=> 'S',
  p_pk_col_source=> s,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133719020794730675 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'ID_DISPLAY',
  p_column_display_sequence=> 3,
  p_column_heading=> 'Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'ESCAPE_SC',
  p_column_width=> '16',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'ID_DISPLAY',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133719106977730676 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'TR_DATE',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Tr Date',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'DATE_PICKER',
  p_column_width=> '12',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'TR_DATE',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133719220911730676 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'SRC_ID',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Src Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'SRC_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133719312525730676 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'DEST_ID',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Dest Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'DEST_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133719407444730676 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 7,
  p_form_element_id=> null,
  p_column_alias=> 'AMOUNT',
  p_column_display_sequence=> 7,
  p_column_heading=> 'Amount',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'AMOUNT',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133719525990730676 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 8,
  p_form_element_id=> null,
  p_column_alias=> 'CURRENCY_ID',
  p_column_display_sequence=> 8,
  p_column_heading=> 'Currency Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'CURRENCY_ID',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 133721601513730676 + wwv_flow_api.g_id_offset,
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 9,
  p_form_element_id=> null,
  p_column_alias=> 'CURR_RATE_ID',
  p_column_display_sequence=> 9,
  p_column_heading=> 'Curr Rate Id',
  p_column_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'TEXT',
  p_column_width=> '16',
  p_is_required=> false,
  p_ref_schema=> 'MARIELLE',
  p_ref_table_name=> 'BALANCE_TRANSFER',
  p_ref_column_name=> 'CURR_RATE_ID',
  p_column_comment=>'');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 133722032512730711 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 24,
  p_button_sequence=> 40,
  p_button_plug_id => 133718632683730613+wwv_flow_api.g_id_offset,
  p_button_name    => 'ADD',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Add Row',
  p_button_position=> 'BOTTOM',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:addRow();',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 133721805855730711 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 24,
  p_button_sequence=> 30,
  p_button_plug_id => 133718632683730613+wwv_flow_api.g_id_offset,
  p_button_name    => 'SUBMIT',
  p_button_action  => 'SUBMIT',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Submit',
  p_button_position=> 'REGION_TEMPLATE_CHANGE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> '',
  p_button_execute_validations=>'Y',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 133721708344730711 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 24,
  p_button_sequence=> 10,
  p_button_plug_id => 133718632683730613+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_PAGE',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 133721917631730711 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 24,
  p_button_sequence=> 20,
  p_button_plug_id => 133718632683730613+wwv_flow_api.g_id_offset,
  p_button_name    => 'MULTI_ROW_DELETE',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(139549412510324095+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Delete',
  p_button_position=> 'REGION_TEMPLATE_DELETE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');',
  p_button_execute_validations=>'N',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>133725618972730771 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 24,
  p_branch_action=> 'f?p=&APP_ID.:24:&SESSION.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133722820487730735 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'TR_DATE not null',
  p_validation_sequence=> 30,
  p_validation => 'TR_DATE',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'TR_DATE',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133723013203730739 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'TR_DATE must be a valid date',
  p_validation_sequence=> 30,
  p_validation => 'TR_DATE',
  p_validation_type => 'ITEM_IS_DATE',
  p_error_message => '#COLUMN_HEADER# must be a valid date.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'TR_DATE',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133723201556730739 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'SRC_ID not null',
  p_validation_sequence=> 40,
  p_validation => 'SRC_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'SRC_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133723416672730739 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'SRC_ID must be numeric',
  p_validation_sequence=> 40,
  p_validation => 'SRC_ID',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#COLUMN_HEADER# must be numeric.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'SRC_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133723624126730740 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'DEST_ID not null',
  p_validation_sequence=> 50,
  p_validation => 'DEST_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'DEST_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133723816729730745 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'DEST_ID must be numeric',
  p_validation_sequence=> 50,
  p_validation => 'DEST_ID',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#COLUMN_HEADER# must be numeric.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'DEST_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133724008300730745 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'AMOUNT not null',
  p_validation_sequence=> 60,
  p_validation => 'AMOUNT',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'AMOUNT',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133724217889730745 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'AMOUNT must be numeric',
  p_validation_sequence=> 60,
  p_validation => 'AMOUNT',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#COLUMN_HEADER# must be numeric.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'AMOUNT',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133724420884730746 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'CURRENCY_ID not null',
  p_validation_sequence=> 70,
  p_validation => 'CURRENCY_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'CURRENCY_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133724620503730746 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'CURRENCY_ID must be numeric',
  p_validation_sequence=> 70,
  p_validation => 'CURRENCY_ID',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#COLUMN_HEADER# must be numeric.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'CURRENCY_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133724800678730747 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'CURR_RATE_ID not null',
  p_validation_sequence=> 80,
  p_validation => 'CURR_RATE_ID',
  p_validation_type => 'ITEM_NOT_NULL',
  p_error_message => '#COLUMN_HEADER# must have a value.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'CURR_RATE_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 133725013431730747 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_tabular_form_region_id => 133718632683730613 + wwv_flow_api.g_id_offset,
  p_validation_name => 'CURR_RATE_ID must be numeric',
  p_validation_sequence=> 80,
  p_validation => 'CURR_RATE_ID',
  p_validation_type => 'ITEM_IS_NUMERIC',
  p_error_message => '#COLUMN_HEADER# must be numeric.',
  p_when_button_pressed=> 133721805855730711 + wwv_flow_api.g_id_offset,
  p_exec_cond_for_each_row=> 'N',
  p_only_for_changed_rows=> 'Y',
  p_associated_column=> 'CURR_RATE_ID',
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE_TRANSFER:ID';

wwv_flow_api.create_page_process(
  p_id     => 133725108400730747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_UPDATE',
  p_process_name=> 'ApplyMRU',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when_button_id=>133721805855730711 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '#MRU_COUNT# row(s) updated, #MRI_COUNT# row(s) inserted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'#OWNER#:BALANCE_TRANSFER:ID';

wwv_flow_api.create_page_process(
  p_id     => 133725307223730758 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 24,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_region_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_process_type=> 'MULTI_ROW_DELETE',
  p_process_name=> 'ApplyMRD',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'INLINE_IN_NOTIFICATION',
  p_process_when=>'MULTI_ROW_DELETE',
  p_process_when_type=>'REQUEST_EQUALS_CONDITION',
  p_process_success_message=> '#MRD_COUNT# row(s) deleted.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 24
--
 
begin
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133726416289838966 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 1,
  p_query_column_name=> 'ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133726516599838973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 2,
  p_query_column_name=> 'ID_DISPLAY',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133726632402838973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 3,
  p_query_column_name=> 'TR_DATE',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133726725615838973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 4,
  p_query_column_name=> 'SRC_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133726805327838973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 5,
  p_query_column_name=> 'DEST_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133726901849838973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 6,
  p_query_column_name=> 'AMOUNT',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133727008500838973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 7,
  p_query_column_name=> 'CURRENCY_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
wwv_flow_api.create_region_rpt_cols (
  p_id     => 133727117316838973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_plug_id=> 133718632683730613 + wwv_flow_api.g_id_offset,
  p_column_sequence=> 8,
  p_query_column_name=> 'CURR_RATE_ID',
  p_display_as=> 'TEXT',
  p_column_comment=> '');
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00101
prompt  ...PAGE 101: Login
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 101
 ,p_name => 'Login'
 ,p_alias => 'LOGIN'
 ,p_step_title => 'Login'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_step_template => 139546806376324064 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'N'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20130802175739'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 122291172835336786 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 101,
  p_plug_name=> 'Login',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 139553223889324117+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122291353672336812 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_USERNAME',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 122291172835336786+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'User',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 40,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565703798324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122291569061336818 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_PASSWORD',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 122291172835336786+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Pass',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 10,
  p_cMaxlength=> 40,
  p_cHeight=> 1,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 139565703798324175+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>122291771137336818 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 101,
  p_name=>'P101_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 122291172835336786+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'LOGIN',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(139549412510324095 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_button_execute_validations=>'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'owa_util.mime_header(''text/html'', FALSE);'||unistr('\000a')||
'owa_cookie.send('||unistr('\000a')||
'    name=>''LOGIN_USERNAME_COOKIE'','||unistr('\000a')||
'    value=>lower(:P101_USERNAME));'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 122292161475336828 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'wwv_flow_custom_auth_std.login('||unistr('\000a')||
'    P_UNAME       => :P101_USERNAME,'||unistr('\000a')||
'    P_PASSWORD    => :P101_PASSWORD,'||unistr('\000a')||
'    P_SESSION_ID  => v(''APP_SESSION''),'||unistr('\000a')||
'    P_FLOW_PAGE   => :APP_ID||'':1'''||unistr('\000a')||
'    );';

wwv_flow_api.create_page_process(
  p_id     => 122291966654336822 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'101';

wwv_flow_api.create_page_process(
  p_id     => 122292557483336829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'    v varchar2(255) := null;'||unistr('\000a')||
'    c owa_cookie.cookie;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');'||unistr('\000a')||
'   :P101_USERNAME := c.vals(1);'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 122292357960336829 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 101,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 101
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/отчеты
 
begin
 
wwv_flow_api.create_list (
  p_id=> 122290442055336772 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Отчеты',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT',
  p_display_row_template_id=> 139560732148324150 + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_list_item (
  p_id=> 122311548533337668 + wwv_flow_api.g_id_offset,
  p_list_id=> 122290442055336772 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'By accounts',
  p_list_item_link_target=> 'f?p=&APP_ID.:10:&SESSION.:REPORT_ACCOUNTTREE:&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'PLSQL_EXPRESSION',
  p_list_item_current_for_pages=> 'apex_application.g_request=''REPORT_ACCOUNTTREE''',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 122311270948337668 + wwv_flow_api.g_id_offset,
  p_list_id=> 122290442055336772 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'By days and direction',
  p_list_item_link_target=> 'f?p=&APP_ID.:10:&SESSION.:REPORT_DAILY:&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'PLSQL_EXPRESSION',
  p_list_item_current_for_pages=> 'apex_application.g_request = ''REPORT_DAILY''',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/графики_и_диаграммы
 
begin
 
wwv_flow_api.create_list (
  p_id=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Графики и диаграммы',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT',
  p_display_row_template_id=> 139560732148324150 + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_list_item (
  p_id=> 122312073595337668 + wwv_flow_api.g_id_offset,
  p_list_id=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> 'Соотношение д/р',
  p_list_item_link_target=> 'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '7',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 122312353072337670 + wwv_flow_api.g_id_offset,
  p_list_id=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> 'Динамика',
  p_list_item_link_target=> 'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '9',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 122312672191337670 + wwv_flow_api.g_id_offset,
  p_list_id=> 122290564939336772 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>30,
  p_list_item_link_text=> 'Структура расходов',
  p_list_item_link_target=> 'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_current_for_pages=> '11',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/lists/dictionaries
 
begin
 
wwv_flow_api.create_list (
  p_id=> 130844242597773500 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dictionaries',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT',
  p_display_row_template_id=> 139558003533324138 + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_list_item (
  p_id=> 130846273418782351 + wwv_flow_api.g_id_offset,
  p_list_id=> 130844242597773500 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>2,
  p_list_item_link_text=> 'Статьи',
  p_list_item_link_target=> 'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:::',
  p_list_item_icon=> 'menu/books_64.gif',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 130846456234786912 + wwv_flow_api.g_id_offset,
  p_list_id=> 130844242597773500 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>4,
  p_list_item_link_text=> 'Контрагенты',
  p_list_item_link_target=> 'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::',
  p_list_item_icon=> 'menu/users_64.gif',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 130848243552792698 + wwv_flow_api.g_id_offset,
  p_list_id=> 130844242597773500 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>6,
  p_list_item_link_text=> 'Валюты',
  p_list_item_link_target=> 'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::',
  p_list_item_icon=> 'menu/law_wbg_64x64.png',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 130850266062799175 + wwv_flow_api.g_id_offset,
  p_list_id=> 130844242597773500 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>8,
  p_list_item_link_text=> 'Счета учета',
  p_list_item_link_target=> 'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::',
  p_list_item_icon=> 'menu/pin_64.gif',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
 
begin
 
wwv_flow_api.create_menu (
  p_id=> 122290373555336772 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'FINANCE_OPERATIONS Breadcrumb');
 
wwv_flow_api.create_menu_option (
  p_id=>122320060147337714 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Transactions',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::',
  p_page_id=>1,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>127844161234078792 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>130792858886867159 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Статьи',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::',
  p_page_id=>12,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>127940448622089317 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>122320060147337714 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Edit transfer',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::',
  p_page_id=>14,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130754249047484809 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Переводы табл',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::',
  p_page_id=>15,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130758469690534409 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>130792858886867159 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Валюты',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::',
  p_page_id=>18,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130758560780534409 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>130758469690534409 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Курсы',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::',
  p_page_id=>19,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130792858886867159 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Справочники',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:20:&SESSION.',
  p_page_id=>20,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130809672033932590 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>130792858886867159 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Контрагенты',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:16:&SESSION.',
  p_page_id=>16,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130821645819999404 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>130792858886867159 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Счета учета',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:17:&SESSION.',
  p_page_id=>17,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130906565132242476 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>10,
  p_short_name=>'Учет остатков',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:21:&SESSION.',
  p_page_id=>21,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>130980858900268018 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>130906565132242476 + wwv_flow_api.g_id_offset,
  p_option_sequence=>10,
  p_short_name=>'Сверка остатков',
  p_long_name=>'',
  p_link=>'f?p=&FLOW_ID.:22:&SESSION.',
  p_page_id=>22,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_menu_option (
  p_id=>122320158012337714 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>122320060147337714 + wwv_flow_api.g_id_offset,
  p_option_sequence=>20,
  p_short_name=>'Insert Operation',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:2:&SESSION.',
  p_page_id=>2,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>122320369981337714 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>122320060147337714 + wwv_flow_api.g_id_offset,
  p_option_sequence=>40,
  p_short_name=>'Success',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:4:&SESSION.',
  p_page_id=>4,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>122320464035337714 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>0,
  p_option_sequence=>50,
  p_short_name=>'Analysis',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::',
  p_page_id=>5,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>122322944193337723 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>122320464035337714 + wwv_flow_api.g_id_offset,
  p_option_sequence=>80,
  p_short_name=>'Reports',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::',
  p_page_id=>10,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>122323367589337725 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>122320464035337714 + wwv_flow_api.g_id_offset,
  p_option_sequence=>90,
  p_short_name=>'By Направление платежа',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:7:&SESSION.',
  p_page_id=>7,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>122323742367337725 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>122320464035337714 + wwv_flow_api.g_id_offset,
  p_option_sequence=>100,
  p_short_name=>'By Дата платежа',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:9:&SESSION.',
  p_page_id=>9,
  p_also_current_for_pages=> '');
 
wwv_flow_api.create_menu_option (
  p_id=>122324151998337725 + wwv_flow_api.g_id_offset,
  p_menu_id=>122290373555336772 + wwv_flow_api.g_id_offset,
  p_parent_id=>122320464035337714 + wwv_flow_api.g_id_offset,
  p_option_sequence=>110,
  p_short_name=>'By Статья',
  p_long_name=>'',
  p_link=>'f?p=&APP_ID.:11:&SESSION.',
  p_page_id=>11,
  p_also_current_for_pages=> '');
 
null;
 
end;
/

prompt  ...page templates for application: 172
--
--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 122269464615336678
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><br /></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top" class="t1Logo">#LOGO#</td>'||unistr('\000a')||
'    <td align="right" valign="top"><br /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarMiddle"><br /></td>'||unistr('\000a')||
' ';

c3:=c3||'   <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table class="t1PageBody" cellpadding="0" cellspacing="0" border="0" summary="" width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1PageCenter" valign="top"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" class="t1PageBody"><div class="t1messages">';

c3:=c3||'#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_03##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'';

wwv_flow_api.create_template(
  p_id=> 122269464615336678 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0"',
  p_theme_id  => 1,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '18');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs
prompt  ......Page template 122269765229336690
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||unistr('\000a')||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||unistr('\000a')||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img sr';

c3:=c3||'c="#IMAGE_PREFIX#themes/theme_1/top_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarMiddle"><br />#REGION_POSITION_01#</td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table class="t1PageBody" cellpadding="0" cellspacing="0" border="0" summary="" width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1PageCenter" valign="top"><table summary="" cellpa';

c3:=c3||'dding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'';

wwv_flow_api.create_template(
  p_id=> 122269765229336690 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1Notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_with_side_bar
prompt  ......Page template 122270068638336692
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||unistr('\000a')||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||unistr('\000a')||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'  ';

c3:=c3||'  <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_far_left.png" alt="" /></td>'||unistr('\000a')||
'    <td align="right" class="t1topbarLeft" colspan="2"  valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_1.png" alt="" /></td>'||unistr('\000a')||
'    <td align="right" class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_2.png" alt="" /></td>'||unistr('\000a')||
'    <td cla';

c3:=c3||'ss="t1topbarMiddle" valign="top"><table height="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="20"><br /></td></tr><tr><td valign="bottom" height="20">#REGION_POSITION_01#</td></tr></table></td>'||unistr('\000a')||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="t1PageLeft" colspan="3" align="left" valign="top">#R';

c3:=c3||'EGION_POSITION_02#</td>'||unistr('\000a')||
'    <td><br /></td>'||unistr('\000a')||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_';

c3:=c3||'03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 122270068638336692 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 17,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 122270342200336693
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||unistr('\000a')||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||unistr('\000a')||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarMiddle" valign="bottom"><table cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="';

c3:=c3||'50%"><br /></td></tr><tr><td height="50%">#REGION_POSITION_01#</td></tr></table></td>'||unistr('\000a')||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><br /></td>'||unistr('\000a')||
'<td class="t1PageCenter" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" class="t1PageBody';

c3:=c3||'"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 122270342200336693 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>'||unistr('\000a')||
''||unistr('\000a')||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>'||unistr('\000a')||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '12');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_with_side_bar
prompt  ......Page template 122270661817336695
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||unistr('\000a')||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||unistr('\000a')||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_far_left.png" alt="" /></td>'||unistr('\000a')||
'    <td align="right" class="t1topbarLeft" colspan="2"  valign="top"><img src="#IMAGE_PREFIX#themes';

c3:=c3||'/theme_1/top_barleft2_1.png" alt="" /></td>'||unistr('\000a')||
'    <td align="right" class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_2.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarMiddle" valign="top"><table height="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="20"><br /></td></tr><tr><td valign="bottom" height="20">#REGION_POSITION_01#</td></tr></tab';

c3:=c3||'le></td>'||unistr('\000a')||
'    <td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="t1PageLeft" colspan="3" align="left" valign="top">#REGION_POSITION_02#</td>'||unistr('\000a')||
'    <td><br /></td>'||unistr('\000a')||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign=';

c3:=c3||'"top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 122270661817336695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>'||unistr('\000a')||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>'||unistr('\000a')||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 16,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 122270950217336695
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top"><div class="t1messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 122270950217336695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 122271253163336695
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top">'||unistr('\000a')||
'<div style="border:1px solid black;">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 122271253163336695 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 122271542298336697
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||unistr('\000a')||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||unistr('\000a')||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#PARENT_TAB_CELLS#</tr></table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td align="right" class="t1topbarLeft"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_left2.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarMiddle" valign="top"><table border="0" cellpadding="0" cellspacing="0" ';

c3:=c3||'summary=""><tr><td height="20">#TAB_CELLS#</td></tr><tr><td height="20">#REGION_POSITION_01#</td></tr></table></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><br /></td>'||unistr('\000a')||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" vali';

c3:=c3||'gn="top" class="t1PageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 122271542298336697 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<span class="t1ChildTab">[&nbsp;#TAB_LABEL#&nbsp;]</span>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<a href="#TAB_LINK#" class="t1ChildTab">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_with_side_bar
prompt  ......Page template 122271852971336697
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/theme_1/bot_bar_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1user">&APP_USER.</div></td>'||unistr('\000a')||
'    <td class="t1BotbarMiddle"><div id="t1copy"><!-- Copyright Here --><span class="t1Customize">#CUSTOMIZE#</span></div></td>'||unistr('\000a')||
'    <td><img src="#IMAGE_PREFIX#themes/th';

c2:=c2||'eme_1/bot_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br />'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td valign="top" class="t1Logo">#LOGO##REGION_POSITION_06#</td>'||unistr('\000a')||
'   <td valign="top" width="100%">#REGION_POSITION_07#</td>'||unistr('\000a')||
'    <td align="right" valign="top">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="" height="70%">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'  ';

c3:=c3||'  <td colspan="5" class="t1ParentTabHolder"><table border="0" cellpadding="0" cellspacing="0" summary="" align="right"><tr><td><br /></td>#PARENT_TAB_CELLS#</tr></table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_far_left.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarLeft" colspan="2"  valign="top"><img src="#IMAGE_PREFIX#themes/theme_';

c3:=c3||'1/top_barleft2_1.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarLeft" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_barleft2_2.png" alt="" /></td>'||unistr('\000a')||
'    <td class="t1topbarMiddle" valign="top"><table height="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td height="20">#TAB_CELLS#</td></tr><tr><td valign="bottom" height="20">#REGION_POSITION_01#</td></tr></table></td>'||unistr('\000a')||
'    <td';

c3:=c3||' valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/top_bar_right.png" alt="" /></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td class="t1PageLeft" colspan="3" align="left" valign="top">#REGION_POSITION_02#</td>'||unistr('\000a')||
'    <td><br /></td>'||unistr('\000a')||
'    <td class="t1PageRight" colspan="2" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" class="t1P';

c3:=c3||'ageBody"><div class="t1messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 122271852971336697 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<span class="t1ChildTab">[&nbsp;#TAB_LABEL#&nbsp;]</span>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<a href="#TAB_LINK#" class="t1ChildTab">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_on_right.png" border="0" alt="" /></td>',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_left.png" border="0" alt="" /></td>'||unistr('\000a')||
'<td class="t1ParentTabCenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/tab_off_right.png" border="0" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t1NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t1NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 1,
  p_theme_class_id => 18,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 139546806376324064
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||unistr('\000a')||
'</html>'||unistr('\000a')||
'';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top">>#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="50%" align="center">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top" class="t15ContentB';

c3:=c3||'ody" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0" align="center">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMid';

c3:=c3||'dle.png" alt="" /></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table></td></tr>'||unistr('\000a')||
'<td width="100%" valign="top" height="100%" id="t16PageBody" style="padding:4px;"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_03##REGION_POSITION_04#</td>'||unistr('\000a')||
'';

c3:=c3||'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="pageBottom"><table summary="" width="100%" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139546806376324064 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t16NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs
prompt  ......Page template 139547031797324084
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16UserPrompt"><br /></td>'||unistr('\000a')||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t16Break"/>'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary=""  width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16BreadCrumbRegion">#REGION_POSITION_01#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table><';

c3:=c3||'/td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top" height="100%">'||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Page';

c3:=c3||'TopCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td style="width:15px;"><br /';

c3:=c3||'></td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" border="0" class="pageBottom">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139547031797324084 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_error_page_template => '<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="" style="width:600px;">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"></th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">'||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button1" style="float: right">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Left.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><a href="#BACK_LINK#">#OK#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Right.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td>'||unistr('\000a')||
'  <p>#MESSAGE#</p>'||unistr('\000a')||
'  <strong>#ADDITIONAL_INFO#</strong>'||unistr('\000a')||
'  <br />'||unistr('\000a')||
'  <br />'||unistr('\000a')||
'  <div class="error_technical_info">#TECHNICAL_INFO#</div>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_with_sidebar
prompt  ......Page template 139547317700324085
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16UserPrompt"><br /></td>'||unistr('\000a')||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t16Break"/>'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary=""  width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16SideBarTitle" align="right"><img src="#IMAGE_PREFIX#themes/theme_16/left_sidebar_cap.png" alt="" /></td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="1" alt="" /></td>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src';

c3:=c3||'="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16SideBar" valign="top">#REGION_POSITION_02#</td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><br /></td>'||unistr('\000a')||
'<td valign="top" height="100%';

c3:=c3||'">'||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table';

c3:=c3||'>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td style="width:15px;"><br /></td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</';

c3:=c3||'table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16BottomRight"><br /></td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><br /></td>'||unistr('\000a')||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" class="pageBottom">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table';

c3:=c3||'></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139547317700324085 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 17,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 139547602857324086
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t16Break"/>'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary="" width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><div class="TabHolder">#TAB_CELLS#</div></td>'||unistr('\000a')||
'<td style="width:5px;"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>   '||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" height="8">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes';

c3:=c3||'/theme_16/breadcrumb_cap.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top" height="100%">'||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PR';

c3:=c3||'EFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="';

c3:=c3||'100%" valign="top" height="100%"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" border="0" class="pageBottom">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><img src="#IMAGE_PREFIX#t';

c3:=c3||'hemes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139547602857324086 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '| <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '12');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_with_sidebar
prompt  ......Page template 139547911157324088
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16UserPrompt"><br /></td>'||unistr('\000a')||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t16Break"/>'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpaddin';

c3:=c3||'g="0" cellspacing="0" summary="" width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td colspan="3">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><div class="TabHolder">#TAB_CELLS#</div></td>'||unistr('\000a')||
'<td style="width:5px;"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16SideBarTitle" align="right"><img src="#IMAGE_PREFIX#themes/theme_16/left_sidebar_cap.png" alt=';

c3:=c3||'"" /></td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="1" alt="" /></td>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||unistr('\000a')||
'<td><img src="#IMAGE';

c3:=c3||'_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16SideBar" valign="top">#REGION_POSITION_02#</td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><br /></td>'||unistr('\000a')||
'<td valign="top" height="100%">'||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt=""';

c3:=c3||' /></td>'||unistr('\000a')||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top" height="100%"><div class="t16me';

c3:=c3||'ssages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td style="width:15px;"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="400" width="1" alt="" /><br /></td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16BottomRight"><br /></td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><br /></td>'||unistr('\000a')||
'<td><ta';

c3:=c3||'ble summary="" width="100%" cellpadding="0" cellspacing="0" border="0" class="pageBottom">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="400" alt="" />'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</t';

c3:=c3||'r>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139547911157324088 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '| <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 16,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 139548203446324089
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD# class="popup">#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top"><div class="t16messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139548203446324089 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t16NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 139548503480324089
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top"><div class="t16messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139548503480324089 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t16NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 139548801963324092
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16UserPrompt"><br /></td>'||unistr('\000a')||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t16Break"/>'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="TabHolder">#PARE';

c3:=c3||'NT_TAB_CELLS#</div>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" height="70%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" class="t16SubTab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'#TAB_CELLS#<td width="100%"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFI';

c3:=c3||'X#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top" height="100%">'||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||unistr('\000a')||
'<tr><td><img src="#';

c3:=c3||'IMAGE_PREFIX#themes/theme_16/t16PageTopCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td';

c3:=c3||' width="100%" valign="top" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td style="width:15px;"><br /></td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table summary="" width="100%" cellpadding="0" cellspacing="0" class';

c3:=c3||'="pageBottom">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139548801963324092 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>#TAB_INLINE_EDIT#',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>#TAB_INLINE_EDIT#',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '8');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_with_sidebar
prompt  ......Page template 139549103590324094
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />'||unistr('\000a')||
'<!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/ie.css" type="text/css" /><![endif]-->'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table border="0" cellpadding="0" cellspacing="0" summary="" id="t16PageFooter" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16UserPrompt"><br /></td>'||unistr('\000a')||
'<td class="t16Copyright"><!-- Copyright --><span class="t16Customize">#CUSTOMIZE#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<br class="t16Break"/>'||unistr('\000a')||
'#REGION_POSITION_05#'||unistr('\000a')||
'#FORM_CLOSE# '||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<table border="0" cellpadding="0" cellspacing="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><div class="t16Logo">#LOGO#</div>#REGION_POSITION_06#</td>'||unistr('\000a')||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||unistr('\000a')||
'<td valign="top"><div class="t16NavigationBar"><span class="t16NavigationBar">(&APP_USER.)</span>#NAVIGATION_BAR#</div>#REGION_POSITION_08#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<div class="TabHolder">#PARE';

c3:=c3||'NT_TAB_CELLS#</div>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" height="70%">'||unistr('\000a')||
''||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td colspan="3">'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0" summary=""  width="100%" class="t16SubTab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'#TAB_CELLS#<td width="100%"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
''||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16SideBarTitle" align="right"><img src="#IMAGE_PREFIX#themes/theme_16/left_sidebar_c';

c3:=c3||'ap.png" alt="" /></td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif" height="1" width="1" alt="" /></td>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" width="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16BreadCrumbRegion" valign="middle">#REGION_POSITION_01#</td>'||unistr('\000a')||
'<td><img';

c3:=c3||' src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_cap_right.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16SideBar" valign="top"><div class="t16Tabs">#REGION_POSITION_02#</td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><br /></td>'||unistr('\000a')||
'<td valign="top" height="100%">'||unistr('\000a')||
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t16PageCap">'||unistr('\000a')||
'<tr><td><img src="#IMAGE_PREFIX#themes/theme';

c3:=c3||'_16/t16PageTopCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td width="100%" class="t16PageTopMiddle"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapMiddle.png" alt="" /></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16PageTopCapRight.png" alt="" /></td></tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table summary="" cellpadding="0" width="100%" height="100%" cellspacing="0" border="0" id="t16PageBody">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td width="100%" valign="top';

c3:=c3||'" height="100%" class="t16ContentBody"><div class="t16messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||unistr('\000a')||
'<td style="width:15px;"><br /></td>'||unistr('\000a')||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16BottomRight"><br /></td>'||unistr('\000a')||
'<td class="t16NavBodySpace"><br /></td>'||unistr('\000a')||
'<td><table summary="" width="100%" cel';

c3:=c3||'lpadding="0" cellspacing="0" class="pageBottom">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td align="left"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapLeft.png" alt="" /></td>'||unistr('\000a')||
'<td align="right"><img src="#IMAGE_PREFIX#themes/theme_16/t16PageBotCapRight.png" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_template(
  p_id=> 139549103590324094 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Sidebar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t16success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td class="M" valign="middle"><span>#TAB_LABEL#</span>#TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||unistr('\000a')||
'',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><span>#TAB_LABEL#</span></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Tab-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Tab">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-1.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'<td class="MC" valign="middle"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16TabC-1-4.gif" width="8" height="22" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>#TAB_INLINE_EDIT#',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t16notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> ' | <a href="#LINK#" class="t16NavigationBar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 16,
  p_theme_class_id => 18,
  p_translate_this_template => 'N',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 122272164736336697
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 122272164736336697 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<table class="t1Button" cellspacing="0" cellpadding="0" border="0"  summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_left.gif" alt="" width="4" height="24" /></a></td>'||unistr('\000a')||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||unistr('\000a')||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_right.gif" width="4" height="24" alt="" /></a></td>'||unistr('\000a')||
'</tr'||
'>'||unistr('\000a')||
'</table>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_theme_id => 1
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_1
prompt  ......Button Template 122272342260336701
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 122272342260336701 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 1'
 ,p_template => 
'<table class="t1ButtonAlternative1" cellspacing="0" cellpadding="0" border="0"  summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt1_left.gif" alt="" width="11" height="20" /></a></td>'||unistr('\000a')||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||unistr('\000a')||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt1_right.gif" width="11" height="20"'||
' alt="" /></a></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 4
 ,p_theme_id => 1
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_2
prompt  ......Button Template 122272552146336701
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 122272552146336701 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 2'
 ,p_template => 
'<table class="t1ButtonAlternative2" cellspacing="0" cellpadding="0" border="0"  summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt2_left.gif" alt="" width="11" height="20" /></a></td>'||unistr('\000a')||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||unistr('\000a')||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt2_right.gif" width="11" height="20"'||
' alt="" /></a></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'XP Square FFFFFF'
 ,p_theme_id => 1
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_3
prompt  ......Button Template 122272742753336701
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 122272742753336701 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 3'
 ,p_template => 
'<table class="t1ButtonAlternative3" cellspacing="0" cellpadding="0" border="0"  summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt3_left.gif" alt="" width="6" height="25" /></a></td>'||unistr('\000a')||
'<td class="t1C"><a href="#LINK#">#LABEL#</a></td>'||unistr('\000a')||
'<td class="t1R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_1/button_alt3_right.gif" width="6" height="25" a'||
'lt="" /></a></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 2
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 1
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 139549412510324095
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 139549412510324095 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Left.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><a href="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Right.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tab'||
'le>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 1
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 16
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_1
prompt  ......Button Template 139549603525324101
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 139549603525324101 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 1'
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button1">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Left.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><a href="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Right.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</'||
'table>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 4
 ,p_template_comment => 'XP Square FFFFFF'
 ,p_theme_id => 16
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_2
prompt  ......Button Template 139549818457324102
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 139549818457324102 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 2'
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button2">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button2Left.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><a href="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button2Right.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</ta'||
'ble>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 5
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 16
  );
null;
 
end;
/

--application/shared_components/user_interface/templates/button/button_alternative_3
prompt  ......Button Template 139550001035324102
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 139550001035324102 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button, Alternative 3'
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button3">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button3Left.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><a href="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#">#LABEL#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button3Right.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</ta'||
'ble>'
 ,p_translate_this_template => 'N'
 ,p_theme_class_id => 2
 ,p_template_comment => 'Standard Button'
 ,p_theme_id => 16
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 122272970724336701
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122272970724336701 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1BorderlessRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##COPY##CREATE##CREATE2##EXPAND##HELP#</td>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Borderless Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 7
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content without a border.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122272970724336701 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 122273269516336709
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122273269516336709 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1BracketedRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##COPY##CREATE##CREATE2##EXPAND##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" wi'||
'dth="100%">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||unistr('\000a')||
'<td rowspan="3" class="t1Body">#BODY#</td>'||unistr('\000a')||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" height="1" width="1" alt="" /></td>'||unistr('\000a')||
'<td><img sr'||
'c="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" height="1" width="1" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||unistr('\000a')||
'<td class="t1bracket"><img src="" height="5" width="1" alt="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Bracketed Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 18
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template when you want to contain content with a bracket UI.'||unistr('\000a')||
''||unistr('\000a')||
'TITLE=YES'||unistr('\000a')||
'BUTTONS=YES'||unistr('\000a')||
'100% WIDTH=NO'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122273269516336709 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 122273565747336709
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122273565747336709 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<div class="t1BreadcrumbRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'Breadcrumb Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 6
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122273565747336709 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 122273843586336711
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122273843586336711 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ButtonRegionwithTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr><td class="t1RegionHeader">#TITLE#</td></tr>'||unistr('\000a')||
'<tr><td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##COPY##EXPAND##HELP#<img src="#IMAGE_PREFIX#/themes/theme_1/1px_trans.gif" height="1" width="600" styl'||
'e="display:block;" alt="" /></td></tr>'||unistr('\000a')||
'</table>#BODY#'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Button Region with Title'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 4
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122273843586336711 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 122274154141336711
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122274154141336711 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ButtonRegionwithoutTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr><td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#<img src="#IMAGE_PREFIX#/themes/theme_1/1px_trans.gif" height="1" width="600" style="display:block;" alt="" /></td></tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'#BODY#'
 ,p_page_plug_template_name => 'Button Region without Title'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 17
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122274154141336711 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 122274450976336711
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122274450976336711 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ListRegionwithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr><t'||
'd valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/chart.gif" alt=""/></td>'||unistr('\000a')||
'<td>#BODY#</td></tr></table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Chart List'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 1
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122274450976336711 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 122274760438336712
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122274760438336712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ChartRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<t'||
'd class="t1Body">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Chart Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 1
 ,p_theme_class_id => 30
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122274760438336712 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 122275072184336712
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122275072184336712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1FormRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_1/1px_trans.gif" height="1" width="400" alt="" /><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVI'||
'OUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body">#BODY#<img src="#IMAGE_PREFIX#/themes/theme_1/1px_trans.gif" height="1" width="600" style="display:block;" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Form Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 1
 ,p_theme_class_id => 8
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122275072184336712 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 122275356631336712
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122275356631336712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1HideandShowRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#<a style="margin-left:5px;" href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_1/ro'||
'llup_plus_dgray.gif'',''#IMAGE_PREFIX#themes/theme_1/rollup_minus_dgray.gif'');" class="t1HideandShowRegionLink"><img src="#IMAGE_PREFIX#themes/theme_1/rollup_plus_dgray.gif" '||unistr('\000a')||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body"><div class="t1H'||
'ide" id="region#REGION_SEQUENCE_ID#">#BODY#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Hide and Show Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 1
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Gray Head, white body'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122275356631336712 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 122275647955336712
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122275647955336712 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<div class="t1NavigationRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'Navigation Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 5
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122275647955336712 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 122275967107336714
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122275967107336714 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1NavigationRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Navigation Region, Alternative 1'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 16
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122275967107336714 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_titles
prompt  ......region template 122276247592336714
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122276247592336714 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table summary="" cellpadding="0" cellspacing="0" border="0" class="t1RegionwithoutButtonsandTitles" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Region without Buttons and Titles'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 19
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122276247592336714 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 122276565931336714
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122276565931336714 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1RegionwithoutTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Region without Title'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 11
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122276565931336714 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row
prompt  ......region template 122276856061336715
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122276856061336715 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_f'||
'ind.png" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>'||unistr('\000a')||
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>'||unistr('\000a')||
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="'||
'apex_finderbar_left_middle"><br /></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Report Filter - Single Row'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 31
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122276856061336715 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 122277165887336715
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122277165887336715 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ListRegionwithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr>'||unistr('\000a')||
'<'||
'td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/report.gif" alt=""/></td>'||unistr('\000a')||
'<td>#BODY#</td></tr></table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Report List'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 1
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122277165887336715 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 122277473043336715
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122277473043336715 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Reports Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 1
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122277473043336715 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 122277763020336715
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122277763020336715 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ReportsRegion100Width" width="100%" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Reports Region 100% Width'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 1
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122277763020336715 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 122278073062336715
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122278073062336715 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ReportsRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Reports Region, Alternative 1'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 1
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122278073062336715 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 122278346262336715
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122278346262336715 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellspacing="0" cellpadding="0" border="0" class="t1SidebarRegion" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# align="right">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/left_curve.gif" width="10" height="20" alt="" /></td>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/right_cur'||
've.gif" width="10" height="20" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td colspan="3" class="t1Body">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table><br />'
 ,p_page_plug_template_name => 'Sidebar Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 1
 ,p_theme_class_id => 2
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => '<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#FF0000" height="16">'||unistr('\000a')||
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td align=middle valign="top">'||unistr('\000a')||
'                  <div align="center">'||unistr('\000a')||
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">'||unistr('\000a')||
'                      <b>#TITLE# </b></font></div>'||unistr('\000a')||
'                </td>'||unistr('\000a')||
'              </tr>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'   <tr>'||unistr('\000a')||
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />'||unistr('\000a')||
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">'||unistr('\000a')||
'              <tr>'||unistr('\000a')||
'                <td colspan="2">'||unistr('\000a')||
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">'||unistr('\000a')||
'                    <tr>'||unistr('\000a')||
'                      <td>&nbsp;</td>'||unistr('\000a')||
'                      <td valign="top" width="106">'||unistr('\000a')||
'                        <P><FONT face="arial, helvetica" size="1">'||unistr('\000a')||
'                            #BODY#'||unistr('\000a')||
'                           </font>'||unistr('\000a')||
'                        </P>'||unistr('\000a')||
'                      </td>'||unistr('\000a')||
'                    </tr>'||unistr('\000a')||
'                  </table>'||unistr('\000a')||
'            </table>'||unistr('\000a')||
'          </td>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'      </table>'||unistr('\000a')||
'      <table border="0" cellpadding="0" cellspacing="0">'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'        <tr>'||unistr('\000a')||
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>'||unistr('\000a')||
'        </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122278346262336715 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 122278660205336717
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122278660205336717 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellspacing="0" cellpadding="0" border="0" class="t1SidebarRegionAlternative1" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# align="right">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/left_curve.gif" width="10" height="20" alt="" /></td>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1EndCaps" valign="top"><img src="#IMAGE_PREFIX#themes/theme'||
'_1/right_curve.gif" width="10" height="20" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td colspan="3" class="t1Body">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table><br />'
 ,p_page_plug_template_name => 'Sidebar Region, Alternative 1'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 1
 ,p_theme_class_id => 3
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122278660205336717 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 122278948851336717
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122278948851336717 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1WizardRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Wizard Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 12
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122278948851336717 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 122279267742336717
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 122279267742336717 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t1WizardRegionwithIcon" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1RegionHeader">#TITLE#</td>'||unistr('\000a')||
'<td class="t1ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1Body" colspan="2"><table summary="" cellpadding="0" cellspacing="0" border="0">'||unistr('\000a')||
'<tr>'||
''||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_1/wizard_icon.gif" alt=""/></td>'||unistr('\000a')||
'<td width="100%" valign="top">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Wizard Region with Icon'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 1
 ,p_theme_class_id => 20
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 122279267742336717 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 139550225870324103
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139550225870324103 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<th align="left" style="text-align:left;">#TITLE#</th>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16Borderless">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</'||
'td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Borderless Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 16
 ,p_theme_class_id => 7
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139550225870324103 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 139550521396324109
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139550521396324109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="Toggle" align="middle" onclick="htmldb_T'||
'oggleTableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16Bracketed">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16ButtonHolder" colspan="3">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXP'||
'AND##COPY##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="t16RegionBody" colspan="3">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionBCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeaderB"><br /></th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionBCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<'||
'/tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Bracketed Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 18
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139550521396324109 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 139550805302324109
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139550805302324109 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
 ,p_page_plug_template_name => 'Breadcrumb Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 6
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139550805302324109 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 139551107237324110
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139551107237324110 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ButtonRegionWithTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<th class="t16RegionHeader">#TITLE#</th>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''||
'#BODY#'
 ,p_page_plug_template_name => 'Button Region with Title'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 4
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139551107237324110 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 139551413740324110
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139551413740324110 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16ButtonRegionWithoutTitle">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>#BODY#'
 ,p_page_plug_template_name => 'Button Region without Title'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 17
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139551413740324110 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 139551721739324114
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139551721739324114 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleT'||
'ableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16ChartIcon">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CRE'||
'ATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16RegionBody">#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16'||
'RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Chart List'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139551721739324114 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 139552020821324115
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139552020821324115 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleT'||
'ableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16ChartIcon">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CRE'||
'ATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="">#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRig'||
'ht.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Chart Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 30
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139552020821324115 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 139552308980324116
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139552308980324116 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" width="7" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="html'||
'db_ToggleTableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" width="7" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREA'||
'TE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td>#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" al'||
't=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Form Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 16
 ,p_theme_class_id => 8
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139552308980324116 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 139552628228324116
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139552628228324116 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_plus.gif" alt="Toggle" align="middle" onclick="htmldb_To'||
'ggleTableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" style="display:none;">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREAT'||
'E##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="RL"><br /></td><td class="t16RegionBody">#BODY#</td><td class="RR"><br /></td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t'||
'16RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Hide and Show Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 1
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139552628228324116 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 139552932574324117
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139552932574324117 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16NavigationRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="" width="210" style="table-layout:fixed;">'||unistr('\000a')||
'<col width="25" /><col width="185" />'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<th align="center" style="border-top:2px solid #839fcd;border-bottom:1px solid #275096;background-color:#4167a7;" colspan="2"><img src="#IMAGE_PREFIX#themes/theme_16/navbar_top.gif" o'||
'nclick="htmldb_ToggleWithImage(''t#REGION_ID#'',''body#REGION_ID#'')"" class="pb" /></th>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td style="background-color:#4167A7;"><img src="#IMAGE_PREFIX#themes/theme_16/sidebar_tab_minus.png" onclick="htmldb_ToggleWithImage(this,''body#REGION_ID#'')" id="t#REGION_ID#" class="pb" /></td>'||unistr('\000a')||
'<th width="100%" style="background-color:#4167A7;">#TITLE#</th>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>'||
'<br /></td>'||unistr('\000a')||
'<td class="t16RegionBody">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Navigation Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 5
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139552932574324117 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 139553223889324117
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139553223889324117 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16NavigationRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="" width="210" style="table-layout:fixed;">'||unistr('\000a')||
'<col width="25" /><col width="185" />'||unistr('\000a')||
'<tr><td><br /></td><th class="t16RegionHeader">#TITLE#</th></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><br /></td><td class="t16RegionBody">#BODY#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Navigation Region, Alternative 1'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 16
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139553223889324117 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_title
prompt  ......region template 139553518884324118
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139553518884324118 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16RegionWithoutButtonsAndTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="">'||unistr('\000a')||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Region without Buttons and Title'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 19
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139553518884324118 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 139553807774324119
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139553807774324119 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16RegionWithoutTitle" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<td class="t16ButtonHolder"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHAN'||
'GE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Region without Title'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 11
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139553807774324119 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row_1
prompt  ......region template 139554106489324120
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139554106489324120 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'<tbody>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_f'||
'ind.png" /></td>'||unistr('\000a')||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>'||unistr('\000a')||
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>'||unistr('\000a')||
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="'||
'apex_finderbar_left_middle"><br /></td></tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Report Filter - Single Row 1'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 31
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139554106489324120 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 139554431432324121
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139554431432324121 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleT'||
'ableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16ReportIcon">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CR'||
'EATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16RegionBody">#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t1'||
'6RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Report List'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 29
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139554431432324121 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 139554719955324121
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139554719955324121 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top" width="7"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="html'||
'db_ToggleTableBody(this,''body#REGION_ID#'')" class="pseudoButtonActive" />#TITLE#</th>'||unistr('\000a')||
'<td valign="top" width="7"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREA'||
'TE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td>#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" al'||
't=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Reports Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 9
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139554719955324121 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 139555010977324122
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139555010977324122 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader">#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapRight.png" border'||
'="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td>#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_P'||
'REFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Reports Region 100% Width'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 13
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139555010977324122 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 139555325452324123
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139555325452324123 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="" style="border:#a2a2a2 1px solid;border-top:none;">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<th class="t16RegionHeader" style="padding-left:12px;"><img src="#IMAGE_PREFIX#themes/theme_16/collapse_minus.gif" alt="" align="middle" onclick="htmldb_ToggleTableBody(this,''body#REGION_ID#'')" class="pb" /'||
'>#TITLE#</th>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16Alt1">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Reports Region, Alternative 1'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 16
 ,p_theme_class_id => 10
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139555325452324123 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 139555606427324123
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139555606427324123 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16SideBarRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr class="t16RegionHeader"><th>#TITLE#</th></tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr><td class="t16RegionBody">#BODY#</td></tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Sidebar Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 16
 ,p_theme_class_id => 2
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139555606427324123 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 139555911589324124
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139555911589324124 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="" style="width:200px;">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader">#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegio'||
'nCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#" class="t16ChartIcon">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="">#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><i'||
'mg src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Sidebar Region, Alternative 1'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 16
 ,p_theme_class_id => 3
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139555911589324124 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/top_bar
prompt  ......region template 139556226792324126
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139556226792324126 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<div class="rounded-corner-region-blank" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||unistr('\000a')||
'  <div class="rc-gray-top">'||unistr('\000a')||
'    <div class="rc-gray-top-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-body">'||unistr('\000a')||
'    <div class="rc-body-r">'||unistr('\000a')||
'      <div class="rc-content-main">'||unistr('\000a')||
'        <div class="rc-left">'||unistr('\000a')||
'          #BODY#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="rc-right">'||unistr('\000a')||
'          #CLOSE##COPY##DELETE##CHANGE##EDIT##PREVIOUS##NE'||
'XT##CREATE##EXPAND#'||unistr('\000a')||
'        </div>'||unistr('\000a')||
'        <div class="clear"></div>'||unistr('\000a')||
'      </div>'||unistr('\000a')||
'    </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="rc-bottom">'||unistr('\000a')||
'    <div class="rc-bottom-r"></div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'</div>'
 ,p_page_plug_template_name => 'Top Bar'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 21
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139556226792324126 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 139556508535324126
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139556508535324126 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="" style="width:600px;">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader">#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegio'||
'nCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td>#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<'||
'td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''||unistr('\000a')||
''
 ,p_page_plug_template_name => 'Wizard Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 12
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139556508535324126 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 139556807851324127
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 139556807851324127 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="t16ReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# border="0" cellpadding="0" cellspacing="0" summary="" style="width:600px;">'||unistr('\000a')||
'<thead>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegionCapLeft.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'<th class="t16RegionHeader">#TITLE#</th>'||unistr('\000a')||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_16/t16ReportRegio'||
'nCapRight.png" border="0" height="27" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</thead>'||unistr('\000a')||
'<tbody id="body#REGION_ID#">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td class="t16ButtonHolder">#CLOSE#&nbsp;&nbsp;#PREVIOUS##NEXT#&nbsp;#DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="RL"><br /></td>'||unistr('\000a')||
'<td>#BODY#</td>'||unistr('\000a')||
'<td class="RR"><br /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tbody>'||unistr('\000a')||
'<tfoot>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<'||
'td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBLeft.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBMiddle.png" alt=""/></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16RegionCapBRight.png" alt=""/></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</tfoot>'||unistr('\000a')||
'</table>'
 ,p_page_plug_template_name => 'Wizard Region with Icon'
 ,p_render_form_items_in_table => 'Y'
 ,p_theme_id => 16
 ,p_theme_class_id => 20
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 139556807851324127 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 122279562634336718
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table class="t1ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1L"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_left_hl.gif" alt="" /></td>'||unistr('\000a')||
'<td class="t1C"><a href="#LINK#" style="color:#FFFFFF;">#TEXT#</a></td>'||unistr('\000a')||
'<td class="t1R"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_right_hl.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

t2:=t2||'<table class="t1ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1L"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_left.gif" alt="" /></td>'||unistr('\000a')||
'<td class="t1NC"><a href="#LINK#">#TEXT#</a></td>'||unistr('\000a')||
'<td class="t1R"><img src="#IMAGE_PREFIX#/themes/theme_1/list_button_right.gif" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122279562634336718 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 1,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t1ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanded
prompt  ......list template 122279862876336726
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>122279862876336726 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanded',
  p_theme_id  => 1,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/hierarchical_expanding
prompt  ......list template 122280153740336726
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>122280153740336726 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Hierarchical Expanding',
  p_theme_id  => 1,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 122280345343336728
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t1current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122280345343336728 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table cellspacing="0" cellpadding="0" border="0" class="t1HorizontalImageswithLabelList" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 122280667229336728
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t1current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122280667229336728 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t1HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu
prompt  ......list template 122280949332336728
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" / ></a></li>';

wwv_flow_api.create_list_template (
  p_id=>122280949332336728 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu',
  p_theme_id  => 1,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 122281250562336729
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt=""  /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>122281250562336729 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => 1,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image_custom_1
prompt  ......list template 122281561094336731
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>122281561094336731 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image (Custom 1)',
  p_theme_id  => 1,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 122281872283336731
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t1current" href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122281872283336731 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 1,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="t1TabbedNavigationList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 122282154385336733
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t1current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / >#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / >#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122282154385336733 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="0" class="t1VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list_custom_2
prompt  ......list template 122282469736336733
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||unistr('\000a')||
'';

t2:=t2||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||unistr('\000a')||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122282469736336733 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List (Custom 2)',
  p_theme_id  => 1,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="5" summary="" >',
  p_list_template_after_rows=>'</table>'||unistr('\000a')||
'',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 122282749743336733
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t1current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122282749743336733 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t1VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 122283062955336733
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t1navcurrent">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t1nav">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122283062955336733 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 1,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t1VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 122283362966336733
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t1current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122283362966336733 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t1VerticalUnorderedListwithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullet
prompt  ......list template 122283643945336734
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t1current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122283643945336734 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullet',
  p_theme_id  => 1,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t1VerticalUnorderedListwithoutBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 122283943503336734
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td><div class="t1current">#TEXT#</div><img src="#IMAGE_PREFIX#themes/theme_1/arrow_down.gif" alt="Down" /></td></tr>';

t2:=t2||'<tr><td><div>#TEXT#</div><img src="#IMAGE_PREFIX#themes/theme_1/arrow_down.gif" alt="Down" /></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>122283943503336734 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 1,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t1WizardProgressList">',
  p_list_template_after_rows=>'<tr><td>&DONE.</td></tr>'||unistr('\000a')||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 139557112620324128
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Left.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'<td class="MC" valign="middle"><a href="#LINK#">#TEXT#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16ButtonC1Right.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

t2:=t2||'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t16Button">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Left.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'<td class="M" valign="middle"><a href="#LINK#">#TEXT#</a></td>'||unistr('\000a')||
'<td><img src="#IMAGE_PREFIX#themes/theme_16/t16Button1Right.gif" width="3" height="18" alt="" /></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139557112620324128 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t16ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_menu_with_sublist
prompt  ......list template 139557431842324134
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_16/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_16/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t16MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>139557431842324134 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => 16,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_tree
prompt  ......list template 139557731544324135
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>139557731544324135 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => 16,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 139558003533324138
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t16current"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" border="0" #IMAGE_ATTR#/></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139558003533324138 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table class="t16HorizontalImageswithLabelList" cellpadding="0" border="0" cellspacing="0" summary=""><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 139558324498324138
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t16current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139558324498324138 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t16HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 139558631663324139
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt=""  /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#menu/brush_bx_128x128.png" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>139558631663324139 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => 16,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image_custom_1
prompt  ......list template 139558924626324141
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_16/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li class="dhtmlSubMenuN"><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)"><span style="float:left;">#TEXT#</span></a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t16MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t16MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>139558924626324141 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image (Custom 1)',
  p_theme_id  => 16,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 139559208462324141
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td valign="bottom" class="t16SepL"><img src="#IMAGE_PREFIX#themes/theme_16/tab_list_left_cap.gif" alt="" /></td>'||unistr('\000a')||
'<td class="t16CurrentListTab"><a class="t16CurrentListTab" href="#LINK#">#TEXT#</a></td>'||unistr('\000a')||
'<td valign="bottom" class="t16SepR"><img src="#IMAGE_PREFIX#themes/theme_16/tab_list_right_cap.gif" alt="" /></td>';

t2:=t2||'<td><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139559208462324141 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => 16,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0"  summary="" width="100%" class="t16TabbedNavigationList"><tbody><tr><td class="t16LeftTabList">&nbsp;&nbsp;&nbsp;&nbsp;</td>',
  p_list_template_after_rows=>'<td class="t14EndCap" width="100%">&nbsp;</td></tr></tbody></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tree_list
prompt  ......list template 139559506824324142
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>139559506824324142 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => 16,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="htmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 139559802936324143
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t16current"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# />#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139559802936324143 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="t16VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list_custom_2
prompt  ......list template 139560122400324144
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||unistr('\000a')||
'';

t2:=t2||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||unistr('\000a')||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139560122400324144 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List (Custom 2)',
  p_theme_id  => 16,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="5" summary="" >',
  p_list_template_after_rows=>'</table>'||unistr('\000a')||
'',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 139560415022324144
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t16current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139560415022324144 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t16VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 139560732148324150
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t16ItemC">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t16Item">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139560732148324150 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => 16,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t16VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_links_without_bullets
prompt  ......list template 139561030607324151
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t16current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139561030607324151 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered Links without Bullets',
  p_theme_id  => 16,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t16VerticalUnorderedLinkswithoutBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
prompt  ......list template 139561327579324151
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t16current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139561327579324151 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullets',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t16VerticalUnorderedListwithBullets">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 139561617239324152
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="t16current">#TEXT#</div>';

t2:=t2||'<div>#TEXT#</div>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>139561617239324152 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => 16,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<div class="t16WizardProgressList">',
  p_list_template_after_rows=>'<center>&DONE.</center>'||unistr('\000a')||
'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/borderless
prompt  ......report template 122284249047336734
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 122284249047336734 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr>'||unistr('\000a')||
'<td><table class="t1borderless" cellpadding="0" border="0" cellspacing="0" summary="">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t1header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 122284249047336734 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 122284741989336740
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 122284741989336740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" class="t1HorizontalBorder" summary="">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t1header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>'||unistr('\000a')||
'',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 122284741989336740 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 122285273778336740
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 122285273778336740 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><ul class="t1OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'NOT_CONDITIONAL',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'NOT_CONDITIONAL',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 122285273778336740 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 122285756503336742
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 122285756503336742 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t1standard">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t1header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 122285756503336742 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_ppr
prompt  ......report template 122286270201336742
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t1data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 122286270201336742 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t1standard">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>'||unistr('\000a')||
'<script language=JavaScript type=text/javascript>'||unistr('\000a')||
'<!--'||unistr('\000a')||
'init_htmlPPRReport(''#REGION_ID#'');'||unistr('\000a')||
''||unistr('\000a')||
'//-->'||unistr('\000a')||
'</script>'||unistr('\000a')||
'</htmldb:#REGION_ID#>'||unistr('\000a')||
'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t1header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')"  class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 1,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> 'This is a deprecated template.'||unistr('\000a')||
''||unistr('\000a')||
'Reports using this template should be switched to to a standard template and the Enable Partial Page Refresh attribute should be enabled.');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 122286270201336742 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 122286762143336743
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="t1data"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c2:=c2||'<td class="t1dataalt"#ALIGNMENT#>#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 122286762143336743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table border="0" cellpadding="0" cellspacing="0" summary="" class="t1standardalternatingrowcolors">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t1header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>'||unistr('\000a')||
'',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#ccc',
  p_theme_id  => 1,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 122286762143336743 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 122287252414336743
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t1header">#COLUMN_HEADER#</th><td class="t1data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 122287252414336743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t1ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t1pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_1/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t1pagination"><img src="#IMAGE_PREFIX#themes/theme_1/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 1,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/apex_4_0_value_attribute_pairs
prompt  ......report template 139561916886324152
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="report-row">'||unistr('\000a')||
'  <div class="report-col-hdr">#COLUMN_HEADER#</div>'||unistr('\000a')||
'  <div class="report-col-val">#COLUMN_VALUE#</div>'||unistr('\000a')||
'</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139561916886324152 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'APEX 4.0 - Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="two-col-report-portlet">',
  p_row_template_after_rows =>'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/borderless
prompt  ......report template 139562232648324160
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139562232648324160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table class="t16Borderless" cellpadding="0" border="0" cellspacing="1" summary="" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'||unistr('\000a')||
'',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t16ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 139562232648324160 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 139562707272324162
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139562707272324162 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table class="t16HorizontalBorder" border="0" cellpadding="0" cellspacing="0" summary="" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t16ReportHeader"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 139562707272324162 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 139563221534324163
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'#COLUMN_VALUE#';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139563221534324163 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr><td><ul class="t16OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 139563221534324163 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<li>',
  p_row_template_after_last =>'</li>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 139563714492324164
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td #ALIGNMENT# headers="#COLUMN_HEADER#" class="t16data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139563714492324164 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t16Standard" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t16ReportHeader" #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 139563714492324164 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 139564221719324166
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16data">#COLUMN_VALUE#</td>';

c2:=c2||'<td headers="#COLUMN_HEADER_NAME#" #ALIGNMENT# class="t16dataalt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139564221719324166 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||unistr('\000a')||
'<tr><td><table border="0" cellpadding="0" cellspacing="0" summary="" class="t16StandardAlternatingRowColors" width="100%">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t16ReportHeader"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond2=>'NOT_CONDITIONAL',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'ODD_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_row_style_checked=>'#CCCCCC',
  p_theme_id  => 16,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 139564221719324166 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/two_column_portlet
prompt  ......report template 139564700454324167
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<div class="report-row">'||unistr('\000a')||
'  <div class="report-col-hdr">#1#</div>'||unistr('\000a')||
'  <div class="report-col-val">#2#</div>'||unistr('\000a')||
'</div>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139564700454324167 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Two Column Portlet',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div class="two-col-report-portlet" #REPORT_ATTRIBUTES# id="#REGION_ID#">',
  p_row_template_after_rows =>'</div>',
  p_row_template_table_attr =>'',
  p_row_template_type =>'NAMED_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_theme_id  => 16,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 139565018364324168
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr>'||unistr('\000a')||
'<th class="t16ReportHeader">#COLUMN_HEADER#</th>'||unistr('\000a')||
'<td class="t16data">#COLUMN_VALUE#</td>'||unistr('\000a')||
'</tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 139565018364324168 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr>'||unistr('\000a')||
'<td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t16ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t16CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT# &gt;</a>',
  p_previous_page_template=>'<a href="#LINK#" class="t16pagination">&lt;#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t16pagination">#PAGINATION_NEXT_SET#&gt;&gt;</a>',
  p_previous_set_template=>'<a href="#LINK#" class="t16pagination">&lt;&lt;#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => 16,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 139565018364324168 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'',
  p_row_template_after_last =>'<tr><td colspan="2" class="t16seperate"><hr /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 122287544294336743
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 122287544294336743 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t1NoLabel">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional
prompt  ......label template 122287651145336747
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 122287651145336747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t1Optional">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_with_help
prompt  ......label template 122287741629336747
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 122287741629336747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t1OptionalwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required
prompt  ......label template 122287861442336747
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 122287861442336747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_1/required.gif" alt="Required Field Icon" tabindex="999" /><span class="t1Required">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_with_help
prompt  ......label template 122287968494336747
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 122287968494336747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_1/required.gif" alt="Required Field Icon" tabindex="999" /><a class="t1RequiredwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t1InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 139565508966324169
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 139565508966324169 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t16NoLabel">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label
prompt  ......label template 139565601579324175
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 139565601579324175 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t16OptionalLabel">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 139565703798324175
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 139565703798324175 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t16OptionalLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label
prompt  ......label template 139565803854324176
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 139565803854324176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t16RequiredLabel">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 139565931004324176
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 139565931004324176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t16RequiredLabelwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'<div class="t16InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 122288042532336747
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 122288042532336747 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t1BreadcrumbMenu">',
  p_current_page_option=>'<span class="t1current">#NAME#</span>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 122288169294336750
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 122288169294336750 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t1HierarchicalMenu">',
  p_current_page_option=>'<li class="t1current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 139566021514324176
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 139566021514324176 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'',
  p_current_page_option=>'<a href="#LINK#" class="t16current">#NAME#</a>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'<img src="#IMAGE_PREFIX#themes/theme_16/breadcrumb_sep.gif" align="middle" alt="" />',
  p_after_last=>'',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 139566107595324184
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 139566107595324184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t16HierarchicalMenu">',
  p_current_page_option=>'<li class="t16current"><a href="#LINK#">#NAME#</a></li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 122288860620336758
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 122288860620336758 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_1/theme_3_1.css" type="text/css">'||unistr('\000a')||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t1PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t1PopupBody">',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ......template 139566815646324194
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 139566815646324194 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon"><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_16/theme_4_0.css" type="text/css" />',
  p_page_body_attr=>'onload="first_field()" class="popuplov"',
  p_before_field_text=>'<div class="t16PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>10,
  p_before_result_set=>'<div class="t16PopupBody">',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 122288249947336751
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 122288249947336751 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t1DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1CalendarHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t1MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t1Calendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t1DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t1Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t1Today">',
  p_weekend_title_format=> '<div class="t1WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t1WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t1NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t1NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1WeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t1DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t1WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t1Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t1NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t1Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t1DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t1DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t1Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t1Today">',
  p_daily_time_open_format => '<th class="t1Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_theme_id  => 1,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 122288455839336756
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 122288455839336756 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th valign="bottom" class="t1DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1CalendarAlternative1Holder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t1MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t1CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t1DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t1Day" valign="top" height="100" height="100">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t1Today">',
  p_weekend_title_format=> '<div class="t1WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t1WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t1NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t1NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1WeekCalendarAlternative1Holder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t1DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t1WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t1Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t1NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t1Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t1DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarAlternative1Holder"> <tr><td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="2" summary="0" class="t1DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t1Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t1Today">',
  p_daily_time_open_format => '<th class="t1Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_theme_id  => 1,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 122288645108336756
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 122288645108336756 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t1DayOfWeek">#DY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1SmallCalendarHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t1MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="1" summary="" class="t1SmallCalendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>',
  p_day_title_format=> '<div class="t1DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t1Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t1Today">',
  p_weekend_title_format=> '<div class="t1WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t1WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t1NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t1NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1SmallWeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t1MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t1DayOfWeek">#IDAY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="1" summary="0" class="t1SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t1Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t1Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t1NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t1Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t1DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1SmallDayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="1" summary="0" class="t1SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t1Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t1Today">',
  p_daily_time_open_format => '<th class="t1Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_theme_id  => 1,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 139566225802324184
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 139566225802324184 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t16DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16CalendarHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t16MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t16Calendar">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t16DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t16Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t16Today">',
  p_weekend_title_format=> '<div class="t16WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t16WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t16NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t16NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16WeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t16DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t16Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t16Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t16NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t16Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t16DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16DayCalendarHolder"> <tr> <td class="t16MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t16DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t16Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t16Today">',
  p_daily_time_open_format => '<th class="t16Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_theme_id  => 16,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 139566410926324190
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 139566410926324190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t16DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16CalendarAlternative1Holder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t16MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t16DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t16Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t16Today">',
  p_weekend_title_format=> '<div class="t16WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t16WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t16NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t16NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16WeekCalendarAlternative1Holder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t16DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t16Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t16Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t16NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t16Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t16DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16DayCalendarAlternative1Holder"> <tr><td class="t16MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t16DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t16Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t16Today">',
  p_daily_time_open_format => '<th class="t16Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_theme_id  => 16,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 139566615491324190
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 139566615491324190 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16SmallCalenderHolder"> '||unistr('\000a')||
' <tr>'||unistr('\000a')||
'   <td class="t16MonthTitle">#IMONTH# #YYYY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16SmallCalender">',
  p_month_close_format=> '</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
'',
  p_day_title_format=> '<div class="t16DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t16Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t16Today">',
  p_weekend_title_format=> '<div class="t16WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t16WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t16NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t16NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16SmallWeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t16MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t16DayOfWeek">#IDAY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t16SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t16Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t16Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t16NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t16Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t16DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t16SmallDayCalendarHolder"> <tr> <td class="t16MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t16SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t16Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t16Today">',
  p_daily_time_open_format => '<th class="t16Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_theme_id  => 16,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/red
prompt  ......theme 122289042167336759
begin
wwv_flow_api.create_theme (
  p_id =>122289042167336759 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 1,
  p_theme_name=>'Red',
  p_default_page_template=>122270342200336693 + wwv_flow_api.g_id_offset,
  p_error_template=>122270342200336693 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>122271253163336695 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>122269464615336678 + wwv_flow_api.g_id_offset,
  p_default_button_template=>122272164736336697 + wwv_flow_api.g_id_offset,
  p_default_region_template=>122277473043336715 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>122274760438336712 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>122275072184336712 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>122277473043336715 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>122277473043336715 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>122278948851336717 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>122273565747336709 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>122274450976336711 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>null + wwv_flow_api.g_id_offset,
  p_default_report_template   =>122285756503336742 + wwv_flow_api.g_id_offset,
  p_default_label_template=>122287741629336747 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>122288042532336747 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>122288249947336751 + wwv_flow_api.g_id_offset,
  p_default_list_template=>122283362966336733 + wwv_flow_api.g_id_offset,
  p_default_option_label=>122287741629336747 + wwv_flow_api.g_id_offset,
  p_default_required_label=>122287968494336747 + wwv_flow_api.g_id_offset);
end;
/
 
--application/shared_components/user_interface/themes/dark_blue
prompt  ......theme 139567007622324199
begin
wwv_flow_api.create_theme (
  p_id =>139567007622324199 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 16,
  p_theme_name=>'Dark Blue',
  p_default_page_template=>139547602857324086 + wwv_flow_api.g_id_offset,
  p_error_template=>139547031797324084 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>139548503480324089 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>139546806376324064 + wwv_flow_api.g_id_offset,
  p_default_button_template=>139549412510324095 + wwv_flow_api.g_id_offset,
  p_default_region_template=>139554719955324121 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>139552020821324115 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>139552308980324116 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>139554719955324121 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>139554719955324121 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>139556508535324126 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>139550805302324109 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>139554719955324121 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>null + wwv_flow_api.g_id_offset,
  p_default_report_template   =>139563714492324164 + wwv_flow_api.g_id_offset,
  p_default_label_template=>139565703798324175 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>139566021514324176 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>139566225802324184 + wwv_flow_api.g_id_offset,
  p_default_list_template=>139561327579324151 + wwv_flow_api.g_id_offset,
  p_default_option_label=>139565703798324175 + wwv_flow_api.g_id_offset,
  p_default_required_label=>139565931004324176 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...build options used by application 172
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 172
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...messages used by application: 172
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations used by application: 172
--
prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/delete_confirm_msg
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Would you like to perform this delete action?';

wwv_flow_api.create_shortcut (
 p_id=> 122302050327337576 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'DELETE_CONFIRM_MSG',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/ok_to_get_next_prev_pk_value
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'Are you sure you want to leave this page without saving?';

wwv_flow_api.create_shortcut (
 p_id=> 122306744853337598 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'OK_TO_GET_NEXT_PREV_PK_VALUE',
 p_shortcut_type=> 'TEXT_ESCAPE_JS',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/html_db
prompt  ......authentication 122289461820336765
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 122289461820336765 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'HTML DB'
 ,p_scheme_type => 'NATIVE_APEX_ACCOUNTS'
 ,p_attribute_15 => '8960446780764229'
 ,p_invalid_session_type => 'LOGIN'
 ,p_logout_url => 'f?p=&APP_ID.:1'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Use internal Application Express account credentials and login page in this application.'
  );
null;
 
end;
/

--application/shared_components/security/authentication/database
prompt  ......authentication 122289748724336767
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 122289748724336767 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'DATABASE'
 ,p_scheme_type => 'NATIVE_DAD'
 ,p_attribute_15 => '8960733684764231'
 ,p_invalid_session_type => 'LOGIN'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Use database authentication (user identified by DAD).'
  );
null;
 
end;
/

--application/shared_components/security/authentication/database_account
prompt  ......authentication 122290073483336767
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 122290073483336767 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'DATABASE ACCOUNT'
 ,p_scheme_type => 'NATIVE_DB_ACCOUNTS'
 ,p_attribute_15 => '8961058443764231'
 ,p_invalid_session_type => 'LOGIN'
 ,p_logout_url => 'f?p=&APP_ID.:1'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'Use database account credentials.'
  );
null;
 
end;
/

prompt  ...plugins
--
prompt  ...load tables
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 132629605878316702 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

--application/end_environment
commit;
commit;
begin 
execute immediate 'begin dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
set define on
prompt  ...done
