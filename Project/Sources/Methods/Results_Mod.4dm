//%attributes = {}
If (False:C215)
	//Project Method Name:      Results_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("Results_Mod")
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([RESULTS:14]; "ResultFound")
	QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=$1)
	If (Records in selection:C76([RESULTS:14])>0)
		CREATE SET:C116([RESULTS:14]; "ResultFound")
	End if 
	$_t_SetName:="ResultFound"
End if 
Minor_Mod(->[RESULTS:14]; "Results"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Results_Mod"; $_t_oldMethodName)
