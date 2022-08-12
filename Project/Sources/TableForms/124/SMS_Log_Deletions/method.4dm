If (False:C215)
	//Table Form Method Name: [SMS_Log]SMS_Log_Deletions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(as20DeletePeriods;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SMS_Log].SMS_Log_Deletions"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SMS_Log:124]); "SMS_Log_Deletions")
		ARRAY TEXT:C222(SMS_at_DeletePeriods; 5)
		SMS_at_DeletePeriods{1}:="over one week old"
		SMS_at_DeletePeriods{2}:="over one month old"
		SMS_at_DeletePeriods{3}:="over six months old"
		SMS_at_DeletePeriods{4}:="over one year old"
		SMS_at_DeletePeriods{5}:="All records"
		SMS_at_DeletePeriods:=1
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM [SMS_Log].SMS_Log_Deletions"; $_t_oldMethodName)
