//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_SelectDiaryRecords
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
	//ARRAY LONGINT(PI_al_DocIncludes;0)
	//ARRAY LONGINT(PO_al_DocIncludes;0)
	//ARRAY LONGINT(PO_al_TabIncludes;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY TEXT(PO_at_TabNames;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_ActionColumnIndex; $_l_ActionID; $_l_ActionRow; $_l_TabColumnIndex; $_l_TabIncludes; $_l_TabRow; $1; PO_l_SelectedTabsLabelsOLD)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_SelectDiaryRecords")

CREATE EMPTY SET:C140([DIARY:12]; "ToDisplay")
If (Count parameters:C259>=1)
	$_l_TabRow:=$1
	If ($_l_TabRow<=0)
		If (Count parameters:C259>=2)
			$_l_TabRow:=Find in array:C230(PO_at_TabNames; $2)
		End if 
	End if 
	If ($_l_TabRow>0)
		PO_l_SelectedTabsLabelsOLD:=PO_at_ViewTabsLabels
		SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_ORDERS:57]); Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); [PURCHASE_ORDERS:57]Purchase_Order_Number:2; (PO_al_DocIncludes{$_l_TabRow}=1))
		If (Records in selection:C76([DIARY:12])>0)
			CREATE SET:C116([DIARY:12]; "OrderMatch")
		Else 
			CREATE EMPTY SET:C140([DIARY:12]; "OrderMatch")
		End if 
		
		For ($_l_TabColumnIndex; 1; Size of array:C274(PO_al_TabIncludes{$_l_TabRow}))
			If (PO_al_TabIncludes{$_l_TabRow}{$_l_TabColumnIndex}>0)
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=PO_al_TabIncludes{$_l_TabRow}{$_l_TabColumnIndex})
				If (Records in selection:C76([ACTIONS:13])>0)
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
					If (PO_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
					End if 
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
					
					CREATE SET:C116([DIARY:12]; "Action")
					INTERSECTION:C121("Action"; "OrderMatch"; "Action")
					UNION:C120("Action"; "ToDisplay"; "ToDisplay")
					UNLOAD RECORD:C212([ACTIONS:13])
				End if 
			Else 
				//action is a group of actions
				$_l_TabIncludes:=PO_al_TabIncludes{$_l_TabRow}{$_l_TabColumnIndex}
				$_l_ActionRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99($_l_TabIncludes))
				SD2_GetRelatedDiaryItems(Table:C252(->[PURCHASE_ORDERS:57]); Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); [PURCHASE_ORDERS:57]Purchase_Order_Number:2; (PO_al_DocIncludes{$_l_TabRow}=1))
				If (Records in selection:C76([DIARY:12])>0)
					CREATE SET:C116([DIARY:12]; "OrderMatch")
				Else 
					CREATE EMPTY SET:C140([DIARY:12]; "OrderMatch")
				End if 
				
				
				If ($_l_ActionRow>0)
					For ($_l_ActionColumnIndex; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_ActionRow}))
						$_l_ActionID:=SD_al_ActionGroupIncludes{$_l_ActionRow}{$_l_ActionColumnIndex}
						If ($_l_ActionID>0)
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]xID:12=$_l_ActionID)
							If (Records in selection:C76([ACTIONS:13])>0)
								QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=[ACTIONS:13]Action_Code:1; *)
								If (PI_al_DocIncludes{$_l_TabRow}=0)  //don't include diary items with documents.
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=""; *)
								End if 
								QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
								CREATE SET:C116([DIARY:12]; "Action")
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
ERR_MethodTrackerReturn("PO_SelectDiaryRecords"; $_t_oldMethodName)
