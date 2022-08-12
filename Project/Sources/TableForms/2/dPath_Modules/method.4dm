If (False:C215)
	//Table Form Method Name: [COMPANIES]dPath_Modules
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 13:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Mod_al_ModuleAccessType;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(<>DB_bo_ModuleSettingsinited; DB_bo_NoLoad)
	C_LONGINT:C283(<>ConIMUsers; <>ConWPUsers; <>SYS_l_MaxConnectedUsers; $_l_event; $_l_Retries; $_l_SpareRow)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284($_t_oldMethodName; vTitle6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dPath_Modules"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
	<>PictLogoMed:=Get_Picture(20240)
	OpenHelp(Table:C252(->[COMPANIES:2]); "dPath_Modules")
	COPY ARRAY:C226(<>Mod_at_ModuleName; MOD_at_ModuleName)
	$_l_Retries:=0
	
	Check_Modules
	
	COPY ARRAY:C226(<>Mod_at_ModuleName; MOD_at_ModuleName)
	COPY ARRAY:C226(<>Mod_al_ModuleAccessType; MOD_al_ModuleAccessStatus)
	SORT ARRAY:C229(MOD_at_ModuleName; MOD_al_ModuleAccessStatus; >)
	
	$_l_SpareRow:=Find in array:C230(MOD_at_ModuleName; "Spare@")  //delete the spares
	
	While ($_l_SpareRow>0)
		IDLE:C311  // 03/04/03 pb
		
		DELETE FROM ARRAY:C228(MOD_at_ModuleName; $_l_SpareRow; 1)
		DELETE FROM ARRAY:C228(MOD_al_ModuleAccessStatus; $_l_SpareRow; 1)
		$_l_SpareRow:=Find in array:C230(MOD_at_ModuleName; "Spare@")
	End while 
	
	$_l_SpareRow:=Find in array:C230(MOD_al_ModuleAccessStatus; 2)  //Show the first line with a blob
	
	If ($_l_SpareRow<1)
		$_l_SpareRow:=Find in array:C230(MOD_al_ModuleAccessStatus; 3)
	End if 
	If ($_l_SpareRow<1)
		$_l_SpareRow:=Find in array:C230(MOD_al_ModuleAccessStatus; 4)
	End if 
	If ($_l_SpareRow<1)
		$_l_SpareRow:=Find in array:C230(MOD_al_ModuleAccessStatus; 1)
	End if 
	If ($_l_SpareRow>0)
		MOD_al_ModuleAccessStatus:=$_l_SpareRow
		MOD_at_ModuleName:=$_l_SpareRow
	End if 
	vTitle6:="Your Licence is for "+String:C10(<>SYS_l_MaxConnectedUsers)
	
	If (((DB_GetModuleSettingByNUM(Module_WPManager)>0) & (<>ConWPUsers>0)) | ((DB_GetModuleSettingByNUM(Module_IntServer)>0) & (<>ConIMUsers>0)))
		
		vTitle6:=vTitle6+" Normal"
		If ((DB_GetModuleSettingByNUM(Module_WPManager)>0) & (<>ConWPUsers>0))
			If ((DB_GetModuleSettingByNUM(Module_IntServer)>0) & (<>ConIMUsers>0))
				
				
				vTitle6:=vTitle6+", "+String:C10(<>ConWPUsers)+" WP"
			Else 
				vTitle6:=vTitle6+" and "+String:C10(<>ConWPUsers)+" WP"
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(Module_IntServer)>0) & (<>ConIMUsers>0))
			
			vTitle6:=vTitle6+" and "+String:C10(<>ConIMUsers)+" Internet"
		End if 
	End if 
	vTitle6:=vTitle6+" User"+"s"*Num:C11((<>SYS_l_MaxConnectedUsers>1) | (<>ConWPUsers>1) | (<>ConIMUsers>1))
	vTitle6:=vTitle6+", with access to the following Modules:"
End if 
ERR_MethodTrackerReturn("FM:dPath_Modules"; $_t_oldMethodName)
