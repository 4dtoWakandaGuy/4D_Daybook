If (False:C215)
	//object Name: [SOURCES]Sources_Stats.Variable25
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
	C_REAL:C285(vT4; vTotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].Sources_Stats.Variable25"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT4:=Subtotal:C97(vTotal)
End if 
ERR_MethodTrackerReturn("OBJ [SOURCES].Sources_Stats.Variable25"; $_t_oldMethodName)
