
If (False:C215)
	//Table Name:      Trigger on [INFORMATION]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/04/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_QualitySubLevels;0)
	//ARRAY TEXT(QV_at_QualitySubLevels;0)
	C_BOOLEAN:C305(<>SYS_bo_inTrigger)
	C_LONGINT:C283($_l_event; $_l_GroupIDOLD; $_l_LevelRow; $_l_SublevelslistID; $_l_YearRow; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:INFORMATION
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INFORMATION]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
C_LONGINT:C283($_l_GroupIDOLD)

$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214

Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INFORMATION]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			AUTO_AUDIT(->[INFORMATION:55]; Field:C253(->[INFORMATION:55]Information_Code:9); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([INFORMATION:55]QualityID:14>0)
				If ([INFORMATION:55]QualityRecordID:16=0)
					[INFORMATION:55]QualityRecordID:16:=AA_GetNextID(->[INFORMATION:55]QualityRecordID:16)
				End if 
				ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; [INFORMATION:55]QualityID:14; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
			End if 
			If ([INFORMATION:55]QualityGroupID:15>0)
				//READ ONLY([LIST_ITEMS])
				//QUERY([LIST_ITEMS];[LIST_ITEMS]x_ID=[INFORMATION]QualityGroupID)
				ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; -([INFORMATION:55]QualityGroupID:15); [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
			End if 
			If ([INFORMATION:55]Information_Level:4>0)
				
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubLevels_"+String:C10([INFORMATION:55]QualityID:14))  //WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
				If (Records in selection:C76([X_LISTS:111])=1)
					$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
					AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
					$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Information_Level:4))
					//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If ($_l_LevelRow>0)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset2"; 0; QV_al_QualitySubLevels{$_l_LevelRow}; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
					End if 
				End if 
			End if 
			
			If ([INFORMATION:55]Year:5>0)
				
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubYears_"+String:C10([INFORMATION:55]QualityID:14))
				If (Records in selection:C76([X_LISTS:111])=1)
					$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
					AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
					$_l_YearRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Year:5))
					//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If ($_l_YearRow>0)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset3"; 0; QV_al_QualitySubLevels{$_l_YearRow}; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
						
					End if 
					
				End if 
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INFORMATION]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			AUTO_AUDIT(->[INFORMATION:55]; Field:C253(->[INFORMATION:55]Information_Code:9); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([INFORMATION:55]QualityRecordID:16=0)
				[INFORMATION:55]QualityRecordID:16:=AA_GetNextID(->[INFORMATION:55]QualityRecordID:16)
			End if 
			If (Old:C35([INFORMATION:55]Information_Level:4)>0) & (Old:C35([INFORMATION:55]Information_Level:4)#[INFORMATION:55]Information_Level:4)
				//quality level is changed
				$_l_GroupIDOLD:=Old:C35([INFORMATION:55]Information_Level:4)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubLevels_"+String:C10([INFORMATION:55]QualityID:14))
				//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
				If (Records in selection:C76([X_LISTS:111])=1)
					$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
					AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
					$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10($_l_GroupIDOLD))
					//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If ($_l_LevelRow>0)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset2"; 0; QV_al_QualitySubLevels{$_l_LevelRow}; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
					End if 
					$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Information_Level:4))
					//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If ($_l_LevelRow>0)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset2"; 0; QV_al_QualitySubLevels{$_l_LevelRow}; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
					End if 
				End if 
				
				// 16/04/02 pb
			Else 
				If ([INFORMATION:55]Information_Level:4>0) & (Old:C35([INFORMATION:55]Information_Level:4)#[INFORMATION:55]Information_Level:4)
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubLevels_"+String:C10([INFORMATION:55]QualityID:14))
					//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If (Records in selection:C76([X_LISTS:111])=1)
						$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
						ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
						ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
						AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
						$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Information_Level:4))
						//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
						If ($_l_LevelRow>0)
							ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset2"; 0; QV_al_QualitySubLevels{$_l_LevelRow}; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
						End if 
					End if 
					
				End if 
			End if 
			If (Old:C35([INFORMATION:55]Year:5)>0) & (Old:C35([INFORMATION:55]Year:5)#[INFORMATION:55]Year:5)  //Changed
				$_l_GroupIDOLD:=Old:C35([INFORMATION:55]Year:5)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubYears_"+String:C10([INFORMATION:55]QualityID:14))
				If (Records in selection:C76([X_LISTS:111])=1)
					$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
					AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
					$_l_YearRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10($_l_GroupIDOLD))  //WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If ($_l_YearRow>0)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset3"; 0; QV_al_QualitySubLevels{$_l_YearRow}; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
						
					End if 
					If ([INFORMATION:55]Year:5>0)
						$_l_YearRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Year:5))
						//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
						If ($_l_YearRow>0)
							ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset3"; 0; QV_al_QualitySubLevels{$_l_YearRow}; [INFORMATION:55]QualityRecordID:16)
						End if 
					End if 
				End if 
				
				
			Else 
				If ([INFORMATION:55]Year:5>0) & (Old:C35([INFORMATION:55]Year:5)#[INFORMATION:55]Year:5)  //set for first time
					
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubYears_"+String:C10([INFORMATION:55]QualityID:14))
					If (Records in selection:C76([X_LISTS:111])=1)
						$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
						ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
						ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
						AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
						$_l_YearRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Year:5))
						//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
						If ($_l_YearRow>0)
							ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset3"; 0; QV_al_QualitySubLevels{$_l_YearRow}; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
						End if 
						
					End if 
					// 16/04/02 pb
					
				End if 
			End if 
			
			
			
			
			If ([INFORMATION:55]QualityID:14#Old:C35([INFORMATION:55]QualityID:14))
				If (Old:C35([INFORMATION:55]QualityID:14)>0)
					$_l_GroupIDOLD:=Old:C35([INFORMATION:55]QualityID:14)
					//       $_l_Process:=New process("QV_UpdateSet";64000;"UPDATING SETS";
					//0;$_l_GroupIDOLD;[QUALITIES]QualityRecordID)
					ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; $_l_GroupIDOLD; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
				End if 
				ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; [INFORMATION:55]QualityID:14; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
			End if 
			
			If ([INFORMATION:55]QualityGroupID:15>0)
				READ ONLY:C145([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityGroupID:15)
				[INFORMATION:55]Group:2:=[LIST_ITEMS:95]List_Entry:2
				If ([INFORMATION:55]QualityGroupID:15#Old:C35([INFORMATION:55]QualityGroupID:15))
					If (Old:C35([INFORMATION:55]QualityGroupID:15)>0)
						$_l_GroupIDOLD:=Old:C35([INFORMATION:55]QualityGroupID:15)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; -$_l_GroupIDOLD; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
					End if 
					ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; -[INFORMATION:55]QualityGroupID:15; [INFORMATION:55]QualityRecordID:16)  // 16/04/02 pb
				End if 
			End if 
			If ([INFORMATION:55]Deleted:10=1)
				If ([INFORMATION:55]QualityID:14>0)
					ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; [INFORMATION:55]QualityID:14; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
				End if 
				If ([INFORMATION:55]QualityGroupID:15>0)
					ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; [INFORMATION:55]QualityID:14; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
				End if 
				If ([INFORMATION:55]Year:5>0)
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubYears_"+String:C10([INFORMATION:55]QualityID:14))
					If (Records in selection:C76([X_LISTS:111])=1)
						$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
						ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
						ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
						AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
						$_l_YearRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Year:5))
						//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
						If ($_l_YearRow>0)
							ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset3"; 0; QV_al_QualitySubLevels{$_l_YearRow}; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
							
						End if 
						
					End if 
					
					
				End if 
				If ([INFORMATION:55]Information_Level:4>0)
					
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubLevels_"+String:C10([INFORMATION:55]QualityID:14))  //WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If (Records in selection:C76([X_LISTS:111])=1)
						$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
						ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
						ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
						AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
						$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Information_Level:4))  //WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
						If ($_l_LevelRow>0)
							ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset2"; 0; QV_al_QualitySubLevels{$_l_LevelRow}; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
						End if 
						
					End if 
				End if 
				
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INFORMATION]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([INFORMATION:55]QualityID:14>0)
				//    $_l_Process:=New process("QV_UpdateSet";64000;"UPDATING SETS";0;
				//[QUALITIES]QualityID;[QUALITIES]QualityRecordID;True)
				ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; [INFORMATION:55]QualityID:14; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
			End if 
			If ([INFORMATION:55]QualityGroupID:15>0)
				//     $_l_Process:=New process("QV_UpdateSet";64000;"UPDATING SETS";0;
				//-[QUALITIES]QualityGroupID;[QUALITIES]QualityRecordID;True)
				ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset"; 0; [INFORMATION:55]QualityID:14; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
			End if 
			If ([INFORMATION:55]Year:5>0)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubYears_"+String:C10([INFORMATION:55]QualityID:14))
				If (Records in selection:C76([X_LISTS:111])=1)
					$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
					AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
					$_l_YearRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Year:5))
					//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If ($_l_YearRow>0)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset3"; 0; QV_al_QualitySubLevels{$_l_YearRow}; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
					End if 
					
				End if 
				
				
			End if 
			If ([INFORMATION:55]Information_Level:4>0)
				
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubLevels_"+String:C10([INFORMATION:55]QualityID:14))
				//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
				If (Records in selection:C76([X_LISTS:111])=1)
					$_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
					AA_LoadListbyID($_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
					$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10([INFORMATION:55]Information_Level:4))
					//WE WILL NOT CREATE THIS HERE-IT WILL ONLY CREATE IF SOMEONE SEARCHES
					If ($_l_LevelRow>0)
						ProcessServices_CreateRecord(->[INFORMATION:55]; ->[INFORMATION:55]QualityRecordID:16; "Updateset2"; 0; QV_al_QualitySubLevels{$_l_LevelRow}; [INFORMATION:55]QualityRecordID:16; True:C214)  // 16/04/02 pb
					End if 
					
				End if 
			End if 
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [INFORMATION]"; $_t_oldMethodName)
