//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_ShowCards
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("CON_ShowCards")
If ([CONTACTS:1]x_ID:33=0)
	[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
End if 
If ([CONTACTS:1]Contact_Code:2#"")
	CCM_ShowContactCards([CONTACTS:1]Contact_Code:2; [CONTACTS:1]x_ID:33; [CONTACTS:1]Company_Code:1)
	
End if 
ERR_MethodTrackerReturn("CON_ShowCards"; $_t_oldMethodName)