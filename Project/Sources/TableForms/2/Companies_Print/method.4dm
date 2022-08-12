If (False:C215)
	//Table Form Method Name: [COMPANIES]Companies_Print
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Companies_Print"; Form event code:C388)
Companies_PrLP
ERR_MethodTrackerReturn("FM [COMPANIES].Companies_Print"; $_t_oldMethodName)
