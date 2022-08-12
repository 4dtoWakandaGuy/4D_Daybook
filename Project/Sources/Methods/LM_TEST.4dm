//%attributes = {}
If (False:C215)
	//Project Method Name:      LM_TEST
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

$_t_oldMethodName:=ERR_MethodTracker("LM_TEST")
//this is just to test the list manager window
Open window:C153(40; 60; 640; 480; 4)
DIALOG:C40([USER:15]; "List_Manager")
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("LM_TEST"; $_t_oldMethodName)