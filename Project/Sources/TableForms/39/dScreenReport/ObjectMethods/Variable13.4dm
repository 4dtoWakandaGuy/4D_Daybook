If (False:C215)
	//object Name: [INVOICES]dScreenReport.Variable13
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dScreenReport.Variable13"; Form event code:C388)
Gen_ScrRepPrEx("Pr")
ERR_MethodTrackerReturn("OBJ [INVOICES].dScreenReport.Variable13"; $_t_oldMethodName)