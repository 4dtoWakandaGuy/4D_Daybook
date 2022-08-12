//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check Pages
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(rDiary; rState; vNo; vPages)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_oldMethodName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check Pages")
//Check Pages
If (<>SYS_t_4DWriteType="")  // plain text
	If ((vPages=1) | (rState=2) | (rDiary=1))
		vText:="Insert "+String:C10(vNo)+" headed sheet(s) in the cassette."
	Else 
		vText:="Insert "+String:C10(vNo)+" headed sheet(s), each followed by "+String:C10(vPages-1)+" continuation sheet(s)\\x01\\x05."
	End if 
	Gen_Confirm(vText)
End if 
ERR_MethodTrackerReturn("Check Pages"; $_t_oldMethodName)