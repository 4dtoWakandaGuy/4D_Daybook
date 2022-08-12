//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_CritArrL
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
	C_LONGINT:C283($_l_SIzeofArray; $_l_StateRow; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_StateName; $_t_Tab; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_CritArrL")
//Sel_CritArrL
$_t_Tab:=Char:C90(9)
$_l_SIzeofArray:=Size of array:C274(SYS_at_RecordStateNames)
$_t_StateName:=First_Field(->vT; $_t_Tab)
$_l_StateRow:=Find in array:C230(SYS_at_RecordStateNames; $_t_StateName)
While ($_l_StateRow>0)
	MOD_al_ModuleAccessStatus{$_l_StateRow}:=Num:C11(First_Field(->vT; $_t_Tab))
	$_t_StateName:=First_Field(->vT; $_t_Tab)
	$_l_StateRow:=Find in array:C230(SYS_at_RecordStateNames; $_t_StateName)
End while 
ERR_MethodTrackerReturn("Sel_CritArrL"; $_t_oldMethodName)
