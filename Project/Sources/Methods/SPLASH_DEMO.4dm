//%attributes = {}
If (False:C215)
	//Project Method Name:      SPLASH_DEMO
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
	C_BOOLEAN:C305(<>_bo_SplashAutoUpdate; <>SYS_bo_inStartup)
	C_LONGINT:C283($_l_Index; $_l_Index2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_DEMO")
SPLASH_TIMER(60*5*60)

//DelayTicks (60*10)
SPLASH_UPDATE("Starting up ..."; 1; 1)
<>SYS_bo_inStartup:=True:C214
<>_bo_SplashAutoUpdate:=False:C215

For ($_l_Index; 2; 100)
	DelayTicks(20)
	For ($_l_Index2; 1; 10)
		SPLASH_DEMO1
	End for 
	//SPLASH_UPDATE ("Splash Screen Demo - "+String($_l_Index)+" ...";$_l_Index)
End for 
<>SYS_bo_inStartup:=False:C215
SPLASH_UPDATE("Stoping ..."; 100; -1; False:C215)
ERR_MethodTrackerReturn("SPLASH_DEMO"; $_t_oldMethodName)
