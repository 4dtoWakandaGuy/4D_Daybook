//%attributes = {}
If (False:C215)
	//Project Method Name:      Sys_register
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Result)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYS_Register")




Case of 
		//: (SYS_OnMac)
	: (Is macOS:C1572)
		$_l_Result:=NTK Register("LPPHAP1HECC4SC24")  //replace with Daybook licenses!
		
		//: (SYS_OnWindows)
	: (Is Windows:C1573)
		$_l_Result:=NTK Register("NYPYUE517G3G65BL")  //replace with Daybook licenses!
End case 

If ($_l_Result<1)
	ALERT:C41("NTK (used by the web server) could not be initialised.")
End if 


If ($_l_Result<0)
	//ALERT("The Web Server could not be initialised")
	ALERT:C41("ITK (used by the web server) could not be initialised.")
End if 
ERR_MethodTrackerReturn("SYS_Register"; $_t_oldMethodName)
