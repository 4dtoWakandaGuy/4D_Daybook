//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ManageProjects
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 14:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; EW_l_ExportProjectTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ManageProjects")
If (Count parameters:C259>=1)
	EW_l_ExportProjectTable:=$1
	Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 1)
	DIALOG:C40("EW_ExportProjectsManager")
	
End if 
ERR_MethodTrackerReturn("EW_ManageProjects"; $_t_oldMethodName)