//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWOpen2
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
	C_LONGINT:C283(Write)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWOpen2")
If (Gen_Option)
	If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver"
		WR EXECUTE COMMAND:P12000:113(Write; 102)
		// WR O DO COMMAND (Write;102;1)
		//  Else
		//    $r:=SW Do Command (Write;102;1)
		
	End if 
Else 
	ZLetters_SWOpen
End if 
ERR_MethodTrackerReturn("Letters_SWOpen2"; $_t_oldMethodName)