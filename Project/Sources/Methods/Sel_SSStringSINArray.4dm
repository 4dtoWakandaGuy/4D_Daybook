//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SSStringSINArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/08/2012 19:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_First)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_Value; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SSStringSINArray")
MESSAGES OFF:C175
If (Not:C34(Is nil pointer:C315($3)))
	$_bo_First:=True:C214
	Master_UseSS($1)
	For ($_l_Index; 1; Size of array:C274($3->))
		If ($3->{$_l_Index})
			$_t_Value:=$4->{$_l_Index}
			
			$_t_Value:=Str_StripDel($_t_Value)
			If ($_t_Value#"")
				$_t_Value:=Sel_AtOp($_t_Value; "=")
				
				If ($_bo_First)
					QUERY SELECTION:C341($1->; $2->; vRec; $_t_Value; *)
					$_bo_First:=False:C215
				Else 
					QUERY SELECTION:C341($1->;  | ; $2->; vRec; $_t_Value; *)
				End if 
				
				
			End if 
			
		End if 
	End for 
	If (Not:C34($_bo_First))  //at least one line true
		QUERY:C277($1->)
		Master2($1)
	End if 
	MESSAGES ON:C181
	
End if 
ERR_MethodTrackerReturn("Sel_SSStringSINArray"; $_t_oldMethodName)
