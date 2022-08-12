//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_StartupP
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
	C_BOOLEAN:C305(<>TelRec)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_StartupP")
Tel_Initialise
//Open_Any_Window (50;250)
//If (◊TelServer)
// ◊Progress:="   Loading Telephony …")
// RESUME PROCESS(Process_No ("$_l_Progress"))
//Else
// MESSAGE(Char(13)+"   No Telephony Server present …")
//End if
//CLOSE WINDOW
Tel_TStartupNP
<>TelRec:=True:C214
ERR_MethodTrackerReturn("Tel_StartupP"; $_t_oldMethodName)