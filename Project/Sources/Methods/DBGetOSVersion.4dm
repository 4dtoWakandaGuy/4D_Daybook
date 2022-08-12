//%attributes = {}
If (False:C215)
	//Project Method Name:      DBGetOSVersion
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 07:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	C_LONGINT:C283($_l_Platform; $_l_SysPosition; $_l_System; $_l_WinMajVers; $_l_WinMinVers; $vlMachine)
	C_OBJECT:C1216($_obj_SystemInfo)
	C_TEXT:C284($_t_OldMethodName; $_t_PlatformOS; $0)
End if 
//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DBGetOSVersion")

//Updated to check for vista as per example in 2004.6 language reference (27/10/08 v631b120a -kmw)

//_O_PLATFORM PROPERTIES($_l_Platform;$_l_System;$vlMachine)
Get_PlatformProperty("Platform"; ->$_l_Platform)
If (($_l_Platform<1) | ($_l_Platform>3))
	$_t_PlatformOS:=""
Else 
	$_obj_SystemInfo:=Get system info:C1571
	If ($_l_Platform=3)
		OB GET PROPERTY NAMES:C1232($_obj_SystemInfo; $_at_Properties; $_al_PropertyTypes)
		$_l_SysPosition:=Find in array:C230($_at_Properties; "osVersion")
		If ($_l_SysPosition>0)
			$_t_PlatformOS:=OB Get:C1224($_obj_SystemInfo; "osVersion")
			If (False:C215)
				$_t_PlatformOS:=""
				If ($_l_System<0)
					$_l_WinMajVers:=((2^31)+$_l_System)%256
					$_l_WinMinVers:=(((2^31)+$_l_System)\256)%256
					If ($_l_WinMinVers=0)
						$_t_PlatformOS:="Windows™ 95"
					Else 
						$_t_PlatformOS:="Windows™ 98"
					End if 
				Else 
					$_l_WinMajVers:=$_l_System%256
					$_l_WinMinVers:=($_l_System\256)%256
					Case of 
						: ($_l_WinMajVers=4)
							$_t_PlatformOS:="Windows™ NT"
						: ($_l_WinMajVers=5)
							If ($_l_WinMinVers=0)
								$_t_PlatformOS:="Windows™ 2000"
							Else 
								$_t_PlatformOS:="Windows™ XP"
							End if 
						: ($_l_WinMajVers=6)
							$_t_PlatformOS:="Windows™ Vista"
							
						: ($_l_WinMajVers=7)
							$_t_PlatformOS:="Windows™ 7"
						: ($_l_WinMajVers=8)
							$_t_PlatformOS:="Windows™ 7"
						: ($_l_WinMajVers=10)
							$_t_PlatformOS:="Windows™ 10"
					End case 
				End if 
				$_t_PlatformOS:=$_t_PlatformOS+" version "+String:C10($_l_WinMajVers)+"."+String:C10($_l_WinMinVers)
			End if 
		End if 
	Else 
		OB GET PROPERTY NAMES:C1232($_obj_SystemInfo; $_at_Properties; $_al_PropertyTypes)
		$_l_SysPosition:=Find in array:C230($_at_Properties; "osVersion")
		If ($_l_SysPosition>0)
			$_t_PlatformOS:=OB Get:C1224($_obj_SystemInfo; "osVersion")
			If (False:C215)
				$_t_PlatformOS:="Mac OS™ version "
				If (($_l_System\256)=16)
					$_t_PlatformOS:=$_t_PlatformOS+"10"
				Else 
					$_t_PlatformOS:=$_t_PlatformOS+String:C10($_l_System\256)
				End if 
				$_t_PlatformOS:=$_t_PlatformOS+"."+String:C10(($_l_System\16)%16)+(("."+String:C10($_l_System%16))*Num:C11(($_l_System%16)#0))
			End if 
		End if 
	End if 
End if 

$0:=$_t_PlatformOS
ERR_MethodTrackerReturn("DBGetOSVersion"; $_t_OldMethodName)
