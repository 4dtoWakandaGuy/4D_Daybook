//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormButtonPopUps
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/08/2010 17:02
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
	C_BOOLEAN:C305(<>DB_bo_FunctionOrder; BUT_bo_Floating; PAL_bo_BUtton3disabled; PAL_bo_BUtton5disabled)
	C_LONGINT:C283($_l_CurrentRow; $_l_CurrentRow2; $_l_objectBottom; $_l_objectLeft; $_l_objectRight; $_l_objectTop; PAL_but_FirstRecord9; PAL_BUTTON_3; PAL_BUTTON_32; PAL_BUTTON_5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormButtonPopUps")

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
$_l_CurrentRow:=1
$_l_CurrentRow2:=1
If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
	If (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu21{$_l_CurrentRow}:=Term_SLPLWT("Enter Project")
		PAL_at_Function21{$_l_CurrentRow}:="Enter Project"
	End if 
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu22{$_l_CurrentRow2}:=Term_SLPLWT("View Projects")
	PAL_at_Function22{$_l_CurrentRow2}:="View Projects"
	If (DB_GetModuleSettingByNUM(Module_JobCosting)#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu21{$_l_CurrentRow}:=Term_SLPLWT("Enter Job")
		PAL_at_Function21{$_l_CurrentRow}:="Enter Job"
	End if 
	
	
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu22{$_l_CurrentRow2}:=Term_SLPLWT("View Jobs")
	PAL_at_Function22{$_l_CurrentRow2}:="View Jobs"
	
End if 

ARRAY TEXT:C222(PAL_at_PopUpMenu21; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_PopUpMenu22; $_l_CurrentRow2)
ARRAY TEXT:C222(PAL_at_Function21; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_Function22; $_l_CurrentRow2)
ARRAY TEXT:C222(PAL_at_PopUpMenu23; 4)
ARRAY TEXT:C222(PAL_at_PopUpMenu24; 4)
ARRAY TEXT:C222(PAL_at_Function23; 4)
ARRAY TEXT:C222(PAL_at_Function24; 4)
PAL_at_PopUpMenu23{1}:=Term_SLPLWT("Enter Contact")
PAL_at_Function23{1}:="Enter Contact"
PAL_at_PopUpMenu24{1}:="View Contacts"
PAL_at_Function24{1}:="View Contacts"
$_l_CurrentRow:=1
$_l_CurrentRow2:=1


ARRAY TEXT:C222(PAL_at_PopUpMenu23; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_PopUpMenu24; $_l_CurrentRow2)
ARRAY TEXT:C222(PAL_at_Function23; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_Function24; $_l_CurrentRow2)
ARRAY TEXT:C222(PAL_at_PopUpMenu25; 23)
ARRAY TEXT:C222(PAL_at_PopUpMenu26; 23)
ARRAY TEXT:C222(PAL_at_Function25; 23)
ARRAY TEXT:C222(PAL_at_Function26; 23)
If (<>DB_bo_FunctionOrder)
	$_l_CurrentRow:=0
	$_l_CurrentRow2:=0
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales orders"
		
		If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)  // enquiry writer"
			If ((DB_GetModuleSettingByNUM(Module_Enquiries))#3)
				
				$_l_CurrentRow:=$_l_CurrentRow+1
				PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Enquiry"
				PAL_at_Function25{$_l_CurrentRow}:="Enter Enquiry"
				$_l_CurrentRow:=$_l_CurrentRow+1
				PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Quotation"
				PAL_at_Function25{$_l_CurrentRow}:="Enter Quotation"
			End if 
			$_l_CurrentRow2:=$_l_CurrentRow2+1
			PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Enquiries"
			PAL_at_Function26{$_l_CurrentRow2}:="View Enquiries"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))#3)
			$_l_CurrentRow:=$_l_CurrentRow+1
			PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Sales Order"
			PAL_at_Function25{$_l_CurrentRow}:="Enter Sales Order"
		End if 
		$_l_CurrentRow2:=$_l_CurrentRow2+1
		PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Sales Orders"
		PAL_at_Function26{$_l_CurrentRow2}:="View Sales Orders"
		$_l_CurrentRow2:=$_l_CurrentRow2+1
		PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Order Items"
		PAL_at_Function26{$_l_CurrentRow2}:="View Order items"
		
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Products))>1)  // products"
		If ((DB_GetModuleSettingByNUM(Module_Products))#3)
			$_l_CurrentRow:=$_l_CurrentRow+1
			PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Product"
			PAL_at_Function25{$_l_CurrentRow}:="Enter Product"
		End if 
		$_l_CurrentRow2:=$_l_CurrentRow2+1
		PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Products"
		PAL_at_Function26{$_l_CurrentRow2}:="View Products"
	End if 
Else 
	$_l_CurrentRow:=0
	$_l_CurrentRow2:=0
	If ((DB_GetModuleSettingByNUM(Module_Products))>1)  // products"
		If ((DB_GetModuleSettingByNUM(Module_Products))#3)
			$_l_CurrentRow:=$_l_CurrentRow+1
			PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Product"
			PAL_at_Function25{$_l_CurrentRow}:="Enter Product"
		End if 
		$_l_CurrentRow2:=$_l_CurrentRow2+1
		PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Products"
		PAL_at_Function26{$_l_CurrentRow2}:="View Products"
	End if 
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>1)  //Sales orders"
		
		If ((DB_GetModuleSettingByNUM(Module_Enquiries))>1)  // enquiry writer"
			If ((DB_GetModuleSettingByNUM(Module_Enquiries))#3)
				$_l_CurrentRow:=$_l_CurrentRow+1
				PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Enquiry"
				PAL_at_Function25{$_l_CurrentRow}:="Enter Enquiry"
				$_l_CurrentRow:=$_l_CurrentRow+1
				PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Quotation"
				PAL_at_Function25{$_l_CurrentRow}:="Enter Quotation"
			End if 
			$_l_CurrentRow2:=$_l_CurrentRow2+1
			PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Enquiries"
			PAL_at_Function26{$_l_CurrentRow2}:="View Enquiries"
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))#3)
			$_l_CurrentRow:=$_l_CurrentRow+1
			PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Sales Order"
			PAL_at_Function25{$_l_CurrentRow}:="Enter Sales Order"
		End if 
		$_l_CurrentRow2:=$_l_CurrentRow2+1
		PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Sales Orders"
		PAL_at_Function26{$_l_CurrentRow2}:="View Sales Orders"
		$_l_CurrentRow2:=$_l_CurrentRow2+1
		PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Order Items"
		PAL_at_Function26{$_l_CurrentRow2}:="View Order items"
		//End if
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>1)  // Purchase orders"
	If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Purchase Order"
		PAL_at_Function25{$_l_CurrentRow}:="Enter Purchase Order"
	End if 
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Purchase Orders"
	PAL_at_Function26{$_l_CurrentRow2}:="View Purchase orders"
End if 
If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>1)  // Purchase invoices"
	If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Purchase Invoice"
		PAL_at_Function25{$_l_CurrentRow}:="Enter Purchase Invoice"
	End if 
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Purchase Ledger"
	PAL_at_Function26{$_l_CurrentRow2}:="View Purchase Ledger"
End if 
If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>1)  // Sales Invoice
	If ((DB_GetModuleSettingByNUM(Module_SalesLedger))#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Ad-hoc Invoice"
		PAL_at_Function25{$_l_CurrentRow}:="Enter adhoc Invoice"
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Invoice Receipt"
		PAL_at_Function25{$_l_CurrentRow}:="Enter Invoice receiptt"
	End if 
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Sales Ledger"
	PAL_at_Function26{$_l_CurrentRow2}:="View Sales Ledger"
End if 
If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>1)  // Nominal Ledger"
	If ((DB_GetModuleSettingByNUM(Module_NominalLedger))#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Transaction Batch"
		PAL_at_Function25{$_l_CurrentRow}:="Enter Transaction Batch"
		
	End if 
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Batches"
	PAL_at_Function26{$_l_CurrentRow2}:="View Batches"
End if 
If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract"
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu25{$_l_CurrentRow}:="Enter Contracts"
		PAL_at_Function25{$_l_CurrentRow}:="Enter Contracts"
	End if 
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu26{$_l_CurrentRow2}:="View Contracts"
	PAL_at_Function26{$_l_CurrentRow2}:="View Contracts"
End if 
ARRAY TEXT:C222(PAL_at_PopUpMenu25; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_PopUpMenu26; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_Function25; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_Function26; $_l_CurrentRow)
//```Diary
ARRAY TEXT:C222(PAL_at_PopUpMenu27; 99)
ARRAY TEXT:C222(PAL_at_PopUpMenu28; 99)
ARRAY TEXT:C222(PAL_at_Function27; 99)
ARRAY TEXT:C222(PAL_at_Function28; 99)
PAL_at_PopUpMenu27{1}:="Enter Diary"
PAL_at_Function27{1}:="Enter Diary"
PAL_at_PopUpMenu28{1}:="View Diary"
PAL_at_Function28{1}:="View Diary"
$_l_CurrentRow:=1
$_l_CurrentRow2:=1
If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)  // Service Contract"
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))#3)
		$_l_CurrentRow:=$_l_CurrentRow+1
		PAL_at_PopUpMenu27{$_l_CurrentRow}:="Enter Service Call"
		PAL_at_Function27{$_l_CurrentRow}:="Enter Service Call"
	End if 
	$_l_CurrentRow2:=$_l_CurrentRow2+1
	PAL_at_PopUpMenu28{$_l_CurrentRow2}:="View Service Calls"
	PAL_at_Function28{$_l_CurrentRow2}:="View Service Calls"
End if 
ARRAY TEXT:C222(PAL_at_PopUpMenu27; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_PopUpMenu28; $_l_CurrentRow2)
ARRAY TEXT:C222(PAL_at_Function27; $_l_CurrentRow)
ARRAY TEXT:C222(PAL_at_Function28; $_l_CurrentRow2)
//other diary items to go here
//PAL_at_PopUpMenu27{3}:="Enter Time Sheet"
ARRAY TEXT:C222(PAL_at_PopUpMenu34; 2)
ARRAY TEXT:C222(PAL_at_Function34; 2)
PAL_at_Function34{1}:="Enter Pipeline"
PAL_at_PopUpMenu34{1}:="Enter Pipeline"
PAL_at_PopUpMenu34{2}:="Enter Target"
PAL_at_Function34{1}:="Enter Target"


If (Size of array:C274(PAL_at_PopUpMenu5)<2)
	OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oMinusButton"; True:C214)
	If (PAL_bo_BUtton3disabled)
		//_O_DISABLE BUTTON(PAL_BUTTON_3)
		OBJECT SET ENABLED:C1123(*; "oMinusButton"; False:C215)
	End if 
Else 
	If (PAL_bo_BUtton3disabled) & (Not:C34(PAL_bo_BUtton5disabled))
		//we can only click the sub item...this may sound mad..See the button script
		OBJECT SET ENABLED:C1123(*; "oMinusButton"; True:C214)
		
		OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oMinusButton"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oMinusButton"; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetFormButtonPopUps"; $_t_oldMethodName)
