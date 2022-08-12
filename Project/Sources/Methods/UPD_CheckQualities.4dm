//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_CheckQualities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CheckedCombos; 0)
	C_LONGINT:C283($_l_Index; $_l_index2; $_l_LastQualityID; $_l_Parent; $_l_QualityGroupsID; $_l_QualityID; $_l_RecordsinSeleciton; $_l_SubListID; $_l_SubParent; $_l_SubParentID)
	C_TEXT:C284($_t_Group; $_t_GroupName; $_t_oldMethodName; $_t_QualityName; $_t_SubGroup)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPD_CheckQualities")
QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14>0)
If (Records in selection:C76([INFORMATION:55])>0)
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="Qualities")
	$_l_Parent:=[X_LISTS:111]x_ID:1
	CREATE SET:C116([INFORMATION:55]; "Done")
	
	//we can update from these first
	ARRAY TEXT:C222($_at_CheckedCombos; 0)
	
	$_l_RecordsinSeleciton:=Records in selection:C76([INFORMATION:55])
	$_l_LastQualityID:=0
	READ WRITE:C146([INFORMATION:55])
	For ($_l_Index; 1; $_l_RecordsinSeleciton)
		USE SET:C118("DONE")
		ORDER BY:C49([INFORMATION:55]; [INFORMATION:55]QualityID:14)
		GOTO SELECTED RECORD:C245([INFORMATION:55]; $_l_Index)
		$_l_QualityID:=[INFORMATION:55]QualityID:14
		$_t_QualityName:=[INFORMATION:55]SubGroup:6
		$_t_GroupName:=[INFORMATION:55]Group:2
		$_l_QualityGroupsID:=[INFORMATION:55]QualityGroupID:15
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INFORMATION:55]Company_Code:7)
		If (Records in selection:C76([COMPANIES:2])>0)
			If ([COMPANIES:2]x_ID:63=0)
				READ WRITE:C146([COMPANIES:2])
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INFORMATION:55]Company_Code:7)
				[COMPANIES:2]x_ID:63:=AA_GetNextIDinMethod(->[COMPANIES:2]x_ID:63)
				DB_SaveRecord(->[COMPANIES:2])
				AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			End if 
			[INFORMATION:55]RelateTableRecordNumber:13:=[COMPANIES:2]x_ID:63
			DB_SaveRecord(->[INFORMATION:55])
			AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
		Else 
			[INFORMATION:55]RelateTableRecordNumber:13:=0
			DB_SaveRecord(->[INFORMATION:55])
			AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
		End if 
		
		If ($_l_LastQualityID#$_l_QualityID)
			ERASE WINDOW:C160
			MESSAGE:C88("Checking existing data:"+Char:C90(13))
			MESSAGE:C88("Checking"+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSeleciton))
			MESSAGE:C88(Char:C90(13)+$_t_QualityName)
			
			
			
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_QualityID)
			
			If ([LIST_ITEMS:95]List_Entry:2#$_t_QualityName)
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_Parent; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2=$_t_GroupName)
				$_l_SubParentID:=[LIST_ITEMS:95]X_ID:3
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_GroupName)
				$_l_SubParent:=[X_LISTS:111]x_ID:1
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=$_t_QualityName; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$_l_SubParent)
				$_l_SubListID:=[LIST_ITEMS:95]X_ID:3
				If (Records in selection:C76([LIST_ITEMS:95])>0)
					Case of 
						: (Records in selection:C76([LIST_ITEMS:95])=1)
							QUERY:C277([INFORMATION:55]; [INFORMATION:55]SubGroup:6=$_t_QualityName; *)
							QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityID:14=$_l_QualityID)
							DB_lockFile(->[INFORMATION:55])
							APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityID:14:=$_l_SubListID)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
							$_l_QualityID:=$_l_SubListID
							$_l_QualityGroupsID:=$_l_SubParentID
						Else 
							
					End case 
				End if 
				
			End if 
			
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]SubGroup:6=$_t_QualityName; *)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Group:2=$_t_GroupName; *)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityID:14=0)
			$_l_LastQualityID:=$_l_QualityID
			
			If (Records in selection:C76([INFORMATION:55])>0)
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_QualityID)
				$_t_SubGroup:=[LIST_ITEMS:95]List_Entry:2
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_QualityGroupsID)
				$_t_Group:=[LIST_ITEMS:95]List_Entry:2
				For ($_l_index2; 1; Records in selection:C76([INFORMATION:55]))
					ERASE WINDOW:C160
					MESSAGE:C88("Checking existing data:"+Char:C90(13))
					MESSAGE:C88("Checking"+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSeleciton))
					MESSAGE:C88(Char:C90(13)+$_t_QualityName+Char:C90(13))
					MESSAGE:C88("Updating Information Record"+String:C10($_l_index2)+" of "+String:C10(Records in selection:C76([INFORMATION:55])))
					
					[INFORMATION:55]Group:2:=$_t_Group
					[INFORMATION:55]SubGroup:6:=$_t_SubGroup
					[INFORMATION:55]QualityID:14:=$_l_QualityID
					[INFORMATION:55]QualityGroupID:15:=$_l_QualityGroupsID
					If ([INFORMATION:55]RelateTableRecordNumber:13=0)
						If ([INFORMATION:55]Company_Code:7#"")
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INFORMATION:55]Company_Code:7)
							If (Records in selection:C76([COMPANIES:2])>0)
								If ([COMPANIES:2]x_ID:63=0)
									READ WRITE:C146([COMPANIES:2])
									LOAD RECORD:C52([COMPANIES:2])
									[COMPANIES:2]x_ID:63:=AA_GetNextIDinMethod(->[COMPANIES:2]x_ID:63)
									DB_SaveRecord(->[COMPANIES:2])
									AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
								End if 
							Else 
								REDUCE SELECTION:C351([COMPANIES:2]; 0)
							End if 
							
							[INFORMATION:55]RelatedTableNumber:11:=Table:C252(->[COMPANIES:2])
							[INFORMATION:55]RelatedTableFieldNum:12:=Field:C253(->[COMPANIES:2]x_ID:63)
							[INFORMATION:55]RelateTableRecordNumber:13:=[COMPANIES:2]x_ID:63
							UNLOAD RECORD:C212([COMPANIES:2])
							READ ONLY:C145([COMPANIES:2])
							
						End if 
						
					End if 
					DB_SaveRecord(->[INFORMATION:55])
					AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
					NEXT RECORD:C51([INFORMATION:55])
				End for 
				
			End if 
			
		End if 
		
	End for 
	
	
End if 
ERR_MethodTrackerReturn("UPD_CheckQualities"; $_t_oldMethodName)