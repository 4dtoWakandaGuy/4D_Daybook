//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_Bar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>StartProc; $_bo_Min)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc; <>newSetsProcess; <>RecBarUp; <>SCPT_l_PlayerActive; $_l_CurrentWinRefOLD; $_l_ProcessState; $_l_ProcessTime; $_l_ScreenHeight; $_l_ScreenRight)
	C_LONGINT:C283($_l_ScreenTop; MOD_l_CurrentModuleAccess; r1; r2; s1; s2; vAdd; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xSort)
	C_TEXT:C284(<>KEYS; <>SYS_t_FormSizeName; $_t_oldMethodName; $_t_oldMethodName2; $_t_processName; $_t_VolumesMenuName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vHeading; vName)
	C_TEXT:C284(vStatus)
	C_TIME:C306(vTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Record_Bar")

$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//Changes-this is now included in our set manager pallete
//so we check if the palette is up already
If (True:C214)
	PROCESS PROPERTIES:C336(<>NewSetsProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
	If ($_t_processName#"Set Manager")
		<>newSetsProcess:=0
	Else 
		If ($_l_ProcessState<0)
			<>newSetsProcess:=0
		End if 
	End if 
	If (<>newSetsProcess=0)
		<>newSetsProcess:=New process:C317("Gen_SetManager"; 128000; "Set Manager"; 0; 0; 0; 1)
		<>RecBarUp:=<>newSetsProcess
	Else 
		<>RecBarUp:=<>newSetsProcess
		PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
		If ($_l_ProcessState>=0)  // 30/05/02 pb
			SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_ShowScripts; 1)
			POST OUTSIDE CALL:C329(<>newSetsProcess)
		End if 
	End if 
	
Else 
	//this is the old code
	If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
		<>StartProc:=False:C215
		<>Keys:=""
		Start_Process
		//DEFAULT TABLE([MACROS])
		MOD_l_CurrentModuleAccess:=1
		vAdd:=0
		DB_t_CurrentFormUsage:=""
		xSort:=0
		vTime:=?00:00:00?
		DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_MacrosPalette"); 4; "18"; <>menuProc; False:C215)
		
		
		vStatus:=""
		vName:=""
		vHeading:=""
		s1:=0
		s2:=1
		Array_LCx(0)
		
		$_l_ScreenHeight:=Screen height:C188
		$_l_ScreenRight:=Screen width:C187  //-2
		r1:=0
		r2:=0
		Macros_File
		
		If (<>SYS_t_FormSizeName="")
			$_l_ScreenTop:=$_l_ScreenHeight-15
		Else 
			$_l_ScreenTop:=$_l_ScreenHeight-30
		End if 
		If ((DB_GetModuleSettingByNUM(1))=5)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenRight-245; $_l_ScreenTop; $_l_ScreenRight; $_l_ScreenHeight; -2)
			DIALOG:C40([COMPANIES:2]; "dRecordS")
		Else 
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenRight-284; $_l_ScreenTop; $_l_ScreenRight; $_l_ScreenHeight; -2)  //-169`290`321
			DIALOG:C40([COMPANIES:2]; "dRecord")
		End if 
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		$_bo_Min:=False:C215
		
		<>RecBarUp:=0
		If (OK=1)
			ZRecord_BarList
		Else 
			If (vStatus="Rec@")
				//TRACE
				ON EVENT CALL:C190("")
				Start_Event
			End if 
			If (vStatus="Play@")
				RESUME PROCESS:C320(<>SCPT_l_PlayerActive)
				<>SCPT_l_PlayerActive:=0
			End if 
			If (Is Windows:C1573)  //needed to force it to turn the check off
				
				If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
					If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
						<>Bar:=0
						$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
						EXECUTE FORMULA:C63(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
					End if 
				End if 
				
			Else 
				DB_MenuAction($_t_VolumesMenuName; Get localized string:C991("MenuItem_MacrosPalette"); 4; ""; <>menuProc; False:C215)
				
			End if 
		End if 
	Else 
		Gen_Alert("You do not have access to the Macros_Module"; "Cancel")
		<>RecBarUp:=0
	End if 
End if 
ERR_MethodTrackerReturn("Record_Bar"; $_t_oldMethodName)
