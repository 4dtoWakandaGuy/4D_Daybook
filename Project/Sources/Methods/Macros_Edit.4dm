//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_Edit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/10/2010 15:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>StartProc)
	C_LONGINT:C283(<>AutoProc; $_l_EndHighlight; $_l_Process; $_l_StartHighlight)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284(<>KEYS; <>SerialNo; $_t_oldMethodName; $_t_ScriptCode; MOD_FieldValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_Edit")
//Macros_Edit - from existing Macros screen
$_ptr_FocusObject:=Focus object:C278
If (Type:C295($_ptr_FocusObject->)=2)
	GET HIGHLIGHT:C209($_ptr_FocusObject->; $_l_StartHighlight; $_l_EndHighlight)
	MOD_FieldValue:=""
	RemoveLeadTr(Substring:C12($_ptr_FocusObject->; $_l_StartHighlight; $_l_EndHighlight-$_l_StartHighlight); ->MOD_FieldValue)
	$_t_ScriptCode:=MOD_FieldValue
	//DB_SaveRecord(->[MACROS])
	//CUT NAMED SELECTION([MACROS];"$m")
	//SEARCH([MACROS];[MACROS]Macro Code=$_t_ScriptCode)
	//If (Records in selection([MACROS])=0)
	//SEARCH([MACROS];[MACROS]Macro Code="IMA "+$_t_ScriptCode;*)
	//SEARCH([MACROS]; | ;[MACROS]Macro Code="ITX "+$_t_ScriptCode;*)
	//SEARCH([MACROS]; | ;[MACROS]Macro Code="ITO "+$_t_ScriptCode)
	//End if
	// If (Records in selection([MACROS])=0)
	//
	//Else
	
	<>AutoFind:=True:C214
	<>AutoProc:=676767
	//If (Records in selection([MACROS])=1)
	//◊SerialNo:=[MACROS]Macro Code
	//  Else
	<>SerialNo:=$_t_ScriptCode
	<>StartProc:=False:C215
	<>Keys:=""
	// End if
	// UNLOAD RECORD([MACROS])
	//ZProc ("Macros_Mod";◊K2;◊SerialNo)
	$_l_Process:=New process:C317("DBI_DisplayRecord"; 256000; $_t_ScriptCode; Current process:C322; Table:C252(->[SCRIPTS:80]); ""; $_t_ScriptCode)
	
	// End if
	//USE NAMED SELECTION("$m")
Else 
	DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[SCRIPTS:80])))
	//ZMacros_Mod
End if 
ERR_MethodTrackerReturn("Macros_Edit"; $_t_oldMethodName)
