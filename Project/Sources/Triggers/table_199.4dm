If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 07/03/2014 11:26
	//Method Name: Trigger on [Bank_Reconcile]
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [BANK_Reconcile]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([Bank_Reconcile:199]x_ID:1=0)
				[Bank_Reconcile:199]x_ID:1:=AA_GetNextID(->[Bank_Reconcile:199]x_ID:1)
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [BANK_Reconcile]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([Bank_Reconcile:199]x_ID:1=0)
				[Bank_Reconcile:199]x_ID:1:=AA_GetNextID(->[Bank_Reconcile:199]x_ID:1)
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [BANK_Reconcile]"; $_l_event)
		If (DB_TableTriggerEnabled)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER  [Bank_Reconcile]"; $_t_oldMethodName)
