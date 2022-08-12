
If (False:C215)
	//Table Name:      Trigger on [DOCUMENTS]
	//------------------ Trigger Notes ------------------
	If (False:C215)  // ----------------------------------------------------
		//Creator: Nigel Greenlee
		//Date & time: 30/09/2013 19:02
		//Method Name: Trigger:DOCUMENTS
		//Description
		
		//Parameters
		//Declarations
		// ----------------------------------------------------
		//Project method Amendments
		
		//End Project method Amendments
	End if 
	
	//------------------ Revision Control ----------------
	//Date Created:  19/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Clash; $_l_TriggerEvent; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DOCUMENTS]")



$0:=0

$_l_TriggerEvent:=Trigger event:C369

Case of 
		
	: ($_l_TriggerEvent=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DOCUMENTS]"; $_l_TriggerEvent)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			AUTO_AUDIT(->[DOCUMENTS:7]; Field:C253(->[DOCUMENTS:7]Document_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_TriggerEvent=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DOCUMENTS]"; $_l_TriggerEvent)
		If (DB_TableTriggerEnabled)
			
			AUTO_AUDIT(->[DOCUMENTS:7]; Field:C253(->[DOCUMENTS:7]Document_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_TriggerEvent=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DOCUMENTS]"; $_l_TriggerEvent)
		If (DB_TableTriggerEnabled)
			
			AUTO_AUDIT_DEL(->[DOCUMENTS:7]; Field:C253(->[DOCUMENTS:7]Document_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [DOCUMENTS]"; $_t_oldMethodName)
