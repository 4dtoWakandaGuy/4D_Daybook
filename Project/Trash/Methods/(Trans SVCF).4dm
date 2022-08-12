//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SVCF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 11:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(DB_at_TableName;0)
	//Array LONGINT(SV_al_TableNumber;0)
	C_LONGINT:C283($_l_Table2; $_l_TableNumber; $2)
	C_POINTER:C301($_ptr_Table; $_Ptr_Table1; $1; vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SVCF")
//Trans_SVCF
If (Count parameters:C259>=1)
	$_Ptr_Table1:=$1
Else 
	$_Ptr_Table1:=vFilePtr
End if 
If (Count parameters:C259>=2)
	$_l_Table2:=$2
Else 
	$_l_Table2:=DB_at_TableName
End if 
$_l_TableNumber:=SV_al_TableNumber{$_l_Table2}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331($_Ptr_Table1->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=39)
		Project_SelFast($_Ptr_Table1; ->[TRANSACTIONS:29]Invoice_Number:4; $_ptr_Table; ->[INVOICES:39]Invoice_Number:1)
	: ($_l_TableNumber=37)
		Project_SelFast($_Ptr_Table1; ->[TRANSACTIONS:29]Purchase_Code:24; $_ptr_Table; ->[PURCHASE_INVOICES:37]Purchase_Code:1)
	: ($_l_TableNumber=26)
		Project_SelFast($_Ptr_Table1; ->[TRANSACTIONS:29]Job_Code:25; $_ptr_Table; ->[JOBS:26]Job_Code:1)
		
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Trans_SVCF"; $_t_oldMethodName)