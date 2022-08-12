
If (False:C215)
	//Table Name:      Trigger on [STOCK_MOVEMENTS]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BLOB:C604(SS_Bl_PackData)
	C_LONGINT:C283($_l_triggerEvent; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; STOCK_t_CalledBy)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:STOCK_MOVEMENTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_MOVEMENTS]")



$0:=0
$_l_triggerEvent:=Trigger event:C369



Case of 
		
		
	: ($_l_triggerEvent=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_MOVEMENTS]"; $_l_triggerEvent)
		If (DB_TableTriggerEnabled)
			If ([STOCK_MOVEMENTS:40]x_ID:22=0)
				[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
			End if 
			NaNFixer
			db_CheckMyUnique(->[STOCK_MOVEMENTS:40]Movement_Code:1; 0)
			
			AUTO_AUDIT(->[STOCK_MOVEMENTS:40]; Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			
		End if 
		
	: ($_l_triggerEvent=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_MOVEMENTS]"; $_l_triggerEvent)
		If (DB_TableTriggerEnabled)
			If ([STOCK_MOVEMENTS:40]x_ID:22=0)
				[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
			End if 
			NaNFixer
			db_CheckMyUnique(->[STOCK_MOVEMENTS:40]Movement_Code:1; 1)
			
			AUTO_AUDIT(->[STOCK_MOVEMENTS:40]; Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
		End if 
		
	: ($_l_triggerEvent=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STOCK_MOVEMENTS]"; $_l_triggerEvent)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[STOCK_MOVEMENTS:40]; Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 



ERR_MethodTrackerReturn("TRIGGER [STOCK_MOVEMENTS]"; $_t_oldMethodName)
