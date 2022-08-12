//%attributes = {}
If (False:C215)
	//Project Method Name:      States_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; vMod2)
	C_LONGINT:C283($_l_Event; $_l_TablePosition; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; vButtDisFST; vStatus; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_InLP")
$_l_Event:=Form event code:C388

//Actually this method is not called i dont think... check it out
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Load_Fields
		
		States_InLPB
		In_ButtChkDis(->vButtDisFST)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisFST)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("Gen_CULPA"; ""; "Minor_DelSinCU"; ->[TABLE_RECORD_STATES:90]; ->[TABLE_RECORD_STATES:90]State_Reference:4; "States"; "1 3 4"; "States_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisFST)
		DB_l_ButtonClickedFunction:=0
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([TABLE_RECORD_STATES:90]State_Code:1))
				RemoveLeadTr(Uppercase:C13([TABLE_RECORD_STATES:90]State_Code:1); ->[TABLE_RECORD_STATES:90]State_Code:1)
				[TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10([TABLE_RECORD_STATES:90]Table_number:3))))+String:C10([TABLE_RECORD_STATES:90]Table_number:3)+[TABLE_RECORD_STATES:90]State_Code:1
				DB_bo_RecordModified:=True:C214
				vMod2:=True:C214
				Macro_AccTypePt(->[TABLE_RECORD_STATES:90]State_Code:1)
			: (Modified:C32([TABLE_RECORD_STATES:90]Listing_Name:2))
				[TABLE_RECORD_STATES:90]Listing_Name:2:=Uppers2([TABLE_RECORD_STATES:90]Listing_Name:2)
				If ([TABLE_RECORD_STATES:90]Entry_Name:5="")
					[TABLE_RECORD_STATES:90]Entry_Name:5:=Uppercase:C13([TABLE_RECORD_STATES:90]Listing_Name:2)
				End if 
				DB_bo_RecordModified:=True:C214
				vMod2:=True:C214
				Macro_AccTypePt(->[TABLE_RECORD_STATES:90]Listing_Name:2)
			: (Modified:C32([TABLE_RECORD_STATES:90]Entry_Name:5))
				[TABLE_RECORD_STATES:90]Entry_Name:5:=Uppercase:C13([TABLE_RECORD_STATES:90]Entry_Name:5)
				DB_bo_RecordModified:=True:C214
				vMod2:=True:C214
				Macro_AccTypePt(->[TABLE_RECORD_STATES:90]Entry_Name:5)
			: (Modified:C32([TABLE_RECORD_STATES:90]Abbreviated_Name:6))
				[TABLE_RECORD_STATES:90]Abbreviated_Name:6:=Uppers2([TABLE_RECORD_STATES:90]Abbreviated_Name:6)
				DB_bo_RecordModified:=True:C214
				vMod2:=True:C214
				Macro_AccTypePt(->[TABLE_RECORD_STATES:90]Abbreviated_Name:6)
			: (Modified:C32([TABLE_RECORD_STATES:90]Table_number:3))
				If (([TABLE_RECORD_STATES:90]Table_number:3>0) & ([TABLE_RECORD_STATES:90]Table_number:3<=Size of array:C274(<>DB_at_TableNames)))
					$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; [TABLE_RECORD_STATES:90]Table_number:3)
					vStatus:=<>DB_at_TableNames{$_l_TablePosition}
				Else 
					[TABLE_RECORD_STATES:90]Table_number:3:=0
					vStatus:=""
				End if 
				[TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10([TABLE_RECORD_STATES:90]Table_number:3))))+String:C10([TABLE_RECORD_STATES:90]Table_number:3)+[TABLE_RECORD_STATES:90]State_Code:1
				DB_bo_RecordModified:=True:C214
				vMod2:=True:C214
				Macro_AccTypePt(->[TABLE_RECORD_STATES:90]Table_number:3)
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("States_InLP"; $_t_oldMethodName)
