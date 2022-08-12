If (False:C215)
	//Table Form Method Name: [COMPANIES]Statement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
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


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Statement"; Form event code:C388)
If (On Printing Detail:K2:18=Form event code:C388)
	Comp_StateLP
End if 
ERR_MethodTrackerReturn("FM [COMPANIES].Statement"; $_t_oldMethodName)
