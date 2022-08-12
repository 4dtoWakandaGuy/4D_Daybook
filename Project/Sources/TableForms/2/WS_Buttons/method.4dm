If (False:C215)
	//Table Form Method Name: Object Name:      [COMPANIES].WS_Buttons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/03/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ButtonsAssigned;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY PICTURE(DB_apic_ToolPalleteICONS;0)
	//ARRAY TEXT(DB_at_ToolPalletteFunctions;0)
	//ARRAY TEXT(PAL_at_Function21;0)
	//ARRAY TEXT(PAL_at_Function22;0)
	//ARRAY TEXT(PAL_at_Function23;0)
	//ARRAY TEXT(PAL_at_Function24;0)
	//ARRAY TEXT(PAL_at_Function25;0)
	//ARRAY TEXT(PAL_at_Function26;0)
	//ARRAY TEXT(PAL_at_Function27;0)
	//ARRAY TEXT(PAL_at_Function28;0)
	//ARRAY TEXT(PAL_at_Function29;0)
	//ARRAY TEXT(PAL_at_Function32;0)
	//ARRAY TEXT(PAL_at_Function34;0)
	//ARRAY TEXT(PAL_at_Function5;0)
	//ARRAY TEXT(PAL_at_PopUpMenu1;0)
	//ARRAY TEXT(PAL_at_PopUpMenu10;0)
	//ARRAY TEXT(PAL_at_PopUpMenu11;0)
	//ARRAY TEXT(PAL_at_PopUpMenu12;0)
	//ARRAY TEXT(PAL_at_PopUpMenu13;0)
	//ARRAY TEXT(PAL_at_PopUpMenu14;0)
	//ARRAY TEXT(PAL_at_PopUpMenu15;0)
	//ARRAY TEXT(PAL_at_PopUpMenu16;0)
	//ARRAY TEXT(PAL_at_PopUpMenu17;0)
	//ARRAY TEXT(PAL_at_PopUpMenu18;0)
	//ARRAY TEXT(PAL_at_PopUpMenu19;0)
	//ARRAY TEXT(PAL_at_PopUpMenu2;0)
	//ARRAY TEXT(PAL_at_PopUpMenu20;0)
	//ARRAY TEXT(PAL_at_PopUpMenu21;0)
	//ARRAY TEXT(PAL_at_PopUpMenu22;0)
	//ARRAY TEXT(PAL_at_PopUpMenu23;0)
	//ARRAY TEXT(PAL_at_PopUpMenu24;0)
	//ARRAY TEXT(PAL_at_PopUpMenu25;0)
	//ARRAY TEXT(PAL_at_PopUpMenu26;0)
	//ARRAY TEXT(PAL_at_PopUpMenu27;0)
	//ARRAY TEXT(PAL_at_PopUpMenu28;0)
	//ARRAY TEXT(PAL_at_PopUpMenu29;0)
	//ARRAY TEXT(PAL_at_PopUpMenu3;0)
	//ARRAY TEXT(PAL_at_PopUpMenu30;0)
	//ARRAY TEXT(PAL_at_PopUpMenu31;0)
	//ARRAY TEXT(PAL_at_PopUpMenu32;0)
	//ARRAY TEXT(PAL_at_PopUpMenu34;0)
	//ARRAY TEXT(PAL_at_PopUpMenu4;0)
	//ARRAY TEXT(PAL_at_PopUpMenu5;0)
	//ARRAY TEXT(PAL_at_PopUpMenu6;0)
	//ARRAY TEXT(PAL_at_PopUpMenu7;0)
	//ARRAY TEXT(PAL_at_PopUpMenu8;0)
	//ARRAY TEXT(PAL_at_PopUpMenu9;0)
	//ARRAY TEXT(WS_at_BUTTON32POPUP;0)
	C_BOOLEAN:C305(<>DB_bo_FunctionOrder; <>PER_bo_CurrentNoButtGrey; <>SYS_bo_QuitCalled; $_bo_breakloop; BUT_bo_Floating; DB_bo_DuringInsideCall; DB_bo_DuringOutsideCall; DB_bo_NoLoad; PAL_bo_BUtton3disabled; PAL_bo_BUtton5disabled; PAL_bo_ButtonSubFunction)
	C_BOOLEAN:C305(SD_bo_AgendaEnabled; SD_bo_ProcessReady; WS_AutoResize)
	C_LONGINT:C283(<>BUTTPROC; <>MENU_l_BarModule; <>PER_l_CurrentUserID; <>SD3_l_DiaryVersion; <>SYS_l_WorkflowProcess; <>WIN_MINLEFT; $_l_ButtonNumber; $_l_CallActionNum; $_l_CharacterPosition; $_l_DataProcess; $_l_DockLeftSize)
	C_LONGINT:C283($_l_Element; $_l_Element2; $_l_event; $_l_FrontMostProcess; $_l_HalfLength; $_l_objectBottom; $_l_objectLeft; $_l_objectRight; $_l_objectTop; $_l_Process; $_l_ProcessNumber)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_Retries; $_l_SelectedValueRow; $_l_WindowBottom; $_l_windowLeft; $_l_WindowRight; $_l_WindowTop; $Left; CB_l_ScheduleFullPage; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(PAL_but_FirstRecord9; PAL_BUTTON_3; PAL_BUTTON_32; PAL_BUTTON_5; PAL_l_PopUpID; SD_l_CompanionMenuTable; SD2_l_CallingProcess; SD2_l_TableNum; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable)
	C_LONGINT:C283(SD3_l_DiarySourceProcess; WS_Buttons_TimerButton)
	C_OBJECT:C1216($_Obj_GetUser)
	C_POINTER:C301($_ptr_FunctionArray; $_ptr_PopUp)
	C_TEXT:C284(<>ButtDis; <>PER_t_CurrentUserInitials; $_t_ButtonFunction; $_t_ButtonOptions; $_t_ButtonOptionsChar1; $_t_oldMethodName; $_t_OptionsString; $_t_ProcessName; $_t_SDProcessName; $_t_SelectedValue; ButString)
	C_TEXT:C284(DB_t_CallOnCloseorSave; PAL_BUTTON; PAL_t_PopUpSelected; SD2_t_TabFunction; SD3_t_DiaryRelatedRecord; SD3_t_DiaryRelatedRecordCode; vButtDis)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].WS_Buttons"; Form event code:C388)


$_l_event:=Form event code:C388
GET WINDOW RECT:C443($_l_windowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
SET WINDOW RECT:C444($_l_windowLeft; $_l_WindowTop; $_l_windowLeft+78; ($_l_WindowTop+(37*12)+17))
SET WINDOW RECT:C444($_l_windowLeft; $_l_WindowTop; $_l_windowLeft+78; ($_l_WindowTop+(37*12)+17))

$_l_DockLeftSize:=INT_GetDock("L")
If ($_l_WindowRight>(80+$_l_DockLeftSize))
	<>WIN_MINLEFT:=1
Else 
	<>WIN_MINLEFT:=$_l_windowLeft+80
End if 

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(PAL_at_PopUpMenu1; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu2; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu3; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu4; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu5; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu6; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu7; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu8; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu9; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu10; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu11; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu12; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu13; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu14; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu15; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu16; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu17; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu18; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu19; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu20; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu21; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu22; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu23; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu24; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu25; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu26; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu27; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu28; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu29; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu30; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu31; 0)
		ARRAY TEXT:C222(PAL_at_PopUpMenu32; 0)
		If (BUT_bo_Floating)
			//SET WINDOW TITLE("Buttons")
			OBJECT SET VISIBLE:C603(*; "GroupClose"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			
		End if 
		ARRAY TEXT:C222(PAL_at_PopUpMenu5; 2)
		ARRAY TEXT:C222(PAL_at_Function5; 2)
		//NG note we will swap these words contextually.
		PAL_at_PopUpMenu5{1}:="Delete Record"
		PAL_at_Function5{1}:="DeleteRecord"
		PAL_at_PopUpMenu5{2}:="Delete Subrecord"
		PAL_at_Function5{2}:="DeleteSubrecord"
		
		ARRAY TEXT:C222(PAL_at_PopUpMenu29; 2)
		ARRAY TEXT:C222(PAL_at_Function29; 2)
		PAL_at_PopUpMenu29{1}:="Show Further Fields"
		PAL_at_Function29{1}:="Further Fields"
		PAL_at_PopUpMenu29{2}:="Show Qualitative Information"
		PAL_at_Function29{2}:="Qualities"
		ARRAY TEXT:C222(WS_at_BUTTON32POPUP; 2)
		WS_at_BUTTON32POPUP{1}:="Enter Pipeline"
		WS_at_BUTTON32POPUP{2}:="Enter Target"
		WS_GETPALLETEBUTTONS
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28)
		ARRAY TEXT:C222(PAL_at_PopUpMenu32; 2)
		ARRAY TEXT:C222(PAL_at_Function32; 2)
		PAL_at_PopUpMenu32{1}:="Enter Pipeline"
		PAL_at_Function32{1}:="Enter Pipeline"
		PAL_at_PopUpMenu32{2}:="Enter Target"
		PAL_at_Function32{2}:="Enter Target"
		OBJECT GET COORDINATES:C663(PAL_BUTTON_32; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
		
		//`Actually at this time i will only be using this ability on buttons 21-32
		ARRAY TEXT:C222(PAL_at_PopUpMenu21; 6)
		ARRAY TEXT:C222(PAL_at_Function21; 6)
		ARRAY TEXT:C222(PAL_at_PopUpMenu22; 6)
		ARRAY TEXT:C222(PAL_at_Function22; 6)
		PAL_at_PopUpMenu21{1}:=Term_SLPLWT("Enter Company")
		PAL_at_Function21{1}:="Enter Company"
		PAL_at_PopUpMenu22{1}:=Term_SLPLWT("View Companies")
		PAL_at_Function22{1}:="View Companies"
		$_l_Element:=1
		$_l_Element2:=1
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
			If (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu21{$_l_Element}:=Term_SLPLWT("Enter Project")
				PAL_at_Function21{$_l_Element}:="Enter Project"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu22{$_l_Element2}:=Term_SLPLWT("View Projects")
			PAL_at_Function22{$_l_Element2}:="View Projects"
			If (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu21{$_l_Element}:=Term_SLPLWT("Enter Job")
				PAL_at_Function21{$_l_Element}:="Enter Job"
			End if 
			
			
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu22{$_l_Element2}:=Term_SLPLWT("View Jobs")
			PAL_at_Function22{$_l_Element2}:="View Jobs"
			
		End if 
		
		ARRAY TEXT:C222(PAL_at_PopUpMenu21; $_l_Element)
		ARRAY TEXT:C222(PAL_at_PopUpMenu22; $_l_Element2)
		ARRAY TEXT:C222(PAL_at_Function21; $_l_Element)
		ARRAY TEXT:C222(PAL_at_Function22; $_l_Element2)
		ARRAY TEXT:C222(PAL_at_PopUpMenu23; 4)
		ARRAY TEXT:C222(PAL_at_PopUpMenu24; 4)
		ARRAY TEXT:C222(PAL_at_Function23; 4)
		ARRAY TEXT:C222(PAL_at_Function24; 4)
		PAL_at_PopUpMenu23{1}:=Term_SLPLWT("Enter Contact")
		PAL_at_Function23{1}:="Enter Contact"
		PAL_at_PopUpMenu24{1}:="View Contacts"
		PAL_at_Function24{1}:="View Contacts"
		$_l_Element:=1
		$_l_Element2:=1
		
		
		ARRAY TEXT:C222(PAL_at_PopUpMenu23; $_l_Element)
		ARRAY TEXT:C222(PAL_at_PopUpMenu24; $_l_Element2)
		ARRAY TEXT:C222(PAL_at_Function23; $_l_Element)
		ARRAY TEXT:C222(PAL_at_Function24; $_l_Element2)
		ARRAY TEXT:C222(PAL_at_PopUpMenu25; 23)
		ARRAY TEXT:C222(PAL_at_PopUpMenu26; 23)
		ARRAY TEXT:C222(PAL_at_Function25; 23)
		ARRAY TEXT:C222(PAL_at_Function26; 23)
		If (<>DB_bo_FunctionOrder)
			$_l_Element:=0
			$_l_Element2:=0
			If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales orders"
				
				If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)  // enquiry writer"
					If ((DB_GetModuleSettingByNUM(Module_Enquiries))#3)
						
						$_l_Element:=$_l_Element+1
						PAL_at_PopUpMenu25{$_l_Element}:="Enter Enquiry"
						PAL_at_Function25{$_l_Element}:="Enter Enquiry"
						$_l_Element:=$_l_Element+1
						PAL_at_PopUpMenu25{$_l_Element}:="Enter Quotation"
						PAL_at_Function25{$_l_Element}:="Enter Quotation"
					End if 
					$_l_Element2:=$_l_Element2+1
					PAL_at_PopUpMenu26{$_l_Element2}:="View Enquiries"
					PAL_at_Function26{$_l_Element2}:="View Enquiries"
				End if 
				If ((DB_GetModuleSettingByNUM(Module_SalesOrders))#3)
					$_l_Element:=$_l_Element+1
					PAL_at_PopUpMenu25{$_l_Element}:="Enter Sales Order"
					PAL_at_Function25{$_l_Element}:="Enter Sales Order"
				End if 
				$_l_Element2:=$_l_Element2+1
				PAL_at_PopUpMenu26{$_l_Element2}:="View Sales Orders"
				PAL_at_Function26{$_l_Element2}:="View Sales Orders"
				$_l_Element2:=$_l_Element2+1
				PAL_at_PopUpMenu26{$_l_Element2}:="View Order Items"
				PAL_at_Function26{$_l_Element2}:="View Order items"
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_Products))>1)  // products"
				If ((DB_GetModuleSettingByNUM(Module_Products))#3)
					$_l_Element:=$_l_Element+1
					PAL_at_PopUpMenu25{$_l_Element}:="Enter Product"
					PAL_at_Function25{$_l_Element}:="Enter Product"
				End if 
				$_l_Element2:=$_l_Element2+1
				PAL_at_PopUpMenu26{$_l_Element2}:="View Products"
				PAL_at_Function26{$_l_Element2}:="View Products"
			End if 
		Else 
			$_l_Element:=0
			$_l_Element2:=0
			If ((DB_GetModuleSettingByNUM(Module_Products))>1)  // products"
				If ((DB_GetModuleSettingByNUM(Module_Products))#3)
					$_l_Element:=$_l_Element+1
					PAL_at_PopUpMenu25{$_l_Element}:="Enter Product"
					PAL_at_Function25{$_l_Element}:="Enter Product"
				End if 
				$_l_Element2:=$_l_Element2+1
				PAL_at_PopUpMenu26{$_l_Element2}:="View Products"
				PAL_at_Function26{$_l_Element2}:="View Products"
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales orders"
				
				If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)  // enquiry writer"
					If ((DB_GetModuleSettingByNUM(Module_Enquiries))#3)
						$_l_Element:=$_l_Element+1
						PAL_at_PopUpMenu25{$_l_Element}:="Enter Enquiry"
						PAL_at_Function25{$_l_Element}:="Enter Enquiry"
						$_l_Element:=$_l_Element+1
						PAL_at_PopUpMenu25{$_l_Element}:="Enter Quotation"
						PAL_at_Function25{$_l_Element}:="Enter Quotation"
					End if 
					$_l_Element2:=$_l_Element2+1
					PAL_at_PopUpMenu26{$_l_Element2}:="View Enquiries"
					PAL_at_Function26{$_l_Element2}:="View Enquiries"
				End if 
				If ((DB_GetModuleSettingByNUM(Module_SalesOrders))#3)
					$_l_Element:=$_l_Element+1
					PAL_at_PopUpMenu25{$_l_Element}:="Enter Sales Order"
					PAL_at_Function25{$_l_Element}:="Enter Sales Order"
				End if 
				$_l_Element2:=$_l_Element2+1
				PAL_at_PopUpMenu26{$_l_Element2}:="View Sales Orders"
				PAL_at_Function26{$_l_Element2}:="View Sales Orders"
				$_l_Element2:=$_l_Element2+1
				PAL_at_PopUpMenu26{$_l_Element2}:="View Order Items"
				PAL_at_Function26{$_l_Element2}:="View Order items"
				//End if
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  // Purchase orders"
			If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu25{$_l_Element}:="Enter Purchase Order"
				PAL_at_Function25{$_l_Element}:="Enter Purchase Order"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu26{$_l_Element2}:="View Purchase Orders"
			PAL_at_Function26{$_l_Element2}:="View Purchase orders"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  // Purchase invoices"
			If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu25{$_l_Element}:="Enter Purchase Invoice"
				PAL_at_Function25{$_l_Element}:="Enter Purchase Invoice"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu26{$_l_Element2}:="View Purchase Ledger"
			PAL_at_Function26{$_l_Element2}:="View Purchase Ledger"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  // Sales Invoice"
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger))#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu25{$_l_Element}:="Enter Ad-hoc Invoice"
				PAL_at_Function25{$_l_Element}:="Enter adhoc Invoice"
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu25{$_l_Element}:="Enter Invoice Receipt"
				PAL_at_Function25{$_l_Element}:="Enter Invoice receipt"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu26{$_l_Element2}:="View Sales Ledger"
			PAL_at_Function26{$_l_Element2}:="View Sales Ledger"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  // Nominal Ledger"
			If ((DB_GetModuleSettingByNUM(Module_NominalLedger))#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu25{$_l_Element}:="Enter Transaction Batch"
				PAL_at_Function25{$_l_Element}:="Enter Transaction Batch"
				
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu26{$_l_Element2}:="View Batches"
			PAL_at_Function26{$_l_Element2}:="View Batches"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract"
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu25{$_l_Element}:="Enter Contracts"
				PAL_at_Function25{$_l_Element}:="Enter Contracts"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu26{$_l_Element2}:="View Contracts"
			PAL_at_Function26{$_l_Element2}:="View Contracts"
		End if 
		ARRAY TEXT:C222(PAL_at_PopUpMenu25; $_l_Element)
		ARRAY TEXT:C222(PAL_at_PopUpMenu26; $_l_Element)
		ARRAY TEXT:C222(PAL_at_Function25; $_l_Element)
		ARRAY TEXT:C222(PAL_at_Function26; $_l_Element)
		//```Diary
		ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
		ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
		ARRAY TEXT:C222(PAL_at_Function27; 99)
		ARRAY TEXT:C222(PAL_at_Function28; 99)
		PAL_at_PopUpMenu27{1}:="Enter Diary"
		PAL_at_Function27{1}:="Enter Diary"
		PAL_at_PopUpMenu28{1}:="View Diary"
		PAL_at_Function28{1}:="View Diary"
		$_l_Element:=1
		$_l_Element2:=1
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract"
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
				$_l_Element:=$_l_Element+1
				PAL_at_PopUpMenu27{$_l_Element}:="Enter Service Call"
				PAL_at_Function27{$_l_Element}:="Enter Service Call"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_at_PopUpMenu28{$_l_Element2}:="View Service Calls"
			PAL_at_Function28{$_l_Element2}:="View Service Calls"
		End if 
		ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_Element)
		ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_Element2)
		ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
		ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
		//other diary items to go here
		//PAL_at_PopUpMenu27{3}:="Enter Time Sheet"
		ARRAY TEXT:C222(PAL_at_PopUpMenu34; 2)
		ARRAY TEXT:C222(PAL_at_Function34; 2)
		PAL_at_Function34{1}:="Enter Pipeline"
		PAL_at_PopUpMenu34{1}:="Enter Pipeline"
		PAL_at_PopUpMenu34{2}:="Enter Target"
		PAL_at_Function34{1}:="Enter Target"
		If (Size of array:C274(PAL_at_PopUpMenu5)<2)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_5; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_3; True:C214)
			If (PAL_bo_BUtton3disabled)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_3; False:C215)
			End if 
		Else 
			If (PAL_bo_BUtton3disabled) & (Not:C34(PAL_bo_BUtton5disabled))
				//we can only click the sub item...this may sound mad..See the button script
				OBJECT SET ENABLED:C1123(PAL_BUTTON_3; True:C214)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_5; False:C215)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_3; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(PAL_BUTTON_5; True:C214)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_3; False:C215)
			End if 
		End if 
		
		
	: ($_l_event=On Outside Call:K2:11)
		
		If (<>ButtProc=0) | (<>SYS_bo_QuitCalled)
			
			CANCEL:C270
		Else 
			$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; 0; "noGreybuttons"; False:C215)
			SYS_GetCurrentUserSetting($_Obj_GetUser)
			If ($_Obj_GetUser.noGreybuttons=False:C215)
				$_t_ButtonOptions:=<>ButtDis
				
				$_t_ButtonOptionsChar1:=Substring:C12($_t_ButtonOptions; 1; 1)
				$_t_OptionsString:=""
				Case of 
					: (($_t_ButtonOptionsChar1="I") | ($_t_ButtonOptionsChar1="O"))
						WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20)  //Reinsert 6 when start using it
						$_t_OptionsString:=$_t_OptionsString+("03"*Num:C11(Substring:C12($_t_ButtonOptions; 3; 1)="D"))+("04"*Num:C11(Substring:C12($_t_ButtonOptions; 4; 1)="P"))+("05"*Num:C11(Substring:C12($_t_ButtonOptions; 5; 1)="M"))
						If (Substring:C12($_t_ButtonOptions; 6; 1)="O")  //remove this when output layouts are AL
							$_t_OptionsString:=$_t_OptionsString+("06"*Num:C11(Substring:C12($_t_ButtonOptions; 6; 1)="O"))
						End if 
						If (Substring:C12($_t_ButtonOptions; 7; 1)="S")
							$_t_OptionsString:=$_t_OptionsString+"07080910"
						Else 
							If (Substring:C12($_t_ButtonOptions; 7; 1)="N")
								$_t_OptionsString:=$_t_OptionsString+"0810"
							End if 
							If (Substring:C12($_t_ButtonOptions; 8; 1)="P")
								$_t_OptionsString:=$_t_OptionsString+"0709"
							End if 
						End if 
						$_t_OptionsString:=$_t_OptionsString+("11"*Num:C11(Substring:C12($_t_ButtonOptions; 10; 1)="S"))+("12"*Num:C11(Substring:C12($_t_ButtonOptions; 9; 1)="F"))+("13"*Num:C11(Substring:C12($_t_ButtonOptions; 12; 1)="S"))+("14"*Num:C11(Substring:C12($_t_ButtonOptions; 11; 1)="S"))+("1516"*Num:C11(Substring:C12($_t_ButtonOptions; 13; 1)="R"))+("17"*Num:C11(Substring:C12($_t_ButtonOptions; 15; 1)="A"))+("18"*Num:C11(Substring:C12($_t_ButtonOptions; 14; 1)="C"))+("19"*Num:C11(Substring:C12($_t_ButtonOptions; 17; 1)="T"))+("20"*Num:C11(Substring:C12($_t_ButtonOptions; 16; 1)="D"))
						$_l_HalfLength:=Length:C16($_t_OptionsString)/2
						$_t_OptionsString:=$_t_OptionsString+("  "*(20-$_l_HalfLength))
						WS_SETPALLETTEBUTTONS(False:C215; Num:C11(Substring:C12($_t_OptionsString; 1; 2)); Num:C11(Substring:C12($_t_OptionsString; 3; 2)); Num:C11(Substring:C12($_t_OptionsString; 5; 2)); Num:C11(Substring:C12($_t_OptionsString; 7; 2)); Num:C11(Substring:C12($_t_OptionsString; 9; 2)); Num:C11(Substring:C12($_t_OptionsString; 11; 2)); Num:C11(Substring:C12($_t_OptionsString; 13; 2)); Num:C11(Substring:C12($_t_OptionsString; 15; 2)); Num:C11(Substring:C12($_t_OptionsString; 17; 2)); Num:C11(Substring:C12($_t_ButtonOptionsChar1; 19; 2)); Num:C11(Substring:C12($_t_OptionsString; 21; 2)); Num:C11(Substring:C12($_t_ButtonOptionsChar1; 23; 2)); Num:C11(Substring:C12($_t_OptionsString; 25; 2)); Num:C11(Substring:C12($_t_OptionsString; 27; 2)); Num:C11(Substring:C12($_t_OptionsString; 29; 2)); Num:C11(Substring:C12($_t_OptionsString; 31; 2)); Num:C11(Substring:C12($_t_OptionsString; 33; 2)); Num:C11(Substring:C12($_t_OptionsString; 35; 2)); Num:C11(Substring:C12($_t_OptionsString; 37; 2)); Num:C11(Substring:C12($_t_OptionsString; 39; 2)))
						ButString:=$_t_OptionsString
					: ($_t_ButtonOptionsChar1="C")
						//copy mode(output)
						WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 11; 12; 13; 14; 30)  //Reinsert 6 when start using it
					: ($_t_ButtonOptionsChar1="D")
						//copy mode(input)
						WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 11; 12; 13; 14; 30)  //Reinsert 6 when start using it
						
					: ($_t_ButtonOptionsChar1="G")
						
						WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28)  //Reinsert 6 when start using it
					: ($_t_ButtonOptionsChar1="A")
						WS_SETPALLETTEBUTTONS(True:C214; 1; 2)
						WS_SETPALLETTEBUTTONS(False:C215; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20)  //Reinsert 6 when start using it
					: ($_t_ButtonOptionsChar1="M")  //=more choices
						WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 20)
						WS_SETPALLETTEBUTTONS(False:C215; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19)
					: (($_t_ButtonOptionsChar1="U") | ($_t_ButtonOptionsChar1="X"))
						WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20)  //Reinsert 6 when start using it
						If ($_t_ButtonOptionsChar1="X")
							///<>PER_bo_CurrentNoButtGrey:=True
						End if 
						
				End case 
				// CLEAR SEMAPHORE("$ButtDis")
			End if 
			
			
			Case of 
					
				: (DB_l_ButtonClickedFunction=902)
					//Call from pop up method
					If (PAL_l_PopUpID>0)
						$_ptr_PopUp:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10(PAL_l_PopUpID))
						$_t_SelectedValue:=PAL_t_PopUpSelected
						$_l_SelectedValueRow:=Find in array:C230($_ptr_PopUp->; $_t_SelectedValue)
						
						
						If ($_l_SelectedValueRow>0)  //the string exists
							//The purpose of this is so the function string is standardized. The name on screen can be set to anthing
							//also the way the function gets called is naturally hard coded
							$_ptr_FunctionArray:=Get pointer:C304("PAL_at_Function"+String:C10(PAL_l_PopUpID))
							$_t_ButtonFunction:=$_ptr_FunctionArray->{$_l_SelectedValueRow}
							$_l_Process:=Frontmost process:C327(*)
							Case of 
								: ($_t_ButtonFunction="DeleteRecord")  //Same as clicking the delete button
									SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Delete"))
									
									POST OUTSIDE CALL:C329($_l_Process)
								: ($_t_ButtonFunction="DeleteSubrecord")  //Same as clicking the remove button
									SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Minus"))
									POST OUTSIDE CALL:C329($_l_Process)
								: ($_t_ButtonFunction="Further Fields")
									SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Diary"))  //Really!!
									POST OUTSIDE CALL:C329($_l_Process)
								: ($_t_ButtonFunction="Qualities")
									SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{29}))
									POST OUTSIDE CALL:C329($_l_Process)
								: ($_t_ButtonFunction="Enter Company")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[COMPANIES:2])))
									
								: ($_t_ButtonFunction="View Companies")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
									
									//ZProc ("Companies_Mod";◊K3;"View Companies")
								: ($_t_ButtonFunction="Enter Project")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[PROJECTS:89])))
									
								: ($_t_ButtonFunction="View Projects")
									//ZProc ("Projects_Mod";◊K4;"View Projects")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PROJECTS:89])))
								: ($_t_ButtonFunction="Enter Job")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[JOBS:26])))
									
								: ($_t_ButtonFunction="View Jobs")
									
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[JOBS:26])))
								: ($_t_ButtonFunction="Enter Contact")
									//ZProc ("Contacts_In";◊K3;"Enter Contacts")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[CONTACTS:1])))
									
								: ($_t_ButtonFunction="VIew Contacts")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])))
									//ZProc ("Contacts_Mod";◊K3;"View Contacts")
								: ($_t_ButtonFunction="Enter Enquiry")
									DB_MenuNewRecord("OrdersEnquiry")
									
								: ($_t_ButtonFunction="Enter Quotation")
									DB_MenuNewRecord("OrdersQuotation")
									
								: ($_t_ButtonFunction="View Enquiries")
									DBI_MenuDisplayRecords("OrdersEnquiries")
									//ZProc ("Orders_View";◊K3;Term_OrdWT ("View SalesBook"))
								: ($_t_ButtonFunction="Enter Order")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[ORDERS:24])))
									
								: ($_t_ButtonFunction="View Orders")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDERS:24])))
									//ZProc ("Orders_Mod";◊K4;"View Sales Orders")
								: ($_t_ButtonFunction="View Order Items")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])))
									//ZProc ("OrderI_Mod";◊K4;"View Order Items")
									
								: ($_t_ButtonFunction="Enter Product")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[PRODUCTS:9])))
								: ($_t_ButtonFunction="View Products")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
									//ZProc ("Products_Mod";◊K2;"View Products")
								: ($_t_ButtonFunction="Enter Purchase Order")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
									
									
								: ($_t_ButtonFunction="View Purchase Orders")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
									
								: ($_t_ButtonFunction="Enter Purchase Invoice")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
									
								: ($_t_ButtonFunction="View Purchase Ledger")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
									//ZProc ("Purchases_Mod";◊K2;Term_SLPLWT ("View Purchase Ledger"))
								: ($_t_ButtonFunction="Enter Purchase Payment")
									DB_MenuNewRecord("PurchasesPayment")
									
								: ($_t_ButtonFunction="Enter Adhoc Invoice")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[INVOICES:39])))
									
								: ($_t_ButtonFunction="View Sales Ledger")
									
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES:39])))
								: ($_t_ButtonFunction="Enter Invoice Receipt")
									DBI_MenuDisplayRecords("InvoicesReceipt")
									
								: ($_t_ButtonFunction="Enter Transaction Batch")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[TRANSACTION_BATCH_ITEMS:155])))
									
									
								: ($_t_ButtonFunction="VIew Batches")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
									//ZProc ("TransB_Mod";◊K2;"View Batches")
								: ($_t_ButtonFunction="Enter Contract")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[CONTRACTS:17])))
									
								: ($_t_ButtonFunction="View Contracts")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTRACTS:17])))
									//ZProc ("Contracts_Mod";◊K3;"View Contracts")
								: ($_t_ButtonFunction="Enter Service Call")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[SERVICE_CALLS:20])))
									
								: ($_t_ButtonFunction="View Service Calls")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[SERVICE_CALLS:20])))
									//ZProc ("Calls_Mod";◊K3;"View Calls")
								: ($_t_ButtonFunction="Enter Letter")
									DB_MenuNewRecord("DiaryLetter")
									
								: ($_t_ButtonFunction="Enter Email")
									DB_MenuNewRecord("DiaryEmail")
									
								: ($_t_ButtonFunction="View Letters and Emailsl")
									//ZProc ("Diary_ModL";◊K4;"View Letters & "+Term_OrdWT ("Quotes"))
									DBI_MenuDisplayRecords("DiaryLetters")
								: ($_t_ButtonFunction="Enter Movement")
									DB_MenuNewRecord(Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
									
								: ($_t_ButtonFunction="View Movements")
									DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
									//ZProc ("Movements_Mod";◊K3;"View Movements")
								: ($_t_ButtonFunction="Enter Diary")  // this will have a multiple actions. The action codes will be in a seperate array
									If (False:C215)
										$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
										$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
										PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
										If ($_l_ProcessState<0)
											$_l_ProcessNumber:=0
											$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
										End if 
										
										
										If ($_l_ProcessNumber>0)
											SD3_l_CallActionNum:=4
											PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
											If ($_l_ProcessState>=0)  // 29/05/02
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
												SHOW PROCESS:C325($_l_ProcessNumber)
												RESUME PROCESS:C320($_l_ProcessNumber)
												BRING TO FRONT:C326($_l_ProcessNumber)
												If (Application type:C494#4D Server:K5:6)
													POST OUTSIDE CALL:C329($_l_ProcessNumber)
												End if 
											End if 
											SD3_l_CallActionNum:=0
											
										Else 
											ZDiary_Mod
											Repeat 
												DelayTicks(10)
												$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
												$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
												$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
											Until ($_l_ProcessNumber>0)
											PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
											SD3_l_CallActionNum:=4
											PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
											If ($_l_ProcessState>=0)  // 29/05/02
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
												SHOW PROCESS:C325($_l_ProcessNumber)
												RESUME PROCESS:C320($_l_ProcessNumber)
												BRING TO FRONT:C326($_l_ProcessNumber)
												If (Application type:C494#4D Server:K5:6)
													POST OUTSIDE CALL:C329($_l_ProcessNumber)
												End if 
											End if 
											SD3_l_CallActionNum:=0
										End if 
									Else 
										SD_bo_AgendaEnabled:=True:C214
										CB_l_ScheduleFullPage:=1
										SD_AutoAddRec(""; Current date:C33(*); Current time:C178(*))
									End if 
									
								: ($_t_ButtonFunction="Enter Related Diary")  // a pop-up item relating to the tab on the current fronmost screen
									$_l_Process:=Frontmost process:C327(*)
									If ($_l_Process>0)
										SET PROCESS VARIABLE:C370($_l_Process; SD2_t_TabFunction; $_ptr_PopUp->{$_l_SelectedValueRow})
										SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; 512)
										POST OUTSIDE CALL:C329($_l_Process)
									End if 
								: ($_t_ButtonFunction="View Diary")  // This will have others as there will be mulitple diary types in the system
									
									$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
									$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
									PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
									If ($_l_ProcessState<0)
										$_l_ProcessNumber:=0
										$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
									End if 
									DB_t_CallOnCloseorSave:="File"
									If (SD3_l_CallActionNum>0)
										If ($_l_ProcessNumber>0)
											
											
											
											PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
											If ($_l_ProcessState>=0)  // 29/05/02
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_t_DiaryRelatedRecordCode; SD3_t_DiaryRelatedRecord)
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiarySourceProcess; Current process:C322)
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryRelatedRecordTable; SD_l_CompanionMenuTable)
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
												SHOW PROCESS:C325($_l_ProcessNumber)
												RESUME PROCESS:C320($_l_ProcessNumber)
												BRING TO FRONT:C326($_l_ProcessNumber)
												If (Application type:C494#4D Server:K5:6)
													POST OUTSIDE CALL:C329($_l_ProcessNumber)
												End if 
											End if 
										Else 
											ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName)
											Repeat 
												DelayTicks(10)
												$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
												$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
												$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
											Until ($_l_ProcessNumber>0)
											SD3_l_CallActionNum:=4
											PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
											If ($_l_ProcessState>=0)  // 29/05/02
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
												SHOW PROCESS:C325($_l_ProcessNumber)
												RESUME PROCESS:C320($_l_ProcessNumber)
												BRING TO FRONT:C326($_l_ProcessNumber)
												If (Application type:C494#4D Server:K5:6)
													POST OUTSIDE CALL:C329($_l_ProcessNumber)
												End if 
											End if 
											SD3_l_CallActionNum:=0
										End if 
										
									Else 
										If ($_l_ProcessNumber>0)
											SD3_l_CallActionNum:=9
											PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
											If ($_l_ProcessState>=0)  // 29/05/02
												SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
												SHOW PROCESS:C325($_l_ProcessNumber)
												RESUME PROCESS:C320($_l_ProcessNumber)
												BRING TO FRONT:C326($_l_ProcessNumber)
												If (Application type:C494#4D Server:K5:6)
													POST OUTSIDE CALL:C329($_l_ProcessNumber)
												End if 
											End if 
											SD3_l_CallActionNum:=0
										Else 
											ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName)
										End if 
									End if 
								: ($_t_ButtonFunction="View Related Diary")  // a pop-up item relating to the tab on the current fronmost screen
									//unlike enter related diary this needs to open a related record of the class assosicateed with the tab, related to the record on screen.
									//but the user may not  have the tab showing so no record is selected..so like view diarythis has to open the diary with a list of related records...
									//this will open the dairy history window
									//First we must get the correct selection of records..as we would for that tab on the current record
									//we do this by asking the frontmost process to do the work
									$_l_Process:=Frontmost process:C327(*)
									If ($_l_Process>0)
										ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
										SD2_l_TableNum:=0  //This will be returned
										SET PROCESS VARIABLE:C370($_l_Process; SD2_t_TabFunction; $_ptr_PopUp->{$_l_SelectedValueRow})
										SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("View Related Diary"))
										SET PROCESS VARIABLE:C370($_l_Process; SD2_l_CallingProcess; Current process:C322)
										POST OUTSIDE CALL:C329($_l_Process)
										$_l_Retries:=0
										
										While (SD2_l_TableNum=0)
											$_l_Retries:=$_l_Retries+1
											DelayTicks($_l_Retries*2)
										End while 
										//we now have a longint array of a selection and a table number(Not the table numbero f the selection-that is always diary)
										If (Size of array:C274(SD_al_RecordSelection)>0)
											SD_bo_ProcessReady:=False:C215
											$_l_Process:=ZProc_withReply("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary"; "GetCurrentSelection"; String:C10(Current process:C322))
											$_l_Retries:=0
											While (SD_bo_ProcessReady=False:C215)
												$_l_Retries:=$_l_Retries+1
												DelayTicks($_l_Retries*2)
											End while 
											SD2_l_TableNum:=Table:C252(->[COMPANIES:2])
											VARIABLE TO VARIABLE:C635($_l_Process; SD_al_RecordSelection; SD_al_RecordSelection; SD2_l_TableNum; SD2_l_TableNum)
											
											SET PROCESS VARIABLE:C370($_l_Process; SD_bo_ProcessReady; True:C214)
											ARRAY LONGINT:C221(SD_al_RecordSelection; 0)  //Free the memory
										Else 
											Gen_Alert("There are no diary records of that type related to the current on screen record")
										End if 
									End if   //No runing process(an error really)
									
								: ($_t_ButtonFunction="Enter Target")
									
									
									$_l_DataProcess:=New process:C317("SP_NewTarget"; DB_ProcessMemoryinit(1); "Enter Target"; True:C214; False:C215)
									
								: ($_t_ButtonFunction="Enter Pipeline")
									
									$_l_ProcessNumber:=Frontmost process:C327(*)
									
									PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
									$_l_CharacterPosition:=Position:C15("User"; $_t_ProcessName)
									If ($_l_CharacterPosition=0)
										SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{32}))
										
										POST OUTSIDE CALL:C329($_l_ProcessNumber)
									Else 
										//  there is no process showing
										
										$_l_DataProcess:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
										
										
									End if 
									
									
									
									
									
							End case 
						End if 
						
					End if 
					
			End case 
			
		End if 
		
		
		
		
		PAL_l_PopUpID:=0
		DB_l_ButtonClickedFunction:=0
		PAL_bo_ButtonSubFunction:=False:C215
		If (Size of array:C274(PAL_at_PopUpMenu5)<2)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_5; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_3; True:C214)
			If (PAL_bo_BUtton3disabled)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_3; False:C215)
			End if 
		Else 
			If (PAL_bo_BUtton3disabled) & (Not:C34(PAL_bo_BUtton5disabled))
				//we can only click the sub item...this may sound mad..See the button script
				OBJECT SET ENABLED:C1123(PAL_BUTTON_3; True:C214)
				
				OBJECT SET VISIBLE:C603(PAL_BUTTON_5; False:C215)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_3; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(PAL_BUTTON_5; True:C214)
				OBJECT SET VISIBLE:C603(PAL_BUTTON_3; False:C215)
			End if 
		End if 
		
		
		
		
		
	: ($_l_event=On Timer:K2:25)
		
		If (False:C215)
			//Rollo 7/23/2004 - enable the button again
			If ((WS_Buttons_TimerButton<=33) & (WS_Buttons_TimerButton>0))
				$_ptr_PopUp:=Get pointer:C304("PAL_pi_GRAPHIC_"+String:C10(WS_Buttons_TimerButton))
				$_ptr_PopUp->:=DB_apic_ToolPalleteICONS{1}{WS_Buttons_TimerButton}
			End if 
			SET TIMER:C645(0)
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		If (PAL_bo_ButtonSubFunction=False:C215)
			
			$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
			$_l_SelectedValueRow:=Find in array:C230(DB_al_ButtonsAssigned; $_l_ButtonNumber)
			If ($_l_SelectedValueRow>0)
				$_l_ButtonNumber:=$_l_SelectedValueRow
			Else 
				$_l_ButtonNumber:=0
			End if 
			PAL_BUTTON:=""
			$_l_ProcessNumber:=Frontmost process:C327(*)
			
			PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			Case of 
				: ($_l_ButtonNumber=1)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Cancel"))
					
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=2)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("OK"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=3)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Minus"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=4)
					If (Substring:C12(<>ButtDis; 1; 1)="I")
						If (Substring:C12(<>ButtDis; 4; 1)#"P")
							//NG Changing this nasty stuff for 5.4-handle in outside call
							//Forms affected
							
							
							SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Plus"))
							POST OUTSIDE CALL:C329($_l_ProcessNumber)
							
							
						End if 
					Else 
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Plus"))
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				: ($_l_ButtonNumber=5)
					If (Substring:C12(<>ButtDis; 1; 1)="I")
						If (Substring:C12(<>ButtDis; 5; 1)#"M")
							//NG Changing this nasty stuff for 5.4-handle in outside call
							//Forms affected
							//Bookings
							SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Minus"))
							//dont thnk this is right
							POST OUTSIDE CALL:C329($_l_ProcessNumber)
							
							
							
							
						End if 
					Else 
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Minus"))
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
						//dont thnk this is right
					End if 
				: ($_l_ButtonNumber=6)
					If (Substring:C12(<>ButtDis; 1; 1)="I")
						If (Substring:C12(<>ButtDis; 6; 1)#"O")
							//Gen_PostKey (0;109;256)
							//NG Changing this nasty stuff for 5.4-handle in outside call
							//Forms affected
							//Bookings
							
							SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Open"))
							POST OUTSIDE CALL:C329($_l_ProcessNumber)
							
							
						End if 
					Else 
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Open"))
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				: ($_l_ButtonNumber=7)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Previous"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=8)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Next"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=9)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("First"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=10)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Last"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=11)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Select"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=12)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Find"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=13)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Sort"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=14)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Set"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=15)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Report"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=16)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Graph"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=17)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Apply"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=18)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Count"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=19)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Tel"))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=20)
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Diary"))
					
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=21)
					
					//ZProc ("Companies_In";◊K3;"Enter Companies")
					DB_MenuNewRecord(Table name:C256(Table:C252(->[COMPANIES:2])))
				: ($_l_ButtonNumber=22)
					ZProc("Companies_Mod"; DB_ProcessMemoryinit(3); "View Companies")
				: ($_l_ButtonNumber=23)
					DB_MenuNewRecord(Table name:C256(Table:C252(->[CONTACTS:1])))
					
				: ($_l_ButtonNumber=24)
					ZProc("Contacts_Mod"; DB_ProcessMemoryinit(3); "View Contacts")
				: ($_l_ButtonNumber=25)
					If (<>DB_bo_FunctionOrder)
						If (((DB_GetModuleSettingByNUM(Module_SalesOrders))=2) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))=4))
							If (<>MENU_l_BarModule=10)  //does not exist-but may return
								DB_MenuNewRecord(Table name:C256(Table:C252(->[ORDERS:24])))
								
							Else 
								DB_MenuNewRecord(Table name:C256(Table:C252(->[ORDERS:24])))
								
							End if 
						Else 
							If ((DB_GetModuleSettingByNUM(Module_Enquiries)=2) | (DB_GetModuleSettingByNUM(Module_Enquiries)=4))
								
								DB_MenuNewRecord("OrdersEnquiries")
								
							Else 
								DB_MenuNewRecord(Table name:C256(Table:C252(->[PRODUCTS:9])))
								
							End if 
						End if 
					Else 
						DB_MenuNewRecord(Table name:C256(Table:C252(->[PRODUCTS:9])))
					End if 
				: ($_l_ButtonNumber=26)
					If (<>DB_bo_FunctionOrder)
						If (((DB_GetModuleSettingByNUM(Module_SalesOrders))=2) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))=4))
							If (<>MENU_l_BarModule=10)
								ZProc("Orders_Mod"; DB_ProcessMemoryinit(4); "View Event Orders")
							Else 
								ZProc("Orders_Mod"; DB_ProcessMemoryinit(4); "View Sales Orders")
							End if 
						Else 
							If (((DB_GetModuleSettingByNUM(Module_Enquiries))=2) | ((DB_GetModuleSettingByNUM(Module_Enquiries))=4))
								
								ZProc("Orders_View"; DB_ProcessMemoryinit(3); Term_OrdWT("View Enq, Qtn, Ord"))
							Else 
								ZProc("Products_Mod"; DB_ProcessMemoryinit(2); "View Products")
							End if 
						End if 
					Else 
						ZProc("Products_Mod"; DB_ProcessMemoryinit(2); "View Products")
					End if 
				: ($_l_ButtonNumber=27)
					//ZProc ("Diary_In";◊K4;"Enter to Diary")`old code
					//◊WT_Initial:=0  `process was initiated from the button bar
					Case of 
						: (<>SD3_l_DiaryVersion=0) | (Macintosh option down:C545) | (Windows Alt down:C563)  //use old diary manager
							ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary")
							//Repeated in Functions Palette
						: (<>SD3_l_DiaryVersion=1)  //use SuperDiary manager
							If (False:C215)
								
								$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
								$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
								PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
								If ($_l_ProcessState<0)
									$_l_ProcessNumber:=0
									$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
								End if 
								DB_t_CallOnCloseorSave:="File"
								vButtDis:="A DPMONPFSSSRCADT"
								Input_Buttons(->[USER:15]; ->vButtDis)
								If ($_l_ProcessNumber>0)
									
									SD3_l_CallActionNum:=4
									
									PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02
										$_l_CallActionNum:=88
										$_l_Retries:=0
										
										While ($_l_CallActionNum>0) & ($_l_Retries<100)
											GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; $_l_CallActionNum)
											If ($_l_CallActionNum>0)
												
												DelayTicks($_l_Retries*2)
												$_l_Retries:=$_l_Retries+1
											End if 
										End while 
										
										SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
										SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiarySourceProcess; Current process:C322)
										POST OUTSIDE CALL:C329($_l_ProcessNumber)
										//SHOW PROCESS($_l_ProcessNumber)
										//RESUME PROCESS($_l_ProcessNumber)
										//BRING TO FRONT($_l_ProcessNumber)
									End if 
									$_l_Retries:=0
									Repeat 
										
										GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
										If (SD3_l_CallActionNum>0)
											DelayTicks(10)
											$_l_Retries:=$_l_Retries+1
										End if 
									Until (SD3_l_CallActionNum=0) | ($_l_Retries>100)
									SD3_l_CallActionNum:=0
								Else 
									$_l_FrontMostProcess:=Frontmost process:C327(*)
									ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName)
									
									$_bo_breakloop:=True:C214
									DB_bo_DuringInsideCall:=True:C214
									SET PROCESS VARIABLE:C370($_l_ProcessNumber; DB_bo_DuringInsideCall; DB_bo_DuringInsideCall)
									Repeat 
										DelayTicks(10)
										$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
										$_t_SDProcessName:="Schedule"+"-"+<>PER_t_CurrentUserInitials
										$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
										If ($_l_ProcessNumber>0)
											PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
											$_bo_breakloop:=($_l_ProcessState=Waiting for input output:K13:7) | ($_l_ProcessState=Waiting for user event:K13:9)
										Else 
											$_bo_breakloop:=True:C214
										End if 
									Until (($_l_ProcessNumber>0) & ($_bo_breakloop)) | ($_l_ProcessState<0)
									
									
									PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
									If ($_l_ProcessState>=0)  // 30/05/02
										
										
										$_l_Retries:=0
										Repeat 
											DelayTicks(10)  //added 16/08/06 -kmw
											
											GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
											GET PROCESS VARIABLE:C371($_l_ProcessNumber; DB_bo_DuringOutsideCall; DB_bo_DuringOutsideCall)
											GET PROCESS VARIABLE:C371($_l_ProcessNumber; DB_bo_DuringInsideCall; DB_bo_DuringInsideCall)
											POST OUTSIDE CALL:C329($_l_ProcessNumber)
											
											$_l_Retries:=$_l_Retries+1
											//added "| ($_l_Retries=100)" to until condition 16/08/06 -kmw
										Until ((SD3_l_CallActionNum=0) & (DB_bo_DuringOutsideCall=False:C215)) | ($_l_Retries=100)  // & (DB_bo_DuringInsideCall=False)  ` | ($_l_Retries>100)
										
										SD3_l_CallActionNum:=4
										SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiarySourceProcess; Current process:C322)  //bsw 26/05/04
										SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
										
										SHOW PROCESS:C325($_l_ProcessNumber)
										RESUME PROCESS:C320($_l_ProcessNumber)
										BRING TO FRONT:C326($_l_ProcessNumber)
										POST OUTSIDE CALL:C329($_l_ProcessNumber)  //bsw 26/05/04 must otherwise SD3_l_DiaryActionNum in Diary proc is not uptodate -Orders 4
										
										//bsw 26/05/04 added code below
										$_l_Retries:=0
										Repeat 
											
											GET PROCESS VARIABLE:C371($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
											
											POST OUTSIDE CALL:C329($_l_ProcessNumber)
											$_l_Retries:=$_l_Retries+1
										Until (SD3_l_CallActionNum=0) | ($_l_Retries>100)
										//bsw 26/05/04 added code above
										SD3_l_CallActionNum:=0
									End if 
									
								End if 
							Else 
								ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary")
							End if 
					End case 
					
				: ($_l_ButtonNumber=28)
					If (Gen_Option)
						
					Else 
						If (<>SYS_l_WorkflowProcess=0)
							
							<>SYS_l_WorkflowProcess:=ZProc_withReply("SD2_workflow_Mod"; DB_ProcessMemoryinit(4); "Tasks awaiting actions")
						Else 
							SHOW PROCESS:C325(<>SYS_l_WorkflowProcess)
							
							BRING TO FRONT:C326(<>SYS_l_WorkflowProcess)
						End if 
					End if 
				: ($_l_ButtonNumber=29)  //show qualities
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{29}))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=30)  //searc
					SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{30}))
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
				: ($_l_ButtonNumber=31)  //view pipeline
					
					$_l_CharacterPosition:=Position:C15("User"; $_t_ProcessName)
					If ($_l_CharacterPosition=0)
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{31}))
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					Else 
						//there is no process showing
						//so call to show the whole thing
						
						ZSalesPipeline
					End if 
					
					
				: ($_l_ButtonNumber=32)  //Enter  pipeline
					
					$_l_CharacterPosition:=Position:C15("User"; $_t_ProcessName)
					If ($_l_CharacterPosition=0)
						SET PROCESS VARIABLE:C370($_l_Process; DB_l_ButtonClickedFunction; DB_GetButtonFunction(DB_at_ToolPalletteFunctions{32}))
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					Else 
						//  there is no process showing
						
						$_l_DataProcess:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
						
						
					End if 
					
				: ($_l_ButtonNumber=33)  //Enter  Target
					
					$_l_DataProcess:=New process:C317("SP_NewTarget"; DB_ProcessMemoryinit(1); "Enter Target"; True:C214; False:C215)
					
					
			End case 
		End if 
	: ($_l_event=On Resize:K2:27)
		
		
End case 
ERR_MethodTrackerReturn("FM: WS_Buttons"; $_t_oldMethodName)
