//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_Squ_Window
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
	C_BOOLEAN:C305(<>SYS_bo_CalenderPics)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Open_Squ_Window")
If (<>SYS_bo_CalenderPics=False:C215)
	Open_AnyTypeWindow(247; 280; 4; "Calendar")
Else 
	Open_AnyTypeWindow(247; 520; 4; "Calendar")
End if 
ERR_MethodTrackerReturn("Open_Squ_Window"; $_t_oldMethodName)