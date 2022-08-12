//%attributes = {}
If (False:C215)
	//Project Method Name:      Address_Horizontal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vDetails)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Address_Horizontal")
Address_Details
vDetails:=Replace string:C233(vDetails; Char:C90(13); ", ")
ERR_MethodTrackerReturn("Address_Horizontal"; $_t_oldMethodName)
