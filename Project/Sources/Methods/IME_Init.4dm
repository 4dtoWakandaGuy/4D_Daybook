//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_Init
	//------------------ Method Notes ------------------
	//IME_Init
	// b8 Rollo 19990613 - Added <>IME_t_FormTypeReport
	// b21 Rollo 19990701 - Added <>IME_t_OptionNull
	// b24 Rollo 19990709 - bug fix involving BaseImageLocation
	//b46 Ron 19990926 - Added ◊IME_t_VRSTiming
	//b54 Ron 19991013 - Shortened input element names
	//b77 Ron 20000120 - Added ◊IME_t_JSVersion
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 14:30`Method: IME_Init
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(<>IME_at_AreaCode;0)
	//Array Text(<>IME_at_AreaColorScheme;0)
	//Array Text(<>IME_at_Section;0)
	//Array Text(<>IME_at_Section2;0)
	//Array Text(<>IME_at_Section3;0)
	_O_C_INTEGER:C282(<>IME_i_PostProcess_BeforeOnly; <>IME_i_PostProcess_Both; <>IME_i_PreProcess_Dynamic; <>IME_i_PreProcess_IMA)
	//ARRAY DATE(<>IME_ad_DateAdded;0)
	//ARRAY DATE(<>IME_ad_DateSold;0)
	//ARRAY INTEGER(<>aiQuality;0)
	//ARRAY LONGINT(<>IME_al_Quality;0)
	//ARRAY LONGINT(<>IME_al_RecordNumber;0)
	//ARRAY TEXT(<>IME_at_exclusions;0)
	//ARRAY TEXT(<>IME_at_Extension;0)
	//ARRAY TEXT(<>IME_at_Name;0)
	//ARRAY TEXT(<>IME_at_RobotIPs;0)
	//ARRAY TEXT(<>IME_at_RobotWebRefs;0)
	//ARRAY TEXT(<>IME_at_Status;0)
	//ARRAY TEXT(IME_at_ExclusionsTemp;0)
	C_BOOLEAN:C305(<>IME_bo_CardServicesLive; <>IME_bo_ColorSchemeBackgrounds; <>IME_bo_Debug; <>IME_bo_Minimize; <>IME_bo_NewFunc; <>IME_bo_PlaySelectionOptimized; <>IME_bo_RequireAccessTimeouts; <>IME_bo_RequireEncryption; <>IME_bo_RequireSameBrowser; <>IME_bo_SignupAgreeWebPage; <>IME_bo_SignupNewProcess)
	C_BOOLEAN:C305(<>IME_bo_SignupSilent; <>IME_bo_Startup; <>IME_bo_StoreProcessCards; <>IME_bo_StoreSalesOrders; <>IME_bo_StoreTemplates; <>IME_bo_Test; <>IME_bo_VRSCookieSecurity; <>IME_t_WebServer; <>IMS_bo_Bizness)
	C_LONGINT:C283(<>GEN_l_Cancel; <>IME_l_ColourIndexBizzed; <>IME_l_MaxFolders; <>IME_l_PopListImplemented; <>IME_l_ActivProc; <>IME_l_ActivSave; <>IME_l_Error; <>IME_l_Hours; <>IME_l_ListMins; <>IME_l_LookupMax; <>IME_l_PopSearchMax)
	C_LONGINT:C283(<>IME_l_PopupMax; <>IME_l_StatProc; $iSize)
	C_TEXT:C284(<>GEN_s_ERROR; <>GEN_t_OK; <>iEncrypt; <>IME_t_BaseBusTempORef; <>IME_t_BaseImageIP; <>IME_t_BaseImageLocation; <>IME_t_BasePersBusTempORef; <>IME_t_BillingEmailFrom; <>IME_t_BillingORef; <>IME_t_BillingStandardOfferCode; <>IME_t_CachedTextName)
	C_TEXT:C284(<>IME_t_CachePrefix; <>IME_t_CancelEmailTo; <>IME_t_CGI; <>IME_t_ColorCodeBizzed; <>IME_t_ColumnBaseColor; <>IME_t_ColumnBaseColorLight; <>IME_t_ColumnHeadBaseColor; <>IME_t_ColumnHeadOrderByColor; <>IME_t_ColumnHeadSortColor; <>IME_t_ColumnSortColor; <>IME_t_ColumnSortColorLight)
	C_TEXT:C284(<>IME_t_ConsoleName; <>IME_t_EncryptFixedForCachePref; <>IME_t_FORM_ITEM_FROM; <>IME_t_FORM_ITEM_FROMTO; <>IME_t_FORM_ITEM_TO; <>IME_t_FormatPrefix; <>IME_t_FormTypeIncluded; <>IME_t_FormTypeInput; <>IME_t_FormTypeInputNew; <>IME_t_FormTypeList; <>IME_t_FormTypeQuery)
	C_TEXT:C284(<>IME_t_FormTypeReport; <>IME_t_FuncColorDark; <>IME_t_FuncColorLight; <>IME_t_FuncColorText; <>IME_t_FuncFrameset; <>IME_t_IFTDateUK; <>IME_t_IFTDateUS; <>IME_t_Images; <>IME_t_INPUT_ITX_AFTER; <>IME_t_INPUT_ITX_BEFORE; <>IME_t_INPUT_MAIN_ITX)
	C_TEXT:C284(<>IME_t_JSFalse; <>IME_t_JSTrue; <>IME_t_JSVersion; <>IME_t_LanguagePrefix; <>IME_t_LIST_ITX_AFTER; <>IME_t_LIST_ITX_BEFORE; <>IME_t_LIST_MAIN_ITX; <>IME_t_MacroPrefix; <>IME_t_MethodPrefix; <>IME_t_NEImages; <>IME_t_OptionNull)
	C_TEXT:C284(<>IME_t_PLAY_ARRAY; <>IME_t_QUERY_ITX_AFTER; <>IME_t_QUERY_ITX_BEFORE; <>IME_t_QUERY_MAIN_ITX; <>IME_t_RefPrefix; <>IME_t_SecureServer; <>IME_t_Server; <>IME_t_SignupConfEmailTo; <>IME_t_SignupErrorEmailTo; <>IME_t_SMTPServer; <>IME_t_SORT_CODE)
	C_TEXT:C284(<>IME_t_StoreEmailDefaultSender; <>IME_t_SuppportEmailFrom; <>IME_t_TestBusTempORef; <>IME_t_TextPrefix; <>IME_t_ToolPrefix; <>IME_t_VersionNoPublic; <>IME_t_VRSQuoteReplacement; <>IME_t_WebMastEmail; <>IME_t_WebMaster; <>sRefPrefix; <>vMacroCode)
	C_TEXT:C284($_t_oldMethodName; $sCharacter)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Init")

<>vMacroCode:=""

<>IME_t_BaseImageLocation:="/s/"
<>IME_t_BaseImageIP:=""

<>sRefPrefix:="A"

<>IME_bo_SignupNewProcess:=False:C215  // Axel 1/23/2001
<>IME_bo_NewFunc:=True:C214
<>IME_t_JSVersion:="1s0"  //Initialized in ITO_SetJSVersion!!!

<>GEN_t_OK:="OK"
<>GEN_s_ERROR:="ERROR"

<>IME_t_MacroPrefix:="IMA_"
<>IME_t_TextPrefix:="ITX_"
<>IME_t_CachePrefix:="ICA_"
<>IME_t_MethodPrefix:="IME_"
<>IME_t_LanguagePrefix:="ILA_"
<>IME_t_ToolPrefix:="ITO_"
<>IME_t_FormatPrefix:="IFT_"

<>IME_t_CGI:=""
<>IME_t_RefPrefix:=""
<>IME_l_StatProc:=0
<>GEN_l_Cancel:=0
<>IME_bo_Test:=False:C215
<>IME_l_Hours:=4
<>IME_l_Error:=6
<>IME_t_WebMaster:=""
<>IME_t_WebMastEmail:=""
<>IME_bo_Minimize:=True:C214
<>IME_bo_Startup:=False:C215
<>IME_l_ActivProc:=0
<>IME_l_ActivSave:=0
<>IME_l_ListMins:=60
<>IME_t_SMTPServer:=""
<>IME_t_WebServer:=False:C215
<>IME_t_Server:=""
<>IME_t_SecureServer:=""
<>IME_l_LookupMax:=300  //see also ITO_NMStartup
<>IME_l_PopupMax:=500  //see also ITO_NMStartup
<>IME_l_PopSearchMax:=200  //see also ITO_NMStartup

// `0=no error messages; 1=Normal  messages; 2=html messages; 4=ERR messages; 8=Em
<>IME_l_Error:=6  //see NMStartup

<>IME_t_OptionNull:="(clear)"  //Rollo 7/1/99

<>iEncrypt:="RANDOM"

<>IME_t_EncryptFixedForCachePref:="-^"

<>IME_t_SORT_CODE:="@/S1@"
<>IME_t_PLAY_ARRAY:="Play Selection "

<>IME_t_CachedTextName:="IME_t_CachedText"

<>IME_t_ColumnHeadBaseColor:="BBBBBB"
<>IME_t_ColumnHeadOrderByColor:="AAAAAA"
<>IME_t_ColumnHeadSortColor:="999999"
<>IME_t_ColumnBaseColor:="CCCCCC"
<>IME_t_ColumnBaseColorLight:="EEEEEE"
<>IME_t_ColumnSortColor:="BBBBBB"
<>IME_t_ColumnSortColorLight:="EDEDED"

<>IME_t_LIST_ITX_BEFORE:="ROWStart"
<>IME_t_LIST_ITX_AFTER:="ROWEnd"
<>IME_t_LIST_MAIN_ITX:="LST"

<>IME_t_INPUT_ITX_BEFORE:="ROWStart"
<>IME_t_INPUT_ITX_AFTER:="ROWEnd"
<>IME_t_INPUT_MAIN_ITX:="INP"

<>IME_t_QUERY_ITX_BEFORE:="ROWStart"
<>IME_t_QUERY_ITX_AFTER:="ROWEnd"
<>IME_t_QUERY_MAIN_ITX:="INP"

<>IME_t_FORM_ITEM_FROMTO:="FromTo/FromTo"
<>IME_t_FORM_ITEM_FROM:="@_FR"
<>IME_t_FORM_ITEM_TO:="@_TO"

<>IME_i_PreProcess_Dynamic:=1  //pre-process an HTML Form with a method, *and* dynamically build it
<>IME_i_PreProcess_IMA:=2  //pre-process an HTML form, but do NOT dynamically build it - IMA does that
<>IME_i_PostProcess_BeforeOnly:=1  //post-process HTML form, do not do standard insert/update
<>IME_i_PostProcess_Both:=2  //post-process HTML form, *and* do the standard insert/update

<>IME_t_FormTypeInput:="Input"
<>IME_t_FormTypeList:="List"
<>IME_t_FormTypeQuery:="Query"
<>IME_t_FormTypeIncluded:="Included"
<>IME_t_FormTypeInputNew:="InputNew"
<>IME_t_FormTypeReport:="Report"

//these are base blues used as a default in IME_FunctionValuesGet
<>IME_t_FuncColorLight:="AAAAFF"
<>IME_t_FuncColorDark:="000066"
<>IME_t_FuncColorText:="000066"
//also used as a default in IME_FunctionValuesGet
<>IME_t_FuncFrameset:="VirtualTD"  //Virtual Tools & Data

<>IME_t_JSTrue:="true"
<>IME_t_JSFalse:="false"

<>IME_bo_Debug:=False:C215

<>IME_t_ConsoleName:="Namevo"

<>IME_bo_RequireEncryption:=True:C214  //Rollo 7/28/99

<>IME_bo_RequireSameBrowser:=True:C214  //Rollo SEQ 9/8/99
<>IME_bo_RequireAccessTimeouts:=True:C214  //Rollo SEQ 9/8/99

<>IME_bo_ColorSchemeBackgrounds:=False:C215  //Rollo 9/27/99

<>IME_l_MaxFolders:=5  //number ofl levels deep

<>IME_bo_PlaySelectionOptimized:=True:C214

<>IME_t_BaseBusTempORef:="7450"  //reset in ITO_NMStartup
<>IME_t_BasePersBusTempORef:="7490"  //reset in ITO_NMStartup
<>IME_t_BillingORef:="110000001"  //dvlp only - see ITO_NMStartup
<>IME_t_TestBusTempORef:="7450"

<>IME_bo_StoreProcessCards:=False:C215

<>IME_t_IFTDateUS:="MM/DD/YYYY;00/00/0000"
<>IME_t_IFTDateUK:="DD/MM/YYYY;00/00/0000"

<>IME_l_PopListImplemented:=1  //0=Not; 1=NS PC & IE4 excluded; 2=IE4 excluded; 3=all

<>IME_t_VersionNoPublic:="5.1"  //is changed also in ITO_NMStartup

<>IME_bo_VRSCookieSecurity:=False:C215  //Rollo 9/1/2000

<>IME_t_SuppportEmailFrom:="support@daybook.co.uk"
<>IME_t_SignupConfEmailTo:="support@daybook.co.uk"
<>IME_t_SignupErrorEmailTo:="support@daybook.co.uk"
<>IME_t_BillingEmailFrom:="support@daybook.co.uk"
<>IME_t_StoreEmailDefaultSender:="support@daybook.co.uk"
<>IME_t_CancelEmailTo:="support@daybook.co.uk"

<>IME_t_ColorCodeBizzed:="Grey Green"
<>IME_l_ColourIndexBizzed:=0  //see ITO_NMStartup

<>IME_bo_CardServicesLive:=False:C215
<>IME_bo_StoreTemplates:=False:C215  //default to true when templates are ready
<>IME_bo_StoreSalesOrders:=True:C214  //Rollo 11/6/2000  - can be temporary - allows reversion of ARQuickSF change

<>IME_t_BillingStandardOfferCode:="0008"  //Rollo 2/26/2001

<>IME_bo_SignupSilent:=False:C215  //Rollo 3/21/2001

<>IME_bo_SignupAgreeWebPage:=False:C215  //Rollo 8/3/2001


<>IME_t_VRSQuoteReplacement:="xxQxx"

//IME_AreaColors
ARRAY TEXT:C222(<>IME_at_AreaCode; 0)
ARRAY TEXT:C222(<>IME_at_AreaColorScheme; 0)


<>IME_t_NEImages:=""
<>IME_t_Images:=""

<>IMS_bo_Bizness:=True:C214

ARRAY LONGINT:C221(<>IME_al_RecordNumber; 0)
ARRAY TEXT:C222(<>IME_at_Name; 0)
ARRAY TEXT:C222(<>IME_at_Extension; 0)
ARRAY TEXT:C222(<>IME_at_Status; 0)
ARRAY LONGINT:C221(<>IME_al_Quality; 0)
ARRAY TEXT:C222(<>IME_at_Section; 0)
ARRAY TEXT:C222(<>IME_at_Section2; 0)
ARRAY TEXT:C222(<>IME_at_Section3; 0)
ARRAY DATE:C224(<>IME_ad_DateSold; 0)
ARRAY DATE:C224(<>IME_ad_DateAdded; 0)

ARRAY TEXT:C222(<>IME_at_exclusions; 0)
ARRAY TEXT:C222(IME_at_ExclusionsTemp; 0)

ARRAY TEXT:C222(<>IME_at_RobotIPs; 0)
ARRAY TEXT:C222(<>IME_at_RobotWebRefs; 0)
ERR_MethodTrackerReturn("IME_Init"; $_t_oldMethodName)