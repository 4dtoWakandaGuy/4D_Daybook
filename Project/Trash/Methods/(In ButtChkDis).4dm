//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      In ButtChkDis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   22/09/2010 12:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
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
	//ARRAY TEXT(PAL_POPUP_1;0)
	//ARRAY TEXT(PAL_POPUP_10;0)
	//ARRAY TEXT(PAL_POPUP_11;0)
	//ARRAY TEXT(PAL_POPUP_12;0)
	//ARRAY TEXT(PAL_POPUP_13;0)
	//ARRAY TEXT(PAL_POPUP_14;0)
	//ARRAY TEXT(PAL_POPUP_15;0)
	//ARRAY TEXT(PAL_POPUP_16;0)
	//ARRAY TEXT(PAL_POPUP_17;0)
	//ARRAY TEXT(PAL_POPUP_18;0)
	//ARRAY TEXT(PAL_POPUP_19;0)
	//ARRAY TEXT(PAL_POPUP_2;0)
	//ARRAY TEXT(PAL_POPUP_20;0)
	//ARRAY TEXT(PAL_POPUP_21;0)
	//ARRAY TEXT(PAL_POPUP_22;0)
	//ARRAY TEXT(PAL_POPUP_23;0)
	//ARRAY TEXT(PAL_POPUP_24;0)
	//ARRAY TEXT(PAL_POPUP_25;0)
	//ARRAY TEXT(PAL_POPUP_26;0)
	//ARRAY TEXT(PAL_POPUP_27;0)
	//ARRAY TEXT(PAL_POPUP_28;0)
	//ARRAY TEXT(PAL_POPUP_29;0)
	//ARRAY TEXT(PAL_POPUP_3;0)
	//ARRAY TEXT(PAL_POPUP_30;0)
	//ARRAY TEXT(PAL_POPUP_31;0)
	//ARRAY TEXT(PAL_POPUP_32;0)
	//ARRAY TEXT(PAL_POPUP_34;0)
	//ARRAY TEXT(PAL_POPUP_4;0)
	//ARRAY TEXT(PAL_POPUP_5;0)
	//ARRAY TEXT(PAL_POPUP_6;0)
	//ARRAY TEXT(PAL_POPUP_7;0)
	//ARRAY TEXT(PAL_POPUP_8;0)
	//ARRAY TEXT(PAL_POPUP_9;0)
	//ARRAY TEXT(WS_at_BUTTON32POPUP;0)
	C_BOOLEAN:C305(<>DB_bo_FunctionOrder; <>PER_bo_CurrentNoButtGrey; BUT_Floating; DB_bo_PopInited; PAL_bo_BUtton3disabled; PAL_bo_BUtton5disabled; PAL_bo_POPUPInited)
	C_LONGINT:C283(<>BUTTPROC; <>Mod_l_MenuBarPaletteProcess; <>SCPT_l_PaletteWIndow; $_l_Element; $_l_Element2; $_l_Event; $_l_HalfLength; $_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; PAL_BUTTON_3; PAL_BUTTON_32; PAL_BUTTON_5; PAL_BUTTON_99)
	C_POINTER:C301($1; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_ButtonOptions; $_t_ButtonOptionsChar1; $_t_oldMethodName; $_t_OptionsString; ButString; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In ButtChkDis")

//If (vProc=Frontmost process(*))
$_t_ButtonOptions:=$1->
BUT_p_ButtonStringPointer:=$1
If (Not:C34(DB_bo_PopInited))
	ARRAY TEXT:C222(PAL_POPUP_1; 0)
	ARRAY TEXT:C222(PAL_POPUP_2; 0)
	ARRAY TEXT:C222(PAL_POPUP_3; 0)
	ARRAY TEXT:C222(PAL_POPUP_4; 0)
	ARRAY TEXT:C222(PAL_POPUP_5; 0)
	ARRAY TEXT:C222(PAL_POPUP_6; 0)
	ARRAY TEXT:C222(PAL_POPUP_7; 0)
	ARRAY TEXT:C222(PAL_POPUP_8; 0)
	ARRAY TEXT:C222(PAL_POPUP_9; 0)
	ARRAY TEXT:C222(PAL_POPUP_10; 0)
	ARRAY TEXT:C222(PAL_POPUP_11; 0)
	ARRAY TEXT:C222(PAL_POPUP_12; 0)
	ARRAY TEXT:C222(PAL_POPUP_13; 0)
	ARRAY TEXT:C222(PAL_POPUP_14; 0)
	ARRAY TEXT:C222(PAL_POPUP_15; 0)
	ARRAY TEXT:C222(PAL_POPUP_16; 0)
	ARRAY TEXT:C222(PAL_POPUP_17; 0)
	ARRAY TEXT:C222(PAL_POPUP_18; 0)
	ARRAY TEXT:C222(PAL_POPUP_19; 0)
	ARRAY TEXT:C222(PAL_POPUP_20; 0)
	ARRAY TEXT:C222(PAL_POPUP_21; 0)
	ARRAY TEXT:C222(PAL_POPUP_22; 0)
	ARRAY TEXT:C222(PAL_POPUP_23; 0)
	ARRAY TEXT:C222(PAL_POPUP_24; 0)
	ARRAY TEXT:C222(PAL_POPUP_25; 0)
	ARRAY TEXT:C222(PAL_POPUP_26; 0)
	ARRAY TEXT:C222(PAL_POPUP_27; 0)
	ARRAY TEXT:C222(PAL_POPUP_28; 0)
	ARRAY TEXT:C222(PAL_POPUP_29; 0)
	ARRAY TEXT:C222(PAL_POPUP_30; 0)
	ARRAY TEXT:C222(PAL_POPUP_31; 0)
	ARRAY TEXT:C222(PAL_POPUP_32; 0)
	If (BUT_Floating)
		//SET WINDOW TITLE("Buttons")
		OBJECT SET VISIBLE:C603(*; "GroupClose"; False:C215)
		OBJECT SET VISIBLE:C603(PAL_BUTTON_99; False:C215)
		
	End if 
	ARRAY TEXT:C222(PAL_POPUP_5; 2)
	ARRAY TEXT:C222(PAL_at_Function5; 2)
	//NG note we will swap these words contextually.
	PAL_POPUP_5{1}:="Delete Record"
	PAL_at_Function5{1}:="DeleteRecord"
	PAL_POPUP_5{2}:="Delete Subrecord"
	PAL_at_Function5{2}:="DeleteSubrecord"
	
	ARRAY TEXT:C222(PAL_POPUP_29; 2)
	ARRAY TEXT:C222(PAL_at_Function29; 2)
	PAL_POPUP_29{1}:="Show Further Fields"
	PAL_at_Function29{1}:="Further Fields"
	PAL_POPUP_29{2}:="Show Qualitative Information"
	PAL_at_Function29{2}:="Qualities"
	ARRAY TEXT:C222(WS_at_BUTTON32POPUP; 2)
	WS_at_BUTTON32POPUP{1}:="Enter Pipeline"
	WS_at_BUTTON32POPUP{2}:="Enter Target"
	WS_GETPALLETEBUTTONS
	WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28)
	ARRAY TEXT:C222(PAL_POPUP_32; 2)
	ARRAY TEXT:C222(PAL_at_Function32; 2)
	PAL_POPUP_32{1}:="Enter Pipeline"
	PAL_at_Function32{1}:="Enter Pipeline"
	PAL_POPUP_32{2}:="Enter Target"
	PAL_at_Function32{2}:="Enter Target"
	OBJECT GET COORDINATES:C663(PAL_BUTTON_32; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	
	//`Actually at this time i will only be using this ability on buttons 21-32
	ARRAY TEXT:C222(PAL_POPUP_21; 6)
	ARRAY TEXT:C222(PAL_at_Function21; 6)
	ARRAY TEXT:C222(PAL_POPUP_22; 6)
	ARRAY TEXT:C222(PAL_at_Function22; 6)
	PAL_POPUP_21{1}:=Term_SLPLWT("Enter Company")
	PAL_at_Function21{1}:="Enter Company"
	PAL_POPUP_22{1}:=Term_SLPLWT("View Companies")
	PAL_at_Function22{1}:="View Companies"
	$_l_Element:=1
	$_l_Element2:=1
	If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
		If (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_21{$_l_Element}:=Term_SLPLWT("Enter Project")
			PAL_at_Function21{$_l_Element}:="Enter Project"
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_22{$_l_Element2}:=Term_SLPLWT("View Projects")
		PAL_at_Function22{$_l_Element2}:="View Projects"
		If (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_21{$_l_Element}:=Term_SLPLWT("Enter Job")
			PAL_at_Function21{$_l_Element}:="Enter Job"
		End if 
		
		
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_22{$_l_Element2}:=Term_SLPLWT("View Jobs")
		PAL_at_Function22{$_l_Element2}:="View Jobs"
		
	End if 
	
	ARRAY TEXT:C222(PAL_POPUP_21; $_l_Element)
	ARRAY TEXT:C222(PAL_POPUP_22; $_l_Element2)
	ARRAY TEXT:C222(PAL_at_Function21; $_l_Element)
	ARRAY TEXT:C222(PAL_at_Function22; $_l_Element2)
	ARRAY TEXT:C222(PAL_POPUP_23; 4)
	ARRAY TEXT:C222(PAL_POPUP_24; 4)
	ARRAY TEXT:C222(PAL_at_Function23; 4)
	ARRAY TEXT:C222(PAL_at_Function24; 4)
	PAL_POPUP_23{1}:=Term_SLPLWT("Enter Contact")
	PAL_at_Function23{1}:="Enter Contact"
	PAL_POPUP_24{1}:="View Contacts"
	PAL_at_Function24{1}:="View Contacts"
	$_l_Element:=1
	$_l_Element2:=1
	
	
	ARRAY TEXT:C222(PAL_POPUP_23; $_l_Element)
	ARRAY TEXT:C222(PAL_POPUP_24; $_l_Element2)
	ARRAY TEXT:C222(PAL_at_Function23; $_l_Element)
	ARRAY TEXT:C222(PAL_at_Function24; $_l_Element2)
	ARRAY TEXT:C222(PAL_POPUP_25; 23)
	ARRAY TEXT:C222(PAL_POPUP_26; 23)
	ARRAY TEXT:C222(PAL_at_Function25; 23)
	ARRAY TEXT:C222(PAL_at_Function26; 23)
	If (<>DB_bo_FunctionOrder)
		$_l_Element:=0
		$_l_Element2:=0
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales orders
			
			If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)  // enquiry writer
				If ((DB_GetModuleSettingByNUM(Module_Enquiries))#3)
					
					$_l_Element:=$_l_Element+1
					PAL_POPUP_25{$_l_Element}:="Enter Enquiry"
					PAL_at_Function25{$_l_Element}:="Enter Enquiry"
					$_l_Element:=$_l_Element+1
					PAL_POPUP_25{$_l_Element}:="Enter Quotation"
					PAL_at_Function25{$_l_Element}:="Enter Quotation"
				End if 
				$_l_Element2:=$_l_Element2+1
				PAL_POPUP_26{$_l_Element2}:="View Enquiries"
				PAL_at_Function26{$_l_Element2}:="View Enquiries"
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesOrders))#3)
				$_l_Element:=$_l_Element+1
				PAL_POPUP_25{$_l_Element}:="Enter Sales Order"
				PAL_at_Function25{$_l_Element}:="Enter Sales Order"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_POPUP_26{$_l_Element2}:="View Sales Orders"
			PAL_at_Function26{$_l_Element2}:="View Sales Orders"
			$_l_Element2:=$_l_Element2+1
			PAL_POPUP_26{$_l_Element2}:="View Order Items"
			PAL_at_Function26{$_l_Element2}:="View Order items"
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Products))>1)  // products"
			If ((DB_GetModuleSettingByNUM(Module_Products))#3)
				$_l_Element:=$_l_Element+1
				PAL_POPUP_25{$_l_Element}:="Enter Product"
				PAL_at_Function25{$_l_Element}:="Enter Product"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_POPUP_26{$_l_Element2}:="View Products"
			PAL_at_Function26{$_l_Element2}:="View Products"
		End if 
	Else 
		$_l_Element:=0
		$_l_Element2:=0
		If ((DB_GetModuleSettingByNUM(Module_Products))>1)  // products
			If ((DB_GetModuleSettingByNUM(Module_Products))#3)
				$_l_Element:=$_l_Element+1
				PAL_POPUP_25{$_l_Element}:="Enter Product"
				PAL_at_Function25{$_l_Element}:="Enter Product"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_POPUP_26{$_l_Element2}:="View Products"
			PAL_at_Function26{$_l_Element2}:="View Products"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales orders
			
			If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)  // enquiry writer
				If ((DB_GetModuleSettingByNUM(Module_Enquiries))#3)
					$_l_Element:=$_l_Element+1
					PAL_POPUP_25{$_l_Element}:="Enter Enquiry"
					PAL_at_Function25{$_l_Element}:="Enter Enquiry"
					$_l_Element:=$_l_Element+1
					PAL_POPUP_25{$_l_Element}:="Enter Quotation"
					PAL_at_Function25{$_l_Element}:="Enter Quotation"
				End if 
				$_l_Element2:=$_l_Element2+1
				PAL_POPUP_26{$_l_Element2}:="View Enquiries"
				PAL_at_Function26{$_l_Element2}:="View Enquiries"
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesOrders))#3)
				$_l_Element:=$_l_Element+1
				PAL_POPUP_25{$_l_Element}:="Enter Sales Order"
				PAL_at_Function25{$_l_Element}:="Enter Sales Order"
			End if 
			$_l_Element2:=$_l_Element2+1
			PAL_POPUP_26{$_l_Element2}:="View Sales Orders"
			PAL_at_Function26{$_l_Element2}:="View Sales Orders"
			$_l_Element2:=$_l_Element2+1
			PAL_POPUP_26{$_l_Element2}:="View Order Items"
			PAL_at_Function26{$_l_Element2}:="View Order items"
			//End if
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  // Purchase orders
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_25{$_l_Element}:="Enter Purchase Order"
			PAL_at_Function25{$_l_Element}:="Enter Purchase Order"
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_26{$_l_Element2}:="View Purchase Orders"
		PAL_at_Function26{$_l_Element2}:="View Purchase orders"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  // Purchase invoices"
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_25{$_l_Element}:="Enter Purchase Invoice"
			PAL_at_Function25{$_l_Element}:="Enter Purchase Invoice"
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_26{$_l_Element2}:="View Purchase Ledger"
		PAL_at_Function26{$_l_Element2}:="View Purchase Ledger"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  // Sales Invoice
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_25{$_l_Element}:="Enter Ad-hoc Invoice"
			PAL_at_Function25{$_l_Element}:="Enter adhoc Invoice"
			$_l_Element:=$_l_Element+1
			PAL_POPUP_25{$_l_Element}:="Enter Invoice Receipt"
			PAL_at_Function25{$_l_Element}:="Enter Invoice receiptt"
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_26{$_l_Element2}:="View Sales Ledger"
		PAL_at_Function26{$_l_Element2}:="View Sales Ledger"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  // Nominal Ledger
		If ((DB_GetModuleSettingByNUM(Module_NominalLedger))#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_25{$_l_Element}:="Enter Transaction Batch"
			PAL_at_Function25{$_l_Element}:="Enter Transaction Batch"
			
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_26{$_l_Element2}:="View Batches"
		PAL_at_Function26{$_l_Element2}:="View Batches"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract"
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_25{$_l_Element}:="Enter Contracts"
			PAL_at_Function25{$_l_Element}:="Enter Contracts"
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_26{$_l_Element2}:="View Contracts"
		PAL_at_Function26{$_l_Element2}:="View Contracts"
	End if 
	ARRAY TEXT:C222(PAL_POPUP_25; $_l_Element)
	ARRAY TEXT:C222(PAL_POPUP_26; $_l_Element)
	ARRAY TEXT:C222(PAL_at_Function25; $_l_Element)
	ARRAY TEXT:C222(PAL_at_Function26; $_l_Element)
	//```Diary
	ARRAY TEXT:C222(PAL_POPUP_27; 99)
	ARRAY TEXT:C222(PAL_POPUP_28; 99)
	ARRAY TEXT:C222(PAL_at_Function27; 99)
	ARRAY TEXT:C222(PAL_at_Function28; 99)
	PAL_POPUP_27{1}:="Enter Diary"
	PAL_at_Function27{1}:="Enter Diary"
	PAL_POPUP_28{1}:="View Diary"
	PAL_at_Function28{1}:="View Diary"
	$_l_Element:=1
	$_l_Element2:=1
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
			$_l_Element:=$_l_Element+1
			PAL_POPUP_27{$_l_Element}:="Enter Service Call"
			PAL_at_Function27{$_l_Element}:="Enter Service Call"
		End if 
		$_l_Element2:=$_l_Element2+1
		PAL_POPUP_28{$_l_Element2}:="View Service Calls"
		PAL_at_Function28{$_l_Element2}:="View Service Calls"
	End if 
	ARRAY TEXT:C222(PAL_POPUP_27; $_l_Element)
	ARRAY TEXT:C222(PAL_POPUP_28; $_l_Element2)
	ARRAY TEXT:C222(PAL_at_Function27; $_l_Element)
	ARRAY TEXT:C222(PAL_at_Function28; $_l_Element2)
	//other diary items to go here
	//PAL_POPUP_27{3}:="Enter Time Sheet"
	ARRAY TEXT:C222(PAL_POPUP_34; 2)
	ARRAY TEXT:C222(PAL_at_Function34; 2)
	PAL_at_Function34{1}:="Enter Pipeline"
	PAL_POPUP_34{1}:="Enter Pipeline"
	PAL_POPUP_34{2}:="Enter Target"
	PAL_at_Function34{1}:="Enter Target"
	If (Size of array:C274(PAL_POPUP_5)<2)
		OBJECT SET VISIBLE:C603(PAL_BUTTON_5; False:C215)
		OBJECT SET VISIBLE:C603(PAL_BUTTON_3; True:C214)
		If (PAL_bo_BUtton3disabled)
			OBJECT SET ENABLED:C1123(PAL_BUTTON_3; False:C215)
			//_O_DISABLE BUTTON(PAL_BUTTON_3)
		End if 
	Else 
		If (PAL_bo_BUtton3disabled) & (Not:C34(PAL_bo_BUtton5disabled))
			//we can only click the sub item...this may sound mad..See the button script
			OBJECT SET ENABLED:C1123(PAL_BUTTON_3; True:C214)
			
			//_O_ENABLE BUTTON(PAL_BUTTON_3)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_5; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_3; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(PAL_BUTTON_5; True:C214)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_3; False:C215)
		End if 
	End if 
	DB_bo_PopInited:=True:C214
End if 
If ($_t_ButtonOptions#"")  //>0)
	If (PAL_bo_POPUPInited) & (Count parameters:C259<2)
		//VARIABLE TO VARIABLE(◊ButtProc;PAL_POPUP_5;PAL_POPUP_5)
	Else 
		If (Count parameters:C259>=2)
			ARRAY TEXT:C222(PAL_POPUP_5; 0)
			PAL_bo_POPUPInited:=True:C214
			For ($_l_Index; 2; Count parameters:C259)
				If (${$_l_Index}#"")
					APPEND TO ARRAY:C911(PAL_POPUP_5; ${$_l_Index})
				End if 
			End for 
			//VARIABLE TO VARIABLE(◊ButtProc;PAL_POPUP_5;PAL_POPUP_5)
		Else 
			If (PAL_bo_POPUPInited)
				//VARIABLE TO VARIABLE(◊ButtProc;PAL_POPUP_5;PAL_POPUP_5)
			End if 
		End if 
	End if 
	//CALL PROCESS(◊ButtProc)
	//```
	
	
	
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
			WS_SETPALLETTEBUTTONS(False:C215; Num:C11(Substring:C12($_t_OptionsString; 1; 2)); Num:C11(Substring:C12($_t_OptionsString; 3; 2)); Num:C11(Substring:C12($_t_OptionsString; 5; 2)); Num:C11(Substring:C12($_t_OptionsString; 7; 2)); Num:C11(Substring:C12($_t_OptionsString; 9; 2)); Num:C11(Substring:C12($_t_OptionsString; 11; 2)); Num:C11(Substring:C12($_t_OptionsString; 13; 2)); Num:C11(Substring:C12($_t_OptionsString; 15; 2)); Num:C11(Substring:C12($_t_OptionsString; 17; 2)); Num:C11(Substring:C12($_t_OptionsString; 19; 2)); Num:C11(Substring:C12($_t_OptionsString; 21; 2)); Num:C11(Substring:C12($_t_OptionsString; 23; 2)); Num:C11(Substring:C12($_t_OptionsString; 25; 2)); Num:C11(Substring:C12($_t_OptionsString; 27; 2)); Num:C11(Substring:C12($_t_OptionsString; 29; 2)); Num:C11(Substring:C12($_t_OptionsString; 31; 2)); Num:C11(Substring:C12($_t_OptionsString; 33; 2)); Num:C11(Substring:C12($_t_OptionsString; 35; 2)); Num:C11(Substring:C12($_t_OptionsString; 37; 2)); Num:C11(Substring:C12($_t_OptionsString; 39; 2)))
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
				<>PER_bo_CurrentNoButtGrey:=True:C214
			End if 
			
	End case 
	//``
End if 

If (<>SCPT_l_PaletteWIndow#0)
	//Macro_FileUpd
End if 

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Activate:K2:9)
		
		If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
			DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
			SET_MENU BAR(DB_t_CUrrentInputMenuRef)
		End if 
		
End case 

In_SetManager
If (<>Mod_l_MenuBarPaletteProcess>0)
	HIDE PROCESS:C324(<>Mod_l_MenuBarPaletteProcess)
End if 
If (<>ButtProc>0)
	HIDE PROCESS:C324(<>ButtProc)
End if 
ERR_MethodTrackerReturn("In ButtChkDis"; $_t_oldMethodName)