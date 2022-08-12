//%attributes = {}
If (False:C215)
	//Project Method Name:      First_Field
	//------------------ Method Notes ------------------
	//The problem with this method was that it chops off the value by changint the value of Vt.... 
	
	//so i am changing this so $1 is a pointer
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 11:27:58If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $0; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("First_Field")
//First_Field
If (Count parameters:C259>=2)
	$0:=First_Fieldx($1; $2)
End if 
ERR_MethodTrackerReturn("First_Field"; $_t_oldMethodName)