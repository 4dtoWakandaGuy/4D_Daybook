If (False:C215)
	//object Name: Object Name:      CON_ContSel.Variable51
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
	C_TEXT:C284($_t_oldMethodName; vArea)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable51")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable51"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vArea; ""; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Area")
End if 
ERR_MethodTrackerReturn("OBJ CON_ContSel.Variable51"; $_t_oldMethodName)
