//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StartLoadInformer
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
	C_LONGINT:C283($ID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StartLoadInformer")
//Method:  IWS_StartLoadInformer
$ID:=New process:C317("IWS_LoadInformer"; 48000; "$LoadInformer"; *)
ERR_MethodTrackerReturn("IWS_StartLoadInformer"; $_t_oldMethodName)