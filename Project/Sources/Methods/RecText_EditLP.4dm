//%attributes = {}
If (False:C215)
	//Project Method Name:      RecText_EditLP
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
	//Array Text(<>SYS_at_CurrentTableFieldNames;0)
	//Array Text(<>DB_at_TableNames;0)
	//Array TEXT(<>SYS_at_2DFieldNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>SCPT_l_RecordEdit; $_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; vButtDisTxt; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RecText_EditLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Load_Fields
		
		
		
		COPY ARRAY:C226(<>SYS_at_2DFieldNames{<>DB_at_TableNames}; <>SYS_at_CurrentTableFieldNames)
		<>SYS_at_CurrentTableFieldNames:=1
		// GOTO AREA(◊RecText)
		vButtDisTxt:="IMDPMO  FSSSRCADT"
		Input_Buttons(->[COMPANIES:2]; ->vButtDisTxt)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisTxt)
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; ""; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ""; ""; ""; ""; "")
		DB_l_ButtonClickedFunction:=0
	: ($_l_Event=On Outside Call:K2:11)
		If (<>SCPT_l_RecordEdit=0)
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("RecText_EditLP"; $_t_oldMethodName)