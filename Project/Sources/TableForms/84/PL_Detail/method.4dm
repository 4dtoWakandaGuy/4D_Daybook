If (False:C215)
	//Table Form Method Name: [HEADINGS]PL_Detail
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


$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].PL_Detail"; Form event code:C388)
ERR_MethodTrackerReturn("FM [HEADINGS].PL_Detail"; $_t_oldMethodName)
