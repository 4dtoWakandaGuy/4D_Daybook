//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote Rec
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
	C_TEXT:C284($_t_oldMethodName; $0; vFld)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote Rec")
$0:=Remote_Packet(vFld)
ERR_MethodTrackerReturn("Remote Rec"; $_t_oldMethodName)