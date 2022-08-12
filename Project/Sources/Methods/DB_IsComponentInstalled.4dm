//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_IsComponentInstalled
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   22/03/2011 07:50 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ComponentNames; 0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_ComponentRow)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_IsComponentInstalled")
ARRAY TEXT:C222($_at_ComponentNames; 0)

COMPONENT LIST:C1001($_at_ComponentNames)
$0:=False:C215
If (Count parameters:C259>=1)
	$_l_ComponentRow:=Find in array:C230($_at_ComponentNames; $1)
	If ($_l_ComponentRow>0)
		$0:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("DB_IsComponentInstalled"; $_t_oldMethodName)