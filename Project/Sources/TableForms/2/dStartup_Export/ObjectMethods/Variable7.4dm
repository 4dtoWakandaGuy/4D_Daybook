If (False:C215)
	//object Name: [COMPANIES]dStartup_Export.Variable7
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStartup_Export.Variable7"; Form event code:C388)
$_l_SIzeofArray:=Size of array:C274(MOD_al_ModuleAccessStatus)
For ($_l_Index; 1; $_l_SIzeofArray)
	MOD_al_ModuleAccessStatus{$_l_Index}:=0
End for 
If (Gen_Option)
	$_l_Index:=-1
Else 
	$_l_Index:=1
End if 
MOD_al_ModuleAccessStatus{3}:=$_l_Index
MOD_al_ModuleAccessStatus{4}:=$_l_Index
MOD_al_ModuleAccessStatus{5}:=$_l_Index
MOD_al_ModuleAccessStatus{6}:=$_l_Index
MOD_al_ModuleAccessStatus{8}:=$_l_Index
MOD_al_ModuleAccessStatus{10}:=$_l_Index
MOD_al_ModuleAccessStatus{13}:=$_l_Index
MOD_al_ModuleAccessStatus{14}:=$_l_Index
MOD_al_ModuleAccessStatus{15}:=$_l_Index
MOD_al_ModuleAccessStatus{31}:=$_l_Index
MOD_al_ModuleAccessStatus{32}:=$_l_Index
MOD_al_ModuleAccessStatus{33}:=$_l_Index
MOD_al_ModuleAccessStatus{35}:=$_l_Index
MOD_al_ModuleAccessStatus{36}:=$_l_Index
MOD_al_ModuleAccessStatus{54}:=$_l_Index
MOD_al_ModuleAccessStatus{59}:=$_l_Index
MOD_al_ModuleAccessStatus{60}:=$_l_Index
MOD_al_ModuleAccessStatus{61}:=$_l_Index
MOD_al_ModuleAccessStatus{65}:=$_l_Index
MOD_al_ModuleAccessStatus{71}:=$_l_Index
MOD_al_ModuleAccessStatus{73}:=$_l_Index
MOD_al_ModuleAccessStatus{74}:=$_l_Index
MOD_al_ModuleAccessStatus{75}:=$_l_Index
MOD_al_ModuleAccessStatus{76}:=$_l_Index
MOD_al_ModuleAccessStatus{84}:=$_l_Index
MOD_al_ModuleAccessStatus{87}:=$_l_Index
MOD_al_ModuleAccessStatus{90}:=$_l_Index
MOD_al_ModuleAccessStatus{91}:=$_l_Index
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStartup_Export.Variable7"; $_t_oldMethodName)
