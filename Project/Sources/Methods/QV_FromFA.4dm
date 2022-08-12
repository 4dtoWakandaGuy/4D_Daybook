//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_FromFA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>QV_al_CallingProcess;0)
	//ARRAY LONGINT(QV_al_ListItemsIDs;0)
	//ARRAY LONGINT(QV_al_subListItemIDS;0)
	//ARRAY TEXT(QV_at_ListItems;0)
	//ARRAY TEXT(QV_at_ListItemProperties;0)
	//ARRAY TEXT(QV_at_SublistItemProperties;0)
	//ARRAY TEXT(QV_at_SubListItems;0)
	C_LONGINT:C283($_l_AddedItemID; $_l_AnalysisIndex; $_l_AnalysisRow; $_l_Contactsindex; $_l_ContactsindextemName; $_l_GroupID; $_l_ListID; $_l_Number; $_l_SubListID; $_l_SublistRow; $1)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_AnalysesCode; $_t_AnalysesName; $_t_itemName; $_t_oldMethodName; $_t_SubListName; $3)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("QV_FromFA")

//this method will translate Further analysis to QV
//$1=Table num
ARRAY TEXT:C222(QV_at_ListItems; 0)
ARRAY LONGINT:C221(QV_al_ListItemsIDs; 0)
ARRAY TEXT:C222(QV_at_ListItemProperties; 0)
ARRAY TEXT:C222(QV_at_SubListItems; 0)
ARRAY LONGINT:C221(QV_al_subListItemIDS; 0)
ARRAY TEXT:C222(QV_at_SublistItemProperties; 0)
//first we make sure we have a 'group'
$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_ListItems; ->QV_al_ListItemsIDs; False:C215; ->QV_at_ListItemProperties)
$_l_AnalysisRow:=Find in array:C230(QV_at_ListItems; "Further Analysis "+Table name:C256(Table:C252($1)))
If ($_l_AnalysisRow<0)
	//add it
	$_l_AddedItemID:=AA_ListAddItem(->[INFORMATION:55]QualityID:14; "Further Analysis "+Table name:C256(Table:C252($1)))
	$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_ListItems; ->QV_al_ListItemsIDs; False:C215; ->QV_at_ListItemProperties)
	$_t_SubListName:="Further Analysis "+Table name:C256(Table:C252($1))
	//that will also mean there is no sublist
	//``so create it
	$_l_ListID:=AA_LoadListByName("Further Analysis "+Table name:C256(Table:C252($1)); ->QV_at_SubListItems; ->QV_al_subListItemIDS; False:C215; ->QV_at_SublistItemProperties)
	$_l_SubListID:=AA_GetListbyName($_t_SubListName)
	READ WRITE:C146([X_LISTS:111])
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_SubListID)
	$_l_Number:=0
	$_l_Number:=$_l_Number ?+ 5
	AA_SetListProperty("ACCESS"; $_l_Number)
	DB_SaveRecord(->[X_LISTS:111])
	AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
	While (Semaphore:C143("$LoadingListofLists"))  //local to this machine
		DelayTicks(60)
	End while 
	AA_LoadListofLists
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
	If (Size of array:C274(<>QV_al_CallingProcess)>0)
		For ($_l_Contactsindex; 1; Size of array:C274(<>QV_al_CallingProcess))
			RESUME PROCESS:C320(<>QV_al_CallingProcess{$_l_Contactsindex})
		End for 
	End if 
	$_l_AnalysisRow:=Find in array:C230(QV_at_ListItems; "Further Analysis "+Table name:C256(Table:C252($1)))
	READ WRITE:C146([LIST_ITEMS:95])
	$_l_GroupID:=QV_al_ListItemsIDs{$_l_AnalysisRow}
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_ListItemsIDs{$_l_AnalysisRow})
	AA_SetListItemProperty("SUBLIST"; $_l_SubListID)
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	UNLOAD RECORD:C212([LIST_ITEMS:95])
Else 
	
	$_t_itemName:="Further Analysis "+Table name:C256(Table:C252($1))
	$_l_ListID:=AA_LoadListByName("Further Analysis "+Table name:C256(Table:C252($1)); ->QV_at_SubListItems; ->QV_al_subListItemIDS; False:C215; ->QV_at_SublistItemProperties)
	$_l_SubListID:=AA_GetListbyName($_t_itemName)
	READ WRITE:C146([LIST_ITEMS:95])
	$_l_GroupID:=QV_al_ListItemsIDs{$_l_AnalysisRow}
	AA_SetListItemProperty("SUBLIST"; $_l_SubListID)
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	UNLOAD RECORD:C212([LIST_ITEMS:95])
End if 


Case of 
	: ($1=Table:C252(->[CONTACTS:1]))
		Case of 
			: ($2=1)  //all records in selection
				
				Open window:C153(20; 60; 150; 250; -1984)
				FIRST RECORD:C50([CONTACTS:1])
				For ($_l_Contactsindex; 1; Records in selection:C76([CONTACTS:1]))
					If ([CONTACTS:1]x_ID:33=0)
						READ WRITE:C146([CONTACTS:1])
						LOAD RECORD:C52([CONTACTS:1])
						
						[CONTACTS:1]x_ID:33:=AA_GetNextIDinMethod(->[CONTACTS:1]x_ID:33)
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					End if 
					READ WRITE:C146([INFORMATION:55])
					ERASE WINDOW:C160
					MESSAGE:C88([CONTACTS:1]Contact_Name:31)
					QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
					
					FIRST RECORD:C50([CONTACTS_RECORD_ANALYSIS:144])
					For ($_l_AnalysisIndex; 1; Records in selection:C76([CONTACTS_RECORD_ANALYSIS:144]))
						MESSAGE:C88(Char:C90(13)+[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1)
						$_t_AnalysesCode:=[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1
						QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=$_t_AnalysesCode)
						If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])>0)
							$_t_AnalysesName:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
							//strip empty chars here
							If ($_t_AnalysesName#"")
								$_l_SublistRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
								If ($_l_SublistRow<0)
									//this code is not in the list so create it
									$_l_AddedItemID:=AA_ListAddItembyID($_l_SubListID; $_t_AnalysesName)
									AA_LoadListbyID($_l_SubListID; ->QV_at_SubListItems; ->QV_al_subListItemIDS; False:C215; ->QV_at_SublistItemProperties)
									$_l_SublistRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
								Else 
									//AA_GetListbyName (
									
								End if 
								//now create the record in the qualities table
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_subListItemIDS{$_l_SublistRow}; *)
								QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[CONTACTS:1]); *)
								QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=[CONTACTS:1]x_ID:33)
								If (Records in selection:C76([INFORMATION:55])=0)
									CREATE RECORD:C68([INFORMATION:55])
									[INFORMATION:55]Group:2:=$_t_SubListName
									[INFORMATION:55]SubGroup:6:=$_t_AnalysesName
									[INFORMATION:55]Information_Date:8:=Current date:C33(*)
									Qual_Code
									[INFORMATION:55]RelatedTableNumber:11:=Table:C252(->[CONTACTS:1])
									[INFORMATION:55]RelatedTableFieldNum:12:=Field:C253(->[CONTACTS:1]x_ID:33)
									[INFORMATION:55]RelateTableRecordNumber:13:=[CONTACTS:1]x_ID:33
									[INFORMATION:55]QualityID:14:=QV_al_subListItemIDS{$_l_SublistRow}
									[INFORMATION:55]QualityGroupID:15:=$_l_GroupID
									DB_SaveRecord(->[INFORMATION:55])
									AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
								Else 
									[INFORMATION:55]QualityGroupID:15:=$_l_GroupID
									DB_SaveRecord(->[INFORMATION:55])
									AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
									
								End if 
							End if 
							
							NEXT RECORD:C51([CONTACTS_RECORD_ANALYSIS:144])
						Else 
							DELETE RECORD:C58([CONTACTS_RECORD_ANALYSIS:144])
							
							DB_SaveRecord(->[CONTACTS:1])
							AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
						End if 
						
					End for 
					NEXT RECORD:C51([CONTACTS:1])
				End for 
				CLOSE WINDOW:C154
				
			: ($2=2)  //the current record
				QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
				
				For ($_l_AnalysisIndex; 1; Records in selection:C76([CONTACTS_RECORD_ANALYSIS:144]))
					$_t_AnalysesCode:=[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1
					QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=$_t_AnalysesCode)
					If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])>0)
						$_t_AnalysesName:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
						
						//strip empty chars here
						If ($_t_AnalysesName#"")
							$_l_AnalysisRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
							If ($_l_AnalysisRow<0)
								//this code is not in the list so create it
								$_l_AddedItemID:=AA_ListAddItembyID($_l_SubListID; $_t_AnalysesName)
								AA_LoadListbyID($_l_SubListID; ->QV_at_SubListItems; ->QV_al_subListItemIDS; False:C215; ->QV_at_SublistItemProperties)
								$_l_AnalysisRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
							End if 
							//now create the record in the qualities table
							QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_subListItemIDS{$_l_AnalysisRow}; *)
							QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[CONTACTS:1]); *)
							QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=[CONTACTS:1]x_ID:33)
							If (Records in selection:C76([INFORMATION:55])=0)
								CREATE RECORD:C68([INFORMATION:55])
								[INFORMATION:55]Group:2:=$_t_SubListName
								[INFORMATION:55]SubGroup:6:=$_t_AnalysesName
								[INFORMATION:55]Information_Date:8:=Current date:C33(*)
								Qual_Code
								[INFORMATION:55]RelatedTableNumber:11:=Table:C252(->[CONTACTS:1])
								[INFORMATION:55]RelatedTableFieldNum:12:=Field:C253(->[CONTACTS:1]x_ID:33)
								[INFORMATION:55]RelateTableRecordNumber:13:=[CONTACTS:1]x_ID:33
								[INFORMATION:55]QualityID:14:=QV_al_subListItemIDS{$_l_AnalysisRow}
								[INFORMATION:55]QualityGroupID:15:=$_l_SubListID
								DB_SaveRecord(->[INFORMATION:55])
								AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
							End if 
						End if 
						
						NEXT RECORD:C51([CONTACTS_RECORD_ANALYSIS:144])
						
					Else 
						DELETE RECORD:C58([CONTACTS_RECORD_ANALYSIS:144])
						
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					End if 
				End for 
			: ($2=3)
				//deleting a Further anal
				$_t_AnalysesName:=$3
				//strip empty chars here
				If ($_t_AnalysesName#"")
					$_l_AnalysisRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
					If ($_l_AnalysisRow>0)
						//now find the record in the qualities table
						QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_subListItemIDS{$_l_AnalysisRow}; *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[CONTACTS:1]); *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=[CONTACTS:1]x_ID:33)
						If (Records in selection:C76([INFORMATION:55])>0)
							[INFORMATION:55]Deleted:10:=1
							DB_SaveRecord(->[INFORMATION:55])
							AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
						End if 
					End if 
				End if 
				
				
		End case 
	: ($1=Table:C252(->[COMPANIES:2]))
		Case of 
			: ($2=1)  //all records in selection
				
			: ($2=2)  //the current record
				QUERY:C277([COMPANIES_RECORD_ANALYSIS:146]; [COMPANIES_RECORD_ANALYSIS:146]Company_Code:4=[COMPANIES:2]Company_Code:1)
				
				For ($_l_AnalysisIndex; 1; Records in selection:C76([COMPANIES_RECORD_ANALYSIS:146]))
					$_t_AnalysesCode:=[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1
					QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=$_t_AnalysesCode)
					If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])>0)
						$_t_AnalysesName:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
						//strip empty chars here
						If ($_t_AnalysesName#"")
							$_l_SublistRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
							If ($_l_SublistRow<0)
								//this code is not in the list so create it
								$_l_AddedItemID:=AA_ListAddItembyID($_l_SubListID; $_t_AnalysesName)
								AA_LoadListbyID($_l_SubListID; ->QV_at_SubListItems; ->QV_al_subListItemIDS; False:C215; ->QV_at_SublistItemProperties)
								$_l_SublistRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
							End if 
							//now create the record in the qualities table
							QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_subListItemIDS{$_l_SublistRow}; *)
							QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[COMPANIES:2]); *)
							QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=[COMPANIES:2]x_ID:63)
							If (Records in selection:C76([INFORMATION:55])=0)
								CREATE RECORD:C68([INFORMATION:55])
								[INFORMATION:55]Group:2:=$_t_AnalysesName
								[INFORMATION:55]SubGroup:6:=$_t_AnalysesName
								[INFORMATION:55]Information_Date:8:=Current date:C33(*)
								Qual_Code
								[INFORMATION:55]RelatedTableNumber:11:=Table:C252(->[COMPANIES:2])
								[INFORMATION:55]RelatedTableFieldNum:12:=Field:C253(->[COMPANIES:2]x_ID:63)
								[INFORMATION:55]RelateTableRecordNumber:13:=[COMPANIES:2]x_ID:63
								[INFORMATION:55]QualityID:14:=QV_al_subListItemIDS{$_l_SublistRow}
								[INFORMATION:55]QualityGroupID:15:=$_l_GroupID
								DB_SaveRecord(->[INFORMATION:55])
								AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
							End if 
						End if 
						
						NEXT RECORD:C51([COMPANIES_RECORD_ANALYSIS:146])
					Else 
						DELETE RECORD:C58([COMPANIES_RECORD_ANALYSIS:146])
						
						DB_SaveRecord(->[COMPANIES:2])
						AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
					End if 
					
				End for 
			: ($2=3)
				//deleting a Further anal
				$_t_AnalysesName:=$3
				//strip empty chars here
				If ($_t_AnalysesName#"")
					$_l_SublistRow:=Find in array:C230(QV_at_SubListItems; $_t_AnalysesName)
					If ($_l_SublistRow>0)
						//now find the record in the qualities table
						QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_subListItemIDS{$_l_SublistRow}; *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[COMPANIES:2]); *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=[COMPANIES:2]x_ID:63)
						If (Records in selection:C76([INFORMATION:55])>0)
							[INFORMATION:55]Deleted:10:=1
							DB_SaveRecord(->[INFORMATION:55])
							AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
						End if 
					End if 
				End if 
				
				
		End case 
		
		
End case 
ERR_MethodTrackerReturn("QV_FromFA"; $_t_oldMethodName)
