//%attributes = {}

If (False:C215)
	//Project Method Name:      Get_PlatformProperty
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/02/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Attributetypes; 0)
	ARRAY TEXT:C222($_at_Attributes; 0)
	C_LONGINT:C283($_l_Platform; $_l_Position)
	C_OBJECT:C1216($_obj_SystemInfo)
	C_POINTER:C301($_ptr_ReturnValue; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_Platform; $_t_Property; $1)
End if 

//Code Starts Here
If (False:C215)
	$_t_oldMethodName:=ERR_MethodTracker("Get_PlatformProperty")
End if 
$_t_Property:=$1
$_ptr_ReturnValue:=$2
$_obj_SystemInfo:=Get system info:C1571
OB GET PROPERTY NAMES:C1232($_obj_SystemInfo; $_at_Attributes; $_al_Attributetypes)
Case of 
	: ($_t_Property="Platform") | ($_t_Property="Platform")
		
		$_l_Position:=Find in array:C230($_at_Attributes; "osVersion")
		If ($_l_Position>0)
			$_t_Platform:=OB Get:C1224($_obj_SystemInfo; "osVersion")
			Case of 
				: ($_t_Platform="Microsoft@") | ($_t_Platform="Windows@")
					
					$_l_Platform:=3
				Else 
					$_l_Platform:=2
			End case 
			
			$_ptr_ReturnValue->:=$_l_Platform
		End if 
End case 
If (False:C215)
	ERR_MethodTrackerReturn("Get_PlatformProperty"; $_t_oldMethodName)
End if 
//ERR_MethodTrackerReturn ("Get_PlatformProperty";$_t_oldMethodName)