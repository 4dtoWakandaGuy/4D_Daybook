//%attributes = {}
If (False:C215)
	//Project Method Name:      Fax_SPHandleErr
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax_SPHandleErr")
//Fax_SPHandleErr
$0:=False:C215

If ($1<0)  //MacOS error
	Case of 
		: ($1=-128)  //user aborted request
			$0:=False:C215
		Else 
			$0:=True:C214
	End case 
Else   //4-Sight API-Error
	$0:=True:C214
	Gen_Alert("A 4-Sight API Error occured, ID "+String:C10($1))
End if 
ERR_MethodTrackerReturn("Fax_SPHandleErr"; $_t_oldMethodName)