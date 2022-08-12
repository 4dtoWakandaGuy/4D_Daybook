//%attributes = {}
If (False:C215)
	//Project Method Name:      Areas_Mod
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
	C_BOOLEAN:C305($_bo_AreasAutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Areas_Mod")

$_t_SetName:=""
$_bo_AreasAutoFind:=False:C215
If (Count parameters:C259>=2)
	$_t_oldMethodName:=ERR_MethodTracker("Areas_Mod"; 0; "$2="+$2)
	$_bo_AreasAutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([AREAS:3]; "areasFound")
	QUERY:C277([AREAS:3]; [AREAS:3]Area_Code:1=$1)
	If (Records in selection:C76([AREAS:3])>0)
		CREATE SET:C116([AREAS:3]; "areasFound")
	End if 
	$_t_SetName:="areasFound"
End if 

Minor_Mod(->[AREAS:3]; "Areas"; ""; ""; $_t_SetName; $_bo_AreasAutoFind)
ERR_MethodTrackerReturn("Areas_Mod"; $_t_oldMethodName)
