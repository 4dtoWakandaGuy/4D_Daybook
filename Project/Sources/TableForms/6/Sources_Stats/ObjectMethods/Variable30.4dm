If (False:C215)
	//object Name: [SOURCES]Sources_Stats.Variable30
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
	C_LONGINT:C283(vAct4)
	C_REAL:C285(vAmount; vStockValUA)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].Sources_Stats.Variable30"; Form event code:C388)

vStockValUA:=Round:C94((vAmount/vAct4); 2)
ERR_MethodTrackerReturn("OBJ [SOURCES].Sources_Stats.Variable30"; $_t_oldMethodName)