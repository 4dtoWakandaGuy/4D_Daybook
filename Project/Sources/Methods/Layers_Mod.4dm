//%attributes = {}
If (False:C215)
	//Project Method Name:      Layers_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("Layers_Mod")
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([LAYERS:76]; "LayersFound")
	QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$1)
	If (Records in selection:C76([LAYERS:76])>0)
		CREATE SET:C116([LAYERS:76]; "LayersFound")
	End if 
	$_t_SetName:="LayersFound"
End if 

Minor_Mod(->[LAYERS:76]; "Layers"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Layers_Mod"; $_t_oldMethodName)