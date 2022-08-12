//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages SVCF
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

$_t_oldMethodName:=ERR_MethodTracker("JobStages SVCF")
//JobStages SVCF

$_l_TableNumber:=SV_al_TableNumber{DB_at_TableName}
MESSAGES OFF:C175
COPY NAMED SELECTION:C331(vFilePtr->; "Select")
$_ptr_Table:=Table:C252($_l_TableNumber)
Case of 
	: ($_l_TableNumber=48)
		Project_Sel2Fld(vFilePtr; ->[JOB_STAGES:47]Job_Code:1; $_ptr_Table; ->[JOB PERSONNEL:48]Job_Code:1; ->[JOB_STAGES:47]Stage_Code:2; ->[JOB PERSONNEL:48]Stage_Code:2)
	: ($_l_TableNumber=25)
		Project_Sel2Fld(vFilePtr; ->[JOB_STAGES:47]Job_Code:1; $_ptr_Table; ->[ORDER_ITEMS:25]Job_Code:34; ->[JOB_STAGES:47]Stage_Code:2; ->[ORDER_ITEMS:25]Job_Stage:35)
End case 
StatsView_CFEnd($_ptr_Table)
ERR_MethodTrackerReturn("JobStages SVCF"; $_t_oldMethodName)