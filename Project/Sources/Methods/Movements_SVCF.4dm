//%attributes = {}
If (False:C215)
	//Project Method Name:      Movements_SVCF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("Movements_SVCF")
//Movements_SVCF

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=27)
		Project_SelFast(vFilePtr; ->[STOCK_MOVEMENTS:40]Movement_Code:1; $_ptr_Table; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Movements_SVCF"; $_t_oldMethodName)
