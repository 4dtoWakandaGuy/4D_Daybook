//%attributes = {}
If (False:C215)
	//Project Method Name:      LAY_LOADACCOUNTBALANCESARRAYS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:         30/11/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
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
	ARRAY TEXT:C222($_at_CreatedPseudoHeadings; 0)
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
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305($_bo_NoMoreLevels; $_bo_ShowAnalysis; $_bo_ShowLayers)
	C_LONGINT:C283($_l_AccountCodeRow; $_l_ArraySize; $_l_CurrentLevel; $_l_Element; $_l_HeadingRow; $_l_Index; $_l_Index2; $_l_Index3; $_l_MissingAccountRow; $_l_offset; $_l_SubCount1)
	C_LONGINT:C283($_l_SubCount2; $_l_SubCount3; $_l_SubCount4; ACC_l_ACCCurrentLevel; ACC_l_AccListRef; ACC_l_AccSetup)
	C_POINTER:C301($_ptr_CurrentLevelGroupArray; $_ptr_CurrentLevelGroupCodesArra; $_ptr_GroupCodes; $_ptr_Groups; $_ptr_GroupTotals; $_ptr_PutLevelGroup; $_ptr_PutLevelGroupCodes; $_ptr_PutLevelTotals)
	C_REAL:C285($_r_ConvertedBalance; $_r_GrandTotal; $_r_SubTotal1; $_r_SubTotal2; $_r_SubTotal3; $_r_SubTotal4; $0; VBALANCE)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AccountHeading; $_t_oldMethodName; $_t_ParentAccountCode; ACC_t_Group1Level; ACC_t_Group2Level; ACC_t_OutputCurrency)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LAY_LOADACCOUNTBALANCESARRAYS")
ARRAY TEXT:C222(ACC_at_Group1; 0)
ARRAY TEXT:C222(ACC_at_Group1Codes; 0)
ARRAY REAL:C219(ACC_ar_Group1Totals; 0)
ARRAY TEXT:C222(ACC_at_Group2; 0)
ARRAY TEXT:C222(ACC_at_Group2Codes; 0)
ARRAY REAL:C219(ACC_ar_Group2Totals; 0)
ARRAY TEXT:C222(ACC_at_Group3; 0)
ARRAY TEXT:C222(ACC_at_Group3Codes; 0)
ARRAY REAL:C219(ACC_ar_Group3Totals; 0)
ARRAY TEXT:C222(ACC_at_Group4; 0)
ARRAY TEXT:C222(ACC_at_Group4Codes; 0)
ARRAY REAL:C219(ACC_ar_Group4Totals; 0)
//go from the selection of balances to a selection of accounts

COPY NAMED SELECTION:C331([ACCOUNT_BALANCES:34]; "$CURRENT")

SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Account_Code:2; $_at_AccountCodes)
ARRAY TEXT:C222(ACC_at_Group1; 0)  //This will  contain all the headings wihin that group-the names of the headings in that group.
If (Is a list:C621(ACC_l_AccSetup))
	CLEAR LIST:C377(ACC_l_AccSetup; *)
End if 
ACC_l_AccSetup:=New list:C375
QUERY WITH ARRAY:C644([ACCOUNTS:32]Account_Code:2; $_at_AccountCodes)
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
For ($_l_Index; 1; Size of array:C274(ACC_at_AccountCodes))
	USE SET:C118("$Temp")
	QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=ACC_at_AccountCodes{$_l_Index})
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "$Temp2")
	QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6#ACC_t_OutputCurrency; *)
	QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6#"")
	If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
		USE SET:C118("$Temp2")
		VBALANCE:=0
		Calc_BalArr
		ACC_ar_AccountBalances{$_l_Index}:=VBALANCE
	Else 
		USE SET:C118("$Temp2")
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=ACC_t_OutputCurrency; *)
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6="")
		VBALANCE:=0
		Calc_BalArr
		ACC_ar_AccountBalances{$_l_Index}:=VBALANCE
		USE SET:C118("$Temp2")
		QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6#ACC_t_OutputCurrency)
		DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; CUR_at_CurrencyToconvert)
		$_r_ConvertedBalance:=CUR_CalcBalConv(->CUR_at_CurrencyToconvert; ACC_t_OutputCurrency)
		ACC_ar_AccountBalances{$_l_Index}:=ACC_ar_AccountBalances{$_l_Index}+$_r_ConvertedBalance
	End if 
End for 
$_bo_ShowAnalysis:=False:C215
$_bo_ShowLayers:=False:C215
SORT ARRAY:C229(ACC_at_AccountCodes; ACC_at_AccountName; ACC_at_GroupHeading; ACC_at_IO; ACC_at_ReportHeading; ACC_ar_AccountBalances)
ARRAY LONGINT:C221(ACC_al_AccCodeRef; Size of array:C274(ACC_at_AccountCodes))
ARRAY LONGINT:C221(AAC_al_UsedACCS; Size of array:C274(ACC_at_AccountCodes))
For ($_l_Index; 1; Size of array:C274(ACC_al_AccCodeRef))
	//ACC_al_AccCodeRef{$_l_Index}:=AA_GetNextID (->ACC_l_AccListRef)
End for 
ALL RECORDS:C47([HEADINGS:84])
ARRAY LONGINT:C221(ACC_al_AccHeadingRef; 0)
ARRAY LONGINT:C221(AAC_al_UsedHEADS; 0)
ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Group_Code:5; [HEADINGS:84]Heading_Code:1)
SELECTION TO ARRAY:C260([HEADINGS:84]Group_Code:5; ACC_at_GroupCode; [HEADINGS:84]Heading_Code:1; ACC_at_HeadingCode; [HEADINGS:84]Heading_Level:3; ACC_ai_HeadingLevel; [HEADINGS:84]Heading_Name:2; ACC_at_HeadingNames; [HEADINGS:84]Level_Up_Code:4; ACC_at_LevelUpCode)

ARRAY LONGINT:C221(ACC_al_AccHeadingRef; Size of array:C274(ACC_at_GroupCode))
ARRAY LONGINT:C221(AAC_al_UsedHEADS; Size of array:C274(ACC_at_GroupCode))

For ($_l_Index; 1; Size of array:C274(ACC_al_AccCodeRef))
	//ACC_al_AccCodeRef{$_l_Index}:=AA_GetNextID (->ACC_l_AccListRef)
End for 
ACC_l_ACCCurrentLevel:=1
//First we are going to set up the headings at each level
For ($_l_Index; 1; Size of array:C274(ACC_at_GroupCode))
	If (ACC_at_GroupCode{$_l_Index}="") & (ACC_at_LevelUpCode{$_l_Index}="")  //`This is the base level off which everny else hangs we need to find what hangs off it
		ACC_t_Group1Level:=String:C10(ACC_ai_HeadingLevel{$_l_Index})
		APPEND TO ARRAY:C911(ACC_at_Group1; ACC_at_HeadingNames{$_l_Index})
		APPEND TO ARRAY:C911(ACC_at_Group1Codes; ACC_at_HeadingCode{$_l_Index})
		APPEND TO ARRAY:C911(ACC_ar_Group1Totals; 0)
	End if 
End for 

$_l_ArraySize:=Size of array:C274(ACC_at_Group1)
ARRAY TEXT:C222(ACC_at_Group2; $_l_ArraySize)
ARRAY TEXT:C222(ACC_at_Group2Codes; $_l_ArraySize)
ARRAY REAL:C219(ACC_ar_Group2Totals; $_l_ArraySize)
$_l_ArraySize:=Size of array:C274(ACC_at_Group1Codes)*Size of array:C274(ACC_at_GroupCode)
$_l_arraySize:=0

For ($_l_Index; 1; $_l_ArraySize)
	$_l_arraySize:=$_l_arraySize+1
	If ($_l_arraySize<=Size of array:C274(ACC_at_Group1Codes))
		$_t_ParentAccountCode:=ACC_at_Group1Codes{$_l_arraySize}
		
		ACC_l_ACCCurrentLevel:=2
		$_l_Element:=1
		$_l_offset:=1
		For ($_l_Index; 1; Size of array:C274(ACC_at_GroupCode))
			If (ACC_at_GroupCode{$_l_Index}=$_t_ParentAccountCode) & (ACC_at_LevelUpCode{$_l_Index}="")  //`This is the base level off which everny else hangs we need to find what hangs off it
				ACC_t_Group2Level:=String:C10(ACC_ai_HeadingLevel{$_l_Index})
				INSERT IN ARRAY:C227(ACC_at_Group1; $_l_arraySize; 1)
				INSERT IN ARRAY:C227(ACC_at_Group1Codes; $_l_arraySize; 1)
				INSERT IN ARRAY:C227(ACC_ar_Group1Totals; $_l_arraySize; 1)
				INSERT IN ARRAY:C227(ACC_at_Group2; $_l_arraySize; 1)
				INSERT IN ARRAY:C227(ACC_at_Group2Codes; $_l_arraySize; 1)
				INSERT IN ARRAY:C227(ACC_ar_Group2Totals; $_l_arraySize; 1)
				ACC_at_Group2{$_l_arraySize}:=ACC_at_HeadingNames{$_l_Index}
				ACC_at_Group2Codes{$_l_arraySize}:=ACC_at_HeadingCode{$_l_Index}
				$_l_arraySize:=$_l_arraySize+1
			End if 
		End for 
	Else 
		$_l_Index:=$_l_ArraySize
	End if 
End for 

$_l_CurrentLevel:=2
$_bo_NoMoreLevels:=True:C214
$_ptr_CurrentLevelGroupArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
$_ptr_CurrentLevelGroupCodesArra:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")
Repeat 
	$_ptr_PutLevelGroup:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1))
	
	$_ptr_PutLevelGroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1)+"Codes")
	$_ptr_PutLevelTotals:=Get pointer:C304("ACC_ar_Group"+String:C10($_l_CurrentLevel+1)+"Totals")
	
	ARRAY TEXT:C222($_ptr_PutLevelGroup->; 0)
	ARRAY TEXT:C222($_ptr_PutLevelGroupCodes->; 0)
	ARRAY REAL:C219($_ptr_PutLevelTotals->; 0)
	
	$_l_ArraySize:=Size of array:C274($_ptr_CurrentLevelGroupArray->)
	ARRAY TEXT:C222($_ptr_PutLevelGroup->; $_l_ArraySize)
	ARRAY TEXT:C222($_ptr_PutLevelGroupCodes->; $_l_ArraySize)
	ARRAY REAL:C219($_ptr_PutLevelTotals->; $_l_ArraySize)
	$_l_ArraySize:=Size of array:C274($_ptr_CurrentLevelGroupArray->)*Size of array:C274(ACC_at_GroupCode)
	$_l_arraySize:=0
	For ($_l_Index; 1; $_l_ArraySize)  //;Size of array($_ptr_CurrentLevelGroupArray->);1;-1)
		$_l_arraySize:=$_l_arraySize+1
		If ($_l_arraySize<=Size of array:C274($_ptr_CurrentLevelGroupArray->))
			
			If ($_ptr_CurrentLevelGroupCodesArra->{$_l_arraySize}#"")
				$_t_ParentAccountCode:=$_ptr_CurrentLevelGroupCodesArra->{$_l_arraySize}
				$_l_Element:=1
				For ($_l_Index; 1; Size of array:C274(ACC_at_GroupCode))
					If (ACC_at_GroupCode{$_l_Index}#"") & (ACC_at_LevelUpCode{$_l_Index}=$_t_ParentAccountCode)
						ACC_t_Group2Level:=String:C10(ACC_ai_HeadingLevel{$_l_Index})
						For ($_l_Index2; 1; $_l_CurrentLevel+1)
							
							$_ptr_Groups:=Get pointer:C304("ACC_at_Group"+String:C10($_l_Index2))
							$_ptr_GroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_Index2)+"Codes")
							$_ptr_GroupTotals:=Get pointer:C304("ACC_ar_Group"+String:C10($_l_Index2)+"Totals")
							INSERT IN ARRAY:C227($_ptr_Groups->; $_l_arraySize; 1)
							INSERT IN ARRAY:C227($_ptr_GroupCodes->; $_l_arraySize; 1)
							INSERT IN ARRAY:C227($_ptr_GroupTotals->; $_l_arraySize; 1)
						End for 
						$_bo_NoMoreLevels:=False:C215
						$_ptr_PutLevelGroup->{$_l_arraySize}:=ACC_at_HeadingNames{$_l_Index}
						$_ptr_PutLevelGroupCodes->{$_l_arraySize}:=ACC_at_HeadingCode{$_l_Index}
						$_l_arraySize:=$_l_arraySize+1
						$_l_Element:=$_l_Element+1
					End if 
				End for 
			End if 
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	If ($_bo_NoMoreLevels=False:C215)
		$_l_CurrentLevel:=$_l_CurrentLevel+1
		$_bo_NoMoreLevels:=True:C214
		$_ptr_CurrentLevelGroupArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
		$_ptr_CurrentLevelGroupCodesArra:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")
	End if 
Until ($_bo_NoMoreLevels)

$_ptr_CurrentLevelGroupArray:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
$_ptr_CurrentLevelGroupCodesArra:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")
SORT ARRAY:C229(ACC_at_AccountCodes; ACC_at_AccountName; ACC_at_GroupHeading; ACC_at_IO; ACC_at_ReportHeading; ACC_abo_NONLPOSTINGS; ACC_at_PLB)

$_ptr_PutLevelGroup:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1))
$_ptr_PutLevelGroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1)+"Codes")
$_ptr_PutLevelTotals:=Get pointer:C304("ACC_ar_Group"+String:C10($_l_CurrentLevel+1)+"Totals")

ARRAY TEXT:C222($_ptr_PutLevelGroup->; 0)
ARRAY TEXT:C222($_ptr_PutLevelGroupCodes->; 0)
ARRAY REAL:C219($_ptr_PutLevelTotals->; 0)

$_l_ArraySize:=Size of array:C274($_ptr_CurrentLevelGroupArray->)
ARRAY TEXT:C222($_ptr_PutLevelGroup->; $_l_ArraySize)
ARRAY TEXT:C222($_ptr_PutLevelGroupCodes->; $_l_ArraySize)
ARRAY REAL:C219($_ptr_PutLevelTotals->; $_l_ArraySize)

//``

//This is only going to add one more level
ARRAY TEXT:C222($_at_AccountCodes; 0)
$_l_ArraySize:=Size of array:C274($_ptr_CurrentLevelGroupArray->)*Size of array:C274(ACC_at_AccountCodes)
$_l_arraySize:=0
For ($_l_Index; 1; $_l_ArraySize)  // ($_l_arraySize;Size of array($_ptr_CurrentLevelGroupArray->);1;-1)
	$_l_arraySize:=$_l_arraySize+1
	If ($_l_arraySize<=Size of array:C274($_ptr_CurrentLevelGroupArray->))
		ARRAY TEXT:C222($_at_ParentCodes; 0)
		For ($_l_Index2; 1; $_l_CurrentLevel+1)
			$_ptr_GroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_Index2)+"Codes")
			APPEND TO ARRAY:C911($_at_ParentCodes; $_ptr_GroupCodes->{$_l_arraySize})
		End for 
		For ($_l_Index2; Size of array:C274($_at_ParentCodes); 1; -1)
			If ($_at_ParentCodes{$_l_Index2}#"")
				$_t_ParentAccountCode:=$_at_ParentCodes{$_l_Index2}  //level 3 code
				$_l_Index2:=0
			End if 
		End for 
		If ($_t_ParentAccountCode#"")
			$_l_Element:=1
			For ($_l_Index3; 1; Size of array:C274(ACC_at_AccountCodes))
				If (ACC_at_ReportHeading{$_l_Index3}=$_t_ParentAccountCode)
					For ($_l_Index2; 1; $_l_CurrentLevel+1)
						$_ptr_Groups:=Get pointer:C304("ACC_at_Group"+String:C10($_l_Index2))
						$_ptr_GroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_Index2)+"Codes")
						$_ptr_GroupTotals:=Get pointer:C304("ACC_ar_Group"+String:C10($_l_Index2)+"Totals")
						INSERT IN ARRAY:C227($_ptr_Groups->; $_l_arraySize; 1)
						INSERT IN ARRAY:C227($_ptr_GroupCodes->; $_l_arraySize; 1)
						INSERT IN ARRAY:C227($_ptr_GroupTotals->; $_l_arraySize; 1)
					End for 
					$_ptr_PutLevelGroup->{$_l_arraySize}:=ACC_at_AccountName{$_l_Index3}
					$_ptr_PutLevelGroupCodes->{$_l_arraySize}:=ACC_at_AccountCodes{$_l_Index3}
					$_ptr_PutLevelTotals->{$_l_arraySize}:=ACC_ar_AccountBalances{$_l_Index3}
					APPEND TO ARRAY:C911($_at_AccountCodes; ACC_at_AccountCodes{$_l_Index3})
					$_l_Element:=$_l_Element+1
					$_l_arraySize:=$_l_arraySize+1
				End if 
			End for 
		Else 
			//TRACE
		End if 
	Else 
		$_l_Index:=$_l_ArraySize
	End if 
End for 

ARRAY TEXT:C222($_at_MissingAccountCodes; 0)
ARRAY TEXT:C222($_at_AdditionalHeaders; 0)
For ($_l_Index; 1; Size of array:C274(ACC_at_AccountCodes))
	If (Find in array:C230($_at_AccountCodes; ACC_at_AccountCodes{$_l_Index})<0)
		APPEND TO ARRAY:C911($_at_MissingAccountCodes; ACC_at_AccountCodes{$_l_Index})
	End if 
End for 
ARRAY TEXT:C222($_at_CreatedPseudoHeadings; 0)

If (Size of array:C274($_at_MissingAccountCodes)>0)
	$_l_ArraySize:=Size of array:C274(ACC_at_Group1Codes)
	APPEND TO ARRAY:C911(ACC_at_Group1Codes; "")
	APPEND TO ARRAY:C911(ACC_ar_Group1Totals; 0)
	APPEND TO ARRAY:C911(ACC_at_Group1; "Invalid Headings")
	APPEND TO ARRAY:C911(ACC_at_Group2Codes; "")
	APPEND TO ARRAY:C911(ACC_ar_Group2Totals; 0)
	APPEND TO ARRAY:C911(ACC_at_Group2; "Invalid Subheadings")
	APPEND TO ARRAY:C911(ACC_at_Group3Codes; "")
	APPEND TO ARRAY:C911(ACC_at_Group3; "")
	APPEND TO ARRAY:C911(ACC_ar_Group3Totals; 0)
	APPEND TO ARRAY:C911(ACC_at_Group4Codes; "")
	APPEND TO ARRAY:C911(ACC_at_Group4; "")
	APPEND TO ARRAY:C911(ACC_ar_Group4Totals; 0)
	
	For ($_l_Index; 1; Size of array:C274($_at_MissingAccountCodes))
		$_l_AccountCodeRow:=Find in array:C230(ACC_at_AccountCodes; $_at_MissingAccountCodes{$_l_Index})
		$_t_AccountHeading:=ACC_at_ReportHeading{$_l_AccountCodeRow}
		$_l_HeadingRow:=Find in array:C230($_at_CreatedPseudoHeadings; $_t_AccountHeading)
		If ($_l_HeadingRow<0)
			APPEND TO ARRAY:C911($_at_CreatedPseudoHeadings; $_t_AccountHeading)
			$_l_arraySize:=Size of array:C274(ACC_at_Group1Codes)
			INSERT IN ARRAY:C227(ACC_at_Group1Codes; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_at_Group1; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_ar_Group1Totals; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_at_Group2Codes; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_at_Group2; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_ar_Group2Totals; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_at_Group3Codes; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_at_Group3; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_ar_Group3Totals; $_l_arraySize; 1)
			ACC_at_Group3Codes{$_l_arraySize}:=$_t_AccountHeading
			INSERT IN ARRAY:C227(ACC_at_Group4Codes; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_at_Group4; $_l_arraySize; 1)
			INSERT IN ARRAY:C227(ACC_ar_Group4Totals; $_l_arraySize; 1)
			
			
			
		End if 
	End for 
	$_l_ArraySize:=Size of array:C274($_ptr_CurrentLevelGroupArray->)*Size of array:C274($_at_MissingAccountCodes)
	$_l_arraySize:=0
	For ($_l_Index; 1; $_l_ArraySize)
		$_l_arraySize:=$_l_arraySize+1
		If ($_l_arraySize<=Size of array:C274($_ptr_CurrentLevelGroupArray->))
			//For ($_l_arraySize;Size of array($_ptr_CurrentLevelGroupArray->);1;-1)
			$_t_ParentAccountCode:=$_ptr_CurrentLevelGroupCodesArra->{$_l_arraySize}
			If ($_t_ParentAccountCode#"")
				$_l_Element:=1
				For ($_l_Index3; 1; Size of array:C274($_at_MissingAccountCodes))
					$_l_MissingAccountRow:=Find in array:C230(ACC_at_AccountCodes; $_at_MissingAccountCodes{$_l_Index3})
					
					If (ACC_at_ReportHeading{$_l_MissingAccountRow}=$_t_ParentAccountCode)
						For ($_l_Index2; 1; $_l_CurrentLevel+1)
							$_ptr_Groups:=Get pointer:C304("ACC_at_Group"+String:C10($_l_Index2))
							$_ptr_GroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_Index2)+"Codes")
							$_ptr_GroupTotals:=Get pointer:C304("ACC_ar_Group"+String:C10($_l_Index2)+"Totals")
							INSERT IN ARRAY:C227($_ptr_Groups->; $_l_arraySize; 1)
							INSERT IN ARRAY:C227($_ptr_GroupCodes->; $_l_arraySize; 1)
							INSERT IN ARRAY:C227($_ptr_GroupTotals->; $_l_arraySize; 1)
						End for 
						$_ptr_PutLevelGroup->{$_l_arraySize}:=ACC_at_AccountName{$_l_MissingAccountRow}
						$_ptr_PutLevelGroupCodes->{$_l_arraySize}:=ACC_at_AccountCodes{$_l_MissingAccountRow}
						$_ptr_PutLevelTotals->{$_l_arraySize}:=ACC_ar_AccountBalances{$_l_MissingAccountRow}
						APPEND TO ARRAY:C911($_at_AccountCodes; ACC_at_AccountCodes{$_l_MissingAccountRow})
						$_l_Element:=$_l_Element+1
						$_l_arraySize:=$_l_arraySize+1
					End if 
				End for 
			End if 
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for   //there are invalid headings on these..to make them appear i am going to add them in to the header
	
End if 
$_l_CurrentLevel:=$_l_CurrentLevel+1
$_r_SubTotal4:=0
$_r_SubTotal3:=0
$_r_SubTotal2:=0
$_r_SubTotal1:=0
$_r_GrandTotal:=0
$_l_SubCount4:=0
$_l_SubCount3:=0
$_l_SubCount2:=0
$_l_SubCount1:=0
For ($_l_Index; 1; Size of array:C274(ACC_at_Group4); 1)
	If (ACC_at_Group4{$_l_Index}#"")
		$_l_SubCount4:=$_l_SubCount4+1
		$_r_SubTotal4:=$_r_SubTotal4+ACC_ar_Group4Totals{$_l_Index}
	Else 
		If (ACC_at_Group3{$_l_Index}#"")
			If ($_l_SubCount4>0)
				$_l_SubCount3:=$_l_SubCount3+1
				$_r_SubTotal3:=$_r_SubTotal3+$_r_SubTotal4
				ACC_ar_Group3Totals{$_l_Index}:=$_r_SubTotal4
				$_r_SubTotal4:=0
				$_l_SubCount4:=0
			End if 
		Else 
			If (ACC_at_Group2{$_l_Index}#"")
				If ($_l_SubCount3>0)
					$_l_SubCount2:=$_l_SubCount2+1
					$_r_SubTotal2:=$_r_SubTotal2+$_r_SubTotal3
					ACC_ar_Group2Totals{$_l_Index}:=$_r_SubTotal3
					$_r_SubTotal3:=0
					$_l_SubCount3:=0
				End if 
			Else 
				If (ACC_at_Group1{$_l_Index}#"")
					If ($_l_SubCount2>0)
						
						$_r_SubTotal1:=$_r_SubTotal1+$_r_SubTotal2
						ACC_ar_Group1Totals{$_l_Index}:=$_r_SubTotal2
						$_r_SubTotal2:=0
						$_l_SubCount2:=0
					End if 
				Else 
					$_r_GrandTotal:=$_r_GrandTotal+$_r_SubTotal1
					$_r_SubTotal1:=0
				End if 
			End if 
		End if 
	End if 
End for 

$_r_GrandTotal:=$_r_GrandTotal+$_r_SubTotal1
If (True:C214)
	$_l_arraySize:=Size of array:C274(ACC_at_Group1Codes)+1
	INSERT IN ARRAY:C227(ACC_at_Group1Codes; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_at_Group1; $_l_arraySize; 1)
	ACC_at_Group1Codes{$_l_arraySize}:="TOTAL"
	
	INSERT IN ARRAY:C227(ACC_ar_Group1Totals; $_l_arraySize; 1)
	ACC_ar_Group1Totals{$_l_arraySize}:=$_r_GrandTotal
	INSERT IN ARRAY:C227(ACC_at_Group2Codes; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_at_Group2; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_ar_Group2Totals; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_at_Group3Codes; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_at_Group3; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_ar_Group3Totals; $_l_arraySize; 1)
	
	INSERT IN ARRAY:C227(ACC_at_Group4Codes; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_at_Group4; $_l_arraySize; 1)
	INSERT IN ARRAY:C227(ACC_ar_Group4Totals; $_l_arraySize; 1)
	
End if 
USE NAMED SELECTION:C332("$CURRENT")

$0:=$_l_CurrentLevel
ERR_MethodTrackerReturn("LAY_LOADACCOUNTBALANCESARRAYS"; $_t_oldMethodName)