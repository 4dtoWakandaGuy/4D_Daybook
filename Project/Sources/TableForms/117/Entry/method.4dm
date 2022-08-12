If (False:C215)
	//Table Form Method Name: [EW_ExportProjects]Entry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_FormEvent; $i)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [EW_ExportProjects].Entry"; Form event code:C388)


Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		WS_AutoscreenSize(1; 375; 700; Table name:C256(->[EW_ExportProjects:117])+"_"+"Entry")
		
		OpenHelp(Table:C252(->[EW_ExportProjects:117]); "Entry")
		EW_EntryBefore
End case 
ERR_MethodTrackerReturn("FM [EW_ExportProjects].Entry"; $_t_oldMethodName)
