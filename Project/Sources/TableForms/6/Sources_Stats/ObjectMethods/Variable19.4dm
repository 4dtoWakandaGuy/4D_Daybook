If (False:C215)
	//object Name: [SOURCES]Sources_Stats.Variable19
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
	C_LONGINT:C283(vAct2; vNo2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].Sources_Stats.Variable19"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vAct2:=Subtotal:C97(vNo2)
End if 
ERR_MethodTrackerReturn("OBJ [SOURCES].Sources_Stats.Variable19"; $_t_oldMethodName)
