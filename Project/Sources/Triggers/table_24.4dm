
If (False:C215)
	//Table Name:      Trigger on [ORDERS]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/05/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>CB_SP_Events)
	C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded; $_bo_Run)
	C_LONGINT:C283(<>CB_SP_Orders; $_l_event; $_l_Retries; $_l_TableNumber; $0; $_l_Number)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:ORDERS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDERS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDERS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[ORDERS:24]Order_Code:3; 0)
			Case of 
				: ([ORDERS:24]Order_Date:4#!00-00-00!)
					[ORDERS:24]SORT_Date:57:=[ORDERS:24]Order_Date:4
				: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
					[ORDERS:24]SORT_Date:57:=[ORDERS:24]Quotation_Date:26
				Else 
					[ORDERS:24]SORT_Date:57:=[ORDERS:24]Enquiry_Date:25
			End case 
			AUTO_AUDIT(->[ORDERS:24]; Field:C253(->[ORDERS:24]Order_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([ORDERS:24]x_ID:58=0)
				If ([ORDERS:24]Order_Code:3#"")
					[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
				End if 
			End if 
			C_LONGINT:C283($_l_TableNumber; <>CB_SP_Orders)
			$_l_TableNumber:=Table:C252(->[ORDERS:24])
			
			C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded)
			$_bo_Run:=False:C215
			$_l_Retries:=0
			While (Test semaphore:C652("PipelineLoad"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Events=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Pipeline Update")  // 16/04/02 pb
			End if 
		End if 
		
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDERS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[ORDERS:24]Order_Code:3; 1)
			Case of 
				: ([ORDERS:24]Order_Date:4#!00-00-00!)
					[ORDERS:24]SORT_Date:57:=[ORDERS:24]Order_Date:4
				: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
					[ORDERS:24]SORT_Date:57:=[ORDERS:24]Quotation_Date:26
				Else 
					[ORDERS:24]SORT_Date:57:=[ORDERS:24]Enquiry_Date:25
			End case 
			AUTO_AUDIT(->[ORDERS:24]; Field:C253(->[ORDERS:24]Order_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([ORDERS:24]x_ID:58=0)
				[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
			End if 
			$_l_TableNumber:=Table:C252(->[ORDERS:24])
			
			C_LONGINT:C283($_l_TableNumber; <>CB_SP_Orders)
			$_l_TableNumber:=Table:C252(->[ORDERS:24])
			
			C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded)
			$_bo_Run:=False:C215
			$_l_Retries:=0
			While (Test semaphore:C652("PipelineLoad"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Events=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Pipeline Update")  // 16/04/02 pb
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ORDERS]"; $_l_event)
		//If (DB_TableTriggerEnabled )
		
		AUTO_AUDIT_DEL(->[ORDERS:24]; Field:C253(->[ORDERS:24]Order_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		//End if
		
End case 
ERR_MethodTrackerReturn("TRIGGER [ORDERS]"; $_t_oldMethodName)
