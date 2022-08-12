If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Auto10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Path)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Auto10"; Form event code:C388)
$_t_Path:=""
$_t_Path:=DB_SelectFolder("Select the export file folder:")
If ($_t_Path#"")
	[EW_ExportProjects:117]ExportFolderName:9:=$_t_Path
End if 
ERR_MethodTrackerReturn("OBJ:Entry,bChoose"; $_t_oldMethodName)
