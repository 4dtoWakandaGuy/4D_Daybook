//%attributes = {}
If (False:C215)
	//Project Method Name:      QUAL_LISTFIX
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
	C_LONGINT:C283($_l_Index; $_l_ListID; $_l_ListItemsIndex; $_l_RecordsinSelection; $_l_ReducedRecordsinSelection)
	C_TEXT:C284($_t_ItemName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QUAL_LISTFIX")
If (False:C215)
	ALL RECORDS:C47([LIST_ITEMS:95])
	CREATE SET:C116([LIST_ITEMS:95]; "ALL")
	CREATE EMPTY SET:C140([LIST_ITEMS:95]; "FORDELETION")
	$_l_RecordsinSelection:=Records in selection:C76([LIST_ITEMS:95])
	
	For ($_l_Index; 1; $_l_RecordsinSelection)
		USE SET:C118("ALL")
		GOTO SELECTED RECORD:C245([LIST_ITEMS:95]; $_l_Index)
		$_l_ListID:=[LIST_ITEMS:95]X_ID:3
		If ($_l_ListID>0)
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_ListID)
			If (Records in selection:C76([LIST_ITEMS:95])>1)
				$_l_ReducedRecordsinSelection:=Records in selection:C76([LIST_ITEMS:95])-1
				REDUCE SELECTION:C351([LIST_ITEMS:95]; $_l_ReducedRecordsinSelection)
				CREATE SET:C116([LIST_ITEMS:95]; "TEMP")
				UNION:C120("TEMP"; "FORDELETION"; "FORDELETION")
				CLEAR SET:C117("TEMP")
			End if 
		End if 
	End for 
	READ WRITE:C146([LIST_ITEMS:95])
	USE SET:C118("FORDELETION")
	DELETE SELECTION:C66([LIST_ITEMS:95])
End if 
If (False:C215)
	
	ALL RECORDS:C47([LIST_ITEMS:95])
	CREATE SET:C116([LIST_ITEMS:95]; "ALL")
	CREATE EMPTY SET:C140([LIST_ITEMS:95]; "FORDELETION")
	$_l_RecordsinSelection:=Records in selection:C76([LIST_ITEMS:95])
	
	For ($_l_Index; 1; $_l_RecordsinSelection)
		MESSAGE:C88(String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection))
		
		USE SET:C118("ALL")
		GOTO SELECTED RECORD:C245([LIST_ITEMS:95]; $_l_Index)
		$_l_ListID:=[LIST_ITEMS:95]X_ID:3
		$_t_ItemName:=[LIST_ITEMS:95]List_Entry:2
		
		If ($_t_ItemName#"")
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=$_t_ItemName)
			MESSAGE:C88($_t_ItemName)
			If (Records in selection:C76([LIST_ITEMS:95])>1)
				For ($_l_ListItemsIndex; 1; Records in selection:C76([LIST_ITEMS:95]))
					MESSAGE:C88($_t_ItemName+" "+String:C10($_l_ListItemsIndex)+" of "+String:C10(Records in selection:C76([LIST_ITEMS:95])))
					
					If ([LIST_ITEMS:95]X_ListID:4=0)
						If ([LIST_ITEMS:95]List_Name:1="Qual SubGroups")
							If ([LIST_ITEMS:95]X_ID:3>0)
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=[LIST_ITEMS:95]X_ID:3)
								If (Records in selection:C76([INFORMATION:55])=0)
									ADD TO SET:C119([LIST_ITEMS:95]; "FORDELETION")
								End if 
							Else 
								ADD TO SET:C119([LIST_ITEMS:95]; "FORDELETION")
							End if 
						End if 
					Else 
						If ([LIST_ITEMS:95]X_ListID:4#821) & ([LIST_ITEMS:95]X_ListID:4#1444)
							ADD TO SET:C119([LIST_ITEMS:95]; "FORDELETION")
						End if 
					End if 
					
					NEXT RECORD:C51([LIST_ITEMS:95])
				End for 
				
				
			End if 
		End if 
	End for 
	READ WRITE:C146([LIST_ITEMS:95])
	USE SET:C118("FORDELETION")
	
End if 
ERR_MethodTrackerReturn("QUAL_LISTFIX"; $_t_oldMethodName)
