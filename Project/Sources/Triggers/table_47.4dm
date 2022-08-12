
If (False:C215)
	//Table Name:      Trigger on [JOB_STAGES]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/03/2022
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: NIgel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_BLOB:C604(Job_blb_JobCode)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_JobCode; $_t_oldMethodName)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:JOB_STAGES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB_STAGES]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB_STAGES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([JOB_STAGES:47]x_ID:54=0)
				If ([JOB_STAGES:47]Stage_Code:2#"")
					[JOB_STAGES:47]x_ID:54:=AA_GetNextID(->[JOB_STAGES:47]x_ID:54)
				End if 
			End if 
			
			If ([JOB_STAGES:47]Job_Stage_code:52="")
				//[JOB STAGES]Job stage code:=[JOB STAGES]Job Code+"/"+[JOB STAGES]Stage Code
				[JOB_STAGES:47]Job_Stage_code:52:=JC_GetNextUniqueJobStageCode  //altered to this 02/04/07 -kmw
			End if 
			
			AUTO_AUDIT(->[JOB_STAGES:47]; Field:C253(->[JOB_STAGES:47]Job_Stage_code:52); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//*********added 28/02/07 -kmw********
			If ([JOB_STAGES:47]Job_Code:1#"")
				$_t_JobCode:=[JOB_STAGES:47]Job_Code:1
				C_BLOB:C604(Job_blb_JobCode)
				SET BLOB SIZE:C606(Job_blb_JobCode; 0)
				VARIABLE TO BLOB:C532($_t_JobCode; Job_blb_JobCode)
				ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCAddJS"; 0; 0; 0; False:C215; ->Job_blb_JobCode)  //adds Job with initial total or updates pre-existing Job
				//********************************
			End if 
			
			If (False:C215)  //blocked out 28/02/07 -kmw
				//*********added 26/02/07 -kmw********
				//`
				JC_FindJob
				If (Records in selection:C76([JOBS:26])>0)
					ProcessServices_CreateRecord(->[JOBS:26]; ->[JOBS:26]x_ID:49; "JCUpdateJobTotals")  //sets totals to sum of lower level records
				Else 
					ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCAddJob")  //adds record and sets initial total
					//ProcessServices_CreateRecord (->[JOBS];->[JOBS]x_ID;"JCUpdateJobTotals")
				End if 
				
				//********************************
			End if 
			
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB_STAGES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([JOB_STAGES:47]x_ID:54=0)
				If ([JOB_STAGES:47]Stage_Code:2#"")
					[JOB_STAGES:47]x_ID:54:=AA_GetNextID(->[JOB_STAGES:47]x_ID:54)
				End if 
			End if 
			AUTO_AUDIT(->[JOB_STAGES:47]; Field:C253(->[JOB_STAGES:47]Job_Stage_code:52); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//*********added 28/02/07 -kmw********
			If ([JOB_STAGES:47]Job_Code:1#"")
				$_t_JobCode:=[JOB_STAGES:47]Job_Code:1
				C_BLOB:C604(Job_blb_JobCode)
				SET BLOB SIZE:C606(Job_blb_JobCode; 0)
				VARIABLE TO BLOB:C532($_t_JobCode; Job_blb_JobCode)
				ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCModJS"; 0; 0; 0; False:C215; ->Job_blb_JobCode)  //adds Job with initial total or updates pre-existing Job
			End if 
			//********************************
			
			If (False:C215)  //blocked out 28/02/07 -kmw
				//*********added 26/02/07 -kmw********
				//`
				JC_FindJob
				If (Records in selection:C76([JOBS:26])>0)
					ProcessServices_CreateRecord(->[JOBS:26]; ->[JOBS:26]x_ID:49; "JCUpdateJobTotals")  //sets totals to sum of lower level records
				Else 
					ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCAddJob")  //adds record and sets initial total
					//ProcessServices_CreateRecord (->[JOBS];->[JOBS]x_ID;"JCUpdateJobTotals")
				End if 
				
				//********************************
			End if 
			
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB_STAGES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			AUTO_AUDIT_DEL(->[JOB_STAGES:47]; Field:C253(->[JOB_STAGES:47]Job_Stage_code:52); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//*********added 28/02/07 -kmw********
			If ([JOB_STAGES:47]Job_Code:1#"")
				$_t_JobCode:=[JOB_STAGES:47]Job_Code:1
				C_BLOB:C604(Job_blb_JobCode)
				SET BLOB SIZE:C606(Job_blb_JobCode; 0)
				
				VARIABLE TO BLOB:C532($_t_JobCode; Job_blb_JobCode)
				ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCDelJS"; 0; 0; 0; False:C215; ->Job_blb_JobCode)  //adds Job with initial total or updates pre-existing Job
				//********************************
			End if 
			
			If (False:C215)  //blocked out 28/02/07 -kmw
				//*********added 26/02/07 -kmw********
				//`
				JC_FindJob
				If (Records in selection:C76([JOBS:26])>0)
					ProcessServices_CreateRecord(->[JOBS:26]; ->[JOBS:26]x_ID:49; "JCUpdateJobTotals")  //sets totals to sum of lower level records
				End if 
				
				//********************************
			End if 
			
		End if 
		
End case 

ERR_MethodTrackerReturn("TRIGGER [JOB_STAGES]"; $_t_oldMethodName)
