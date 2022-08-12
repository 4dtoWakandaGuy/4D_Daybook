If (False:C215)
	//Table Form Method Name: [HEADINGS]PLB_Det
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

$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].PLB_Det"; Form event code:C388)
ERR_MethodTrackerReturn("FM [HEADINGS].PLB_Det"; $_t_oldMethodName)