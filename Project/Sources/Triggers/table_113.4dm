
If (False:C215)
	//Table Name:      Trigger on [SALES_PROJECTION]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_Process; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SALES_PROJECTION]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SALES_PROJECTION]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			AUTO_AUDIT(->[SALES_PROJECTION:113]; Field:C253(->[SALES_PROJECTION:113]x_ID:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([SALES_PROJECTION:113]x_ID:1=0)
				[SALES_PROJECTION:113]x_ID:1:=AA_GetNextID(->[SALES_PROJECTION:113]x_ID:1)
			End if 
			If ([SALES_PROJECTION:113]Forcast_LevelID:3<=1)
				$_l_Process:=New process:C317("SP_UpdateDiary"; DB_ProcessMemoryinit(1); "Sales Pipeline Diary"; [SALES_PROJECTION:113]x_ID:1; [SALES_PROJECTION:113]RelatedDiaryID:27)
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SALES_PROJECTION]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			AUTO_AUDIT(->[SALES_PROJECTION:113]; Field:C253(->[SALES_PROJECTION:113]x_ID:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([SALES_PROJECTION:113]x_ID:1=0)
				[SALES_PROJECTION:113]x_ID:1:=AA_GetNextID(->[SALES_PROJECTION:113]x_ID:1)
			End if 
			If ([SALES_PROJECTION:113]Forcast_LevelID:3<=1)
				$_l_Process:=New process:C317("SP_UpdateDiary"; DB_ProcessMemoryinit(1); "Sales Pipeline Diary"; [SALES_PROJECTION:113]x_ID:1; [SALES_PROJECTION:113]RelatedDiaryID:27)
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SALES_PROJECTION]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[SALES_PROJECTION:113]; Field:C253(->[SALES_PROJECTION:113]x_ID:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [SALES_PROJECTION]"; $_t_oldMethodName)
