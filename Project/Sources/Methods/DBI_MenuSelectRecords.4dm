//%attributes = {}
If (False:C215)
	//Project Method Name:      DBI_MenuSelectRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    08/11/2010 20:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305($_bo_DataEditing; $_bo_EditInTransaction; $_bo_FIltersAvailable; $_bo_GraphsAvailable; $_bo_HideModuleBar; $_bo_NewProcess; $_bo_NoHideModule; $_bo_ReturnProcessID; $_bo_ReturnSelectRecords; $_bo_SearchesAvailable; $_bo_SelectionsAvailable)
	C_BOOLEAN:C305($_bo_StatsAvailable; $_bo_SubselectionsAvailable; $_bo_TabsAvailable; $2; $ShowModuleBar)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_DisplayRecordsTable; $_l_Index; $_l_LastTableNumber; $_l_Module; $_l_offset; $_l_Offsets; $_l_Process; $_l_TableNUmberRow; $DB_l_ViewType)
	C_POINTER:C301($_bo_ReturnProcessIDto; $_Ptr_DisplayTable)
	C_TEXT:C284($_t_Context; $_t_MenuItemParameter; $_t_oldMethodName; $_t_TableName; $_t_TableName2; $1; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBI_MenuSelectRecords")
$_bo_EditInTransaction:=False:C215
$_bo_HideModuleBar:=False:C215
$_bo_DataEditing:=True:C214  //(add records modify records-option to preven if window is selection only)
$_bo_ReturnSelectRecords:=False:C215
$_bo_FIltersAvailable:=True:C214
$_bo_SelectionsAvailable:=True:C214
$_bo_SubselectionsAvailable:=True:C214
$_bo_SearchesAvailable:=True:C214
$_bo_TabsAvailable:=True:C214
$_bo_StatsAvailable:=False:C215
$_bo_GraphsAvailable:=False:C215
$_t_Context:=""
$_bo_ReturnProcessID:=False:C215

If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_bo_NoHideModule:=True:C214
	If (<>MENU_l_BarModule>0)
		ModuleNumber:=<>MENU_l_BarModule
	End if 
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_l_DisplayRecordsTable:=Num:C11($_t_MenuItemParameter)
If ($_l_DisplayRecordsTable>10000)
	//This section here for handling calls direct from the menu
	//where we want to use a context, the table number is added to by 10000 for each context
	//the context has to be interpreted here
	$_l_offset:=$_l_DisplayRecordsTable
	$_l_Offsets:=0
	Repeat 
		$_l_Offsets:=$_l_Offsets+1
		$_l_DisplayRecordsTable:=$_l_DisplayRecordsTable-10000
	Until ($_l_DisplayRecordsTable<1000)
	Case of 
		: ($_l_DisplayRecordsTable=Table:C252(->[ORDERS:24]))
			//no offset means new order
			Case of 
				: ($_l_Offsets=1)  //Enquiries
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
						$_t_Context:=<>SYS_at_RecStateCodes{24}{1}
					End if 
				: ($_l_Offsets=2)  //quotations
					If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
						$_t_Context:=<>SYS_at_RecStateCodes{24}{2}
					End if 
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[PURCHASE_INVOICES:37]))
			//no offset means PI
			Case of 
				: ($_l_Offsets=1)  //Credit notes
					$_t_Context:="CreditNote"
				: ($_l_Offsets=2)  //prepayments
					$_t_Context:="Prepayment"
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[INVOICES:39]))
			Case of 
				: ($_l_Offsets=1)  //Credit note
					$_t_Context:="Credit Note"
				: ($_l_Offsets=2)  //deposit
					$_t_Context:="Deposit"
			End case 
		: ($_l_DisplayRecordsTable=Table:C252(->[STOCK_MOVEMENTS:40]))
			Case of 
				: ($_l_Offsets=1)  //Credit note
					$_t_Context:="Assembly"
				: ($_l_Offsets=2)  //deposit
					$_t_Context:="Dissasembly"
			End case 
			
		: ($_l_DisplayRecordsTable=Table:C252(->[DOCUMENTS:7]))
			Case of 
				: ($_l_Offsets=1)  //Credit note
					$_t_Context:="Assembly"
				: ($_l_Offsets=2)  //deposit
					$_t_Context:="Dissasembly"
			End case 
			
			
	End case 
	
	
End if 
If ($_l_DisplayRecordsTable=0)  //``
	$_t_TableName:=$_t_MenuItemParameter
	$_l_TableNUmberRow:=DB_GetTableNumFromNameString($_t_TableName)
	If ($_l_TableNUmberRow<0)
		If (Position:C15(" "; $_t_TableName)>0)
			$_t_TableName2:=Replace string:C233($_t_TableName; " "; "_")
			$_l_TableNUmberRow:=DB_GetTableNumFromNameString($_t_TableName2)
		End if 
	End if 
	
	If ($_l_TableNUmberRow<0)
		//this should not happen as only invisible tables are not included
		$_l_LastTableNumber:=Get last table number:C254
		For ($_l_Index; 1; $_l_LastTableNumber; 1)
			If (Is table number valid:C999($_l_Index))
				If (Table name:C256($_l_Index)=$_t_TableName)
					$_l_DisplayRecordsTable:=$_l_Index
					$_l_Index:=$_l_LastTableNumber
				End if 
			End if 
		End for 
	Else 
		$_l_DisplayRecordsTable:=<>DB_al_TableNums{$_l_TableNUmberRow}
	End if 
	
End if 
If ($_l_DisplayRecordsTable=0)
	Gen_Alert($_t_MenuItemParameter+" was not understood")
Else 
	$_Ptr_DisplayTable:=Table:C252($_l_DisplayRecordsTable)
	If (Count parameters:C259>=2)
		$_bo_NewProcess:=$2
	Else 
		$_bo_NewProcess:=True:C214
	End if 
	COPY NAMED SELECTION:C331($_Ptr_DisplayTable->; "◊Selselection")
	$DB_l_ViewType:=1
	$_bo_TabsAvailable:=False:C215
	$_bo_HideModuleBar:=True:C214
	$_bo_SearchesAvailable:=False:C215
	$_bo_StatsAvailable:=False:C215
	$_bo_GraphsAvailable:=False:C215
	$_bo_FIltersAvailable:=False:C215
	$_bo_SelectionsAvailable:=False:C215
	$_l_Module:=0
	$_bo_EditInTransaction:=False:C215
	$_bo_ReturnSelectRecords:=True:C214
	$_t_Context:="Select Records"
	
	
	If ($_bo_NewProcess)
		$_l_Process:=New process:C317("DBI_DisplayRecords"; 1024000; "Select "+Table name:C256($_Ptr_DisplayTable); $_l_DisplayRecordsTable; "◊Selselection"; $_t_Context; $DB_l_ViewType; $_bo_TabsAvailable; $_bo_HideModuleBar; $_bo_SearchesAvailable; Current process:C322; $_bo_StatsAvailable; $_bo_GraphsAvailable; $_bo_FIltersAvailable; $_bo_SelectionsAvailable; $_l_Module; $_bo_EditInTransaction; $_bo_ReturnSelectRecords; True:C214)
		While (Process state:C330($_l_Process)>=0)
			DelayTicks(60)
			If ($_l_Process#Frontmost process:C327)
				BRING TO FRONT:C326($_l_Process)
			End if 
		End while 
		USE NAMED SELECTION:C332("◊Selselection")
		
	Else 
		DBI_DisplayRecords($_l_DisplayRecordsTable; "◊Selselection"; $_t_Context; $DB_l_ViewType; $_bo_TabsAvailable; $_bo_HideModuleBar; $_bo_SearchesAvailable; Current process:C322; $_bo_StatsAvailable; $_bo_GraphsAvailable; $_bo_FIltersAvailable; $_bo_SelectionsAvailable; $_l_Module; $_bo_EditInTransaction; $_bo_ReturnSelectRecords; True:C214)
		
	End if 
End if 
ERR_MethodTrackerReturn("DBI_MenuSelectRecords"; $_t_oldMethodName)
