If (False:C215)
	//object Name: [SOURCES]Sources_Stats.Variable24
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vDue; vT3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].Sources_Stats.Variable24"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT3:=Subtotal:C97(vDue)
End if 
ERR_MethodTrackerReturn("OBJ [SOURCES].Sources_Stats.Variable24"; $_t_oldMethodName)
