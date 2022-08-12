//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls Sheets
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoPrint; $_bo_AutoSearch)
	C_LONGINT:C283(vCalls)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchCode; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls Sheets")
$_bo_AutoSearch:=False:C215
$_t_SearchCode:=""
If (Count parameters:C259>=2)
	$_t_SearchCode:=$1  //if this is empty use current selectiong
	$_bo_AutoSearch:=($2="TRUE")  //USE THIS TO AVOID THE SEARCH DIALOG
	
End if 
If (Count parameters:C259>=3)  //USE THIS TO CALL THIS METHOD WITHOUT DISPLAYING THE SELECTION
	$_bo_AutoPrint:=($3="TRUE")
End if 
Gen_ListSR("Call Sheets"; "Calls_File"; "Master"; ->[SERVICE_CALLS:20]; ->vCalls; "Calls_Sel"; "Service Calls"; "ServiceReport"; "Many"; "CallSheets"; $_bo_AutoSearch; $_t_SearchCode)
ERR_MethodTrackerReturn("Calls Sheets"; $_t_oldMethodName)