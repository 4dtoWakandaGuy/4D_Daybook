//%attributes = {}
If (False:C215)
	//Project Method Name:      ContactTypes_Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName; $_t_SetName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ContactTypes_Mod")

$_bo_AutoFind:=False:C215
$_t_SetName:=""
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([CONTRACT_TYPES:19]; "CtypesFound")
	QUERY:C277([CONTRACT_TYPES:19]; [CONTRACT_TYPES:19]Contract_Type_Code:1=$1)
	
	If (Records in selection:C76([CONTRACT_TYPES:19])>0)
		CREATE SET:C116([CONTRACT_TYPES:19]; "AtypesFound")
	End if 
	$_t_SetName:="AtypesFound"
End if 
Minor_ModName(->[CONTRACT_TYPES:19]; "ContTypes"; <>SYS_t_FormSizeName; "Contract Types"; $_bo_AutoFind; $_t_SetName)
ERR_MethodTrackerReturn("ContactTypes_Mod"; $_t_oldMethodName)