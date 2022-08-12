//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_State
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
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_Found)
	C_LONGINT:C283($_l_Index; $_l_Positive; $_l_SizeofArray; $_l_TableNumber)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_StateCodesCombined; $_t_TableStateCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_State")
//Sel_State
$_l_Positive:=0
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
$_l_SizeofArray:=Size of array:C274(SYS_at_RecordStateNames)
For ($_l_Index; 1; $_l_SizeofArray)
	If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
		$_l_Positive:=1
	Else 
		If (($_l_Positive=0) & (MOD_al_ModuleAccessStatus{$_l_Index}=-1))
			$_l_Positive:=-1
		End if 
	End if 
End for 
$_l_TableNumber:=Table:C252($1)
$_t_TableStateCode:=("0"*(3-Length:C16(String:C10($_l_TableNumber))))+String:C10($_l_TableNumber)
If ($_l_Positive#0)
	$_bo_Found:=True:C214
	If ($_l_Positive=1)
		For ($_l_Index; 1; $_l_SizeofArray)
			If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
				$_t_StateCodesCombined:=$_t_TableStateCode+<>SYS_at_RecStateCodes{$_l_TableNumber}{$_l_Index}
				If ($_bo_Found)
					QUERY:C277($1->; $2->=$_t_StateCodesCombined; *)
					$_bo_Found:=False:C215
				Else 
					QUERY:C277($1->;  | ; $2->=$_t_StateCodesCombined; *)
				End if 
			End if 
		End for 
	Else 
		For ($_l_Index; 1; $_l_SizeofArray)
			If (MOD_al_ModuleAccessStatus{$_l_Index}=-1)
				$_t_StateCodesCombined:=$_t_TableStateCode+<>SYS_at_RecStateCodes{$_l_TableNumber}{$_l_Index}
				If ($_bo_Found)
					QUERY:C277($1->; $2->#$_t_StateCodesCombined; *)
					$_bo_Found:=False:C215
				Else 
					QUERY:C277($1->;  & ; $2->#$_t_StateCodesCombined; *)
				End if 
			End if 
		End for 
	End if 
	QUERY:C277($1->)
	Master2($1)
	
End if 
ERR_MethodTrackerReturn("Sel_State"; $_t_oldMethodName)
