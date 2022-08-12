If (False:C215)
	//object Name: [SOURCES]Sources_Stats.Variable17
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
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].Sources_Stats.Variable17"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vQuantity:=Subtotal:C97([SOURCES:6]Target_Leads:11)
End if 
ERR_MethodTrackerReturn("OBJ [SOURCES].Sources_Stats.Variable17"; $_t_oldMethodName)
