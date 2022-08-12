//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_SVCF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:44:01If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Diary_SVCF")
//Diary_SVCF - Cross File searches

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=2)
		Join_SelFast(vFilePtr; ->[DIARY:12]Company_Code:1; $_ptr_Table; ->[COMPANIES:2]Company_Code:1)
	: ($_l_TableNumber=1)
		Join_SelFast(vFilePtr; ->[DIARY:12]Contact_Code:2; $_ptr_Table; ->[CONTACTS:1]Contact_Code:2)
	: ($_l_TableNumber=24)
		Join_SelFast(vFilePtr; ->[DIARY:12]Order_Code:26; $_ptr_Table; ->[ORDERS:24]Order_Code:3)
	: ($_l_TableNumber=20)
		Join_SelFast(vFilePtr; ->[DIARY:12]Call_Code:25; $_ptr_Table; ->[SERVICE_CALLS:20]Call_Code:4)
	: ($_l_TableNumber=26)
		Join_SelFast(vFilePtr; ->[DIARY:12]Job_Code:19; $_ptr_Table; ->[JOBS:26]Job_Code:1)
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("Diary_SVCF"; $_t_oldMethodName)