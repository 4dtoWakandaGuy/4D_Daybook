//%attributes = {}

If (False:C215)
	//Project Method Name:      StartBackgrounder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StartBackgrounder")

//BSW12/02/03
//This routine will kick off Backrounder process only if process is not running
//See * param in the end
//$_t_oldMethodName:=ERR_MethodTracker ("StartBackgrounder")


If (Not:C34(<>SYS_bo_QuitCalled))
	
	Case of 
		: (Application type:C494=4D Server:K5:6)
			$_l_Process:=New process:C317("Backgrounder"; 128*1024; "Backgrounder Process"; *)  //BSW 12/02/03
			
		: (ApplicationType_isSingleUser)
			
			$_l_Process:=New process:C317("Backgrounder"; 128*1024; "Backgrounder Process"; *)  //BSW 12/02/03
			
		Else 
			//Do nothing
	End case 
	
End if 
//ERR_MethodTrackerReturn ("StartBackgrounder";$_t_oldMethodName)