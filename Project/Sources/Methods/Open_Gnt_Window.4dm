//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_Gnt_Window
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

$_t_oldMethodName:=ERR_MethodTracker("Open_Gnt_Window")
Open_Any_Window(285; 450)
ERR_MethodTrackerReturn("Open_Gnt_Window"; $_t_oldMethodName)