//%attributes = {}
If (False:C215)
	//Project Method Name:      Modules_ArrStar
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
	//Array Text(MOD_at_ModuleStartName;0)
	//Array LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_LONGINT:C283($_l_ModuleNamePosition; $_l_StartPosition)
	C_REAL:C285($1)
	C_TEXT:C284($_t_ModuleName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Modules_ArrStar")
//Modules_ArrStart
If (Count parameters:C259>=1)
	$_l_StartPosition:=$1
Else 
	$_l_StartPosition:=MOD_al_ModuleAccessStatus
End if 
$_l_ModuleNamePosition:=Find in array:C230(MOD_at_ModuleStartName; MOD_at_ModuleName{$_l_StartPosition})
If ($_l_ModuleNamePosition>0)
	$_t_ModuleName:=MOD_at_ModuleStartName{$_l_ModuleNamePosition}
Else 
	$_t_ModuleName:=""
End if 
If (MOD_al_ModuleAccessStatus{$_l_StartPosition}=0)
	If ($_l_ModuleNamePosition>0)
		DELETE FROM ARRAY:C228(MOD_at_ModuleStartName; $_l_ModuleNamePosition; 1)
		SORT ARRAY:C229(MOD_at_ModuleStartName; >)
	End if 
Else 
	If ($_l_ModuleNamePosition<=0)
		INSERT IN ARRAY:C227(MOD_at_ModuleStartName; 1; 1)
		MOD_at_ModuleStartName{1}:=MOD_at_ModuleName{$_l_StartPosition}
		SORT ARRAY:C229(MOD_at_ModuleStartName; >)
	End if 
End if 
MOD_at_ModuleStartName:=Find in array:C230(MOD_at_ModuleStartName; $_t_ModuleName)
If (MOD_at_ModuleStartName<0)
	MOD_at_ModuleStartName:=0
End if 
ERR_MethodTrackerReturn("Modules_ArrStar"; $_t_oldMethodName)