//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_InHist
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2010 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; <>MENU_l_BarModule)
	C_TEXT:C284(<>AutoFile; <>CallCode; <>CompCode; <>ContCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InHist")
<>AutoFind:=True:C214
<>DB_bo_AutoOut:=True:C214
<>AutoFile:="Calls"
<>AutoProc:=Current process:C322
<>CompCode:=[SERVICE_CALLS:20]Company_Code:1
<>ContCode:=""
<>CallCode:=""
//ZCalls_Mod
DBI_MenuDisplayRecords((Table name:C256(Table:C252(->[SERVICE_CALLS:20]))); <>MENU_l_BarModule; ""; ->[SERVICE_CALLS:20]Company_Code:1; [SERVICE_CALLS:20]Company_Code:1)
ERR_MethodTrackerReturn("Calls_InHist"; $_t_oldMethodName)