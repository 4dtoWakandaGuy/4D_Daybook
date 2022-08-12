//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_Boot_Mode
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
	C_BOOLEAN:C305($_bo_NormalBoot; $0)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Boot_Mode")

//bsw 14/12/03
//Allows an user to start debug mode or Daybook Tools mode
//method returns false if user selected any of the options
//$_t_oldMethodName:=ERR_MethodTracker ("DB_Boot_Mode") to speed up login

$_bo_NormalBoot:=True:C214

If (Is macOS:C1572)
	Case of 
		: ((Shift down:C543) & (Application type:C494#4D Server:K5:6))
			
			DEI_Tools(1)
			$_bo_NormalBoot:=False:C215
			
		: ((Shift down:C543) & (Application type:C494=4D Server:K5:6))
			$_l_Process:=New process:C317("DEI_Tools"; 64000; "Tools Process"; 1)
			$_bo_NormalBoot:=False:C215
		: (Macintosh control down:C544)
			ErrorDebugInit
			
	End case 
	
Else 
	
	Case of 
			
		: ((Shift down:C543) & (Application type:C494#4D Server:K5:6))
			
			DEI_Tools(1)
			$_bo_NormalBoot:=False:C215
		: ((Shift down:C543) & (Application type:C494=4D Server:K5:6))
			
			$_l_Process:=New process:C317("DEI_Tools"; 64000; "Tools Process"; 1)
			$_bo_NormalBoot:=False:C215
			
		: (Windows Ctrl down:C562)
			
			ErrorDebugInit
			
	End case 
	
End if 

$0:=$_bo_NormalBoot
//ERR_MethodTrackerReturn ("DB_Boot_Mode";$_t_oldMethodName)