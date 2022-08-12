//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_Startup
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
	C_BOOLEAN:C305(<>IME_StartupHasBeenRun)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Startup")

INIT_BashWrapper  //added so bash commands will work
SYS_Init
UTI_Init
STR_Init
IWS_Init
//IWS_Startup  `now in the ITO Startup Macro
IME_Init
CAC_Init
BDL_Init

<>IME_StartupHasBeenRun:=True:C214  //added -kmw 10/10/08 v631b120
ERR_MethodTrackerReturn("IME_Startup"; $_t_oldMethodName)