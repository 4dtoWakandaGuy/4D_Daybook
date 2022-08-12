//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_SVCF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
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

$_t_oldMethodName:=ERR_MethodTracker("Calls_SVCF")
//Calls_SVCF

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=12)
		Project_SelFast(vFilePtr; ->[SERVICE_CALLS:20]Call_Code:4; $_ptr_Table; ->[DIARY:12]Call_Code:25)
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Calls_SVCF"; $_t_oldMethodName)