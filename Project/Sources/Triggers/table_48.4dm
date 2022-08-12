If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:JOB PERSONNEL
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB PERSONNEL]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB PERSONNEL]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([JOB PERSONNEL:48]X_ID:14=0)  //NG april 2004
				[JOB PERSONNEL:48]X_ID:14:=AA_GetNextID(->[JOB PERSONNEL:48]X_ID:14)
			End if 
			
			AUTO_AUDIT(->[JOB PERSONNEL:48]; Field:C253(->[JOB PERSONNEL:48]Job_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//*********added 28/02/07 -kmw********
			$JSPCompositeKey:=[JOB PERSONNEL:48]Job_Code:1+"*|Delim1|*"+[JOB PERSONNEL:48]Stage_Code:2+"*|Delim2|*"+[JOB PERSONNEL:48]Job_stage_Code:17
			C_BLOB:C604(JSP_blb_CompositeKey)
			SET BLOB SIZE:C606(JSP_blb_CompositeKey; 0)
			VARIABLE TO BLOB:C532($JSPCompositeKey; JSP_blb_CompositeKey)
			ProcessServices_CreateRecord(->[JOB PERSONNEL:48]; ->[JOB PERSONNEL:48]X_ID:14; "JCAddJSP"; 0; 0; 0; False:C215; ->JSP_blb_CompositeKey)  //adds Job Stage with initial total or updates pre-existing Job Stage
			//********************************
			
			If (False:C215)  //blocked out 28/02/07 -kmw
				//*********added 26/02/07 -kmw********
				//
				JC_FindJobStage
				If (Records in selection:C76([JOB_STAGES:47])>0)
					ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCUpdateJSTotals")  //sets totals to sum of lower level records
				Else 
					ProcessServices_CreateRecord(->[JOB PERSONNEL:48]; ->[JOB PERSONNEL:48]X_ID:14; "JCAddJS")  //adds record and sets initial total
					//ProcessServices_CreateRecord (->[JOB STAGES];->[JOB STAGES]x_ID;"JCUpdateJSTotals")
				End if 
				
				//********************************
			End if 
			
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB PERSONNEL]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([JOB PERSONNEL:48]X_ID:14=0)  //NG April 2004
				[JOB PERSONNEL:48]X_ID:14:=AA_GetNextID(->[JOB PERSONNEL:48]X_ID:14)
			End if 
			AUTO_AUDIT(->[JOB PERSONNEL:48]; Field:C253(->[JOB PERSONNEL:48]Job_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//*********added 28/02/07 -kmw********
			$JSPCompositeKey:=[JOB PERSONNEL:48]Job_Code:1+"*|Delim1|*"+[JOB PERSONNEL:48]Stage_Code:2+"*|Delim2|*"+[JOB PERSONNEL:48]Job_stage_Code:17
			C_BLOB:C604(JSP_blb_CompositeKey)
			SET BLOB SIZE:C606(JSP_blb_CompositeKey; 0)
			VARIABLE TO BLOB:C532($JSPCompositeKey; JSP_blb_CompositeKey)
			ProcessServices_CreateRecord(->[JOB PERSONNEL:48]; ->[JOB PERSONNEL:48]X_ID:14; "JCModJSP"; 0; 0; 0; False:C215; ->JSP_blb_CompositeKey)  //adds Job Stage with initial total or updates pre-existing Job Stage
			//********************************
			
			If (False:C215)  //blocked out 28/02/07 -kmw
				//*********added 26/02/07 -kmw********
				//
				JC_FindJobStage
				If (Records in selection:C76([JOB_STAGES:47])>0)
					ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCUpdateJSTotals")  //sets totals to sum of lower level records
				Else 
					ProcessServices_CreateRecord(->[JOB PERSONNEL:48]; ->[JOB PERSONNEL:48]X_ID:14; "JCAddJS")  //adds record and sets initial total
					//ProcessServices_CreateRecord (->[JOB STAGES];->[JOB STAGES]x_ID;"JCUpdateJSTotals")
				End if 
				
				//********************************
			End if 
			
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOB PERSONNEL]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[JOB PERSONNEL:48]; Field:C253(->[JOB PERSONNEL:48]Job_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			//*********added 28/02/07 -kmw********
			$JSPCompositeKey:=[JOB PERSONNEL:48]Job_Code:1+"*|Delim1|*"+[JOB PERSONNEL:48]Stage_Code:2+"*|Delim2|*"+[JOB PERSONNEL:48]Job_stage_Code:17
			C_BLOB:C604(JSP_blb_CompositeKey)
			SET BLOB SIZE:C606(JSP_blb_CompositeKey; 0)
			VARIABLE TO BLOB:C532($JSPCompositeKey; JSP_blb_CompositeKey)
			ProcessServices_CreateRecord(->[JOB PERSONNEL:48]; ->[JOB PERSONNEL:48]X_ID:14; "JCDelJSP"; 0; 0; 0; False:C215; ->JSP_blb_CompositeKey)  //updates pre-existing Job Stage (if any)
			//********************************
			
			If (False:C215)  //blocked out 28/02/07 -kmw
				//*********added 26/02/07 -kmw********
				//
				JC_FindJobStage
				If (Records in selection:C76([JOB_STAGES:47])>0)
					ProcessServices_CreateRecord(->[JOB_STAGES:47]; ->[JOB_STAGES:47]x_ID:54; "JCUpdateJSTotals")  //sets totals to sum of lower level records
				End if 
				
				//********************************
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [JOB PERSONNEL]"; $_t_oldMethodName)
