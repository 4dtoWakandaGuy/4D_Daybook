If (False:C215)
	//object Name: [INVOICES]Invoices_AD.Variable25
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vTot; vTot0; vTotP0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_AD.Variable25"; Form event code:C388)
vTotP0:=Round:C94((vTot0/vTot*100); 2)
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_AD.Variable25"; $_t_oldMethodName)