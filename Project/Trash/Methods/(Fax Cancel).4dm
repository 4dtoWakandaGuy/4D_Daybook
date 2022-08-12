//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax Cancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>FaxMode)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax Cancel")
//Fax Cancel
Case of 
	: (<>FaxMode=1)
		PLUGCALL_FAX("SetDriver"; 1)
		
	: (<>FaxMode=2)
		PLUGCALL_FAX("SetDriver"; 2)
		
End case 
ERR_MethodTrackerReturn("Fax Cancel"; $_t_oldMethodName)