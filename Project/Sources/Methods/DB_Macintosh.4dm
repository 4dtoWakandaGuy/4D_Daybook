//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Macintosh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 11:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; DB_bo_Platforminited)
	C_LONGINT:C283($_l_Platform; $_t_Machine)
	C_TEXT:C284(<>SYS_t_PlatformSetting; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Macintosh")

$0:=Is macOS:C1572

If (False:C215)
	If (Not:C34(DB_bo_Platforminited))
		
		//_O_PLATFORM PROPERTIES($_l_Platform;$System;$_t_Machine)
		Get_PlatformProperty("Platform"; ->$_l_Platform)
		
		$0:=$_l_Platform#Windows:K25:3
		If ($_l_Platform=Windows:K25:3)
			<>SYS_t_PlatformSetting:="W"
		Else 
			<>SYS_t_PlatformSetting:="P"
		End if 
		DB_bo_Platforminited:=True:C214
		
	Else 
		$0:=(<>SYS_t_PlatformSetting="P")
	End if 
End if 
ERR_MethodTrackerReturn("DB_Macintosh"; $_t_oldMethodName)