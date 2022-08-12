If (False:C215)
	//object Name: [SOURCES]Sources_Stats.Variable29
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
	C_LONGINT:C283(vAct1; vAct2; vAct3)
	C_REAL:C285(vAmount; vStockVal)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [SOURCES].Sources_Stats.Variable29"; Form event code:C388)

vStockVal:=Round:C94((vAmount/(vAct1+vAct2+vAct3)); 2)
ERR_MethodTrackerReturn("OBJ [SOURCES].Sources_Stats.Variable29"; $_t_oldMethodName)