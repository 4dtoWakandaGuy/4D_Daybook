//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_StatePosNeg
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
	C_LONGINT:C283($_l_Index; $_l_SIzeofArray; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_StatePosNeg")
//Sel_StatePosNeg
$0:=0
$_l_SIzeofArray:=Size of array:C274(SYS_at_RecordStateNames)
For ($_l_Index; 1; $_l_SIzeofArray)
	If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
		$0:=1
	Else 
		If (($0=0) & (MOD_al_ModuleAccessStatus{$_l_Index}=-1))
			$0:=-1
		End if 
	End if 
End for 
ERR_MethodTrackerReturn("Sel_StatePosNeg"; $_t_oldMethodName)
