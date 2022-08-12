//%attributes = {}
If (False:C215)
	//Project Method Name:      ZMenu_ModBar2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/10/2012 13:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_BarState)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BarProcess; $_l_MenuBarPaletteProcess; $_l_Retries; Mod_l_MenuBarPaletteProcess)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284($_t_MachineName; $_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZMenu_ModBar2")
Menu_Record("ZMenu_ModBar"; "Modules Palette")
$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; "")
SYS_GetCurrentUserSetting($_Obj_GetUser)

$_bo_BarState:=($_Obj_GetUser.functions ?? 2)
//TRACE
If ($_bo_BarState)  //this is still ok NG
	$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
	If ($_l_BarProcess>0)
		SET PROCESS VARIABLE:C370($_l_BarProcess; Mod_l_MenuBarPaletteProcess; 0)
		
		POST OUTSIDE CALL:C329($_l_BarProcess)
	Else 
		$_l_BarProcess:=0
		$_t_MachineName:=Current machine:C483
		$_t_ProcessName:="Modules_Palette"+$_t_MachineName  //see ZMenuModBar
		$_l_Retries:=0
		While ((Get_ProcessNumber($_t_ProcessName)>0) & ($_l_BarProcess<1000))
			$_l_Retries:=$_l_Retries+1
			DelayTicks($_l_Retries*2)  // 7/04/03 pb
			//<>Mod_l_MenuBarPaletteProcess:=0
			SET PROCESS VARIABLE:C370($_l_BarProcess; Mod_l_MenuBarPaletteProcess; 0)
			POST OUTSIDE CALL:C329(Get_ProcessNumber($_t_ProcessName))
			DelayTicks
			$_l_BarProcess:=$_l_BarProcess+1
		End while 
		If ($_l_BarProcess<1000)
			$_t_MachineName:=Current machine:C483
			$_l_MenuBarPaletteProcess:=New process:C317("Menu_ModBar2"; 256000; "Modules_Palette"; *)  //see ZMenuModBar
		Else 
			Gen_Alert("Menu Problem-1000 Menu Bars")
			BEEP:C151
		End if 
	End if 
Else 
	If (False:C215)
		Gen_Alert("The Modules Palette cannot be used at present.  "+Char:C90(13)+"To change this, alter the Performance v Functionality settings"+" of your Personnel record in the Data Manager.")
	Else 
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			SET PROCESS VARIABLE:C370($_l_BarProcess; Mod_l_MenuBarPaletteProcess; 0)
			POST OUTSIDE CALL:C329($_l_BarProcess)
		Else 
			$_l_BarProcess:=0
			$_t_MachineName:=Current machine:C483
			$_t_ProcessName:="Modules_Palette"+$_t_MachineName  //see ZMenuModBar
			$_l_Retries:=0
			While ((Get_ProcessNumber($_t_ProcessName)>0) & ($_l_BarProcess<1000))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)  // 7/04/03 pb
				SET PROCESS VARIABLE:C370($_l_BarProcess; Mod_l_MenuBarPaletteProcess; 0)
				POST OUTSIDE CALL:C329(Get_ProcessNumber($_t_ProcessName))
				
				
				
				DelayTicks($_l_Retries*2)
				$_l_BarProcess:=$_l_BarProcess+1
			End while 
			If ($_l_BarProcess<1000)
				$_t_MachineName:=Current machine:C483
				$_l_MenuBarPaletteProcess:=New process:C317("Menu_ModBar2"; 256000; "Modules_Palette"; *)  //see ZMenuModBar
			Else 
				Gen_Alert("Menu problem-1000 menu bars(2)")
				
				BEEP:C151
			End if 
		End if 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("ZMenu_ModBar2"; $_t_oldMethodName)
