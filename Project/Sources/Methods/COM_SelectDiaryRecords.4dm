//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_SelectDiaryRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2011 11:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(COM_al_DocIncludes;0)
	//ARRAY LONGINT(COM_Al_FormIDs;0)
	//ARRAY LONGINT(COM_al_TabIncludes;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD_al_FormReferenceID;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY TEXT(COM_at_TabNames;0)
	//ARRAY TEXT(SD2_at_FormNames;0)
	C_LONGINT:C283($_l_actionGroupRow; $_l_ActionID; $_l_FormReferenceRow; $_l_Index; $_l_Index2; $_l_TabIncludes; $_l_TabRow)
	C_TEXT:C284($_t_oldMethodName; $_t_TabName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_SelectDiaryRecords")

//This method selects the diary records for a company
If (Count parameters:C259>=1)
	$_t_TabName:=$1
	$0:=""
	If ([COMPANIES:2]Company_Code:1#"")
		
		If (Size of array:C274(COM_at_TabNames)=0)
			QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
			$0:=""
		Else 
			SD2_loadFormNames
			$_l_TabRow:=Find in array:C230(COM_at_TabNames; $_t_TabName)
			If ($_l_TabRow>0)  //it should be
				If (Size of array:C274(COM_al_TabIncludes{$_l_TabRow})>0)
					CREATE EMPTY SET:C140([DIARY:12]; "ToDisplay")
					For ($_l_Index; 1; Size of array:C274(COM_al_TabIncludes{$_l_TabRow}))
						If (COM_al_TabIncludes{$_l_TabRow}{$_l_Index}>0)
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=COM_al_TabIncludes{$_l_TabRow}{$_l_Index})
							If (Records in selection:C76([ACTIONS:13])>0)
								QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
								QUERY:C277([DIARY:12];  & ; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
								If (COM_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
								End if 
								
								QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
								// [DIARY];"Diary_InNEW"
								CREATE SET:C116([DIARY:12]; "Action")
								UNION:C120("Action"; "ToDisplay"; "ToDisplay")
								UNLOAD RECORD:C212([ACTIONS:13])
							End if 
						Else 
							//action is a group of actions
							$_l_TabIncludes:=COM_al_TabIncludes{$_l_TabRow}{$_l_Index}
							$_l_actionGroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
							If ($_l_actionGroupRow>0)
								For ($_l_Index2; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_actionGroupRow}))
									$_l_ActionID:=SD_al_ActionGroupIncludes{$_l_actionGroupRow}{$_l_Index2}
									If ($_l_ActionID>0)
										QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=$_l_ActionID)
										If (Records in selection:C76([ACTIONS:13])>0)
											QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
											QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
											If (COM_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
												QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
											End if 
											
											QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
											CREATE SET:C116([DIARY:12]; "Action")
											UNION:C120("Action"; "ToDisplay"; "ToDisplay")
											UNLOAD RECORD:C212([ACTIONS:13])
										End if 
										
									End if 
									
								End for 
								
							End if 
							
						End if 
						
					End for 
					USE SET:C118("ToDisplay")
				Else 
					QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
				End if 
				
				If (COM_Al_FormIDs{$_l_TabRow}>0)
					$_l_FormReferenceRow:=Find in array:C230(SD_al_FormReferenceID; COM_Al_FormIDs{$_l_TabRow})
					If ($_l_FormReferenceRow>0)
						$0:=SD2_at_FormNames{$_l_FormReferenceRow}
					Else 
						$0:=""
					End if 
				Else 
					$0:=""
				End if 
			End if 
		End if 
	Else 
		REDUCE SELECTION:C351([DIARY:12]; 0)
	End if 
	
End if 
ERR_MethodTrackerReturn("COM_SelectDiaryRecords"; $_t_oldMethodName)