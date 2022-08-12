//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_SVCF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:14:43If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Table; vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_SVCF")
//Contacts_SVCF

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=2)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Company_Code:1; $_ptr_Table; ->[COMPANIES:2]Company_Code:1)
	: ($_l_TableNumber=55)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Contact_Code:2; $_ptr_Table; ->[INFORMATION:55]Contact_Code:1)
	: ($_l_TableNumber=12)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Contact_Code:2; $_ptr_Table; ->[DIARY:12]Contact_Code:2)
	: ($_l_TableNumber=24)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Contact_Code:2; $_ptr_Table; ->[ORDERS:24]Contact_Code:2)
	: ($_l_TableNumber=25)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Contact_Code:2; ->[ORDERS:24]; ->[ORDERS:24]Contact_Code:2)
		Project_SelFast(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; $_ptr_Table; ->[ORDER_ITEMS:25]Order_Code:1)
	: ($_l_TableNumber=39)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Contact_Code:2; $_ptr_Table; ->[INVOICES:39]Contact_Code:3)
	: ($_l_TableNumber=20)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Contact_Code:2; $_ptr_Table; ->[SERVICE_CALLS:20]Contact_Code:2)
	: ($_l_TableNumber=26)
		Project_SelFast(vFilePtr; ->[CONTACTS:1]Contact_Code:2; $_ptr_Table; ->[JOBS:26]Contact_Code:4)
		
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Contacts_SVCF"; $_t_oldMethodName)