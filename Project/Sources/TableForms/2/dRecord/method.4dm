If (False:C215)
	//Table Form Method Name: [COMPANIES]dRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 13:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_event; SCPT_but_2; SCPT_but_3; SCPT_but_4; SCPT_l_Cancel; SCPT_l_ExecutionState; SCPT_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dRecord"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SCPT_l_ExecutionState:=1
		OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
		OBJECT SET ENABLED:C1123(SCPT_but_3; True:C214)
		OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
		OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
		
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (SCPT_l_ExecutionState=3)
				CANCEL:C270
			: (SCPT_l_ExecutionState=2)
				//Paused
				OBJECT SET ENABLED:C1123(SCPT_but_2; True:C214)
				OBJECT SET ENABLED:C1123(SCPT_but_3; False:C215)
				OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
				
			: (SCPT_l_ExecutionState=1)
				OBJECT SET ENABLED:C1123(SCPT_but_2; False:C215)
				OBJECT SET ENABLED:C1123(SCPT_but_3; True:C214)
				OBJECT SET ENABLED:C1123(SCPT_but_4; True:C214)
			: (<>SYS_l_CancelProcess=SCPT_l_ParentProcess) | (<>SYS_l_CancelProcess=Current process:C322)
				SET PROCESS VARIABLE:C370(SCPT_l_ParentProcess; SCPT_l_Cancel; SCPT_l_ParentProcess)
				<>SYS_l_CancelProcess:=0
		End case 
End case 
ERR_MethodTrackerReturn("FM:dRecord"; $_t_oldMethodName)
