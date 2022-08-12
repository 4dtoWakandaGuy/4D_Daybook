//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoPrint; $_bo_AutoSearch)
	C_LONGINT:C283(vContr)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchCode; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_List")
$_bo_AutoPrint:=False:C215
$_bo_AutoSearch:=False:C215
$_t_SearchCode:=""
If (Count parameters:C259>=2)
	$_t_SearchCode:=$1  //if this is empty use current selectiong
	$_bo_AutoSearch:=($2="TRUE")  //USE THIS TO AVOID THE SEARCH DIALOG
	
End if 
If (Count parameters:C259>=3)  //USE THIS TO CALL THIS METHOD WITHOUT DISPLAYING THE SELECTION
	$_bo_AutoPrint:=($3="TRUE")
End if 
// THE REASON THE PARAMETERS ARE STRING IS B ECAUSE WHEN CALLED VIA ZPROC ALL PARAMETERS HAVE TO BE OF THE SAME TYPE

Gen_ListSR("View Contracts"; "Contracts_File"; "Master"; ->[CONTRACTS:17]; ->vContr; "Contracts_Sel"; "Contracts"; "Contracts_List"; ""; "ContrList"; $_bo_AutoSearch; $_t_SearchCode)
ERR_MethodTrackerReturn("Contracts_List"; $_t_oldMethodName)