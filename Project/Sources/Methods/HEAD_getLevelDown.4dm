//%attributes = {}

If (False:C215)
	//Database Method Name:      HEAD_getLevelDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/07/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_NONLPOSTINGS;0)
	//ARRAY INTEGER(ACC_ai_HeadingLevel;0)
	//ARRAY LONGINT(AAC_al_UsedACCS;0)
	//ARRAY LONGINT(AAC_al_UsedHEADS;0)
	//ARRAY LONGINT(ACC_al_AccCodeRef;0)
	//ARRAY LONGINT(ACC_al_AccHeadingRef;0)
	//ARRAY REAL(ACC_ar_AccountBalances;0)
	//ARRAY REAL(ACC_ar_Group1Totals;0)
	//ARRAY REAL(ACC_ar_Group2Totals;0)
	//ARRAY REAL(ACC_ar_Group3Totals;0)
	//ARRAY REAL(ACC_ar_Group4Totals;0)
	ARRAY TEXT:C222($_at_AccountCodes; 0)
	ARRAY TEXT:C222($_at_AdditionalHeaders; 0)
	ARRAY TEXT:C222($_at_CodesThisLevel; 0)
	ARRAY TEXT:C222($_at_CodesThisLevel2; 0)
	ARRAY TEXT:C222($_at_CreatedPseudoHeadings; 0)
	ARRAY TEXT:C222($_at_HeadingCodes; 0)
	ARRAY TEXT:C222($_at_MissingAccountCodes; 0)
	ARRAY TEXT:C222($_at_ParentCodes; 0)
	//ARRAY TEXT(ACC_at_AccountCodes;0)
	//ARRAY TEXT(ACC_at_AccountName;0)
	//ARRAY TEXT(ACC_AT_analysis;0)
	//ARRAY TEXT(ACC_at_Group1;0)
	//ARRAY TEXT(ACC_at_Group1Codes;0)
	//ARRAY TEXT(ACC_at_Group2;0)
	//ARRAY TEXT(ACC_at_Group2Codes;0)
	//ARRAY TEXT(ACC_at_Group3;0)
	//ARRAY TEXT(ACC_at_Group3Codes;0)
	//ARRAY TEXT(ACC_at_Group4;0)
	//ARRAY TEXT(ACC_at_Group4Codes;0)
	//ARRAY TEXT(ACC_at_GroupCode;0)
	//ARRAY TEXT(ACC_at_GroupHeading;0)
	//ARRAY TEXT(ACC_at_HeadingCode;0)
	//ARRAY TEXT(ACC_at_HeadingNames;0)
	//ARRAY TEXT(ACC_at_IO;0)
	//ARRAY TEXT(ACC_at_LevelUpCode;0)
	//ARRAY TEXT(ACC_at_PLB;0)
	//ARRAY TEXT(ACC_at_RelatedAccountCodes;0)
	//ARRAY TEXT(ACC_at_ReportHeading;0)
	C_BOOLEAN:C305($_bo_NoMoreLevels; $_bo_ShowAnalysis; $_bo_ShowLayers; Head_bo_GroupsLoaded)
	C_LONGINT:C283($_l_AccountCodeIndex; $_l_ArraySize; $_l_BuildHeadings; $_l_CallBackProcess; $_l_CurrentLevel; $_l_CurrentRow; $_l_CurrentRowIndex; $_l_element; $_l_Group4Index; $_l_GroupIndex; $_l_HeaderRow)
	C_LONGINT:C283($_l_LevelIndex; $_l_MaxRows; $_l_MissingAccountRow; $_l_missingiAccountIndex; $_l_offset; $_l_SizeofArray; $_l_Sub1Count; $_l_Sub2Count; $_l_Sub3Count; $_l_Sub4Count; $1)
	C_LONGINT:C283(ACC_l_ACCCurrentLevel; ACC_l_AccListRef)
	C_OBJECT:C1216($_obj_AccGroups; Head_obj_HeadingDownData)
	C_POINTER:C301($_ptr_CurrentLevelCodePointer; $_ptr_CurrentLevelPointer; $_ptr_GroupArray; $_ptr_GroupCodeArray; $_ptr_GroupLevelArray; $_ptr_GroupLevelCodeArray; $_ptr_LevelTotalsArray)
	C_REAL:C285($_r_GrandTotal; $_r_Subtotal1; $_r_Subtotal2; $_r_Subtotal3; $_r_Subtotal4)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_Heading; $_t_HeadingCode; $_t_LevelupCode; $_t_oldMethodName; $_t_ParentCode; $2; ACC_t_Group1Level; ACC_t_Group2Level; ACC_t_OutputCurrency)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("HEAD_getLevelDown")
If (Count parameters:C259>=2)
	
	$_l_CallBackProcess:=$1
	$_t_HeadingCode:=$2
	ARRAY TEXT:C222(ACC_at_Group1; 0)
	ARRAY TEXT:C222(ACC_at_Group1Codes; 0)
	//ARRAY REAL(ACC_ar_Group1Totals;0)
	ARRAY TEXT:C222(ACC_at_Group2; 0)
	ARRAY TEXT:C222(ACC_at_Group2Codes; 0)
	//ARRAY REAL(ACC_ar_Group2Totals;0)
	ARRAY TEXT:C222(ACC_at_Group3; 0)
	ARRAY TEXT:C222(ACC_at_Group3Codes; 0)
	//ARRAY REAL(ACC_ar_Group3Totals;0)
	ARRAY TEXT:C222(ACC_at_Group4; 0)
	ARRAY TEXT:C222(ACC_at_Group4Codes; 0)
	//ARRAY REAL(ACC_ar_Group4Totals;0)
	//ALL RECORDS([ACCOUNTS])
	ARRAY TEXT:C222($_at_HeadingCodes; 0)
	//TRACE
	// QUERY([HEADINGS];[HEADINGS]Heading_Code=$_t_HeadingCode)
	//$_t_LevelupCode:=[HEADINGS]Level_Up_Code
	QUERY:C277([HEADINGS:84]; [HEADINGS:84]Group_Code:5=$_t_HeadingCode; *)
	QUERY:C277([HEADINGS:84];  | ; [HEADINGS:84]Level_Up_Code:4=$_t_HeadingCode)
	If (Records in selection:C76([HEADINGS:84])>0)
		SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_CodesThisLevel)
		For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel))
			If ($_at_CodesThisLevel{$_l_BuildHeadings}#"")
				APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel{$_l_BuildHeadings})
			End if 
		End for 
		SELECTION TO ARRAY:C260([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel2)
		For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel2))
			If ($_at_CodesThisLevel2{$_l_BuildHeadings}#"")
				APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
				APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
			End if 
		End for 
		QUERY WITH ARRAY:C644([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel)
		CREATE SET:C116([HEADINGS:84]; "$Set1")
		QUERY WITH ARRAY:C644([HEADINGS:84]Level_Up_Code:4; $_at_CodesThisLevel)
		CREATE SET:C116([HEADINGS:84]; "$Set2")
		UNION:C120("$Set1"; "$Set2"; "$Set1")
		USE SET:C118("$Set1")
		
		If (Records in selection:C76([HEADINGS:84])>0)
			SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_CodesThisLevel)
			For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel))
				If ($_at_CodesThisLevel{$_l_BuildHeadings}#"")
					APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel{$_l_BuildHeadings})
				End if 
			End for 
			SELECTION TO ARRAY:C260([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel2)
			For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel2))
				If ($_at_CodesThisLevel2{$_l_BuildHeadings}#"")
					APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
					APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
				End if 
			End for 
			
			QUERY WITH ARRAY:C644([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel)
			CREATE SET:C116([HEADINGS:84]; "$Set1")
			QUERY WITH ARRAY:C644([HEADINGS:84]Level_Up_Code:4; $_at_CodesThisLevel)
			CREATE SET:C116([HEADINGS:84]; "$Set2")
			UNION:C120("$Set1"; "$Set2"; "$Set1")
			USE SET:C118("$Set1")
			
			If (Records in selection:C76([HEADINGS:84])>0)
				SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_CodesThisLevel)
				For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel))
					If ($_at_CodesThisLevel{$_l_BuildHeadings}#"")
						APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel{$_l_BuildHeadings})
					End if 
				End for 
				SELECTION TO ARRAY:C260([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel2)
				For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel2))
					If ($_at_CodesThisLevel2{$_l_BuildHeadings}#"")
						APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
						APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
					End if 
				End for 
				QUERY WITH ARRAY:C644([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel)
				CREATE SET:C116([HEADINGS:84]; "$Set1")
				QUERY WITH ARRAY:C644([HEADINGS:84]Level_Up_Code:4; $_at_CodesThisLevel)
				CREATE SET:C116([HEADINGS:84]; "$Set2")
				UNION:C120("$Set1"; "$Set2"; "$Set1")
				USE SET:C118("$Set1")
				
				If (Records in selection:C76([HEADINGS:84])>0)
					SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_CodesThisLevel)
					For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel))
						If ($_at_CodesThisLevel{$_l_BuildHeadings}#"")
							APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel{$_l_BuildHeadings})
						End if 
					End for 
					SELECTION TO ARRAY:C260([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel2)
					For ($_l_BuildHeadings; 1; Size of array:C274($_at_CodesThisLevel2))
						If ($_at_CodesThisLevel2{$_l_BuildHeadings}#"")
							APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
							APPEND TO ARRAY:C911($_at_HeadingCodes; $_at_CodesThisLevel2{$_l_BuildHeadings})
						End if 
					End for 
					QUERY WITH ARRAY:C644([HEADINGS:84]Group_Code:5; $_at_CodesThisLevel)
					CREATE SET:C116([HEADINGS:84]; "$Set1")
					QUERY WITH ARRAY:C644([HEADINGS:84]Level_Up_Code:4; $_at_CodesThisLevel)
					CREATE SET:C116([HEADINGS:84]; "$Set2")
					UNION:C120("$Set1"; "$Set2"; "$Set1")
					USE SET:C118("$Set1")
					
				End if 
			End if 
		End if 
		QUERY WITH ARRAY:C644([ACCOUNTS:32]Report_Heading:1; $_at_HeadingCodes)
		CREATE SET:C116([ACCOUNTS:32]; "$Set1")
		QUERY WITH ARRAY:C644([ACCOUNTS:32]Group_Heading:6; $_at_HeadingCodes)
		CREATE SET:C116([ACCOUNTS:32]; "$Set2")
		UNION:C120("$Set1"; "$Set2"; "$Set1")
		USE SET:C118("$Set1")
		
	Else 
		QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=$_t_HeadingCode)
		CREATE SET:C116([ACCOUNTS:32]; "$Set1")
		QUERY WITH ARRAY:C644([ACCOUNTS:32]Group_Heading:6; $_at_HeadingCodes)
		CREATE SET:C116([ACCOUNTS:32]; "$Set2")
		UNION:C120("$Set1"; "$Set2"; "$Set1")
		USE SET:C118("$Set1")
		
	End if 
	If (False:C215)
		
		QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_HeadingCode)
		$_t_LevelupCode:=[HEADINGS:84]Level_Up_Code:4
		QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_LevelupCode)
		If (Records in selection:C76([HEADINGS:84])>0)
			//SELECTION TO ARRAY([HEADINGS]Heading_Code;$_at_CodesThisLevel)
			$_t_LevelupCode:=[HEADINGS:84]Level_Up_Code:4
			QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_LevelupCode)
			//For ($_l_BuildHeadings;1;Size of array($_at_CodesThisLevel))
			APPEND TO ARRAY:C911($_at_HeadingCodes; $_t_LevelupCode)
			//End for 
			//QUERY WITH ARRAY([HEADINGS]Level_Up_Code;$_at_CodesThisLevel)
			If (Records in selection:C76([HEADINGS:84])>0)
				//SELECTION TO ARRAY([HEADINGS]Heading_Code;$_at_CodesThisLevel)
				//For ($_l_BuildHeadings;1;Size of array($_at_CodesThisLevel))
				//APPEND TO ARRAY($_at_HeadingCodes;$_at_CodesThisLevel{$_l_BuildHeadings})
				//End for 
				$_t_LevelupCode:=[HEADINGS:84]Level_Up_Code:4
				QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_LevelupCode)
				APPEND TO ARRAY:C911($_at_HeadingCodes; $_t_LevelupCode)
				
				//QUERY WITH ARRAY([HEADINGS]Level_Up_Code;$_at_CodesThisLevel)
				If (Records in selection:C76([HEADINGS:84])>0)
					//SELECTION TO ARRAY([HEADINGS]Heading_Code;$_at_CodesThisLevel)
					//For ($_l_BuildHeadings;1;Size of array($_at_CodesThisLevel))
					//APPEND TO ARRAY($_at_HeadingCodes;$_at_CodesThisLevel{$_l_BuildHeadings})
					//End for 
					//QUERY WITH ARRAY([HEADINGS]Level_Up_Code;$_at_CodesThisLevel)
					$_t_LevelupCode:=[HEADINGS:84]Level_Up_Code:4
					QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_LevelupCode)
					APPEND TO ARRAY:C911($_at_HeadingCodes; $_t_LevelupCode)
					
					If (Records in selection:C76([HEADINGS:84])>0)
						//SELECTION TO ARRAY([HEADINGS]Heading_Code;$_at_CodesThisLevel)
						//F//or ($_l_BuildHeadings;1;Size of array($_at_CodesThisLevel))
						//APPEND TO ARRAY($_at_HeadingCodes;$_at_CodesThisLevel{$_l_BuildHeadings})
						//End for 
						$_t_LevelupCode:=[HEADINGS:84]Level_Up_Code:4
						QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_LevelupCode)
						APPEND TO ARRAY:C911($_at_HeadingCodes; $_t_LevelupCode)
						
					End if 
				End if 
			End if 
			QUERY WITH ARRAY:C644([ACCOUNTS:32]Report_Heading:1; $_at_HeadingCodes)
		Else 
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=$_t_HeadingCode)
			
		End if 
	End if 
	
	ARRAY LONGINT:C221(ACC_al_AccCodeRef; 0)
	ARRAY LONGINT:C221(AAC_al_UsedACCS; 0)
	SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_AccountCodes; [ACCOUNTS:32]Account_Name:3; ACC_at_AccountName; [ACCOUNTS:32]Group_Heading:6; ACC_at_GroupHeading; [ACCOUNTS:32]IO:5; ACC_at_IO; [ACCOUNTS:32]Report_Heading:1; ACC_at_ReportHeading; [ACCOUNTS:32]No_NL_Postings:9; ACC_abo_NONLPOSTINGS; [ACCOUNTS:32]PB:4; ACC_at_PLB)
	QUERY WITH ARRAY:C644([ACCOUNTS_ANALYSES:157]Account_Code:3; ACC_at_AccountCodes)
	ARRAY REAL:C219(ACC_ar_AccountBalances; 0)
	ARRAY REAL:C219(ACC_ar_AccountBalances; Size of array:C274(ACC_at_AccountCodes))
	SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; ACC_AT_analysis; [ACCOUNTS_ANALYSES:157]Account_Code:3; ACC_at_RelatedAccountCodes)
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$Temp")
	If (ACC_t_OutputCurrency="")
		ACC_t_OutputCurrency:=<>SYS_t_BaseCurrency
	End if 
	
	$_bo_ShowAnalysis:=False:C215
	$_bo_ShowLayers:=False:C215
	SORT ARRAY:C229(ACC_at_AccountCodes; ACC_at_AccountName; ACC_at_GroupHeading; ACC_at_IO; ACC_at_ReportHeading; ACC_ar_AccountBalances)
	ARRAY LONGINT:C221(ACC_al_AccCodeRef; Size of array:C274(ACC_at_AccountCodes))
	ARRAY LONGINT:C221(AAC_al_UsedACCS; Size of array:C274(ACC_at_AccountCodes))
	
	//ALL RECORDS([HEADINGS])
	QUERY WITH ARRAY:C644([HEADINGS:84]Heading_Code:1; $_at_HeadingCodes)
	
	ARRAY LONGINT:C221(ACC_al_AccHeadingRef; 0)
	ARRAY LONGINT:C221(AAC_al_UsedHEADS; 0)
	ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Group_Code:5; [HEADINGS:84]Heading_Code:1)
	SELECTION TO ARRAY:C260([HEADINGS:84]Group_Code:5; ACC_at_GroupCode; [HEADINGS:84]Heading_Code:1; ACC_at_HeadingCode; [HEADINGS:84]Heading_Level:3; ACC_ai_HeadingLevel; [HEADINGS:84]Heading_Name:2; ACC_at_HeadingNames; [HEADINGS:84]Level_Up_Code:4; ACC_at_LevelUpCode)
	
	ARRAY LONGINT:C221(ACC_al_AccHeadingRef; Size of array:C274(ACC_at_GroupCode))
	ARRAY LONGINT:C221(AAC_al_UsedHEADS; Size of array:C274(ACC_at_GroupCode))
	
	//For ($i;1;Size of array(ACC_al_AccCodeRef))
	//ACC_al_AccCodeRef{$i}:=AA_GetNextID (->ACC_l_AccListRef)
	//End for 
	ACC_l_ACCCurrentLevel:=1
	//First we are going to set up the headings at each level
	For ($_l_GroupIndex; 1; Size of array:C274(ACC_at_GroupCode))
		If (ACC_at_GroupCode{$_l_GroupIndex}="") & (ACC_at_LevelUpCode{$_l_GroupIndex}="")  //`This is the base level off which everny else hangs we need to find what hangs off it
			ACC_t_Group1Level:=String:C10(ACC_ai_HeadingLevel{$_l_GroupIndex})
			APPEND TO ARRAY:C911(ACC_at_Group1; ACC_at_HeadingNames{$_l_GroupIndex})
			APPEND TO ARRAY:C911(ACC_at_Group1Codes; ACC_at_HeadingCode{$_l_GroupIndex})
			//APPEND TO ARRAY(ACC_ar_Group1Totals;0)
		End if 
	End for 
	
	$_l_SizeofArray:=Size of array:C274(ACC_at_Group1)
	ARRAY TEXT:C222(ACC_at_Group2; $_l_SizeofArray)
	ARRAY TEXT:C222(ACC_at_Group2Codes; $_l_SizeofArray)
	//ARRAY REAL(ACC_ar_Group2Totals;$_l_SizeofArray)
	$_l_MaxRows:=Size of array:C274(ACC_at_Group1Codes)*Size of array:C274(ACC_at_GroupCode)
	$_l_CurrentRow:=0
	
	For ($_l_CurrentRowIndex; 1; $_l_MaxRows)
		$_l_CurrentRow:=$_l_CurrentRow+1
		If ($_l_CurrentRow<=Size of array:C274(ACC_at_Group1Codes))
			$_t_ParentCode:=ACC_at_Group1Codes{$_l_CurrentRow}
			
			ACC_l_ACCCurrentLevel:=2
			$_l_element:=1
			$_l_offset:=1
			For ($_l_GroupIndex; 1; Size of array:C274(ACC_at_GroupCode))
				If (ACC_at_GroupCode{$_l_GroupIndex}=$_t_ParentCode) & (ACC_at_LevelUpCode{$_l_GroupIndex}="")  //`This is the base level off which everny else hangs we need to find what hangs off it
					ACC_t_Group2Level:=String:C10(ACC_ai_HeadingLevel{$_l_GroupIndex})
					INSERT IN ARRAY:C227(ACC_at_Group1; $_l_CurrentRow; 1)
					INSERT IN ARRAY:C227(ACC_at_Group1Codes; $_l_CurrentRow; 1)
					//INSERT IN ARRAY(ACC_ar_Group1Totals;$_l_CurrentRow;1)
					INSERT IN ARRAY:C227(ACC_at_Group2; $_l_CurrentRow; 1)
					INSERT IN ARRAY:C227(ACC_at_Group2Codes; $_l_CurrentRow; 1)
					//INSERT IN ARRAY(ACC_ar_Group2Totals;$_l_CurrentRow;1)
					ACC_at_Group2{$_l_CurrentRow}:=ACC_at_HeadingNames{$_l_GroupIndex}
					ACC_at_Group2Codes{$_l_CurrentRow}:=ACC_at_HeadingCode{$_l_GroupIndex}
					$_l_CurrentRow:=$_l_CurrentRow+1
				End if 
			End for 
		Else 
			$_l_CurrentRowIndex:=$_l_MaxRows
		End if 
	End for 
	
	$_l_CurrentLevel:=2
	$_bo_NoMoreLevels:=True:C214
	$_ptr_CurrentLevelPointer:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
	$_ptr_CurrentLevelCodePointer:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")
	Repeat 
		$_ptr_GroupArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1))
		
		$_ptr_GroupCodeArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1)+"Codes")
		$_ptr_LevelTotalsArray:=Get pointer:C304("ACC_ar_Group"+String:C10($_l_CurrentLevel+1)+"Totals")
		
		ARRAY TEXT:C222($_ptr_GroupArray->; 0)
		ARRAY TEXT:C222($_ptr_GroupCodeArray->; 0)
		//ARRAY REAL($_ptr_LevelTotalsArray->;0)
		
		$_l_ArraySize:=Size of array:C274($_ptr_CurrentLevelPointer->)
		ARRAY TEXT:C222($_ptr_GroupArray->; $_l_ArraySize)
		ARRAY TEXT:C222($_ptr_GroupCodeArray->; $_l_ArraySize)
		//ARRAY REAL($_ptr_LevelTotalsArray->;$_l_SizeofArray)
		$_l_MaxRows:=Size of array:C274($_ptr_CurrentLevelPointer->)*Size of array:C274(ACC_at_GroupCode)
		$_l_CurrentRow:=0
		For ($_l_CurrentRowIndex; 1; $_l_MaxRows)  //;Size of array($_ptr_CurrentLevelPointer->);1;-1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			If ($_l_CurrentRow<=Size of array:C274($_ptr_CurrentLevelPointer->))
				
				If ($_ptr_CurrentLevelCodePointer->{$_l_CurrentRow}#"")
					$_t_ParentCode:=$_ptr_CurrentLevelCodePointer->{$_l_CurrentRow}
					$_l_element:=1
					For ($_l_GroupIndex; 1; Size of array:C274(ACC_at_GroupCode))
						If (ACC_at_GroupCode{$_l_GroupIndex}#"") & (ACC_at_LevelUpCode{$_l_GroupIndex}=$_t_ParentCode)
							ACC_t_Group2Level:=String:C10(ACC_ai_HeadingLevel{$_l_GroupIndex})
							For ($_l_LevelIndex; 1; $_l_CurrentLevel+1)
								
								$_ptr_GroupLevelArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelIndex))
								$_ptr_GroupLevelCodeArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelIndex)+"Codes")
								//$P3:=Get pointer("ACC_ar_Group"+String($_l_LevelIndex)+"Totals")
								INSERT IN ARRAY:C227($_ptr_GroupLevelArray->; $_l_CurrentRow; 1)
								INSERT IN ARRAY:C227($_ptr_GroupLevelCodeArray->; $_l_CurrentRow; 1)
								//INSERT IN ARRAY($p3->;$_l_CurrentRow;1)
							End for 
							$_bo_NoMoreLevels:=False:C215
							$_ptr_GroupArray->{$_l_CurrentRow}:=ACC_at_HeadingNames{$_l_GroupIndex}
							$_ptr_GroupCodeArray->{$_l_CurrentRow}:=ACC_at_HeadingCode{$_l_GroupIndex}
							$_l_CurrentRow:=$_l_CurrentRow+1
							$_l_element:=$_l_element+1
						End if 
					End for 
				End if 
			Else 
				$_l_CurrentRowIndex:=$_l_MaxRows
			End if 
		End for 
		If ($_bo_NoMoreLevels=False:C215)
			$_l_CurrentLevel:=$_l_CurrentLevel+1
			$_bo_NoMoreLevels:=True:C214
			$_ptr_CurrentLevelPointer:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
			$_ptr_CurrentLevelCodePointer:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")
		End if 
	Until ($_bo_NoMoreLevels)
	
	
	$_ptr_GroupArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1))
	$_ptr_GroupCodeArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1)+"Codes")
	//$_ptr_LevelTotalsArray:=Get pointer("ACC_ar_Group"+String($_l_CurrentLevel+1)+"Totals")
	
	ARRAY TEXT:C222($_ptr_GroupArray->; 0)
	ARRAY TEXT:C222($_ptr_GroupCodeArray->; 0)
	//ARRAY REAL($_ptr_LevelTotalsArray->;0)
	
	$_l_ArraySize:=Size of array:C274($_ptr_CurrentLevelPointer->)
	ARRAY TEXT:C222($_ptr_GroupArray->; $_l_ArraySize)
	ARRAY TEXT:C222($_ptr_GroupCodeArray->; $_l_ArraySize)
	//ARRAY REAL($_ptr_LevelTotalsArray->;$_l_SizeofArray)
	
	//``
	
	//This is only going to add one more level
	ARRAY TEXT:C222($_at_AccountCodes; 0)
	$_l_MaxRows:=Size of array:C274($_ptr_CurrentLevelPointer->)*Size of array:C274(ACC_at_AccountCodes)
	$_l_CurrentRow:=0
	For ($_l_CurrentRowIndex; 1; $_l_MaxRows)  // ($_l_CurrentRow;Size of array($_ptr_CurrentLevelPointer->);1;-1)
		$_l_CurrentRow:=$_l_CurrentRow+1
		If ($_l_CurrentRow<=Size of array:C274($_ptr_CurrentLevelPointer->))
			ARRAY TEXT:C222($_at_ParentCodes; 0)
			For ($_l_LevelIndex; 1; $_l_CurrentLevel+1)
				$_ptr_GroupLevelCodeArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelIndex)+"Codes")
				APPEND TO ARRAY:C911($_at_ParentCodes; $_ptr_GroupLevelCodeArray->{$_l_CurrentRow})
			End for 
			For ($_l_LevelIndex; Size of array:C274($_at_ParentCodes); 1; -1)
				If ($_at_ParentCodes{$_l_LevelIndex}#"")
					$_t_ParentCode:=$_at_ParentCodes{$_l_LevelIndex}  //level 3 code
					$_l_LevelIndex:=0
				End if 
			End for 
			If ($_t_ParentCode#"")
				$_l_element:=1
				For ($_l_AccountCodeIndex; 1; Size of array:C274(ACC_at_AccountCodes))
					If (ACC_at_ReportHeading{$_l_AccountCodeIndex}=$_t_ParentCode)
						For ($_l_LevelIndex; 1; $_l_CurrentLevel+1)
							$_ptr_GroupLevelArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelIndex))
							$_ptr_GroupLevelCodeArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelIndex)+"Codes")
							//$P3:=Get pointer("ACC_ar_Group"+String($_l_LevelIndex)+"Totals")
							INSERT IN ARRAY:C227($_ptr_GroupLevelArray->; $_l_CurrentRow; 1)
							INSERT IN ARRAY:C227($_ptr_GroupLevelCodeArray->; $_l_CurrentRow; 1)
							//INSERT IN ARRAY($p3->;$_l_CurrentRow;1)
						End for 
						$_ptr_GroupArray->{$_l_CurrentRow}:=ACC_at_AccountName{$_l_AccountCodeIndex}
						$_ptr_GroupCodeArray->{$_l_CurrentRow}:=ACC_at_AccountCodes{$_l_AccountCodeIndex}
						//$_ptr_LevelTotalsArray->{$_l_CurrentRow}:=ACC_ar_AccountBalances{$_l_AccountCodeIndex}
						APPEND TO ARRAY:C911($_at_AccountCodes; ACC_at_AccountCodes{$_l_AccountCodeIndex})
						$_l_element:=$_l_element+1
						$_l_CurrentRow:=$_l_CurrentRow+1
					End if 
				End for 
			Else 
				//TRACE
			End if 
		Else 
			$_l_CurrentRowIndex:=$_l_MaxRows
		End if 
	End for 
	
	ARRAY TEXT:C222($_at_MissingAccountCodes; 0)
	ARRAY TEXT:C222($_at_AdditionalHeaders; 0)
	For ($_l_AccountCodeIndex; 1; Size of array:C274(ACC_at_AccountCodes))
		If (Find in array:C230($_at_AccountCodes; ACC_at_AccountCodes{$_l_AccountCodeIndex})<0)
			APPEND TO ARRAY:C911($_at_MissingAccountCodes; ACC_at_AccountCodes{$_l_AccountCodeIndex})
		End if 
	End for 
	ARRAY TEXT:C222($_at_CreatedPseudoHeadings; 0)
	
	If (Size of array:C274($_at_MissingAccountCodes)>0)
		$_l_ArraySize:=Size of array:C274(ACC_at_Group1Codes)
		APPEND TO ARRAY:C911(ACC_at_Group1Codes; "")
		//APPEND TO ARRAY(ACC_ar_Group1Totals;0)
		APPEND TO ARRAY:C911(ACC_at_Group1; "Invalid Headings")
		APPEND TO ARRAY:C911(ACC_at_Group2Codes; "")
		//APPEND TO ARRAY(ACC_ar_Group2Totals;0)
		APPEND TO ARRAY:C911(ACC_at_Group2; "Invalid Subheadings")
		APPEND TO ARRAY:C911(ACC_at_Group3Codes; "")
		APPEND TO ARRAY:C911(ACC_at_Group3; "")
		//APPEND TO ARRAY(ACC_ar_Group3Totals;0)
		APPEND TO ARRAY:C911(ACC_at_Group4Codes; "")
		APPEND TO ARRAY:C911(ACC_at_Group4; "")
		//APPEND TO ARRAY(ACC_ar_Group4Totals;0)
		
		For ($_l_missingiAccountIndex; 1; Size of array:C274($_at_MissingAccountCodes))
			$_l_MissingAccountRow:=Find in array:C230(ACC_at_AccountCodes; $_at_MissingAccountCodes{$_l_missingiAccountIndex})
			$_t_Heading:=ACC_at_ReportHeading{$_l_MissingAccountRow}
			$_l_HeaderRow:=Find in array:C230($_at_CreatedPseudoHeadings; $_t_Heading)
			If ($_l_HeaderRow<0)
				APPEND TO ARRAY:C911($_at_CreatedPseudoHeadings; $_t_Heading)
				$_l_CurrentRow:=Size of array:C274(ACC_at_Group1Codes)
				INSERT IN ARRAY:C227(ACC_at_Group1Codes; $_l_CurrentRow; 1)
				INSERT IN ARRAY:C227(ACC_at_Group1; $_l_CurrentRow; 1)
				//INSERT IN ARRAY(ACC_ar_Group1Totals;$_l_CurrentRow;1)
				INSERT IN ARRAY:C227(ACC_at_Group2Codes; $_l_CurrentRow; 1)
				INSERT IN ARRAY:C227(ACC_at_Group2; $_l_CurrentRow; 1)
				//INSERT IN ARRAY(ACC_ar_Group2Totals;$_l_CurrentRow;1)
				INSERT IN ARRAY:C227(ACC_at_Group3Codes; $_l_CurrentRow; 1)
				INSERT IN ARRAY:C227(ACC_at_Group3; $_l_CurrentRow; 1)
				//INSERT IN ARRAY(ACC_ar_Group3Totals;$_l_CurrentRow;1)
				ACC_at_Group3Codes{$_l_CurrentRow}:=$_t_Heading
				INSERT IN ARRAY:C227(ACC_at_Group4Codes; $_l_CurrentRow; 1)
				INSERT IN ARRAY:C227(ACC_at_Group4; $_l_CurrentRow; 1)
				//INSERT IN ARRAY(ACC_ar_Group4Totals;$_l_CurrentRow;1)
				
				
				
			End if 
		End for 
		$_l_MaxRows:=Size of array:C274($_ptr_CurrentLevelPointer->)*Size of array:C274($_at_MissingAccountCodes)
		$_l_CurrentRow:=0
		For ($_l_CurrentRowIndex; 1; $_l_MaxRows)
			$_l_CurrentRow:=$_l_CurrentRow+1
			If ($_l_CurrentRow<=Size of array:C274($_ptr_CurrentLevelPointer->))
				//For ($_l_CurrentRow;Size of array($_ptr_CurrentLevelPointer->);1;-1)
				$_t_ParentCode:=$_ptr_CurrentLevelCodePointer->{$_l_CurrentRow}
				If ($_t_ParentCode#"")
					$_l_element:=1
					For ($_l_AccountCodeIndex; 1; Size of array:C274($_at_MissingAccountCodes))
						$_l_MissingAccountRow:=Find in array:C230(ACC_at_AccountCodes; $_at_MissingAccountCodes{$_l_AccountCodeIndex})
						
						If (ACC_at_ReportHeading{$_l_MissingAccountRow}=$_t_ParentCode)
							For ($_l_LevelIndex; 1; $_l_CurrentLevel+1)
								$_ptr_GroupLevelArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelIndex))
								$_ptr_GroupLevelCodeArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelIndex)+"Codes")
								//$P3:=Get pointer("ACC_ar_Group"+String($_l_LevelIndex)+"Totals")
								INSERT IN ARRAY:C227($_ptr_GroupLevelArray->; $_l_CurrentRow; 1)
								INSERT IN ARRAY:C227($_ptr_GroupLevelCodeArray->; $_l_CurrentRow; 1)
								//INSERT IN ARRAY($p3->;$_l_CurrentRow;1)
							End for 
							$_ptr_GroupArray->{$_l_CurrentRow}:=ACC_at_AccountName{$_l_MissingAccountRow}
							$_ptr_GroupCodeArray->{$_l_CurrentRow}:=ACC_at_AccountCodes{$_l_MissingAccountRow}
							//$_ptr_LevelTotalsArray->{$_l_CurrentRow}:=ACC_ar_AccountBalances{$_l_MissingAccountRow}
							APPEND TO ARRAY:C911($_at_AccountCodes; ACC_at_AccountCodes{$_l_MissingAccountRow})
							$_l_element:=$_l_element+1
							$_l_CurrentRow:=$_l_CurrentRow+1
						End if 
					End for 
				End if 
			Else 
				$_l_CurrentRowIndex:=$_l_MaxRows
			End if 
		End for   //there are invalid headings on these..to make them appear i am going to add them in to the header
		
	End if 
	$_l_CurrentLevel:=$_l_CurrentLevel+1
	$_r_Subtotal4:=0
	$_r_Subtotal3:=0
	$_r_Subtotal2:=0
	$_r_Subtotal1:=0
	$_r_GrandTotal:=0
	$_l_Sub4Count:=0
	$_l_Sub3Count:=0
	$_l_Sub2Count:=0
	$_l_Sub1Count:=0
	For ($_l_Group4Index; 1; Size of array:C274(ACC_at_Group4); 1)
		If (ACC_at_Group4{$_l_Group4Index}#"")
			$_l_Sub4Count:=$_l_Sub4Count+1
			//$_r_Subtotal4:=$_r_Subtotal4+ACC_ar_Group4Totals{$_l_Group4Index}
		Else 
			If (ACC_at_Group3{$_l_Group4Index}#"")
				If ($_l_Sub4Count>0)
					$_l_Sub3Count:=$_l_Sub3Count+1
					//$_r_Subtotal3:=$_r_Subtotal3+$_r_Subtotal4
					//ACC_ar_Group3Totals{$i}:=$_r_Subtotal4
					$_r_Subtotal4:=0
					$_l_Sub4Count:=0
				End if 
			Else 
				If (ACC_at_Group2{$_l_Group4Index}#"")
					If ($_l_Sub3Count>0)
						$_l_Sub2Count:=$_l_Sub2Count+1
						//$_r_Subtotal2:=$_r_Subtotal2+$_r_Subtotal3
						//ACC_ar_Group2Totals{$i}:=$_r_Subtotal3
						$_r_Subtotal3:=0
						$_l_Sub3Count:=0
					End if 
				Else 
					If (ACC_at_Group1{$_l_Group4Index}#"")
						If ($_l_Sub2Count>0)
							
							//$_r_Subtotal1:=$_r_Subtotal1+$_r_Subtotal2
							//ACC_ar_Group1Totals{$i}:=$_r_Subtotal2
							$_r_Subtotal2:=0
							$_l_Sub2Count:=0
						End if 
					Else 
						//$_r_GrandTotal:=$_r_GrandTotal+$_r_Subtotal1
						$_r_Subtotal1:=0
					End if 
				End if 
			End if 
		End if 
	End for 
	
	//$_r_GrandTotal:=$_r_GrandTotal+$_r_Subtotal1
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 1"; ACC_at_Group1)
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 1Codes"; ACC_at_Group1Codes)
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 2"; ACC_at_Group2)
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 2Codes"; ACC_at_Group2Codes)
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 3"; ACC_at_Group3)
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 3Codes"; ACC_at_Group3Codes)
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 4"; ACC_at_Group4)
	OB SET ARRAY:C1227($_obj_AccGroups; "Group 4Codes"; ACC_at_Group4Codes)
	OB SET:C1220($_obj_AccGroups; "Current Level"; $_l_CurrentLevel)
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; Head_obj_HeadingDownData; $_obj_AccGroups)
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; Head_bo_GroupsLoaded; True:C214)
	
End if 
ERR_MethodTrackerReturn("HEAD_getLevelDown"; $_t_oldMethodName)