//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Categories Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Categories Mod")
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([TIME_BILLING_CATEGORIES:46]; "CatagoryFound")
	QUERY:C277([TIME_BILLING_CATEGORIES:46]; [TIME_BILLING_CATEGORIES:46]Category_Code:1=$1)
	
	If (Records in selection:C76([TIME_BILLING_CATEGORIES:46])>0)
		CREATE SET:C116([TIME_BILLING_CATEGORIES:46]; "CatagoryFound")
	End if 
	$_t_SetName:="CatagoryFound"
End if 
Minor_Mod(->[TIME_BILLING_CATEGORIES:46]; "Categories"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Categories Mod"; $_t_oldMethodName)