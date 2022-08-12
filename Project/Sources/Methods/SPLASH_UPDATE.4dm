//%attributes = {}

If (False:C215)
	//Project Method Name:      SPLASH_UPDATE
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
	C_BOOLEAN:C305(<>_bo_SplashAutoUpdate; <>_bo_splashbringtofront; <>ST_Bo_ShowSplash; $_bo_callSplashprocess; $_bo_TempDIsableSplash; $4)
	C_LONGINT:C283(<>_l_splashscreenprocess; <>_l_splashThermoMeter; <>_l_splashtimer; <>_l_SplashUpdateCode; $_l_Countparameters; $_l_handleprocess; $_l_progressbar; $2; $3)
	C_TEXT:C284(<>Splash_t_SplashProgressMessage; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_UPDATE")

//bsw 23/07/04
//$1 Message appearing on splash screen (string 31 chars, mandatory but can pass if starting up or stoping)
//$2 Thermo progress (1 to 100, Default is  Negative value ( like -1 ) means auto calculate, 0 means start thermo bar from 0)
//$3 Splash Process handling code - Optional pass Default 0 - do nothing (1 to start splash screen process if not running, pass -1 to stop if it is running)
//$4 bring to front splash screen (default true)
If (True:C214)
	
	$_l_Countparameters:=Count parameters:C259
	
	
	//$_t_oldMethodName:=ERR_MethodTracker ("SPLASH_UPDATE")
	
	//TRACE
	$_bo_TempDIsableSplash:=True:C214  //added 28/03/08 -kmw -temp disable to stop login crashes until we can find why slpash screen is causing crashes
	
	If ($_bo_TempDIsableSplash) | (((Current user:C182="Designer") & (Not:C34(Is compiled mode:C492))) & (Not:C34(<>ST_Bo_ShowSplash)))  //don't want splash for designer
		SPLASH_ENABLE_CANCEL
		SPLASH_THERMO
		<>_bo_SplashAutoUpdate:=False:C215
		<>_bo_splashbringtofront:=False:C215
		<>_l_splashtimer:=0
		<>_l_SplashUpdateCode:=0
	Else 
		If ($_l_Countparameters>0)
			While (Semaphore:C143("SplashMessageUpdate"))
				DelayTicks(10)
			End while 
			<>Splash_t_SplashProgressMessage:=$1
			CLEAR SEMAPHORE:C144("SplashMessageUpdate")
			If ($_l_Countparameters>1)
				$_l_progressbar:=$2
			Else 
				$_l_progressbar:=-1  //default
			End if 
			
			If ($_l_progressbar<0)  //negative value means auto calculate position of bar
				<>_bo_SplashAutoUpdate:=True:C214
				//◊_l_splashThermoMeter:=◊_l_splashThermoMeter+1
			Else 
				<>_bo_SplashAutoUpdate:=False:C215
				<>_l_splashThermoMeter:=$_l_progressbar
				$_bo_callSplashprocess:=True:C214
			End if 
			
			If ($_l_Countparameters>2)
				$_l_handleprocess:=$3
			Else 
				$_l_handleprocess:=0
			End if 
			
			If ($_l_Countparameters>3)
				<>_bo_splashbringtofront:=$4
			Else 
				<>_bo_splashbringtofront:=True:C214
			End if 
			
			If (False:C215) & ($_l_handleprocess=0)  //& (Compiled application)  `check if proc is not aborted
				If (<>_l_splashscreenprocess>0) & (Process number:C372("Splash Screen")=0)
					//$_l_handleprocess:=1  `restart it as it was aborted
					//$_l_handleprocess:=0
				End if 
			End if 
			
			
			Case of 
				: ($_l_handleprocess=2)  //this bit starts splash screen proc (if $3 is passed 1)
					SPLASH_THERMO(True:C214)
					<>_l_splashscreenprocess:=New process:C317("STARTUP_SCREEN"; 128*1024; "Splash Screen"; *)
					//Delayticks(60)
					//◊_l_splashThermoUpdateProc:=New process("SPLASH_THERMO_UPDATE";32*1024;"Splash Update Thermo Remote";*)
					
				: ($_l_handleprocess=1)  //this bit starts splash screen proc (if $3 is passed 1)
					SPLASH_THERMO(False:C215)
					<>_l_splashscreenprocess:=New process:C317("STARTUP_SCREEN"; 128*1024; "Splash Screen"; *)
					//Delayticks(60)
					//◊_l_splashThermoUpdateProc:=New process("SPLASH_THERMO_UPDATE";32*1024;"Splash Update Thermo Remote";*)
				: ($_l_handleprocess=-1)  //this will kill splash screen process and close splash window
					<>_l_splashtimer:=0
					<>Splash_t_SplashProgressMessage:=""
					If (Not:C34(VER_4DServer))
						POST OUTSIDE CALL:C329(<>_l_splashscreenprocess)
						<>_l_splashscreenprocess:=0
					End if 
					SPLASH_ENABLE_CANCEL
					SPLASH_THERMO
				Else 
			End case 
			If (<>_bo_splashbringtofront)
				$_bo_callSplashprocess:=True:C214
			End if 
			
			$_bo_callSplashprocess:=(($_bo_callSplashprocess) & (<>_l_splashscreenprocess>0) & (Not:C34(VER_4DServer)))
			
			If ($_bo_callSplashprocess)
				POST OUTSIDE CALL:C329(<>_l_splashscreenprocess)
			End if 
		End if 
		
	End if 
End if 
//ERR_MethodTrackerReturn ("SPLASH_UPDATE";$_t_oldMethodName)
