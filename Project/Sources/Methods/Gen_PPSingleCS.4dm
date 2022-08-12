//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PPSingleCS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2; vLayCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PPSingleCS")
vLayCode:=""
If (Count parameters:C259=2)
	COPY NAMED SELECTION:C331($1->; $2)
Else 
	COPY NAMED SELECTION:C331($1->; "Selection")
End if 
OK:=1
ERR_MethodTrackerReturn("Gen_PPSingleCS"; $_t_oldMethodName)