//%attributes = {}
If (False:C215)
	//Project Method Name:      CONT_SelectDiaryRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2009 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CONT_al_DocIncludes;0)
	//ARRAY LONGINT(CONT_al_TabIncludes;0)
	//ARRAY LONGINT(ORD_al_DocIncludes;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY TEXT(CONT_at_TabNames;0)
	C_LONGINT:C283($_l_ActionID; $_l_GroupRow; $_l_Index; $_l_Index2; $_l_Tabincludes; $_l_TabNumber; $1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CONT_SelectDiaryRecords")

CREATE EMPTY SET:C140([DIARY:12]; "ToDisplay")
If (Count parameters:C259>=1)
	$_l_TabNumber:=$1
	If ($_l_TabNumber<=0)
		If (Count parameters:C259>=2)
			$_l_TabNumber:=Find in array:C230(CONT_at_TabNames; $2)
		End if 
	End if 
	If ($_l_TabNumber>0)
		For ($_l_Index2; 1; Size of array:C274(CONT_al_TabIncludes{$_l_TabNumber}))
			If (CONT_al_TabIncludes{$_l_TabNumber}{$_l_Index2}>0)
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=CONT_al_TabIncludes{$_l_TabNumber}{$_l_Index2})
				If (Records in selection:C76([ACTIONS:13])>0)
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
					If (CONT_al_DocIncludes{$_l_TabNumber}=0)  //don't include diary items with documents.
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
					End if 
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
					// [DIARY];"Diary_InNEW"
					CREATE SET:C116([DIARY:12]; "Action")
					SD2_GetRelatedDiaryItems(Table:C252(->[CONTRACTS:17]); Field:C253(->[CONTRACTS:17]Contract_Code:3); [CONTRACTS:17]Contract_Code:3; (CONT_al_DocIncludes{$_l_TabNumber}=1))
					CREATE SET:C116([DIARY:12]; "OrderMatch")
					INTERSECTION:C121("Action"; "OrderMatch"; "Action")
					UNION:C120("Action"; "ToDisplay"; "ToDisplay")
					UNLOAD RECORD:C212([ACTIONS:13])
				End if 
			Else 
				//action is a group of actions
				$_l_Tabincludes:=CONT_al_TabIncludes{$_l_TabNumber}{$_l_Index2}
				$_l_GroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_Tabincludes))
				If ($_l_GroupRow>0)
					For ($_l_Index; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_GroupRow}))
						$_l_ActionID:=SD_al_ActionGroupIncludes{$_l_GroupRow}{$_l_Index}
						If ($_l_ActionID>0)
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=$_l_ActionID)
							If (Records in selection:C76([ACTIONS:13])>0)
								QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
								
								If (ORD_al_DocIncludes{$_l_TabNumber}=0)  //don't include diary items with documents.
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
								End if 
								
								QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
								CREATE SET:C116([DIARY:12]; "Action")
								SD2_GetRelatedDiaryItems(Table:C252(->[CONTRACTS:17]); Field:C253(->[CONTRACTS:17]Contract_Code:3); [CONTRACTS:17]Contract_Code:3; (CONT_al_DocIncludes{$_l_TabNumber}=1))
								CREATE SET:C116([DIARY:12]; "OrderMatch")
								INTERSECTION:C121("Action"; "OrderMatch"; "Action")
								
								UNION:C120("Action"; "ToDisplay"; "ToDisplay")
								UNLOAD RECORD:C212([ACTIONS:13])
							End if 
							
						End if 
						
					End for 
					
				End if 
				
			End if 
			
		End for 
	End if 
End if 
USE SET:C118("ToDisplay")
CLEAR SET:C117("ToDisplay")
ERR_MethodTrackerReturn("CONT_SelectDiaryRecords"; $_t_oldMethodName)