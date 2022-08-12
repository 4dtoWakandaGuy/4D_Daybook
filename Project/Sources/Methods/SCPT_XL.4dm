//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 06:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Platform)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL")


//_O_PLATFORM PROPERTIES($_l_Platform)
Get_PlatformProperty("Platform"; ->$_l_Platform)
If ($_l_Platform=Windows:K25:3)
	
	$0:=SCPT_VBS($1+".vbs")
	
Else 
	
	$0:=SCPT_OSA($1+".scpt")
	
End if 
ERR_MethodTrackerReturn("SCPT_XL"; $_t_oldMethodName)