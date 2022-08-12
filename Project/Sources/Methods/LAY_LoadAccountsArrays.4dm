//%attributes = {}
If (False:C215)
	//Project Method Name:      LAY_LoadAccountsArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:        12/01/2011 16:55 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_NONLPOSTINGS;0)
	//ARRAY BOOLEAN(ACC_abo_RestrictNL;0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY INTEGER(ACC_ai_HeadingLevel;0)
	//ARRAY LONGINT(AAC_al_UsedACCS;0)
	//ARRAY LONGINT(AAC_al_UsedHEADS;0)
	//ARRAY LONGINT(ACC_al_AccCodeRef;0)
	//ARRAY LONGINT(ACC_al_AccHeadingRef;0)
	ARRAY TEXT:C222($_at_AccountCodes; 0)
	ARRAY TEXT:C222($_at_AdditionalHeaders; 0)
	ARRAY TEXT:C222($_at_CreatedPseudoHeadings; 0)
	ARRAY TEXT:C222($_at_LoadHeadingCodes; 0)
	ARRAY TEXT:C222($_at_MissingAccountCodes; 0)
	ARRAY TEXT:C222($_at_ParentCodes; 0)
	//ARRAY TEXT(ACC_at_AccountCodes;0)
	//ARRAY TEXT(ACC_at_AccountName;0)
	//ARRAY TEXT(ACC_at_AnalCodesList;0)
	//ARRAY TEXT(ACC_AT_AnalList;0)
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
	//ARRAY TEXT(ACC_At_LayercodesList;0)
	//ARRAY TEXT(ACC_AT_layers;0)
	//ARRAY TEXT(ACC_AT_LayersList;0)
	//ARRAY TEXT(ACC_at_LevelUpCode;0)
	//ARRAY TEXT(ACC_at_LRelatedAccountCodes;0)
	//ARRAY TEXT(ACC_at_PLB;0)
	//ARRAY TEXT(ACC_at_ProfitorBalance;0)
	//ARRAY TEXT(ACC_at_RelatedAccountCodes;0)
	//ARRAY TEXT(ACC_at_ReportHeading;0)
	C_BOOLEAN:C305($_bo_AllHeadings; $_bo_NoMoreLevels; $_bo_ShowAnalysis; $_bo_ShowLayers; $1)
	C_LONGINT:C283($_l_CurrentLevel; $_l_Element; $_l_FirstLevelUpRow; $_l_GroupsIndex; $_l_HeadingCodeRow; $_l_HeadingCodeRowTrackerReturn; $_l_Index; $_l_LevelsIndex; $_l_LevelUpHeadingRow; $_l_MissingAccountRow; $_l_MissingAccountsIndex)
	C_LONGINT:C283($_l_NextInsertColumn; $_l_NumberofGroups; $_l_RelatedAccountRow; $_l_ReportHeadingRow; ACC_l_ACCCurrentLevel; ACC_l_AccListRef; ACC_l_AccSetup; ACC_l_BUT1; ACC_l_BUT10; ACC_l_BUT11; ACC_l_BUT12)
	C_LONGINT:C283(ACC_l_BUT13; ACC_l_BUT14; ACC_l_BUT15; ACC_l_BUT16; ACC_l_BUT17; ACC_l_BUT18; ACC_l_BUT19; ACC_l_BUT2; ACC_l_BUT20; ACC_l_BUT21; ACC_l_BUT22)
	C_LONGINT:C283(ACC_l_BUT23; ACC_l_BUT24; ACC_l_BUT25; ACC_l_BUT26; ACC_l_BUT27; ACC_l_BUT3; ACC_l_BUT4; ACC_l_BUT5; ACC_l_BUT6; ACC_l_BUT7; ACC_l_BUT8)
	C_LONGINT:C283(ACC_l_BUT9)
	C_POINTER:C301($_Ptr_CurrentLevelCode; $_ptr_CurrentLevelGroupNames; $_Ptr_LevelGroupCodes; $_Ptr_LevelGroupCodes1; $_Ptr_LevelGroupNames; $_Ptr_LevelGroupNames1)
	C_TEXT:C284($_t_oldMethodName; $_t_ParentLevelCode; $_t_ReportHeading; ACC_t_Group1Level; ACC_t_Group2Level; ERR_Method; oACC_COL1; oACC_COL10; oACC_COL11; oACC_COL12; oACC_COL13)
	C_TEXT:C284(oACC_COL14; oACC_COL15; oACC_COL16; oACC_COL17; oACC_COL18; oACC_COL19; oACC_COL2; oACC_COL20; oACC_COL21; oACC_COL22; oACC_COL23)
	C_TEXT:C284(oACC_COL24; oACC_COL25; oACC_COL26; oACC_COL27; oACC_COL3; oACC_COL4; oACC_COL5; oACC_COL6; oACC_COL7; oACC_COL8; oACC_COL9)
	C_TEXT:C284(oACC_HED1; oACC_HED10; oACC_HED11; oACC_HED12; oACC_HED13; oACC_HED14; oACC_HED15; oACC_HED16; oACC_HED17; oACC_HED18; oACC_HED19)
	C_TEXT:C284(oACC_HED2; oACC_HED20; oACC_HED21; oACC_HED22; oACC_HED23; oACC_HED24; oACC_HED25; oACC_HED26; oACC_HED27; oACC_HED3; oACC_HED4)
	C_TEXT:C284(oACC_HED5; oACC_HED6; oACC_HED7; oACC_HED8; oACC_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LAY_LoadAccountsArrays")
ARRAY TEXT:C222(ACC_at_Group1; 0)
ARRAY TEXT:C222(ACC_at_Group1Codes; 0)
ARRAY TEXT:C222(ACC_at_Group2; 0)
ARRAY TEXT:C222(ACC_at_Group2Codes; 0)
ARRAY TEXT:C222(ACC_at_Group3; 0)
ARRAY TEXT:C222(ACC_at_Group3Codes; 0)
ARRAY TEXT:C222(ACC_at_Group4; 0)
ARRAY TEXT:C222(ACC_at_Group4Codes; 0)
If (Count parameters:C259>=1)
	$_bo_AllHeadings:=$1
Else 
	$_bo_AllHeadings:=True:C214
End if 
//go from the selection of balances to a selection of accounts
//`SELECTION TO ARRAY([ACC BALANCES]Account Code;$_at_AccountCodes)
ARRAY TEXT:C222(ACC_at_Group1; 0)  //This will  contain all the headings wihin that group-the names of the headings in that group.
If (Is a list:C621(ACC_l_AccSetup))
	CLEAR LIST:C377(ACC_l_AccSetup; *)
End if 
ACC_l_AccSetup:=New list:C375
//QUERY WITH ARRAY([ACCOUNTS]Account Code;$_at_AccountCodes)
ARRAY LONGINT:C221(ACC_al_AccCodeRef; 0)
ARRAY LONGINT:C221(AAC_al_UsedACCS; 0)
SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_AccountCodes; [ACCOUNTS:32]Account_Name:3; ACC_at_AccountName; [ACCOUNTS:32]Group_Heading:6; ACC_at_GroupHeading; [ACCOUNTS:32]IO:5; ACC_at_IO; [ACCOUNTS:32]Report_Heading:1; ACC_at_ReportHeading; [ACCOUNTS:32]No_NL_Postings:9; ACC_abo_NONLPOSTINGS; [ACCOUNTS:32]PB:4; ACC_at_PLB)
QUERY WITH ARRAY:C644([ACCOUNTS_ANALYSES:157]Account_Code:3; ACC_at_AccountCodes)
SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; ACC_AT_analysis; [ACCOUNTS_ANALYSES:157]Account_Code:3; ACC_at_RelatedAccountCodes)
$_bo_ShowAnalysis:=False:C215
$_bo_ShowLayers:=False:C215
ARRAY TEXT:C222(ACC_AT_AnalList; 0)
ARRAY TEXT:C222(ACC_AT_AnalList; Size of array:C274(ACC_at_AccountCodes))
ARRAY TEXT:C222(ACC_AT_LayersList; 0)
ARRAY TEXT:C222(ACC_AT_LayersList; Size of array:C274(ACC_at_AccountCodes))
For ($_l_Index; 1; Size of array:C274(ACC_AT_analysis))
	$_bo_ShowAnalysis:=True:C214
	$_l_RelatedAccountRow:=Find in array:C230(ACC_at_AccountCodes; ACC_at_RelatedAccountCodes{$_l_Index})
	If ($_l_RelatedAccountRow>0)  //it better be
		If (ACC_AT_AnalList{$_l_RelatedAccountRow}="")
			ACC_AT_AnalList{$_l_RelatedAccountRow}:=ACC_AT_analysis{$_l_Index}
		Else 
			ACC_AT_AnalList{$_l_RelatedAccountRow}:=ACC_AT_AnalList{$_l_RelatedAccountRow}+","+ACC_AT_analysis{$_l_Index}
		End if 
	End if 
	
End for 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)  //Multi-Layer
	QUERY WITH ARRAY:C644([ACCOUNTS_LAYERS:156]Account_Code:3; ACC_at_AccountCodes)
	SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; ACC_AT_layers; [ACCOUNTS_LAYERS:156]Account_Code:3; ACC_at_LRelatedAccountCodes)
	
	For ($_l_Index; 1; Size of array:C274(ACC_AT_layers))
		$_bo_ShowLayers:=False:C215
		$_l_RelatedAccountRow:=Find in array:C230(ACC_at_AccountCodes; ACC_at_LRelatedAccountCodes{$_l_Index})
		If ($_l_RelatedAccountRow>0)  //it better be
			If (ACC_AT_LayersList{$_l_RelatedAccountRow}="")
				ACC_AT_LayersList{$_l_RelatedAccountRow}:=ACC_AT_layers{$_l_Index}
			Else 
				ACC_AT_LayersList{$_l_RelatedAccountRow}:=ACC_AT_LayersList{$_l_RelatedAccountRow}+","+ACC_AT_layers{$_l_Index}
			End if 
		End if 
		
	End for 
	
End if 
SORT ARRAY:C229(ACC_at_AccountCodes; ACC_at_AccountName; ACC_at_GroupHeading; ACC_at_IO; ACC_at_ReportHeading; ACC_abo_NONLPOSTINGS; ACC_at_PLB; ACC_AT_AnalList; ACC_AT_LayersList)

ARRAY LONGINT:C221(ACC_al_AccCodeRef; Size of array:C274(ACC_at_AccountCodes))
ARRAY LONGINT:C221(AAC_al_UsedACCS; Size of array:C274(ACC_at_AccountCodes))
For ($_l_Index; 1; Size of array:C274(ACC_al_AccCodeRef))
	//ACC_al_AccCodeRef{$_l_Index}:=AA_GetNextID (->ACC_l_AccListRef)
End for 
If (Not:C34($_bo_AllHeadings))
	SELECTION TO ARRAY:C260([HEADINGS:84]Heading_Code:1; $_at_LoadHeadingCodes)
Else 
	ARRAY TEXT:C222($_at_LoadHeadingCodes; 0)
End if 
ALL RECORDS:C47([HEADINGS:84])

ARRAY LONGINT:C221(ACC_al_AccHeadingRef; 0)
ARRAY LONGINT:C221(AAC_al_UsedHEADS; 0)
ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Group_Code:5; [HEADINGS:84]Heading_Code:1)
SELECTION TO ARRAY:C260([HEADINGS:84]Group_Code:5; ACC_at_GroupCode; [HEADINGS:84]Heading_Code:1; ACC_at_HeadingCode; [HEADINGS:84]Heading_Level:3; ACC_ai_HeadingLevel; [HEADINGS:84]Heading_Name:2; ACC_at_HeadingNames; [HEADINGS:84]Level_Up_Code:4; ACC_at_LevelUpCode)

ARRAY LONGINT:C221(ACC_al_AccHeadingRef; Size of array:C274(ACC_at_GroupCode))
ARRAY LONGINT:C221(AAC_al_UsedHEADS; Size of array:C274(ACC_at_GroupCode))
If (Size of array:C274($_at_LoadHeadingCodes)>0)
	$_l_Index:=0
	Repeat 
		$_l_Index:=$_l_Index+1
		$_l_HeadingCodeRow:=Find in array:C230(ACC_at_HeadingCode; $_at_LoadHeadingCodes{$_l_Index})
		If ($_l_HeadingCodeRow>0)
			If (ACC_at_LevelUpCode{$_l_HeadingCodeRow}#"")
				$_l_LevelUpHeadingRow:=Find in array:C230($_at_LoadHeadingCodes; ACC_at_LevelUpCode{$_l_HeadingCodeRow})
				
				If ($_l_LevelUpHeadingRow<0)
					APPEND TO ARRAY:C911($_at_LoadHeadingCodes; ACC_at_LevelUpCode{$_l_HeadingCodeRow})
				End if 
			End if 
			If (ACC_at_GroupCode{$_l_HeadingCodeRow}#"")
				$_l_HeadingCodeRow:=Find in array:C230($_at_LoadHeadingCodes; ACC_at_GroupCode{$_l_HeadingCodeRow})
				If ($_l_HeadingCodeRow<0)
					APPEND TO ARRAY:C911($_at_LoadHeadingCodes; ACC_at_GroupCode{$_l_HeadingCodeRow})
				End if 
			End if 
		End if 
	Until ($_l_Index=Size of array:C274($_at_LoadHeadingCodes))
	
End if 

For ($_l_Index; 1; Size of array:C274(ACC_al_AccCodeRef))
	//ACC_al_AccCodeRef{$_l_Index}:=AA_GetNextID (->ACC_l_AccListRef)
End for 
ACC_l_ACCCurrentLevel:=1
//First we are going to set up the headings at each level
For ($_l_Index; 1; Size of array:C274(ACC_at_GroupCode))
	If (ACC_at_GroupCode{$_l_Index}="") & (ACC_at_LevelUpCode{$_l_Index}="")  //`This is the base level off which everny else hangs we need to find what hangs off it
		If (Size of array:C274($_at_LoadHeadingCodes)>0)
			$_l_HeadingCodeRow:=Find in array:C230($_at_LoadHeadingCodes; ACC_at_HeadingCode{$_l_Index})
		Else 
			$_l_HeadingCodeRow:=1
		End if 
		If ($_l_HeadingCodeRow>0)
			ACC_t_Group1Level:=String:C10(ACC_ai_HeadingLevel{$_l_Index})
			APPEND TO ARRAY:C911(ACC_at_Group1; ACC_at_HeadingNames{$_l_Index})
			APPEND TO ARRAY:C911(ACC_at_Group1Codes; ACC_at_HeadingCode{$_l_Index})
		End if 
	End if 
End for 

$_l_NumberofGroups:=Size of array:C274(ACC_at_Group1)
ARRAY TEXT:C222(ACC_at_Group2; $_l_NumberofGroups)
ARRAY TEXT:C222(ACC_at_Group2Codes; $_l_NumberofGroups)
For ($_l_GroupsIndex; Size of array:C274(ACC_at_Group1Codes); 1; -1)
	If (Size of array:C274($_at_LoadHeadingCodes)>0)
		$_l_HeadingCodeRow:=Find in array:C230($_at_LoadHeadingCodes; ACC_at_Group1Codes{$_l_GroupsIndex})
	Else 
		$_l_HeadingCodeRow:=1
	End if 
	If ($_l_HeadingCodeRow>0)
		$_t_ParentLevelCode:=ACC_at_Group1Codes{$_l_GroupsIndex}
		
		ACC_l_ACCCurrentLevel:=2
		$_l_Element:=1
		For ($_l_Index; 1; Size of array:C274(ACC_at_GroupCode))
			If (Size of array:C274($_at_LoadHeadingCodes)>0)
				$_l_HeadingCodeRow:=Find in array:C230($_at_LoadHeadingCodes; ACC_at_HeadingCode{$_l_Index})
			Else 
				$_l_HeadingCodeRow:=1
			End if 
			If ($_l_HeadingCodeRow>0)
				If (ACC_at_GroupCode{$_l_Index}=$_t_ParentLevelCode) & (ACC_at_LevelUpCode{$_l_Index}="")  //`This is the base level off which everny else hangs we need to find what hangs off it
					ACC_t_Group2Level:=String:C10(ACC_ai_HeadingLevel{$_l_Index})
					INSERT IN ARRAY:C227(ACC_at_Group1; $_l_GroupsIndex+$_l_Element; 1)
					INSERT IN ARRAY:C227(ACC_at_Group1Codes; $_l_GroupsIndex+$_l_Element; 1)
					INSERT IN ARRAY:C227(ACC_at_Group2; $_l_GroupsIndex+$_l_Element; 1)
					INSERT IN ARRAY:C227(ACC_at_Group2Codes; $_l_GroupsIndex+$_l_Element; 1)
					
					ACC_at_Group2{$_l_GroupsIndex+$_l_Element}:=ACC_at_HeadingNames{$_l_Index}
					ACC_at_Group2Codes{$_l_GroupsIndex+$_l_Element}:=ACC_at_HeadingCode{$_l_Index}
					$_l_Element:=$_l_Element+1
				End if 
			End if 
		End for 
	End if 
End for 
$_l_CurrentLevel:=2
$_bo_NoMoreLevels:=True:C214
$_ptr_CurrentLevelGroupNames:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
$_Ptr_CurrentLevelCode:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")
Repeat 
	$_Ptr_LevelGroupNames:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1))
	$_Ptr_LevelGroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1)+"Codes")
	ARRAY TEXT:C222($_Ptr_LevelGroupNames->; 0)
	ARRAY TEXT:C222($_Ptr_LevelGroupCodes->; 0)
	$_l_NumberofGroups:=Size of array:C274($_ptr_CurrentLevelGroupNames->)
	ARRAY TEXT:C222($_Ptr_LevelGroupNames->; $_l_NumberofGroups)
	ARRAY TEXT:C222($_Ptr_LevelGroupCodes->; $_l_NumberofGroups)
	For ($_l_GroupsIndex; Size of array:C274($_ptr_CurrentLevelGroupNames->); 1; -1)
		If ($_Ptr_CurrentLevelCode->{$_l_GroupsIndex}#"")
			$_t_ParentLevelCode:=$_Ptr_CurrentLevelCode->{$_l_GroupsIndex}
			$_l_Element:=1
			$_l_FirstLevelUpRow:=Find in array:C230(ACC_at_LevelUpCode; $_t_ParentLevelCode)
			If ($_l_FirstLevelUpRow>0)
				For ($_l_Index; $_l_FirstLevelUpRow; Size of array:C274(ACC_at_GroupCode))
					
					If (ACC_at_GroupCode{$_l_Index}#"") & (ACC_at_LevelUpCode{$_l_Index}=$_t_ParentLevelCode)  //`This is the base level off which everny else hangs we need to find what hangs off it
						ACC_t_Group2Level:=String:C10(ACC_ai_HeadingLevel{$_l_Index})
						For ($_l_LevelsIndex; 1; $_l_CurrentLevel+1)
							$_Ptr_LevelGroupNames1:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelsIndex))
							$_Ptr_LevelGroupCodes1:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelsIndex)+"Codes")
							INSERT IN ARRAY:C227($_Ptr_LevelGroupNames1->; $_l_GroupsIndex+$_l_Element; 1)
							INSERT IN ARRAY:C227($_Ptr_LevelGroupCodes1->; $_l_GroupsIndex+$_l_Element; 1)
						End for 
						$_bo_NoMoreLevels:=False:C215
						$_Ptr_LevelGroupNames->{$_l_GroupsIndex+$_l_Element}:=ACC_at_HeadingNames{$_l_Index}
						$_Ptr_LevelGroupCodes->{$_l_GroupsIndex+$_l_Element}:=ACC_at_HeadingCode{$_l_Index}
						$_l_Element:=$_l_Element+1
					End if 
				End for 
			End if 
		End if 
	End for 
	If ($_bo_NoMoreLevels=False:C215)
		$_l_CurrentLevel:=$_l_CurrentLevel+1
		$_bo_NoMoreLevels:=True:C214
		$_ptr_CurrentLevelGroupNames:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
		$_Ptr_CurrentLevelCode:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")
	End if 
Until ($_bo_NoMoreLevels)

$_ptr_CurrentLevelGroupNames:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel))
$_Ptr_CurrentLevelCode:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel)+"Codes")

SORT ARRAY:C229(ACC_at_AccountCodes; ACC_at_AccountName; ACC_at_GroupHeading; ACC_at_IO; ACC_at_ReportHeading; ACC_abo_NONLPOSTINGS; ACC_at_PLB; ACC_AT_AnalList; ACC_AT_LayersList)

$_Ptr_LevelGroupNames:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1))
$_Ptr_LevelGroupCodes:=Get pointer:C304("ACC_at_Group"+String:C10($_l_CurrentLevel+1)+"Codes")
ARRAY TEXT:C222($_Ptr_LevelGroupNames->; 0)
ARRAY TEXT:C222($_Ptr_LevelGroupCodes->; 0)
$_l_NumberofGroups:=Size of array:C274($_ptr_CurrentLevelGroupNames->)
ARRAY TEXT:C222($_Ptr_LevelGroupNames->; $_l_NumberofGroups)
ARRAY TEXT:C222($_Ptr_LevelGroupCodes->; $_l_NumberofGroups)
ARRAY BOOLEAN:C223(ACC_abo_RestrictNL; $_l_NumberofGroups)
ARRAY TEXT:C222(ACC_at_ProfitorBalance; $_l_NumberofGroups)
ARRAY TEXT:C222(ACC_at_AnalCodesList; $_l_NumberofGroups)
ARRAY TEXT:C222(ACC_At_LayercodesList; $_l_NumberofGroups)


//``

//This is only going to add one more level
ARRAY TEXT:C222($_at_AccountCodes; 0)
For ($_l_GroupsIndex; Size of array:C274($_ptr_CurrentLevelGroupNames->); 1; -1)
	ARRAY TEXT:C222($_at_ParentCodes; 0)
	For ($_l_LevelsIndex; 1; $_l_CurrentLevel+1)
		$_Ptr_LevelGroupCodes1:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelsIndex)+"Codes")
		APPEND TO ARRAY:C911($_at_ParentCodes; $_Ptr_LevelGroupCodes1->{$_l_GroupsIndex})
	End for 
	For ($_l_LevelsIndex; Size of array:C274($_at_ParentCodes); 1; -1)
		If ($_at_ParentCodes{$_l_LevelsIndex}#"")
			$_t_ParentLevelCode:=$_at_ParentCodes{$_l_LevelsIndex}  //level 3 code
			$_l_LevelsIndex:=0
		End if 
	End for 
	If ($_t_ParentLevelCode#"")
		$_l_Element:=1
		For ($_l_MissingAccountsIndex; 1; Size of array:C274(ACC_at_AccountCodes))
			If (ACC_at_ReportHeading{$_l_MissingAccountsIndex}=$_t_ParentLevelCode)
				For ($_l_LevelsIndex; 1; $_l_CurrentLevel+1)
					$_Ptr_LevelGroupNames1:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelsIndex))
					$_Ptr_LevelGroupCodes1:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelsIndex)+"Codes")
					INSERT IN ARRAY:C227($_Ptr_LevelGroupNames1->; $_l_GroupsIndex+$_l_Element; 1)
					INSERT IN ARRAY:C227($_Ptr_LevelGroupCodes1->; $_l_GroupsIndex+$_l_Element; 1)
				End for 
				INSERT IN ARRAY:C227(ACC_abo_RestrictNL; $_l_GroupsIndex+$_l_Element; 1)
				INSERT IN ARRAY:C227(ACC_at_ProfitorBalance; $_l_GroupsIndex+$_l_Element; 1)
				INSERT IN ARRAY:C227(ACC_at_AnalCodesList; $_l_GroupsIndex+$_l_Element; 1)
				INSERT IN ARRAY:C227(ACC_At_LayercodesList; $_l_GroupsIndex+$_l_Element; 1)
				$_Ptr_LevelGroupNames->{$_l_GroupsIndex+$_l_Element}:=ACC_at_AccountName{$_l_MissingAccountsIndex}
				$_Ptr_LevelGroupCodes->{$_l_GroupsIndex+$_l_Element}:=ACC_at_AccountCodes{$_l_MissingAccountsIndex}
				ACC_abo_RestrictNL{$_l_GroupsIndex+$_l_Element}:=ACC_abo_NONLPOSTINGS{$_l_MissingAccountsIndex}
				ACC_at_ProfitorBalance{$_l_GroupsIndex+$_l_Element}:=ACC_at_PLB{$_l_MissingAccountsIndex}
				ACC_at_AnalCodesList{$_l_GroupsIndex+$_l_Element}:=ACC_AT_AnalList{$_l_MissingAccountsIndex}
				ACC_At_LayercodesList{$_l_GroupsIndex+$_l_Element}:=ACC_AT_LayersList{$_l_MissingAccountsIndex}
				APPEND TO ARRAY:C911($_at_AccountCodes; ACC_at_AccountCodes{$_l_MissingAccountsIndex})
				$_l_Element:=$_l_Element+1
			End if 
		End for 
	Else 
		//TRACE
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
	$_l_NumberofGroups:=Size of array:C274(ACC_at_Group1Codes)
	APPEND TO ARRAY:C911(ACC_at_Group1Codes; "")
	APPEND TO ARRAY:C911(ACC_at_Group1; "Invalid Headings")
	APPEND TO ARRAY:C911(ACC_at_Group2Codes; "")
	APPEND TO ARRAY:C911(ACC_at_Group2; "Invalid Subheadings")
	APPEND TO ARRAY:C911(ACC_at_Group3Codes; "")
	APPEND TO ARRAY:C911(ACC_at_Group3; "")
	APPEND TO ARRAY:C911(ACC_at_Group4Codes; "")
	APPEND TO ARRAY:C911(ACC_at_Group4; "")
	APPEND TO ARRAY:C911(ACC_abo_RestrictNL; False:C215)
	APPEND TO ARRAY:C911(ACC_at_ProfitorBalance; "")
	APPEND TO ARRAY:C911(ACC_at_AnalCodesList; "")
	APPEND TO ARRAY:C911(ACC_At_LayercodesList; "")
	
	For ($_l_Index; 1; Size of array:C274($_at_MissingAccountCodes))
		$_l_MissingAccountRow:=Find in array:C230(ACC_at_AccountCodes; $_at_MissingAccountCodes{$_l_Index})
		$_t_ReportHeading:=ACC_at_ReportHeading{$_l_MissingAccountRow}
		$_l_ReportHeadingRow:=Find in array:C230($_at_CreatedPseudoHeadings; $_t_ReportHeading)
		If ($_l_ReportHeadingRow<0)
			APPEND TO ARRAY:C911($_at_CreatedPseudoHeadings; $_t_ReportHeading)
			
			APPEND TO ARRAY:C911(ACC_at_Group1Codes; "")
			APPEND TO ARRAY:C911(ACC_at_Group1; "")
			APPEND TO ARRAY:C911(ACC_at_Group2Codes; "")
			APPEND TO ARRAY:C911(ACC_at_Group2; "")
			APPEND TO ARRAY:C911(ACC_at_Group3Codes; $_t_ReportHeading)
			APPEND TO ARRAY:C911(ACC_at_Group3; "")
			APPEND TO ARRAY:C911(ACC_at_Group4Codes; "")
			APPEND TO ARRAY:C911(ACC_at_Group4; "")
			APPEND TO ARRAY:C911(ACC_abo_RestrictNL; False:C215)
			APPEND TO ARRAY:C911(ACC_at_ProfitorBalance; "")
			APPEND TO ARRAY:C911(ACC_at_AnalCodesList; "")
			APPEND TO ARRAY:C911(ACC_At_LayercodesList; "")
			
		End if 
	End for 
	
	For ($_l_GroupsIndex; Size of array:C274($_ptr_CurrentLevelGroupNames->); 1; -1)
		$_t_ParentLevelCode:=$_Ptr_CurrentLevelCode->{$_l_GroupsIndex}
		If ($_t_ParentLevelCode#"")
			$_l_Element:=1
			For ($_l_MissingAccountsIndex; 1; Size of array:C274($_at_MissingAccountCodes))
				$_l_MissingAccountRow:=Find in array:C230(ACC_at_AccountCodes; $_at_MissingAccountCodes{$_l_MissingAccountsIndex})
				
				If (ACC_at_ReportHeading{$_l_MissingAccountRow}=$_t_ParentLevelCode)
					For ($_l_LevelsIndex; 1; $_l_CurrentLevel+1)
						$_Ptr_LevelGroupNames1:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelsIndex))
						$_Ptr_LevelGroupCodes1:=Get pointer:C304("ACC_at_Group"+String:C10($_l_LevelsIndex)+"Codes")
						INSERT IN ARRAY:C227($_Ptr_LevelGroupNames1->; $_l_GroupsIndex+$_l_Element; 1)
						INSERT IN ARRAY:C227($_Ptr_LevelGroupCodes1->; $_l_GroupsIndex+$_l_Element; 1)
					End for 
					INSERT IN ARRAY:C227(ACC_abo_RestrictNL; $_l_GroupsIndex+$_l_Element; 1)
					INSERT IN ARRAY:C227(ACC_at_ProfitorBalance; $_l_GroupsIndex+$_l_Element; 1)
					INSERT IN ARRAY:C227(ACC_at_AnalCodesList; $_l_GroupsIndex+$_l_Element; 1)
					INSERT IN ARRAY:C227(ACC_At_LayercodesList; $_l_GroupsIndex+$_l_Element; 1)
					$_Ptr_LevelGroupNames->{$_l_GroupsIndex+$_l_Element}:=ACC_at_AccountName{$_l_MissingAccountRow}
					$_Ptr_LevelGroupCodes->{$_l_GroupsIndex+$_l_Element}:=ACC_at_AccountCodes{$_l_MissingAccountRow}
					ACC_abo_RestrictNL{$_l_GroupsIndex+$_l_Element}:=ACC_abo_NONLPOSTINGS{$_l_MissingAccountRow}
					ACC_at_ProfitorBalance{$_l_GroupsIndex+$_l_Element}:=ACC_at_PLB{$_l_MissingAccountRow}
					ACC_at_AnalCodesList{$_l_GroupsIndex+$_l_Element}:=ACC_AT_AnalList{$_l_MissingAccountRow}
					ACC_At_LayercodesList{$_l_GroupsIndex+$_l_Element}:=ACC_AT_LayersList{$_l_MissingAccountRow}
					APPEND TO ARRAY:C911($_at_AccountCodes; ACC_at_AccountCodes{$_l_MissingAccountRow})
					$_l_Element:=$_l_Element+1
				End if 
			End for 
		End if 
	End for   //there are invalid headings on these..to make them appear i am going to add them in to the header
	
End if 
$_l_CurrentLevel:=$_l_CurrentLevel+1





//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
Case of 
	: ($_l_CurrentLevel=4)
		
		LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; 1; ->ACC_at_Group1Codes; ->ACC_at_Group1; ->ACC_at_Group2Codes; ->ACC_at_Group2; ->ACC_at_Group3Codes; ->ACC_at_Group3; ->ACC_at_Group4Codes; ->ACC_at_Group4; ->ACC_at_ProfitorBalance; ->ACC_abo_RestrictNL)
		
		$_l_NextInsertColumn:=11
		If ($_bo_ShowAnalysis)
			LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; $_l_NextInsertColumn; ->ACC_at_AnalCodesList)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
		
		If ($_bo_ShowLayers)
			LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; $_l_NextInsertColumn; ->ACC_At_LayercodesList)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
		//$_bo_ShowAnalysis:=False
		//$_bo_ShowLayers:=False
		
		//;->ACC_aS80_CardIssuers;->ACC_aS80_CardNumbers;->ACC_aS6_CardExpiries;->ACC_al_CardRecordIDs;->ACC_at_CardOwnerName;->ACC_aS35_AVSFailCode)
		LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; 1; "Codes"; "Headings"; "Codes"; "Level one headings"; "Codes"; "Level two headings"; "Account Code"; "Accounts"; "Profit or Balance sheet"; "No Nominal Ledger Postings")
		$_l_NextInsertColumn:=11
		If ($_bo_ShowAnalysis)
			LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; $_l_NextInsertColumn; "Restrict analysis")
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
		If ($_bo_ShowLayers)
			LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; $_l_NextInsertColumn; "Restrict analysis")
		End if 
		
		LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; 1; 50; 209; 50; 209; 50; 209; 50; 209; 80; 40)
		$_l_NextInsertColumn:=11
		If ($_bo_ShowAnalysis)
			LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; $_l_NextInsertColumn; 90)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
			
		End if 
		If ($_bo_ShowLayers)
			LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; $_l_NextInsertColumn; 90)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
	: ($_l_CurrentLevel=3)
		
		LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; 1; ->ACC_at_Group1Codes; ->ACC_at_Group1; ->ACC_at_Group2Codes; ->ACC_at_Group2; ->ACC_at_Group3Codes; ->ACC_at_Group3; ->ACC_at_ProfitorBalance; ->ACC_abo_RestrictNL)
		
		$_l_NextInsertColumn:=9
		If ($_bo_ShowAnalysis)
			LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; $_l_NextInsertColumn; ->ACC_at_AnalCodesList)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
		
		If ($_bo_ShowLayers)
			LB_SetupListbox(->DB_lb_OutputArrays; "oCCM"; "ACC_L"; $_l_NextInsertColumn; ->ACC_At_LayercodesList)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
		//$_bo_ShowAnalysis:=False
		//$_bo_ShowLayers:=False
		
		//;->ACC_aS80_CardIssuers;->ACC_aS80_CardNumbers;->ACC_aS6_CardExpiries;->ACC_al_CardRecordIDs;->ACC_at_CardOwnerName;->ACC_aS35_AVSFailCode)
		LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; 1; "Codes"; "Headings"; "Codes"; "Level one headings"; "Account Code"; "Accounts"; "Profit or Balance sheet"; "No Nominal Ledger Postings")
		$_l_NextInsertColumn:=9
		If ($_bo_ShowAnalysis)
			LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; $_l_NextInsertColumn; "Restrict analysis")
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
		If ($_bo_ShowLayers)
			LB_SetColumnHeaders(->DB_lb_OutputArrays; "ACC_L"; $_l_NextInsertColumn; "Restrict analysis")
		End if 
		
		LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; 1; 50; 209; 50; 209; 50; 209; 50; 209; 80; 40)
		$_l_NextInsertColumn:=9
		If ($_bo_ShowAnalysis)
			LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; $_l_NextInsertColumn; 90)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
			
		End if 
		If ($_bo_ShowLayers)
			LB_SetColumnWidths(->DB_lb_OutputArrays; "oCCM"; $_l_NextInsertColumn; 90)
			$_l_NextInsertColumn:=$_l_NextInsertColumn+1
		End if 
End case 
//Card Type";"Issued by";"Card Number";'"Expiry Date";"";"";"")


//`109;162;59;0;0;0)
LB_SetScroll(->DB_lb_OutputArrays; -3; -2)



LB_SetEnterable(->DB_lb_OutputArrays; False:C215; 0; "")
LB_StyleSettings(->DB_lb_OutputArrays; "Black"; 9; "oCCM"; ->[ACCOUNTS:32])

//LBi_InclSetupJustStyle (->DB_lb_OutputArrays)
//LB_Setdividers (->DB_lb_OutputArrays;Black;0)

LBI_Scrollonresize(->DB_lb_OutputArrays)
ERR_MethodTrackerReturn("LAY_LoadAccountsArrays"; $_t_oldMethodName)