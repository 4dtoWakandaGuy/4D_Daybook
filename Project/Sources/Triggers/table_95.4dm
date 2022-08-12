
If (False:C215)
	//Table Name:      Trigger on [LIST_ITEMS]
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
	C_BOOLEAN:C305(<>SYS_bo_inTrigger; DB_bo_InLists)
	C_LONGINT:C283($_l_event; $_l_Process; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_processName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [LIST_ITEMS]")

DB_bo_InLists:=True:C214

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
C_TEXT:C284($_t_processName)
C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime)
C_TEXT:C284($_t_oldMethodName)

Case of 
		
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [LIST_ITEMS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([LIST_ITEMS:95]X_ID:3=0)
				
				[LIST_ITEMS:95]X_ID:3:=AA_GetNextID(->[LIST_ITEMS:95]X_ID:3)
			End if 
			If (False:C215)
				$_l_ProcessNumber:=Process number:C372("UpdateListVersion"+String:C10([LIST_ITEMS:95]X_ListID:4))
				If ($_l_ProcessNumber#0)
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessState<0)
						$_l_ProcessNumber:=0
					End if 
				End if 
				If ($_l_ProcessNumber=0)
					$_l_Process:=New process:C317("AA_UpdateListVersion"; DB_ProcessMemoryinit(1); "UpdateListVersion"+String:C10([LIST_ITEMS:95]X_ListID:4); [LIST_ITEMS:95]X_ListID:4)
				End if 
			End if 
			
			AUTO_AUDIT(->[LIST_ITEMS:95]; Field:C253(->[LIST_ITEMS:95]List_Name:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [LIST_ITEMS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([LIST_ITEMS:95]X_ID:3=0)
				
				[LIST_ITEMS:95]X_ID:3:=AA_GetNextID(->[LIST_ITEMS:95]X_ID:3)
			End if 
			If (False:C215)
				$_l_ProcessNumber:=Process number:C372("UpdateListVersion"+String:C10([LIST_ITEMS:95]X_ListID:4))
				If ($_l_ProcessNumber#0)
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessState<0)
						$_l_ProcessNumber:=0
					End if 
				End if 
				If ($_l_ProcessNumber=0)
					$_l_Process:=New process:C317("AA_UpdateListVersion"; DB_ProcessMemoryinit(1); "UpdateListVersion"+String:C10([LIST_ITEMS:95]X_ListID:4); [LIST_ITEMS:95]X_ListID:4)
				End if 
			End if 
			If ([LIST_ITEMS:95]List_Entry:2#Old:C35([LIST_ITEMS:95]List_Entry:2))
				ProcessServices_CreateRecord(->[LIST_ITEMS:95]; ->[LIST_ITEMS:95]X_ID:3; "Update Related")  // 16/04/02 pb
			End if 
			
			AUTO_AUDIT(->[LIST_ITEMS:95]; Field:C253(->[LIST_ITEMS:95]List_Name:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [LIST_ITEMS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[LIST_ITEMS:95]; Field:C253(->[LIST_ITEMS:95]List_Name:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If (False:C215)
				$_l_ProcessNumber:=Process number:C372("UpdateListVersion"+String:C10([LIST_ITEMS:95]X_ListID:4))
				If ($_l_ProcessNumber#0)
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessState<0)
						$_l_ProcessNumber:=0
					End if 
				End if 
				If ($_l_ProcessNumber=0)
					$_l_Process:=New process:C317("AA_UpdateListVersion"; DB_ProcessMemoryinit(1); "UpdateListVersion"+String:C10([LIST_ITEMS:95]X_ListID:4); [LIST_ITEMS:95]X_ListID:4)
				End if 
			End if 
		End if 
End case 
DB_bo_InLists:=False:C215
ERR_MethodTrackerReturn("TRIGGER [LIST_ITEMS]"; $_t_oldMethodName)
