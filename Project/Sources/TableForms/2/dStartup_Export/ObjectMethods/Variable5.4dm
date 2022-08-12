If (False:C215)
	//object Name: [COMPANIES]dStartup_Export.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	C_LONGINT:C283($_l_Index; $_l_SIzeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStartup_Export.Variable5"; Form event code:C388)
$_l_SIzeofArray:=Size of array:C274(MOD_al_ModuleAccessStatus)
If (Gen_Option)
	For ($_l_Index; 1; $_l_SIzeofArray)
		MOD_al_ModuleAccessStatus{$_l_Index}:=-1
	End for 
Else 
	For ($_l_Index; 1; $_l_SIzeofArray)
		MOD_al_ModuleAccessStatus{$_l_Index}:=1
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStartup_Export.Variable5"; $_t_oldMethodName)
