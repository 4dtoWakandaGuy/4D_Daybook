//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_SVCF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Table; vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_SVCF")
//Companies_SVCF - Cross File searches

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=1)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS_COMPANIES:145]; ->[CONTACTS_COMPANIES:145]Company_Code:1)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
		QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
	: ($_l_TableNumber=55)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[INFORMATION:55]Company_Code:7)
	: ($_l_TableNumber=12)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[DIARY:12]Company_Code:1)
	: ($_l_TableNumber=24)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[ORDERS:24]Company_Code:1)
	: ($_l_TableNumber=25)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; ->[ORDERS:24]; ->[ORDERS:24]Company_Code:1)
		Project_SelFast(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; $_ptr_Table; ->[ORDER_ITEMS:25]Order_Code:1)
	: ($_l_TableNumber=57)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[PURCHASE_ORDERS:57]Company_Code:1)
	: ($_l_TableNumber=39)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[INVOICES:39]Company_Code:2)
	: ($_l_TableNumber=20)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[SERVICE_CALLS:20]Company_Code:1)
	: ($_l_TableNumber=37)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[PURCHASE_INVOICES:37]Company_Code:2)
	: ($_l_TableNumber=29)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[TRANSACTIONS:29]Company_Code:9)
	: ($_l_TableNumber=26)
		Project_SelFast(vFilePtr; ->[COMPANIES:2]Company_Code:1; $_ptr_Table; ->[JOBS:26]Company_Code:3)
		
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Companies_SVCF"; $_t_oldMethodName)
