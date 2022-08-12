If (False:C215)
	//object Name: [MOVEMENT_TYPES]MoveType_in.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/07/2011 18:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [MOVEMENT_TYPES].MoveType_in.Variable4"; Form event code:C388)
If (ch1=1)
	If ([MOVEMENT_TYPES:60]MN_Identifier_Number:24=0)
		Gen_Confirm("Are you sure that you want to convert the "+[MOVEMENT_TYPES:60]Number_Name:5+" Unique No sequence"+" to the 'Multiple Numbers' method?"; "Yes"; "No")
		If (OK=1)
			If (False:C215)
				MESSAGES OFF:C175
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>999; *)
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<2000)
				If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
					ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1; >)
					LAST RECORD:C200([IDENTIFIERS_MULTI_NUMBERS:94])
					[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+1
				Else 
					[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=1000
				End if 
				MESSAGES ON:C181
			End if 
			[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=AA_GetNextID(->[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
		Else 
			ch1:=0
		End if 
	End if 
Else 
	If ([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)
		Gen_Confirm("Are you sure that you want to convert the "+[MOVEMENT_TYPES:60]Number_Name:5+" Unique No sequence"+" back to the standard method?"; "Yes"; "No")
		If (OK=1)
			[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
		Else 
			ch1:=1
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [MOVEMENT_TYPES].MoveType_in.Variable4"; $_t_oldMethodName)
