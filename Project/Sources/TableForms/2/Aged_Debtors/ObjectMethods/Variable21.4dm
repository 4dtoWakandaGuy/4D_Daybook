If (False:C215)
	//object Name: [COMPANIES]Aged Debtors.Variable21
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vTot; vTot91; vTotP91)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Aged Debtors.Variable21"; Form event code:C388)
vTotP91:=Round:C94((vTot91/vTot*100); 2)
ERR_MethodTrackerReturn("OBJ [COMPANIES].Aged Debtors.Variable21"; $_t_oldMethodName)