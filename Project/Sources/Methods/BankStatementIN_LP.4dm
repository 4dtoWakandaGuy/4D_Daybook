//%attributes = {}

If (False:C215)
	//Database Method Name:      BankStatementIN_LP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305($_bo_COntinue; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_FormEvent; $_l_ID; $_l_ModulePosition; $_l_Records; $_l_Save; $1; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_PreviousRecord)
	C_OBJECT:C1216($_obj_BankStatements; $_obj_LPParameters)
	C_TEXT:C284($_t_BackgroundColour; $_t_ExportStamp; $_t_ForegroundColour; $_t_OldMethodName; $_t_PalleteButton; ABC_t_AccountCode; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("BankStatementIN_LP"; $_l_FormEvent)
If (Not:C34(Form:C1466=Null:C1517))
	If (Form:C1466.x_ID=Null:C1517)
		Form:C1466.x_ID:=0
	End if 
	$_l_ID:=Form:C1466.ID
	$_obj_LPParameters:=New object:C1471("recordIdent"; Form:C1466.x_ID; "nextAttribute"; Form:C1466.Bank_Account_Number; "currentTable"; Table:C252(->[ACC_Bank_Statements:198]); "tableTitle"; Form:C1466.singular; "IDFieldNumbers"; New collection:C1472(1); "onLoadMethod"; "ACC_BalStatementLoad"; "onSaveMethod"; "ACC_BalStatementSave"; "formData"; Form:C1466)
	
	Minor_LP_exByObject($_obj_LPParameters)
Else 
	$_t_ExportStamp:=""
	Minor_LP_Ex(->[ACC_Bank_Statements:198]x_ID:1; ->[ACC_Bank_Statements:198]Bank_Account_Number:2; ->$_t_ExportStamp; ->[ACC_Bank_Statements:198]; "Bank Statement"; "1"; "")
	
End if 
If (Count parameters:C259>=1)
	$_l_FormEvent:=$1
Else 
	$_l_FormEvent:=Form event code:C388
End if 



Case of 
	: ($_l_FormEvent=On Data Change:K2:15) | ($_l_FormEvent=On Clicked:K2:4) | ($_l_FormEvent=On Menu Selected:K2:14) | ($_l_FormEvent=On Plug in Area:K2:16)
		
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ACC_Bank_Statements:198]); "Balance_Entry")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalleteButton:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalleteButton)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				If ($_l_FormEvent=On Data Change:K2:15)
					DB_bo_RecordModified:=True:C214
				End if 
				
		End case 
		
	: ($_l_FormEvent=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_bo_COntinue:=True:C214
			$_l_Save:=DB_GetButtonFunction("OK")
			If ($_l_Save>0)
				//user clicked to save
				If ([ACC_Bank_Statements:198]Bank_TransactionDate:5=!00-00-00!)
					Gen_Alert("Sorry. You must enter a date for this transaction!")
					$_bo_COntinue:=False:C215
				End if 
			End if 
			If ($_bo_COntinue)
				$_t_PalleteButton:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalleteButton)
				PAL_bo_ButtonSubFunction:=False:C215
			End if 
		End if 
	: ($_l_FormEvent=On Activate:K2:9)
		If (Not:C34(Form:C1466.formName=Null:C1517))
			DB_SetInputFormMenu(Table:C252(->[ACC_Bank_Statements:198]); Form:C1466.formName)
			If (Not:C34(Form:C1466.currentCollection=Null:C1517))
				$_obj_BankStatements:=Form:C1466.currentCollection
				$_l_Records:=$_obj_BankStatements.length
			Else 
				$_l_Records:=0
			End if 
			If (Records in selection:C76($_l_Records)<=1)
				OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		Else 
			DB_SetInputFormMenu(Table:C252(->[ACC_Bank_Statements:198]); "Balance_Entry")
			If (Records in selection:C76([ACC_Bank_Statements:198])<=1)
				OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
		
		
	: ($_l_FormEvent=On Menu Selected:K2:14)
		If (Not:C34(Form:C1466.formName=Null:C1517))
			DB_SetInputFormMenu(Table:C252(->[ACC_Bank_Statements:198]); Form:C1466.formName)
			If (Not:C34(Form:C1466.currentCollection=Null:C1517))
				$_obj_BankStatements:=Form:C1466.currentCollection
				$_l_Records:=$_obj_BankStatements.length
			Else 
				$_l_Records:=0
			End if 
			If (Records in selection:C76($_l_Records)<=1)
				OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		Else 
			DB_SetInputFormMenu(Table:C252(->[ACC_Bank_Statements:198]); "Balance_Entry")
			If (Records in selection:C76([ACC_Bank_Statements:198])<=1)
				OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
		
	: ($_l_FormEvent=On Header:K2:17) | ($_l_FormEvent=On Resize:K2:27)
		//note the 'variable' name matches the field name
		
		
		WS_AutoscreenSize(2; 350; 585)
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (Not:C34(Form:C1466=Null:C1517))
			If (Form:C1466.Bank_Transaction_Details=Null:C1517)
				Form:C1466.Bank_Transaction_Details:=""
			End if 
			If (Form:C1466.Bank_CreditAmount=Null:C1517)
				Form:C1466.Bank_CreditAmount:=0
			End if 
			If (Form:C1466.Bank_debitAmount=Null:C1517)
				Form:C1466.Bank_debitAmount:=0
			End if 
			If (Form:C1466.Bank_TransactionType=Null:C1517)
				Form:C1466.Bank_TransactionType:=""
			End if 
			If (Form:C1466.Bank_TransactionReference=Null:C1517)
				Form:C1466.Bank_TransactionReference:=""
			End if 
			If (Form:C1466.Bank_TransactionDate=Null:C1517)
				Form:C1466.Bank_TransactionDate:=!00-00-00!
			End if 
			If (Form:C1466.Bank_Account_Number="")
				Form:C1466.Bank_Account_Number:=""
			End if 
			
			//$_obj_FormData:=New object("CallBackProcess"; Current process;"formName";"Balance_Entry";"Plural";"Bank Statements";"Singular";"Bank Statement")
			
			If (Not:C34(Form:C1466.bankAccountNumber=Null:C1517))
				If (Form:C1466.bankAccountNumber#"")
					OBJECT SET ENTERABLE:C238(*; "oBankAccountNumber"; False:C215)
				End if 
			End if 
			If (Not:C34(Form:C1466.currentCollection=Null:C1517))
				$_obj_BankStatements:=Form:C1466.currentCollection
				$_l_Records:=$_obj_BankStatements.length
			Else 
				$_l_Records:=0
			End if 
			//OpenHelp(Table(->[ACC_Bank_Statements]); "Balance_Entry")
			WS_AutoscreenSize(2; 360; 585)
			INT_SetInput(Table:C252(->[ACC_Bank_Statements:198]); Form:C1466.formName; Form:C1466)
			If (Not:C34(Form:C1466.backgroundColour=Null:C1517)) & (Not:C34(Form:C1466.foregroundColour=Null:C1517))
				
				OBJECT SET RGB COLORS:C628(*; "oBankAccountNumber"; $_t_ForegroundColour; $_t_BackgroundColour)
				//OBJECT SET RGB COLORS(*; "oBankTransactionDate"; $_t_ForegroundColour; $_t_BackgroundColour)
				//OBJECT SET RGB COLORS(*; "oBankTransactionReference"; $_t_ForegroundColour; $_t_BackgroundColour)
				//OBJECT SET RGB COLORS(*; "oBankTransactionType"; $_t_ForegroundColour; $_t_BackgroundColour)
				///OBJECT SET RGB COLORS(*; "oDebitAmount"; $_t_ForegroundColour; $_t_BackgroundColour)
				//OBJECT SET RGB COLORS(*; "oCreditAmount"; $_t_ForegroundColour; $_t_BackgroundColour)
				//OBJECT SET RGB COLORS(*; "oTransactionDetails"; $_t_ForegroundColour; $_t_BackgroundColour)
			End if 
			
			DB_SetInputFormMenu(Table:C252(->[ACC_Bank_Statements:198]); Form:C1466.formName)
			If ($_l_Records<=1)
				OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		Else 
			If ([ACC_Bank_Statements:198]x_ID:1=0)
				[ACC_Bank_Statements:198]x_ID:1:=AA_GetNextID(->[ACC_Bank_Statements:198]x_ID:1)
			End if 
			If ([ACC_Bank_Statements:198]Bank_Account_Number:2="") & (ABC_t_AccountCode#"")  //make sure whereever you can access this screen from that you can identify the account
				[ACC_Bank_Statements:198]Bank_Account_Number:2:=ABC_t_AccountCode
			End if 
			If ([ACC_Bank_Statements:198]Bank_Account_Number:2#"")
				OBJECT SET ENTERABLE:C238(*; "oBankAccountNumber"; False:C215)
			End if 
			
			OpenHelp(Table:C252(->[ACC_Bank_Statements:198]); "Balance_Entry")
			WS_AutoscreenSize(2; 360; 585)
			WIN_t_CurrentInputForm:="Balance_Entry"
			INT_SetInput(Table:C252(->[ACC_Bank_Statements:198]); WIN_t_CurrentInputForm)
			DB_SetInputFormMenu(Table:C252(->[ACC_Bank_Statements:198]); "Balance_Entry")
			
			If (Records in selection:C76([ACC_Bank_Statements:198])<=1)
				OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("BankStatementIN_LP"; $_t_OldMethodName)
