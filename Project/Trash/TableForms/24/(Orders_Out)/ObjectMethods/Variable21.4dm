
If (False:C215)
	//Form Name:      ORDERS.Orders_Out.Variable21
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(cNAL)
	//C_UNKNOWN(VSource)
	//ARRAY TEXT(ORD_at_SourceCodes;0)
	//ARRAY TEXT(ORD_at_SourceNames;0)
	C_BOOLEAN:C305(ORD_bo_UnfilteredSetKnown)
	C_LONGINT:C283($_l_EditedTextLength; $_l_event; $_l_Index; cNAL; $_l_ArrayRow; $_l_EditedTextLength; $_l_event; $_l_Index; ORD_l_SetID)
	C_TEXT:C284($_t_Keystroke; $_t_oldMethodName; VSource; $_t_EditedText; $_t_Keystroke; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.Variable21"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		If (cNAL=0)
			
			$_t_Keystroke:=Keystroke:C390
			$_t_EditedText:=Get edited text:C655
			If ((Character code:C91($_t_Keystroke)#Backspace:K15:36) & (Length:C16($_t_EditedText)>0))
				If (Character code:C91($_t_EditedText[[Length:C16($_t_EditedText)]])#64)
					$_l_ArrayRow:=Find in array:C230(ORD_at_SourceCodes; $_t_EditedText)
					$_l_EditedTextLength:=Length:C16($_t_EditedText)
					If ($_l_ArrayRow<0)
						$_l_ArrayRow:=Find in array:C230(ORD_at_SourceNames; $_t_EditedText)
						If ($_l_ArrayRow<0)
							For ($_l_Index; 1; Size of array:C274(ORD_at_SourceCodes))
								If (Position:C15($_t_EditedText; ORD_at_SourceCodes{$_l_Index})=1)
									$_l_ArrayRow:=$_l_Index
									$_l_Index:=99999
								End if 
							End for 
							If ($_l_ArrayRow<0)
								For ($_l_Index; 1; Size of array:C274(ORD_at_SourceNames))
									If (Position:C15($_t_EditedText; ORD_at_SourceNames{$_l_Index})=1)
										$_l_ArrayRow:=$_l_Index
										$_l_Index:=99999
									End if 
								End for 
								
							End if 
						End if 
					End if 
					If ($_l_ArrayRow>0)
						VSource:=ORD_at_SourceCodes{$_l_ArrayRow}
						HIGHLIGHT TEXT:C210(VSource; $_l_EditedTextLength+1; Length:C16(VSource)+1)
					End if 
				End if 
			End if 
		Else 
			Vsource:=Get edited text:C655
		End if 
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
		
		
		
	: ($_l_event=On Data Change:K2:15)
		//$_t_oldMethodName:=ERR_MethodTracker ("OBJ [ORDERS].Orders_Out.Variable21";Form event)
		If (cNAL=0)
			Check_MinorNC(->vSource; ""; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Source"; "4")
		End if 
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
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.Variable21"; $_t_oldMethodName)
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.Variable21"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		If (cNAL=0)
			
			$_t_Keystroke:=Keystroke:C390
			$_t_EditedText:=Get edited text:C655
			If ((Character code:C91($_t_Keystroke)#Backspace:K15:36) & (Length:C16($_t_EditedText)>0))
				If (Character code:C91($_t_EditedText[[Length:C16($_t_EditedText)]])#64)
					$_l_ArrayRow:=Find in array:C230(ORD_at_SourceCodes; $_t_EditedText)
					$_l_EditedTextLength:=Length:C16($_t_EditedText)
					If ($_l_ArrayRow<0)
						$_l_ArrayRow:=Find in array:C230(ORD_at_SourceNames; $_t_EditedText)
						If ($_l_ArrayRow<0)
							For ($_l_Index; 1; Size of array:C274(ORD_at_SourceCodes))
								If (Position:C15($_t_EditedText; ORD_at_SourceCodes{$_l_Index})=1)
									$_l_ArrayRow:=$_l_Index
									$_l_Index:=99999
								End if 
							End for 
							If ($_l_ArrayRow<0)
								For ($_l_Index; 1; Size of array:C274(ORD_at_SourceNames))
									If (Position:C15($_t_EditedText; ORD_at_SourceNames{$_l_Index})=1)
										$_l_ArrayRow:=$_l_Index
										$_l_Index:=99999
									End if 
								End for 
								
							End if 
						End if 
					End if 
					If ($_l_ArrayRow>0)
						VSource:=ORD_at_SourceCodes{$_l_ArrayRow}
						HIGHLIGHT TEXT:C210(VSource; $_l_EditedTextLength+1; Length:C16(VSource)+1)
					End if 
				End if 
			End if 
		Else 
			Vsource:=Get edited text:C655
		End if 
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
		
		
		
	: ($_l_event=On Data Change:K2:15)
		//
		If (cNAL=0)
			Check_MinorNC(->vSource; ""; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Source"; "4")
		End if 
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
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.Variable21"; $_t_oldMethodName)
