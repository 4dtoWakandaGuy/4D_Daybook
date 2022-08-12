If (False:C215)
	//Table Form Method Name: [LIST_LAYOUTS]Layout_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2011 17:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; vButtDisTxt; vTitle13; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [LIST_LAYOUTS].Layout_In"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
	: ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 420; 580)
		INT_SetInput(Table:C252(->[LIST_LAYOUTS:96]); WIN_t_CurrentInputForm)
		
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Load_Fields
		
		
		OpenHelp(Table:C252(->[LIST_LAYOUTS:96]); "Layout_In")
		WS_AutoscreenSize(2; 420; 580)
		INT_SetInput(Table:C252(->[LIST_LAYOUTS:96]); WIN_t_CurrentInputForm)
		Layouts_InLPB
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[LIST_LAYOUTS:96]); "Layout_In")
		In_ButtChkDis(->vButtDisTxt)
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("Layouts_Setting"; ""; ""; ->[LIST_LAYOUTS:96]; ->[LIST_LAYOUTS:96]Layout_Reference:1; ""; ""; "Layouts_InLPB"; ""; "")
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([LIST_LAYOUTS:96]Title:4))
				[LIST_LAYOUTS:96]Title:4:=Uppers2([LIST_LAYOUTS:96]Title:4)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([LIST_LAYOUTS:96]Format:6))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([LIST_LAYOUTS:96]Width:5))
				If (([LIST_LAYOUTS:96]Width:5>200) | ([LIST_LAYOUTS:96]Width:5<0))
					Gen_Alert("Please enter a Width in the range of 0 to 200"; "Try again")
					REJECT:C38([LIST_LAYOUTS:96]Width:5)
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([LIST_LAYOUTS:96]Order:7))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([LIST_LAYOUTS:96]Enterable:8))
				If (([LIST_LAYOUTS:96]Enterable:8) & ([LIST_LAYOUTS:96]Formula:9#"") & (vTitle13#"Subfile@"))
					Gen_Alert("A Column with a Formula cannot be Enterable"; "OK")
					[LIST_LAYOUTS:96]Enterable:8:=False:C215
				End if 
				If (([LIST_LAYOUTS:96]Enterable:8) & ([LIST_LAYOUTS:96]Table_Number:2#Num:C11(Substring:C12([LIST_LAYOUTS:96]Layout_Reference:1; 1; 3))))
					Gen_Alert("A Column allocated to a secondary File cannot be Enterable"; "OK")
					[LIST_LAYOUTS:96]Enterable:8:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([LIST_LAYOUTS:96]Formula:9))
				If (([LIST_LAYOUTS:96]Formula:9#"") & (vTitle13#"Subfile@"))
					[LIST_LAYOUTS:96]Enterable:8:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
		End case 
End case 
ERR_MethodTrackerReturn("FM:Layout_In"; $_t_oldMethodName)
