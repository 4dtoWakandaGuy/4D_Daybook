//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_GetConstantsList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 17:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ResourceIDS; 0)
	//ARRAY LONGINT(SMC_al_ScriptStatus;0)
	ARRAY TEXT:C222($_at_ResName; 0)
	//ARRAY TEXT(SMC_at_ScriptStatus;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_ResourceID; $_l_ResourceRow)
	C_POINTER:C301($_ptr_ScriptStatus; $_ptr_ScriptStatusName; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_Type; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_GetConstantsList")
//$1=name of the list
//$2=String array pointer
//$3=Longint array pointer

//Prior to 4D v13 this used the old style resources-that of course stopped working-this is only used in on place
If (Count parameters:C259>=3)
	$_t_Type:=$1
	$_ptr_ScriptStatusName:=$2
	$_ptr_ScriptStatus:=$3
Else 
	ARRAY TEXT:C222(SMC_at_ScriptStatus; 0)
	ARRAY LONGINT:C221(SMC_al_ScriptStatus; 0)
	$_ptr_ScriptStatusName:=->SMC_at_ScriptStatus
	$_ptr_ScriptStatus:=->SMC_al_ScriptStatus
End if 


Case of 
		
	: ($_t_Type="Macro Status")
		ARRAY TEXT:C222($_ptr_ScriptStatusName->; 4)
		ARRAY LONGINT:C221($_ptr_ScriptStatus->; 4)
		$_ptr_ScriptStatusName->{1}:="Active in Testing"
		$_ptr_ScriptStatus->{1}:=1
		$_ptr_ScriptStatusName->{2}:="Active"
		$_ptr_ScriptStatus->{2}:=2
		$_ptr_ScriptStatusName->{3}:="Active LOCKED"
		$_ptr_ScriptStatus->{3}:=3
		$_ptr_ScriptStatusName->{4}:="Disabled"
		$_ptr_ScriptStatus->{4}:=4
End case 

ERR_MethodTrackerReturn("Gen_GetConstantsList"; $_t_oldMethodName)
