If (False:C215)
	//Table Form Method Name: [COMPANIES]dAbout_VectorW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/01/2013 11:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>_bo_splashbringtofront; <>_bo_SplashEnableCancel; <>_bo_SplashHidden; <>_bo_SplashHideThermo; $_bo_ShiftKeyDown; $_bo_ShowThermo; DB_bo_NoLoad; WS_bo_FromMenu; <>_bo_SplashAutoUpdate; <>_bo_splashbringtofront; <>_bo_SplashHidden)
	C_BOOLEAN:C305(<>_bo_SplashHideThermo; $_bo_ShiftKeyDown; $_bo_ShowThermo; DB_bo_NoLoad; WS_bo_FromMenu)
	C_LONGINT:C283(<>_l_splashThermoMeter; <>_l_splashtimer; <>_l_SplashUpdateCode; $_l_ThermometerMove; Splash_l_SplashTimer; <>_l_splashscreenprocess; <>_l_splashThermoMeter; <>_l_splashtimer; <>_l_SplashUpdateCode; $_l_ThermometerMove; Splash_l_SplashTimer)
	C_LONGINT:C283(VER_l_CustomerBuild)
	C_TEXT:C284(<>SYS_t_VersionNumber; $_t_oldMethodName; DB_T_ScreenT; SYS_t_DataVersionNumber; SYS_t_VersionNumber; <>Splash_t_SplashProgressMessage; <>SYS_t_VersionNumber; $_t_oldMethodName; DB_T_ScreenT; SYS_t_DataVersionNumber)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAbout_VectorW"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_T_ScreenT:=DB_GetOrganisationScreenName
		
		$_bo_ShowThermo:=Not:C34(<>_bo_SplashHideThermo)
		OBJECT SET VISIBLE:C603(*; "oProgress"; $_bo_ShowThermo)
		OBJECT SET VISIBLE:C603(*; "oSplashThermometer"; $_bo_ShowThermo)
		
		If (<>Splash_t_SplashProgressMessage="")
			//◊Progress:="Logged in as: "+◊User+" ("+Current machine+")"
		End if 
		Splash_l_SplashTimer:=0
		If (<>_l_splashtimer=0)  //not set on startup
			Case of 
				: (VER_4DServer)
					
					<>_l_SplashUpdateCode:=1
					<>_l_splashtimer:=3
				Else 
					<>_l_splashtimer:=60*2  //2 minute timeout
			End case 
		End if 
		
		$_bo_ShiftKeyDown:=Shift down:C543  //bsw 17/12/03 admin only
		
		If ($_bo_ShiftKeyDown)
			SYS_t_DataVersionNumber:=VER_GetVersion
		End if 
		
		OBJECT SET VISIBLE:C603(*; "ot_DataVersionNo@"; $_bo_ShiftKeyDown)
		
		
		<>SYS_t_VersionNumber:=VER_GetLicenceVersion
		
		//NG note this change below to show the customer licence version in the about screen
		VER_t_CustomerLicenceVersion:=<>SYS_t_VersionNumber
		//VER_GetVersion
		VER_l_CustomerBuild:=VER_GetBuildNumber
		
		If (WS_bo_FromMenu)
			WS_AutoscreenSize(3; 439; 567)
		Else 
			WS_AutoscreenSize(3; 379; 567)
		End if 
		
		SET TIMER:C645(60)  //60 ticks = 1 sec timer
		
	: (Form event code:C388=On Outside Call:K2:11)
		If (<>_l_splashtimer=0) | (Splash_l_SplashTimer><>_l_splashtimer)
			CANCEL:C270
			<>_l_splashtimer:=0
		Else 
			//In_ButtdCall
			REDRAW WINDOW:C456
		End if 
		
	: (Form event code:C388=On Timer:K2:25)  //after every 1 sec
		
		If (<>_l_SplashUpdateCode=1)  //activated
			If (<>_bo_SplashAutoUpdate)
				If (<>_l_splashtimer<=0)  //Tue, Mar 14, 2006 bwalia: fixed an error
					$_l_ThermometerMove:=1
				Else 
					$_l_ThermometerMove:=(100\<>_l_splashtimer)
				End if 
				
				If ($_l_ThermometerMove<1)
					$_l_ThermometerMove:=1
				End if 
				Case of 
					: (<>_l_splashtimer<=30)
						$_l_ThermometerMove:=($_l_ThermometerMove*14)
					: (<>_l_splashtimer<=60)
						$_l_ThermometerMove:=($_l_ThermometerMove*8)
					Else 
						
				End case 
				
				<>_l_splashThermoMeter:=<>_l_splashThermoMeter+$_l_ThermometerMove
			End if 
			
			If (<>_bo_splashbringtofront)
				SHOW PROCESS:C325(Current process:C322)
				BRING TO FRONT:C326(Current process:C322)
			End if 
			
			If (<>_l_splashtimer=0) | (Splash_l_SplashTimer><>_l_splashtimer)
				CANCEL:C270
				<>_l_splashtimer:=0
			End if 
			
			$_bo_ShowThermo:=Not:C34(<>_bo_SplashHideThermo)
			OBJECT SET VISIBLE:C603(*; "oProgress"; $_bo_ShowThermo)
			OBJECT SET VISIBLE:C603(*; "oSplashThermometer"; $_bo_ShowThermo)
			
			Splash_l_SplashTimer:=Splash_l_SplashTimer+1
		End if 
		If (<>_bo_SplashHidden)
			HIDE PROCESS:C324(Current process:C322)
			PAUSE PROCESS:C319(Current process:C322)
			
			
		End if 
	: (Form event code:C388=On Unload:K2:2)
		<>_l_splashscreenprocess:=0
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAbout_VectorW"; $_t_oldMethodName)
