//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalSVCallsFile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283($_l_TableNumberRow)
	C_POINTER:C301($_ptr_Table; vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalSVCallsFile")
//ACC_BalSVCallsFile
$_l_TableNumberRow:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumberRow)
Project_SelABTr
Case of 
	: ($_l_TableNumberRow=39)
		Project_SelFast(vFilePtr; ->[TRANSACTIONS:29]Invoice_Number:4; $_ptr_Table; ->[INVOICES:39]Invoice_Number:1)
	: ($_l_TableNumberRow=37)
		Project_SelFast(vFilePtr; ->[TRANSACTIONS:29]Purchase_Code:24; $_ptr_Table; ->[PURCHASE_INVOICES:37]Purchase_Code:1)
	: ($_l_TableNumberRow=26)
		Project_SelFast(vFilePtr; ->[TRANSACTIONS:29]Job_Code:25; $_ptr_Table; ->[JOBS:26]Job_Code:1)
		
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("ACC_BalSVCallsFile"; $_t_oldMethodName)
