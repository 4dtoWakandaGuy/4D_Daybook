If (False:C215)
	//object Name: Object Name:      CON_ContSel.Variable50
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/07/2012 11:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vSource)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable50")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable50"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vSource; ""; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Source"; "2")
End if 
ERR_MethodTrackerReturn("OBJ CON_ContSel.Variable50"; $_t_oldMethodName)