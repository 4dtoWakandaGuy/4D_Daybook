If (False:C215)
	//Table Form Method Name: [EW_ExportProjects]StaticTextBK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [EW_ExportProjects].StaticTextBK"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[EW_ExportProjects:117]); "StaticTextBK")
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [EW_ExportProjects].StaticTextBK"; $_t_oldMethodName)
