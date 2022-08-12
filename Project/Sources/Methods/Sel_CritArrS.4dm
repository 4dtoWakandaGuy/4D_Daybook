//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_CritArrS
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
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_LONGINT:C283($_l_Index; $_l_SIzeofArray; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Tab; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_CritArrS")
//Sel_CritArrS
$_t_Tab:=Char:C90(9)
$_l_SIzeofArray:=Size of array:C274(SYS_at_RecordStateNames)
For ($_l_Index; 1; $_l_SIzeofArray)
	vT:=vT+SYS_at_RecordStateNames{$_l_Index}+$_t_Tab+String:C10(MOD_al_ModuleAccessStatus{$_l_Index})+$_t_Tab
End for 
vT:=vT+"*END"+$_t_Tab
ERR_MethodTrackerReturn("Sel_CritArrS"; $_t_oldMethodName)
