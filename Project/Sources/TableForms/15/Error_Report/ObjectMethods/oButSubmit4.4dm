If (False:C215)
	//object Name: [USER]Error_Report.oButSubmit4
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
	C_LONGINT:C283(ERR_l_reportAction)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Error_Report.oButSubmit4"; Form event code:C388)

ERR_l_reportAction:=1
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].Error_Report.oButSubmit4"; $_t_oldMethodName)