If (False:C215)
	//object Name: [USER]User_In.oAddPriority
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SVS_lb_CallPriorities;0)
	//ARRAY LONGINT(SVS_al_PriorityNumbers;0)
	//ARRAY TEXT(SVS_at_priorityNames;0)
	C_LONGINT:C283($_l_ArraySize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oAddPriority"; Form event code:C388)

$_l_ArraySize:=Size of array:C274(SVS_al_PriorityNumbers)
If (SVS_at_priorityNames{$_l_ArraySize}#"")
	LISTBOX INSERT ROWS:C913(SVS_lb_CallPriorities; $_l_ArraySize+1)
	SVS_al_PriorityNumbers{$_l_ArraySize+1}:=SVS_al_PriorityNumbers{$_l_ArraySize}+1
	EDIT ITEM:C870(SVS_at_priorityNames; $_l_ArraySize+1)
Else 
	EDIT ITEM:C870(SVS_at_priorityNames; $_l_ArraySize)
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oAddPriority"; $_t_oldMethodName)
