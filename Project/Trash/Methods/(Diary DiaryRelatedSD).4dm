//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryRelatedSD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:00:45If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; <>SD3_bo_Query; $_bo_Expanded)
	C_LONGINT:C283(<>AutoProc; $_l_HistoryType; $_l_ItemReference; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SublistID; SD_l_CompanionMenuTable; SD_l_HLRelatedInfo; SD3_l_CallActionNum; SD3_l_DiaryActionNum)
	C_REAL:C285($_l_SelectedListItem2)
	C_TEXT:C284(<>AutoFile; $_t_ItemText; $_t_oldMethodName; SD_t_ProcRelationActionID; SD3_t_DiaryRelatedRecord)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryRelatedSD")
//Diary_DiaryRelatedSD - SuperDiary - WT

$_l_SelectedListItem:=Selected list items:C379(SD_l_HLRelatedInfo)  // Get the position of the selected item
If ($_l_SelectedListItem#0)  // Just in case, check the position
	GET LIST ITEM:C378(SD_l_HLRelatedInfo; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	$_l_SelectedItemParent:=List item parent:C633(SD_l_HLRelatedInfo; $_l_ItemReference)
	If ($_l_SelectedItemParent>0)
		SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLRelatedInfo; List item parent:C633(SD_l_HLRelatedInfo; $_l_ItemReference))  // Select the parent item
	End if 
	$_l_SelectedListItem2:=Selected list items:C379(SD_l_HLRelatedInfo)
	GET LIST ITEM:C378(SD_l_HLRelatedInfo; $_l_SelectedListItem2; $_l_ItemReference; $_t_ItemText)
	SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLRelatedInfo; 1)  // Reselect the child item
	////////////_o_REDRAW LIST(SD_l_HLRelatedInfo)
End if 
Case of 
	: (($_l_SelectedListItem>=3) & ($_l_SelectedListItem<=10))  //for the View items pop-up menu
		SDiary_MenV($_l_SelectedListItem)
	: (($_l_SelectedListItem>=12) & ($_l_SelectedListItem<=26))  //for the History items pop-up menu
		If (Modified record:C314([DIARY:12]))
			Diary_PersPrior
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		End if 
		$_l_HistoryType:=SDiary_HistFind($_l_SelectedListItem)
		$_l_HistoryType:=$_l_HistoryType-1
		If ($_l_HistoryType>0)
			Case of 
				: ($_l_HistoryType=1)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
					SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
				: ($_l_HistoryType=2)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Contact_Code:2
					SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
					
				: ($_l_HistoryType=3)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
					SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
					
				: ($_l_HistoryType=5)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
					SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
					
					
				: ($_l_HistoryType=7)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
					SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
				: ($_l_HistoryType=8)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
					SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
					SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
					
				: ($_l_HistoryType=9)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
					SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
					SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
				: ($_l_HistoryType=10)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
					SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
					SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
				: ($_l_HistoryType=12)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
					SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
					SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
				: ($_l_HistoryType=14)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
					SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
					SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
				: ($_l_HistoryType=15)
					SD3_t_DiaryRelatedRecord:=[DIARY:12]Document_Code:15
					SD_l_CompanionMenuTable:=Table:C252(->[DOCUMENTS:7])
					SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
			End case 
			If (SD3_t_DiaryRelatedRecord#"") & (SD_l_CompanionMenuTable>0)
				<>DB_bo_AutoOut:=True:C214
				<>AutoFind:=True:C214
				<>AutoProc:=Record number:C243([DIARY:12])
				<>AutoFile:="Diary"
				
				SD3_l_CallActionNum:=1
				
				ZDiary_Mod
				SD3_l_CallActionNum:=0
			End if 
			
		Else 
			$_l_HistoryType:=1
		End if 
End case 
ERR_MethodTrackerReturn("Diary_DiaryRelatedSD"; $_t_oldMethodName)