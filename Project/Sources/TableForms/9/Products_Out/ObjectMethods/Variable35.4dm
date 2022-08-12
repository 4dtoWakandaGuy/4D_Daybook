
If (False:C215)
	//Form Name:      PRODUCTS.Products_Out.Variable35
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
	//C_UNKNOWN(vAnalysis)
	//C_UNKNOWN(vSales)
	//ARRAY TEXT(PRO_at_AnalysisNames;0)
	//ARRAY TEXT(PROD_at_AnalysisCodes;0)
	C_BOOLEAN:C305(PROD_bo_UnfilteredSetKnown)
	C_LONGINT:C283($_l_EditedTextLength; $_l_event; $_l_Index; cNAL; $_l_ArrayRow; $_l_EditedTextLength; $_l_event; $_l_Index; PROD_l_SetID)
	C_TEXT:C284($_t_Keystroke; $_t_oldMethodName; vAnalysis; vSales; $_t_EditedText; $_t_Keystroke; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_Out.Variable35"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		If (cNAL=0)
			$_t_Keystroke:=Keystroke:C390
			$_t_EditedText:=Get edited text:C655
			If ((Character code:C91($_t_Keystroke)#Backspace:K15:36) & (Length:C16($_t_EditedText)>1))
				If (Character code:C91($_t_EditedText[[Length:C16($_t_EditedText)]])#64)
					$_l_ArrayRow:=Find in array:C230(PROD_at_AnalysisCodes; $_t_EditedText)
					$_l_EditedTextLength:=Length:C16($_t_EditedText)
					If ($_l_ArrayRow<0)
						$_l_ArrayRow:=Find in array:C230(PRO_at_AnalysisNames; $_t_EditedText)
						If ($_l_ArrayRow<0)
							For ($_l_Index; 1; Size of array:C274(PROD_at_AnalysisCodes))
								If (Position:C15($_t_EditedText; PROD_at_AnalysisCodes{$_l_Index})=1)
									$_l_ArrayRow:=$_l_Index
									$_l_Index:=99999
								End if 
							End for 
							If ($_l_ArrayRow<0)
								For ($_l_Index; 1; Size of array:C274(PRO_at_AnalysisNames))
									If (Position:C15($_t_EditedText; (PRO_at_AnalysisNames{$_l_Index}))=1)
										$_l_ArrayRow:=$_l_Index
										$_l_Index:=99999
									End if 
								End for 
								
							End if 
						End if 
					End if 
					If ($_l_ArrayRow>0)
						Self:C308->:=PROD_at_AnalysisCodes{$_l_ArrayRow}
						HIGHLIGHT TEXT:C210(Self:C308->; $_l_EditedTextLength+1; Length:C16(vSales)+1)
					End if 
				End if 
			End if 
		Else 
			Self:C308->:=Get edited text:C655
		End if 
		If (Not:C34(PROD_bo_UnfilteredSetKnown))
			//Remember the current selection
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
			
		Else 
			USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
		End if 
		
		SRCH_Applyfilterstoselection(->[PRODUCTS:9])
		
		
		
	: ($_l_event=On Data Change:K2:15)
		//$_t_oldMethodName:=ERR_MethodTracker ("OBJ [PRODUCTS].Products_Out.Variable35";Form event)
		If (cNAL=0)
			
			Check_MinorNC(->vAnalysis; ""; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis")
		End if 
		If (Not:C34(PROD_bo_UnfilteredSetKnown))
			//Remember the current selection
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
			
		Else 
			USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
		End if 
		
		SRCH_Applyfilterstoselection(->[PRODUCTS:9])
		
		
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_Out.Variable35"; $_t_oldMethodName)
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_Out.Variable35"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		If (cNAL=0)
			$_t_Keystroke:=Keystroke:C390
			$_t_EditedText:=Get edited text:C655
			If ((Character code:C91($_t_Keystroke)#Backspace:K15:36) & (Length:C16($_t_EditedText)>1))
				If (Character code:C91($_t_EditedText[[Length:C16($_t_EditedText)]])#64)
					$_l_ArrayRow:=Find in array:C230(PROD_at_AnalysisCodes; $_t_EditedText)
					$_l_EditedTextLength:=Length:C16($_t_EditedText)
					If ($_l_ArrayRow<0)
						$_l_ArrayRow:=Find in array:C230(PRO_at_AnalysisNames; $_t_EditedText)
						If ($_l_ArrayRow<0)
							For ($_l_Index; 1; Size of array:C274(PROD_at_AnalysisCodes))
								If (Position:C15($_t_EditedText; PROD_at_AnalysisCodes{$_l_Index})=1)
									$_l_ArrayRow:=$_l_Index
									$_l_Index:=99999
								End if 
							End for 
							If ($_l_ArrayRow<0)
								For ($_l_Index; 1; Size of array:C274(PRO_at_AnalysisNames))
									If (Position:C15($_t_EditedText; (PRO_at_AnalysisNames{$_l_Index}))=1)
										$_l_ArrayRow:=$_l_Index
										$_l_Index:=99999
									End if 
								End for 
								
							End if 
						End if 
					End if 
					If ($_l_ArrayRow>0)
						Self:C308->:=PROD_at_AnalysisCodes{$_l_ArrayRow}
						HIGHLIGHT TEXT:C210(Self:C308->; $_l_EditedTextLength+1; Length:C16(vSales)+1)
					End if 
				End if 
			End if 
		Else 
			Self:C308->:=Get edited text:C655
		End if 
		If (Not:C34(PROD_bo_UnfilteredSetKnown))
			//Remember the current selection
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
			
		Else 
			USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
		End if 
		
		SRCH_Applyfilterstoselection(->[PRODUCTS:9])
		
		
		
	: ($_l_event=On Data Change:K2:15)
		//
		If (cNAL=0)
			
			Check_MinorNC(->vAnalysis; ""; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis")
		End if 
		If (Not:C34(PROD_bo_UnfilteredSetKnown))
			//Remember the current selection
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
			
		Else 
			USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
		End if 
		
		SRCH_Applyfilterstoselection(->[PRODUCTS:9])
		
		
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_Out.Variable35"; $_t_oldMethodName)
