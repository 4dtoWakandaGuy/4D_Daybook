If (False:C215)
	//object Name: Object Name:      CON_ContSel.Variable49
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
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable49")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable49"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vType; ""; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; "Type"; "2")
End if 
ERR_MethodTrackerReturn("OBJ CON_ContSel.Variable49"; $_t_oldMethodName)
