//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: Compiler_IME_IV
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_IME_IV")
//Compiler_IME_IV
// b8 Rollo 19990613 - Added <>IME_t_FormTypeReport
// b21 Rollo 19990701 - Added <>IME_t_OptionNull
// b24 Rollo 19990709 - new variable
//b46 Ron 19990926 - Added ◊IME_t_VRSTiming
//b77 Ron 20000120 - Added <>IME_t_JSVersion

//Ron 11/8/00 - See MAC_OptimizeUpdateVars

C_TEXT:C284(<>GEN_t_OK; <>GEN_t_ERROR)

C_TEXT:C284(<>IME_t_PPLDoClick; <>IME_t_PPLDoMouse)
C_TEXT:C284(<>IME_t_FBHYOnDefineItems; <>IME_t_FBHYOnFormItems; <>IME_t_FBHYOnCustomItems; <>IME_t_FBHSetItem; <>IME_t_FBHSetCol; <>IME_t_FBHSetTotal; <>IME_t_FBHSetFromToItems)
C_TEXT:C284(<>IME_t_CFMVirtualTDPush; <>IME_t_CFMRelatedObject; <>IME_t_CFMYOnBuildHdrPgSet; <>IME_t_CFMYOnBuildRelPgSet)
C_TEXT:C284(<>IME_t_TLFPageSetUpdate; <>IME_t_TLFPageAdd; <>IME_t_TLFPageDoTab; <>IME_t_HLPDoPageLink; <>IME_t_NAVDoClick)
C_TEXT:C284(<>IME_t_FBHLinkClick; <>IME_t_FBHLinkMouse)

C_TEXT:C284(<>IME_t_JSVersion)

C_TEXT:C284(<>IME_t_MacroPrefix; <>IME_t_TextPrefix; <>IME_t_CachePrefix; <>IME_t_MethodPrefix; <>IME_t_LanguagePrefix; <>IME_t_ToolPrefix; <>IME_t_FormatPrefix; <>IME_t_FormatPrefixWildcard)  //the prefixes used by the Internet Manager
C_TEXT:C284(<>IME_t_MacroPrefixWildcard; <>IME_t_TextPrefixWildcard; <>IME_t_CachePrefixWildcard; <>IME_t_MethodPrefixWildcard; <>IME_t_LanguagePrefixWildcard; <>IME_t_ToolPrefixWildcard)

C_BOOLEAN:C305(<>IME_bo_Startup; <>IME_bo_Minimize; <>IME_bo_Test; <>IME_bo_WebServer; <>IME_bo_Debug)

C_TEXT:C284(<>iEncrypt; <>IME_t_WebMaster; <>IME_t_RefPrefix)
C_TEXT:C284(<>IME_t_CGI; <>IME_t_Server; <>IME_t_SecureServer; <>IME_t_WebMastEmail)
C_LONGINT:C283(<>IME_l_Hours; <>IME_l_Error; <>IME_l_ListMins; <>IME_l_StatProc; <>IME_l_ActivProc; <>IME_l_ActivSave; <>IME_l_LookupMax; <>IME_l_PopupMax; <>IME_l_PopSearchMax)

C_TEXT:C284(<>IME_t_SMTPServer)

C_TEXT:C284(<>IME_t_FormProcess)
C_TEXT:C284(<>IME_t_SORT_CODE)
C_TEXT:C284(<>IME_t_PLAY_ARRAY; <>IME_t_FORM_ITEM_FROMTO; <>IME_t_FORM_ITEM_FROM; <>IME_t_FORM_ITEM_TO)
C_TEXT:C284(<>IME_t_CachedTextName)

C_TEXT:C284(<>IME_t_MacroSQLPrefix; <>IME_t_MacroSQL; <>IME_t_MacroSQLSelect; <>IME_t_MacroSQLSelectPrefix)

C_TEXT:C284(<>IME_t_ColumnHeadBaseColor; <>IME_t_ColumnBaseColorLight; <>IME_t_ColumnHeadOrderByColor; <>IME_t_ColumnHeadSortColor; <>IME_t_ColumnSortColorLight; <>IME_t_ColumnBaseColor; <>IME_t_ColumnSortColor)

C_TIME:C306(<>IME_ti_JSErrLog)

//- IME_CGIVirtualServer…
//ARRAY TEXT(◊IME_at_VRSResps;0)  `Ron: this is an array, so it has moved to IA
C_TEXT:C284(<>IME_t_VRSupToRsps; <>IME_t_VRSTextEnd; <>IME_t_VRSTiming; <>IME_t_VRSLSCode)
C_LONGINT:C283(<>IME_l_KvrMaxItems)

C_TEXT:C284(<>IME_t_LIST_ITX_BEFORE; <>IME_t_LIST_ITX_AFTER; <>IME_t_LIST_MAIN_ITX)
C_TEXT:C284(<>IME_t_INPUT_ITX_BEFORE; <>IME_t_INPUT_ITX_AFTER; <>IME_t_INPUT_MAIN_ITX)
C_TEXT:C284(<>IME_t_QUERY_ITX_BEFORE; <>IME_t_QUERY_ITX_AFTER; <>IME_t_QUERY_MAIN_ITX)

_O_C_INTEGER:C282(<>IME_i_PreProcess_Dynamic; <>IME_i_PreProcess_IMA; <>IME_i_PostProcess_BeforeOnly; <>IME_i_PostProcess_Both)

C_TEXT:C284(<>IME_t_FormTypeInput; <>IME_t_FormTypeList; <>IME_t_FormTypeQuery; <>IME_t_FormTypeIncluded; <>IME_t_FormTypeInputNew)
C_TEXT:C284(<>IME_t_FormTypeReport)  //Rollo 6/13/99

C_TEXT:C284(<>IME_t_FuncColorLight; <>IME_t_FuncColorDark; <>IME_t_FuncColorText)
C_TEXT:C284(<>IME_t_FuncFrameset)

C_TEXT:C284(<>IME_t_VRSQuoteReplacement)

C_TEXT:C284(<>IME_t_JSTrue; <>IME_t_JSFalse)

C_TEXT:C284(<>IME_t_BaseImageLocation; <>IME_t_BaseImageLocationSF; <>IME_t_ConsoleName)

C_BOOLEAN:C305(<>IME_bo_NewFunc; <>IME_bo_NewFuncTabs)  //Ron 9/16/99

C_TEXT:C284(<>IME_t_OptionNull)  //Rollo 7/1/99

C_TEXT:C284(<>IME_t_BaseImageIP)  //Rollo 7/9/99

C_BOOLEAN:C305(<>IME_bo_RequireEncryption)  //Rollo 7/28/99

C_BOOLEAN:C305(<>IME_bo_RequireSameBrowser)  //Rollo SEQ 9/8/99
C_BOOLEAN:C305(<>IME_bo_RequireAccessTimeouts)  //Rollo SEQ 9/8/99
C_BOOLEAN:C305(<>IME_bo_SignupNewProcess)  // Axel 1/23/2002

C_BOOLEAN:C305(<>IME_bo_ColorSchemeBackgrounds)  //Rollo 9/27/99

C_LONGINT:C283(<>IME_l_MaxFolders)

//Rollo 1/16/2000
C_TEXT:C284(<>IME_t_QuickbooksWorkareaPath)

C_TEXT:C284(<>IME_t_EncryptFixedForCachePref)

C_BOOLEAN:C305(<>IME_bo_PlaySelectionOptimized)

C_TEXT:C284(<>IME_t_URLHostSecure; <>IME_t_URLHostSecure128; <>IME_t_URLHostStore; <>IME_t_URLHostStoreNoWWW; <>IME_t_IPHostStore; <>IME_t_URLHostSite; <>IME_t_URLHostInsecure)  //Rollo 4/14/2000

C_TEXT:C284(<>IME_t_BaseBusTempORef; <>IME_t_BasePersBusTempORef; <>IME_t_TestBusTempORef)  //Rollo 4/30/2000; Rollo 7/2/2000; Rollo 12/1/2000

C_TEXT:C284(<>IME_t_TerminologyPrefix)  //Rollo 6/12/2000

C_TEXT:C284(<>IME_t_IFTDateUS; <>IME_t_IFTDateUK)  //Rollo 6/22/2000

C_LONGINT:C283(<>IME_l_PopListImplemented)  //Rollo 7/8/2000

C_TEXT:C284(<>IME_t_VersionNoPublic)

C_BOOLEAN:C305(<>IME_bo_VRSCookieSecurity)  //Rollo 9/1/2000

C_TEXT:C284(<>IME_t_BillingORef)
C_TEXT:C284(<>IME_t_BillingStandardOfferCode)

C_TEXT:C284(<>IME_t_SuppportEmailFrom; <>IME_t_SignupErrorEmailTo; <>IME_t_SignupConfEmailTo; <>IME_t_BillingEmailFrom; <>IME_t_StoreEmailDefaultSender; <>IME_t_CancelEmailTo)  //Rollo 9/21/2000

C_TEXT:C284(<>IME_t_ColorCodeBizzed)
C_LONGINT:C283(<>IME_l_ColourIndexBizzed)

C_BOOLEAN:C305(<>IME_bo_CardServicesLive; <>IME_bo_StoreTemplates; <>IME_bo_StoreSalesOrders)

C_TEXT:C284(<>IME_t_URLHostsAllowed)

C_BOOLEAN:C305(<>IME_bo_SignupSilent)  //Rollo 3/21/2001

C_BOOLEAN:C305(<>IME_bo_SignupAgreeWebPage)  //Rollo 8/3/2001

C_TEXT:C284(<>IME_t_CorporateSiteURL)  //Rollo 8/24/2001



ERR_MethodTrackerReturn("Compiler_IME_IV"; $_t_oldMethodName)