If (False:C215)
	//object Name: [ORDERS]Orders_Out.Variable31
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ORD_bo_UnfilteredSetKnown)
	C_DATE:C307($_d_EnteredDate)
	C_LONGINT:C283($_l_Dayof; $_l_event; $_l_MonthOf; $_l_TextLength; $_l_Year; $_l_CharacterPosition; $_l_Dayof; $_l_event; $_l_MonthOf; $_l_TextLength; $_l_Year)
	C_LONGINT:C283(ORD_l_SetID)
	C_TEXT:C284($_t_oldMethodName; $_t_Substring; $_t_EditedText; $_t_oldMethodName; $_t_Substring)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.Variable31"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		$_t_EditedText:=Get edited text:C655
		$_l_TextLength:=Length:C16($_t_EditedText)
		$_l_CharacterPosition:=Position:C15("/"; $_t_EditedText)
		If ($_l_CharacterPosition>0)
			$_t_Substring:=Substring:C12($_t_EditedText; $_l_CharacterPosition+1; Length:C16($_t_EditedText))
			$_l_CharacterPosition:=Position:C15("/"; $_t_Substring)
			If ($_l_CharacterPosition>0)
				$_t_Substring:=Substring:C12($_t_Substring; $_l_CharacterPosition+1; Length:C16($_t_EditedText))
				
				If (Length:C16($_t_Substring)=4) | (Length:C16($_t_Substring)=2)
					$_d_EnteredDate:=Date:C102($_t_EditedText)
					$_l_Year:=Year of:C25($_d_EnteredDate)
					
					$_l_MonthOf:=Month of:C24($_d_EnteredDate)
					$_l_Dayof:=Day of:C23($_d_EnteredDate)
					If ($_l_Dayof>0) & ($_l_MonthOf>0) & ($_l_Year>1985) & ($_l_Year<=Year of:C25(Current date:C33(*)))
						Self:C308->:=$_d_EnteredDate
						HIGHLIGHT TEXT:C210(Self:C308->; $_l_TextLength+1; Length:C16(String:C10(Self:C308->))+1)
						If (Not:C34(ORD_bo_UnfilteredSetKnown))
							//Remember the current selection
							ORD_l_SetID:=0
							ORD_l_SetID:=AA_GetNextID(->ORD_l_SetID)
							CREATE SET:C116([ORDERS:24]; "OrdSelection"+String:C10(ORD_l_SetID))
							ORD_bo_UnfilteredSetKnown:=True:C214
							
						Else 
							USE SET:C118("OrdSelection"+String:C10(ORD_l_SetID))
						End if 
						
						SRCH_Applyfilterstoselection(->[ORDERS:24])
					End if 
				End if 
			End if 
		End if 
	: ($_l_event=On Data Change:K2:15)
		If (Not:C34(ORD_bo_UnfilteredSetKnown))
			//Remember the current selection
			ORD_l_SetID:=0
			ORD_l_SetID:=AA_GetNextID(->ORD_l_SetID)
			CREATE SET:C116([ORDERS:24]; "OrdSelection"+String:C10(ORD_l_SetID))
			ORD_bo_UnfilteredSetKnown:=True:C214
			
		Else 
			USE SET:C118("OrdSelection"+String:C10(ORD_l_SetID))
		End if 
		
		SRCH_Applyfilterstoselection(->[ORDERS:24])
		
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.Variable31"; $_t_oldMethodName)
