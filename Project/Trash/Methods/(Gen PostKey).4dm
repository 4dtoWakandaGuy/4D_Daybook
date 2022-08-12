//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen PostKey
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:17
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($1; $2; $3)
	C_TEXT:C284(<>SYS_t_PlatformSetting; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen PostKey")
//Gen PostKey

If (Is macOS:C1572)
	// PostKe2 (0;$2;$3)  `PostKey ($1;$2;$3)
	If ($1>0)
		POST KEY:C465($2; $3; $1)
	Else 
		POST KEY:C465($2; $3; Frontmost process:C327(*))
	End if 
Else 
	If ($1>0)
		POST KEY:C465($2; $3; $1)
	Else 
		POST KEY:C465($2; $3; Frontmost process:C327(*))
	End if 
End if 
ERR_MethodTrackerReturn("Gen PostKey"; $_t_oldMethodName)