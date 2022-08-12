//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MoveTypes_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/03/2011 03:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Event; $_l_NewNumbersProcess; $_l_ProcessState; $_l_TypeNumber; $_l_TypeNumberMN; $_l_TypeNumberNew; ch1; DB_l_ButtonClickedFunction; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8)
	C_LONGINT:C283(PAL_BUTTON_9)
	C_TEXT:C284($_t_IndentityString; $_t_oldMethodName; $_t_ProcessState; CreateSem; DB_t_CUrrentInputMenuRef; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MoveTypes_InLP")
$_l_Event:=Form event code:C388

Minor_LP(->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2; ->[MOVEMENT_TYPES:60]; "Movement Types"; "1"; "MoveTypes_InLPB"; "")

Case of 
	: ($_l_Event=On Clicked:K2:4)
		
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([MOVEMENT_TYPES:60]Stock_Plus:3))
				Check_MinorNC(->[MOVEMENT_TYPES:60]Stock_Plus:3; "Type"; ->[STOCK_TYPES:59]; ->[STOCK_TYPES:59]Type_Code:1; ->[STOCK_TYPES:59]Type_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Stock_Plus:3)
			: (Modified:C32([MOVEMENT_TYPES:60]Stock_Minus:4))
				Check_MinorNC(->[MOVEMENT_TYPES:60]Stock_Minus:4; "Type"; ->[STOCK_TYPES:59]; ->[STOCK_TYPES:59]Type_Code:1; ->[STOCK_TYPES:59]Type_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Stock_Minus:4)
			: (Modified:C32([MOVEMENT_TYPES:60]Form_Title:7))
				[MOVEMENT_TYPES:60]Form_Title:7:=Uppers2([MOVEMENT_TYPES:60]Form_Title:7)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Form_Title:7)
			: (Modified:C32([MOVEMENT_TYPES:60]Number_Name:5))
				[MOVEMENT_TYPES:60]Number_Name:5:=Uppers2([MOVEMENT_TYPES:60]Number_Name:5)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Number_Name:5)
			: (Modified:C32([MOVEMENT_TYPES:60]Trans_Code:17))
				Check_MinorNC(->[MOVEMENT_TYPES:60]Trans_Code:17; "Type"; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Trans_Code:17)
			: (Modified:C32([MOVEMENT_TYPES:60]Serial_Current:18))
				If (([MOVEMENT_TYPES:60]Serial_Current:18) & ([MOVEMENT_TYPES:60]Serial_Unique:19))
					[MOVEMENT_TYPES:60]Serial_Current:18:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Serial_Current:18)
			: (Modified:C32([MOVEMENT_TYPES:60]Serial_Unique:19))
				If (([MOVEMENT_TYPES:60]Serial_Current:18) & ([MOVEMENT_TYPES:60]Serial_Unique:19))
					[MOVEMENT_TYPES:60]Serial_Unique:19:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Serial_Unique:19)
				
				//see also Files List LP
			: (Modified:C32([MOVEMENT_TYPES:60]MN_Identifier_Number:24))
				$_l_TypeNumberMN:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
				CreateSem:="CodeCr"+String:C10($_l_TypeNumberMN)
				If (ch1=1)
					DB_SaveRecord(->[MOVEMENT_TYPES:60])
					UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
					$_l_NewNumbersProcess:=New process:C317("Gen_CodeCreate"; 128000; String:C10($_l_TypeNumberMN); $_l_TypeNumberMN)
					DelayTicks(3)
					Repeat 
						$_l_ProcessState:=Process state:C330($_l_NewNumbersProcess)
						If ($_l_ProcessState>=0)
							DelayTicks(3)
						End if 
						$_l_ProcessState:=Process state:C330($_l_NewNumbersProcess)
						While (Semaphore:C143(CreateSem))
							DelayTicks(3)
							
						End while 
					Until ($_l_ProcessState<0)
					CLEAR SEMAPHORE:C144(CreateSem)
					LOAD RECORD:C52([MOVEMENT_TYPES:60])
				Else 
					If (Not:C34(Semaphore:C143(CreateSem)))
						DB_SaveRecord(->[MOVEMENT_TYPES:60])
						READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
						If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
							MESSAGES OFF:C175
							ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
							MESSAGES ON:C181
							FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
							$_l_TypeNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
							$_t_IndentityString:=""
							While (Not:C34(End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])))
								If ($_l_TypeNumber#[IDENTIFIERS_MULTI_NUMBERS:94]Number:2)
									$_t_IndentityString:=$_t_IndentityString+String:C10([IDENTIFIERS_MULTI_NUMBERS:94]Number:2)+" "
								Else 
									$_l_TypeNumberNew:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
								End if 
								NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
								$_l_TypeNumber:=$_l_TypeNumber-1
							End while 
							If ($_t_IndentityString="")
								LAST RECORD:C200([IDENTIFIERS_MULTI_NUMBERS:94])
								[MOVEMENT_TYPES:60]Number:6:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2-1
							Else 
								Gen_Alert("NB: The following numbers will now never be used: "+$_t_IndentityString)
								[MOVEMENT_TYPES:60]Number:6:=$_l_TypeNumberNew-1
							End if 
							DB_SaveRecord(->[MOVEMENT_TYPES:60])
							DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
						End if 
						$_l_TypeNumber:=$_l_TypeNumberMN+9000
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_TypeNumber)
						DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						CLEAR SEMAPHORE:C144(CreateSem)
						[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=0
						DB_SaveRecord(->[MOVEMENT_TYPES:60])
					Else 
						Gen_Alert("The Numbers are currently in use and cannot be updated"; "Cancel")
						ch1:=1
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
				
			: (Modified:C32([MOVEMENT_TYPES:60]Number:6))
				If ([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)
					$_l_TypeNumberMN:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
					CreateSem:="CodeCr"+String:C10($_l_TypeNumberMN)
					Gen_Confirm("Are you sure that you want to modify the Number?"+"  Existing 'Multiple Numbers' will be deleted, and 40 more created, starting"+"  from the Number specified +1."; "Yes"; "No")
					If (OK=1)
						DB_SaveRecord(->[MOVEMENT_TYPES:60])
						READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
						$_l_TypeNumber:=$_l_TypeNumberMN+9000
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  | ; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_TypeNumber)
						DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						$_l_TypeNumberMN:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
						DB_SaveRecord(->[MOVEMENT_TYPES:60])
						UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
						$_l_NewNumbersProcess:=New process:C317("Gen_CodeCreate"; 128000; String:C10($_l_TypeNumberMN))
						DelayTicks(180)
						While (Semaphore:C143(CreateSem))
							DelayTicks(30)
						End while 
						CLEAR SEMAPHORE:C144(CreateSem)
						LOAD RECORD:C52([MOVEMENT_TYPES:60])
					Else 
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
						If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
							MESSAGES OFF:C175
							ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
							MESSAGES ON:C181
							FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
							[MOVEMENT_TYPES:60]Number:6:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
						End if 
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[MOVEMENT_TYPES:60]Number:6)
				
		End case 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[MOVEMENT_TYPES:60]); WIN_t_CurrentInputForm)
		MoveTypes_InLPB
		DB_SetInputFormMenu(Table:C252(->[MOVEMENT_TYPES:60]); "MoveTypes In13")
		If (Records in selection:C76([MOVEMENT_TYPES:60])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		WS_AutoscreenSize(2; 525; 590)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[MOVEMENT_TYPES:60]); "MoveTypes In13")
		If (Records in selection:C76([MOVEMENT_TYPES:60])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[MOVEMENT_TYPES:60]); "MoveTypes In13")
		If (Records in selection:C76([MOVEMENT_TYPES:60])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Outside Call:K2:11)
		DB_l_ButtonClickedFunction:=0
End case 
ERR_MethodTrackerReturn("MoveTypes_InLP"; $_t_oldMethodName)
