//%attributes = {}
If (False:C215)
	//Project Method Name:      PLUGCALL_Chooser
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PLUGCALL_Chooser")
//this method is a wrapper for plug in calls to 4D chooser

//when we have a new solution it can be used to find all the old calls

//this was done as a simple way to take out the calls but leave the references
//(commenting could have left ambiguity as there may already been commented out calls
//to plug ins
Case of 
	: ($1="Setchooser")
		If (Count parameters:C259=1)
			//Set chooser("")
		End if 
End case 
ERR_MethodTrackerReturn("PLUGCALL_Chooser"; $_t_oldMethodName)
