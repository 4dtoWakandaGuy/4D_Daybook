//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Module First
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
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305($_bo_Execute; $_bo_inStartup; DB_bo_ModuleSettingsinited)
	C_LONGINT:C283(<>Login_l_HomeTable; <>Mod_l_MaxModules; <>Mod_l_MenuBarPaletteProcess; $_l_HomeTable; $_l_Index; $1; DBWS_l_HomeTable; SD2_l_DiaryStartups)
	C_TEXT:C284(<>LOGIN_s255_FirstModuleName; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_MenusFormat; DBWS_t_FirstModuleName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Module First")

If (DB_bo_ModuleSettingsinited)
	//ALERT("Chek Modules Has Run")
End if 
//set the above before calling this method-it till be unset at the end of this call
//If (Not(DB_bo_ModuleSettingsinited))
Check_Modules
//DB_bo_ModuleSettingsinited:=True
//End if 
If (<>Mod_l_MaxModules=0) & (Application type:C494=4D Remote mode:K5:5)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
	If (<>Mod_l_MaxModules=0)
		<>Mod_l_MaxModules:=45
	End if 
End if 

$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
$_bo_Execute:=False:C215
$_l_HomeTable:=0
If (Count parameters:C259=0)
	//No parameter--need to find the first module
	If (DB_t_MenusFormat#"")  //web call
		If (DBWS_t_FirstModuleName="")
			$_l_Index:=1
			$_l_HomeTable:=Table:C252(->[COMPANIES:2])
		Else 
			$_l_Index:=Find in array:C230(<>Mod_at_ModuleName; DBWS_t_FirstModuleName)
			$_l_HomeTable:=DBWS_l_HomeTable
			If ($_l_Index<0)
				$_l_Index:=1
				//◊Login_l_HomeTable
			End if 
		End if 
	Else 
		If (<>LOGIN_s255_FirstModuleName="")
			$_l_Index:=1
			$_l_HomeTable:=Table:C252(->[COMPANIES:2])
			
		Else 
			$_l_Index:=Find in array:C230(<>Mod_at_ModuleName; <>LOGIN_s255_FirstModuleName)
			$_l_HomeTable:=<>Login_l_HomeTable
			If ($_l_Index<0)
				$_l_Index:=1
				//◊Login_l_HomeTable
			End if 
		End if 
	End if 
End if 
If (Count parameters:C259<2)
	$_l_Index:=$1
	
Else 
	If (DBWS_t_FirstModuleName="")
		$_l_Index:=1
		$_l_HomeTable:=Table:C252(->[COMPANIES:2])
	Else 
		$_l_Index:=Find in array:C230(<>Mod_at_ModuleName; DBWS_t_FirstModuleName)
	End if 
	//$_l_Index:=Find in array(<>Mod_at_ModuleName;$2)
	//$_l_HomeTable:=DBWS_l_HomeTable<---this has to be got from the current user settings
	If ($_l_Index<0)
		$_l_Index:=1
		//◊Login_l_HomeTable
	End if 
End if 


If (<>Mod_l_MaxModules>0) & ((Size of array:C274(<>Mod_at_ProcessFunction))=<>Mod_l_MaxModules)
	
	If ($_l_HomeTable=0)
		
		While ($_l_Index<(<>Mod_l_MaxModules))
			IDLE:C311  // 7/04/03 pb
			If ($_l_Index<=Size of array:C274(<>Mod_at_ProcessFunction))
				If ((DB_GetModuleSettingByNUM($_l_Index)>1) & (<>Mod_at_ProcessFunction{$_l_Index}#""))
					If (DB_GetModuleSettingByNUM(1)=5)
						If (($_l_Index#2) & ($_l_Index#4) & ($_l_Index#5) & ($_l_Index#6) & ($_l_Index#3) & ($_l_Index#9))  //◊aMod nos that aare already in Silver
							If (DB_GetModuleSettingByNUM(30)>0)  //SIlver plus
								If (($_l_Index#7) & ($_l_Index#17) & ($_l_Index#18))
									DB_t_CurrentFormUsage:="ModBar"
									
									Modules_MenuExe(<>Mod_at_ProcessFunction{$_l_Index})
									$_bo_Execute:=True:C214
									$_l_Index:=50
								End if 
							Else 
								DB_t_CurrentFormUsage:="ModBar"
								Modules_MenuExe(<>Mod_at_ProcessFunction{$_l_Index})
								$_bo_Execute:=True:C214
								$_l_Index:=50
							End if 
						End if 
					Else 
						DB_t_CurrentFormUsage:="ModBar"
						Modules_MenuExe(<>Mod_at_ProcessFunction{$_l_Index})
						$_bo_Execute:=True:C214
						$_l_Index:=50
					End if 
				End if 
			Else 
				$_l_Index:=99999
			End if 
			$_l_Index:=$_l_Index+1
		End while 
		If (Count parameters:C259<2)
			$_bo_inStartup:=Test semaphore:C652("$DuringLogin")
			If ($_bo_inStartup)
				If (SD2_l_DiaryStartups=0) | (True:C214)
					//no window will open so open the toolbar
					//ALERT("19")
					<>Mod_l_MenuBarPaletteProcess:=New process:C317("Menu_ModBar2"; 256000; "Modules_Palette"; *)  //see ZMenuModBar
				Else 
					//start the diary
					
				End if 
			Else 
				ALERT:C41("20")
				<>Mod_l_MenuBarPaletteProcess:=New process:C317("Menu_ModBar2"; 256000; "Modules_Palette"; *)  //see ZMenuModBar
				
			End if 
		End if 
	Else 
		If (Count parameters:C259<2)
			DBI_MenuDisplayRecords(String:C10($_l_HomeTable))
		End if 
	End if 
	Modules_Array
	If ($_bo_Execute=False:C215)
		While (Semaphore:C143("$ModifyingModulesArray"))
			DelayTicks(2)
		End while 
		$_t_oldMethodName:=ERR_MethodTracker("Module First")
		For ($_l_Index; 1; DB_aI_aMod)
			If ($_l_Index<=Size of array:C274(DB_aI_aMod))
				If (DB_GetModuleSettingByNUM($_l_Index)=1)
					DB_aI_aMod{$_l_Index}:=2
					
				End if 
			End if 
		End for 
		
		//ALERT("19x3")
		Module First(1)
	End if 
	DB_t_MenusFormat:=""
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
End if 
ERR_MethodTrackerReturn("Module First"; $_t_oldMethodName)
