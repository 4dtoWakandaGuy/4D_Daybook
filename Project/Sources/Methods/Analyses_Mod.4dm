//%attributes = {}
If (False:C215)
	//Project Method Name:      Analyses_Mod
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
	C_BOOLEAN:C305($_bo_ANAAutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Analyses_Mod")
$_t_SetName:=""
$_bo_ANAAutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_ANAAutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([ANALYSES:36]; "ANAFound")
	QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$1)
	If (Records in selection:C76([ANALYSES:36])>0)
		CREATE SET:C116([ANALYSES:36]; "ANAFound")
	End if 
	$_t_SetName:="ANAFound"
End if 
Minor_Mod(->[ANALYSES:36]; "Analyses"; ""; ""; $_t_SetName; $_bo_ANAAutoFind)
ERR_MethodTrackerReturn("Analyses_Mod"; $_t_oldMethodName)
