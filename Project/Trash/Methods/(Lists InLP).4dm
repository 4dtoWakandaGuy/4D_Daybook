//%attributes = {}
If (False:C215)
	//Project Method Name:      Lists InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 17:35 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ListEntries; 0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_CountRecords; $_l_Event; $_l_Index; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_ListEntryNew; $_t_ListEntryOLD; $_t_oldMethodName; vButtDisLISTS)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Lists InLP")
//Lists InLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		Lists_InLPB
	: ($_l_Event=On Activate:K2:9)
		
		
		In_ButtChkDis(->vButtDisLISTS)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; "Lists_InLPA"; "Minor_DelSinEx"; ->[LIST_ITEMS:95]; ->[LIST_ITEMS:95]List_Name:1; "Lists"; "1 2"; "Lists_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisLISTS)
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([LIST_ITEMS:95]List_Name:1))
				Check_Lists(->[LIST_ITEMS:95]List_Name:1; "Lists"; "List")
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[LIST_ITEMS:95]List_Name:1)
			: (Modified:C32([LIST_ITEMS:95]List_Entry:2))
				[LIST_ITEMS:95]List_Entry:2:=Uppers2([LIST_ITEMS:95]List_Entry:2)
				DB_bo_RecordModified:=True:C214
				If ([LIST_ITEMS:95]List_Name:1="Lists")
					If (Length:C16([LIST_ITEMS:95]List_Entry:2)>15)
						Gen_Alert("The 'Lists' Entries can only be 15 characters long"; "Abbreviate")
						[LIST_ITEMS:95]List_Entry:2:=Substring:C12([LIST_ITEMS:95]List_Entry:2; 1; 15)
					End if 
					$_t_ListEntryOLD:=Old:C35([LIST_ITEMS:95]List_Entry:2)
					$_t_ListEntryNew:=[LIST_ITEMS:95]List_Entry:2
					If ($_t_ListEntryOLD#"")
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						CUT NAMED SELECTION:C334([LIST_ITEMS:95]; "List")
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$_t_ListEntryOLD)
						$_l_CountRecords:=Records in selection:C76([LIST_ITEMS:95])
						If ($_l_CountRecords>0)
							ARRAY TEXT:C222($_at_ListEntries; $_l_CountRecords)
							For ($_l_Index; 1; $_l_CountRecords)
								$_at_ListEntries{$_l_Index}:=$_t_ListEntryNew
							End for 
							ARRAY TO SELECTION:C261($_at_ListEntries; [LIST_ITEMS:95]List_Name:1)
						End if 
						USE NAMED SELECTION:C332("List")
					End if 
				End if 
				Macro_AccTypePt(->[LIST_ITEMS:95]List_Entry:2)
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Lists InLP"; $_t_oldMethodName)