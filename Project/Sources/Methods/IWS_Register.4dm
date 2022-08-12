//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Register
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/12/2009 13:10`Method: IWS_Register
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(NTK Register)
	C_LONGINT:C283($_l_Error)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Register")
//IWS_Register
//Rollo 26/5/2004

// Internet-ToolKit Pro v2.5/2.6 - dev. subscriptions expire on June 2005

$_l_Error:=0
Case of 
		
	: (Is macOS:C1572)
		$_l_Error:=NTK Register("LPPHAP1HECC4SC24")  //replace with Daybook licenses!
		
		
	: (Is Windows:C1573)
		$_l_Error:=NTK Register("NYPYUE517G3G65BL")  //replace with Daybook licenses!
End case 

If ($_l_Error<1)
	Gen_Alert("NTK (used by the web server) could not be initialised.")
End if 


//$_l_Error:=ITK_Init ("ITKP05068049051007092T"))ITK OUT AUgust 2009

If ($_l_Error<0)
	//ALERT("The Web Server could not be initialised")
	Gen_Alert("ITK (used by the web server) could not be initialised.")
End if 
ERR_MethodTrackerReturn("IWS_Register"; $_t_oldMethodName)
