//%attributes = {}

//Database Method Name:      CHANGE_TYPE
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  26/10/2017
//Created BY:  DefaultUser
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	C_BOOLEAN:C305($_bo_Exit)
	C_LONGINT:C283($_l_CurrentForm; $_l_CurrentFormNumber; $_l_CurrentTable; $_l_Index; $_l_Index2; $_l_isTableValid; $_l_LastTableNumber; $_l_Length; $_l_Position)
	C_POINTER:C301($_Ptr_ptrTablePointer)
	C_TEXT:C284($_t_indexString; $_T_MethodCode)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CHANGE_TYPE")

If (True:C214)
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	METHOD GET PATHS:C1163(Path database method:K72:2; $_at_MethodPaths; *)
	For ($_l_Index; 1; Size of array:C274($_at_MethodPaths))
		METHOD GET CODE:C1190($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
		$_l_Length:=Length:C16("comment added and reserved by 4D.")
		$_l_Position:=Position:C15("comment added and reserved by 4D."; $_T_MethodCode)
		If ($_l_Position>0)
			$_T_MethodCode:=Substring:C12($_T_MethodCode; $_l_Position+$_l_Length+3)
		End if 
		$_bo_Exit:=False:C215
		Repeat 
			If ($_T_MethodCode#"")
				If ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(13)) | ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(10))
					$_T_MethodCode:=Substring:C12($_T_MethodCode; 1; Length:C16($_T_MethodCode)-1)
					
				Else 
					$_bo_Exit:=True:C214
				End if 
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit)
		
		
		For ($_l_index2; 255; 1; -1)
			$_t_indexString:=String:C10($_l_Index2)
			
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_STRING("+$_t_indexString+";"; "C_TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"Array String("+$_t_indexString+";"; "ARRAY TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_INTEGER("+$_t_indexString+";"; "C_LONGINT(")
			
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"ARRAY INTEGER("+$_t_indexString+";"; "ARRAY LONGINT(")
			
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_STRING("+$_t_indexString+";"; "C_TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "Array String("+$_t_indexString+";"; "ARRAY TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_INTEGER("+$_t_indexString+";"; "C_INTEGER(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "ARRAY INTEGER("+$_t_indexString+";"; "ARRAY INTEGER(")
			
		End for 
		METHOD SET CODE:C1194($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
		
	End for 
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	METHOD GET PATHS:C1163(Path project method:K72:1; $_at_MethodPaths; *)
	For ($_l_Index; 1; Size of array:C274($_at_MethodPaths))
		If ($_at_MethodPaths{$_l_Index}#"CHANGE_TYPE")
			METHOD GET CODE:C1190($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
			$_l_Length:=Length:C16("comment added and reserved by 4D.")
			$_l_Position:=Position:C15("comment added and reserved by 4D."; $_T_MethodCode)
			If ($_l_Position>0)
				$_T_MethodCode:=Substring:C12($_T_MethodCode; $_l_Position+$_l_Length+1)
			End if 
			$_bo_Exit:=False:C215
			Repeat 
				If ($_T_MethodCode#"")
					If ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(13)) | ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(10))
						$_T_MethodCode:=Substring:C12($_T_MethodCode; 1; Length:C16($_T_MethodCode)-1)
						
					Else 
						$_bo_Exit:=True:C214
					End if 
				Else 
					$_bo_Exit:=True:C214
				End if 
			Until ($_bo_Exit)
			
			For ($_l_index2; 255; 1; -1)
				$_t_indexString:=String:C10($_l_Index2)
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_STRING("+$_t_indexString+";"; "C_TEXT(")
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"Array String("+$_t_indexString+";"; "ARRAY TEXT(")
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_INTEGER("+$_t_indexString+";"; "C_LONGINT(")
				
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"ARRAY INTEGER("+$_t_indexString+";"; "ARRAY LONGINT(")
				
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_STRING("+$_t_indexString+";"; "C_TEXT(")
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "Array String("+$_t_indexString+";"; "ARRAY TEXT(")
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_INTEGER("+$_t_indexString+";"; "C_INTEGER(")
				$_T_MethodCode:=Replace string:C233($_T_MethodCode; "ARRAY INTEGER("+$_t_indexString+";"; "ARRAY INTEGER(")
				
				
			End for 
			METHOD SET CODE:C1194($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
		End if 
		
	End for 
End if 
ARRAY TEXT:C222($_at_MethodPaths; 0)
FORM GET NAMES:C1167($_at_FormNames; *)

///

//TRACE

///
For ($_l_CurrentForm; 1; Size of array:C274($_at_FormNames))
	METHOD GET PATHS FORM:C1168($_at_MethodPaths; $_at_FormNames{$_l_CurrentForm}; *)
	
	
	For ($_l_Index; 1; Size of array:C274($_at_MethodPaths))
		METHOD GET CODE:C1190($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
		$_l_Length:=Length:C16("comment added and reserved by 4D.")
		$_l_Position:=Position:C15("comment added and reserved by 4D."; $_T_MethodCode)
		If ($_l_Position>0)
			$_T_MethodCode:=Substring:C12($_T_MethodCode; $_l_Position+$_l_Length+1)
		End if 
		$_bo_Exit:=False:C215
		Repeat 
			If ($_T_MethodCode#"")
				If ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(13)) | ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(10))
					$_T_MethodCode:=Substring:C12($_T_MethodCode; 1; Length:C16($_T_MethodCode)-1)
					
				Else 
					$_bo_Exit:=True:C214
				End if 
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit)
		
		
		For ($_l_index2; 255; 1; -1)
			$_t_indexString:=String:C10($_l_Index2)
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_STRING("+$_t_indexString+";"; "C_TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"Array String("+$_t_indexString+";"; "ARRAY TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_INTEGER("+$_t_indexString+";"; "C_LONGINT(")
			
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"ARRAY INTEGER("+$_t_indexString+";"; "ARRAY LONGINT(")
			
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_STRING("+$_t_indexString+";"; "C_TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "Array String("+$_t_indexString+";"; "ARRAY TEXT(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_INTEGER("+$_t_indexString+";"; "C_INTEGER(")
			$_T_MethodCode:=Replace string:C233($_T_MethodCode; "ARRAY INTEGER("+$_t_indexString+";"; "ARRAY INTEGER(")
			
			
		End for 
		METHOD SET CODE:C1194($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
		
		
	End for 
End for 
///this can only work if you pass the pointers@
//$_l_LastTableNumber:=Get last table number
$_l_LastTableNumber:=Get last table number:C254

//$_l_LastTableNumber:=Size of array($_ptr_TablePointers->)

For ($_l_CurrentTable; 1; $_l_LastTableNumber)
	$_l_isTableValid:=0
	If (Is table number valid:C999($_l_CurrentTable))
		
		
		
		ARRAY TEXT:C222($_at_FormNames; 0)
		$_Ptr_ptrTablePointer:=Table:C252($_l_CurrentTable)
		//$_Ptr_ptrTablePointer:=$_ptr_TablePointers->{$_l_CurrentTable}
		FORM GET NAMES:C1167($_Ptr_ptrTablePointer->; $_at_FormNames; *)
		For ($_l_CurrentFormNumber; 1; Size of array:C274($_at_FormNames))
			ARRAY TEXT:C222($_at_MethodPaths; 0)
			METHOD GET PATHS FORM:C1168($_Ptr_ptrTablePointer->; $_at_MethodPaths; $_at_FormNames{$_l_CurrentFormNumber}; *)
			For ($_l_Index; 1; Size of array:C274($_at_MethodPaths))
				METHOD GET CODE:C1190($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
				$_l_Length:=Length:C16("comment added and reserved by 4D.")
				$_l_Position:=Position:C15("comment added and reserved by 4D."; $_T_MethodCode)
				If ($_l_Position>0)
					$_T_MethodCode:=Substring:C12($_T_MethodCode; $_l_Position+$_l_Length+1)
				End if 
				$_bo_Exit:=False:C215
				Repeat 
					If ($_T_MethodCode#"")
						If ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(13)) | ($_T_MethodCode[[Length:C16($_t_methodCode)]]=Char:C90(10))
							$_T_MethodCode:=Substring:C12($_T_MethodCode; 1; Length:C16($_T_MethodCode)-1)
							
						Else 
							$_bo_Exit:=True:C214
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Until ($_bo_Exit)
				
				
				For ($_l_index2; 255; 1; -1)
					$_t_indexString:=String:C10($_l_Index2)
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_STRING("+$_t_indexString+";"; "C_TEXT(")
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"Array String("+$_t_indexString+";"; "ARRAY TEXT(")
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"C_INTEGER("+$_t_indexString+";"; "C_LONGINT(")
					
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "_o_"+"ARRAY INTEGER("+$_t_indexString+";"; "ARRAY LONGINT(")
					
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_STRING("+$_t_indexString+";"; "C_TEXT(")
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "Array String("+$_t_indexString+";"; "ARRAY TEXT(")
					
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "C_INTEGER("+$_t_indexString+";"; "C_INTEGER(")
					$_T_MethodCode:=Replace string:C233($_T_MethodCode; "ARRAY INTEGER("+$_t_indexString+";"; "ARRAY INTEGER(")
					
					
				End for 
				METHOD SET CODE:C1194($_at_MethodPaths{$_l_Index}; $_T_MethodCode)
				
				
			End for 
		End for 
	End if 
End for 
ERR_MethodTrackerReturn("CHANGE_TYPE"; $_t_oldMethodName)