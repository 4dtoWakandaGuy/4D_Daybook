If (False:C215)
	//object Name: Object Name:      CON_ContSel.Variable22
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
	C_BOOLEAN:C305(<>NoContTit)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable22")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CON_ContSel.Variable22"; Form event code:C388)
If (<>NoContTit=False:C215)
	Check_Lists(->vTitle; "Titles")
End if 
ERR_MethodTrackerReturn("OBJ CON_ContSel.Variable22"; $_t_oldMethodName)
