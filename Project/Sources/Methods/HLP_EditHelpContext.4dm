//%attributes = {}
If (False:C215)
	//Project Method Name:      HLP_EditHelpContext
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
	C_TEXT:C284($_t_oldMethodName; HLP_T_EditHelpReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("HLP_EditHelpContext")

//This method will display the help context window for editing
If (HLP_T_EditHelpReference#"")
	Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
	DIALOG:C40([USER:15]; "HLP_Edit")
	CLOSE WINDOW:C154
	
Else 
	Gen_Alert(" There is no help associated with the current window!")
End if 
ERR_MethodTrackerReturn("HLP_EditHelpContext"; $_t_oldMethodName)