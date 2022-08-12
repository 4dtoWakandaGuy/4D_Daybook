//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/09/2010 22:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_OrderInvoicesIndex; 0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_InvoiceRow; $_l_InvoicesIndex; $_l_MenuSelected; $_l_TableNumber; $1; $2; SD_l_CompanionMenuTable; SD3_l_CallActionNum)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; <>JobCode; <>ProdCode; $_t_oldMethodName; SD3_t_DiaryRelatedRecord)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs MenV")
$_l_MenuSelected:=Sel_LPmi("Jobs MenV")
DB_SaveRecord(->[JOBS:26])
AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
DB_SaveRecord(->[JOB_STAGES:47])
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
<>CompCode:=[JOBS:26]Company_Code:3
<>ContCode:=[JOBS:26]Contact_Code:4
<>ProdCode:=[ORDER_ITEMS:25]Product_Code:2
<>JobCode:=[JOBS:26]Job_Code:1
<>DB_bo_AutoOut:=False:C215
<>AutoFind:=True:C214
<>AutoProc:=Current process:C322
<>AutoFile:="Jobs"
SD3_t_DiaryRelatedRecord:=[JOBS:26]Job_Code:1
SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
Case of 
	: ($_l_MenuSelected=1)
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
		//DBI_MenuDisplayRecords ("Companies";Module_JobCosting ;"";->[JOBS]Company Code)
		DBI_DisplayRecord(Current process:C322; $_l_TableNumber; ""; [JOBS:26]Company_Code:3)
		
	: ($_l_MenuSelected=2)
		//DBI_MenuDisplayRecords ("Contacts";Module_JobCosting ;"";->[JOBS]Contact Code)
		DBI_DisplayRecord(Current process:C322; Table:C252(->[CONTACTS:1]); ""; [JOBS:26]Contact_Code:4)
		
	: ($_l_MenuSelected=3)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[DIARY:12])); Module_JobCosting; ""; ->[DIARY:12]Job_Code:19; [JOBS:26]Job_Code:1)
		
	: ($_l_MenuSelected=4)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])); Module_JobCosting; ""; ->[ORDER_ITEMS:25]Job_Code:34; [JOBS:26]Job_Code:1)
		//ZProducts_Mod ([ORDER ITEMS]Product Code)
	: ($_l_MenuSelected=5)
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
		QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Invoice_Number:10#"")
		SELECTION TO ARRAY:C260([JOB_STAGES:47]Invoice_Number:10; $_at_InvoiceNumbers)
		
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A"; *)
		QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]State:46=""; *)
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17#"")
		OrderI_Level0
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Invoice_Number:17; $_at_OrderInvoicesIndex)
		For ($_l_InvoicesIndex; 1; Size of array:C274($_at_OrderInvoicesIndex))
			$_l_InvoiceRow:=Find in array:C230($_at_InvoiceNumbers; $_at_OrderInvoicesIndex{$_l_InvoicesIndex})
			If ($_l_InvoiceRow<0)
				APPEND TO ARRAY:C911($_at_InvoiceNumbers; $_at_OrderInvoicesIndex{$_l_InvoicesIndex})
			End if 
		End for 
		QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
		COPY NAMED SELECTION:C331([INVOICES:39]; "CurrentInvoices")
		If (Records in selection:C76([INVOICES:39])>0)
			
			
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES:39])); Module_JobCosting; "CurrentInvoices")
		End if 
		
End case 
ERR_MethodTrackerReturn("Jobs MenV"; $_t_oldMethodName)