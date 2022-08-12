If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Radio Button1
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
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Radio Button1"; Form event code:C388)
If (r1=1)
	[EW_ExportProjects:117]IncludeParentRecordData:13:=True:C214
	[EW_ExportProjects:117]ExportToSeparatefiles:14:=False:C215
Else 
	[EW_ExportProjects:117]IncludeParentRecordData:13:=False:C215
	[EW_ExportProjects:117]ExportToSeparatefiles:14:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Radio Button1"; $_t_oldMethodName)
