If (False:C215)
	//Table Form Method Name: [HEADINGS]All_Hdr12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2009 15:30
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

$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].All_Hdr12"; Form event code:C388)
ERR_MethodTrackerReturn("FM [HEADINGS].All_Hdr12"; $_t_oldMethodName)