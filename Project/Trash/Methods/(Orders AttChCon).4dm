//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders AttChCon
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

$_t_oldMethodName:=ERR_MethodTracker("Orders AttChCon")
Menu_Record("Orders AttChCon"; "Consolidate Attendee Items")
//?????  a Menu that does nothing
ERR_MethodTrackerReturn("Orders AttChCon"; $_t_oldMethodName)