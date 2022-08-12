If (False:C215)
	//Table Form Method Name: [JOB_STAGES]JobStages_Sub
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].JobStages_Sub"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Modified record:C314([JOB_STAGES:47]))
			JobStages_LP
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOB_STAGES:47]); "JobStages_Sub")
		JobStages_SbLPB
End case 
ERR_MethodTrackerReturn("FM [JOB_STAGES].JobStages_Sub"; $_t_oldMethodName)
