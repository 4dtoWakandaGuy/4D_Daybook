//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices SVCF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2009 10:05
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices SVCF")
//Invoices SVCF

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=29)
		Project_SelFast(vFilePtr; ->[INVOICES:39]Invoice_Number:1; $_ptr_Table; ->[TRANSACTIONS:29]Invoice_Number:4)
		
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Invoices SVCF"; $_t_oldMethodName)