If (False:C215)
	//object Name: [COMPANIES]dStartup_Export.Variable6
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
	C_TEXT:C284($_t_oldMethodName; $_t_String)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStartup_Export.Variable6"; Form event code:C388)
SET CHANNEL:C77(10; "")
If (OK=1)
	$_l_SIzeofArray:=Size of array:C274(MOD_al_ModuleAccessStatus)
	For ($_l_Index; 1; $_l_SIzeofArray)
		RECEIVE PACKET:C104($_t_String; Char:C90(13))
		MOD_al_ModuleAccessStatus{$_l_Index}:=Num:C11($_t_String)
	End for 
	SET CHANNEL:C77(11)
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStartup_Export.Variable6"; $_t_oldMethodName)
