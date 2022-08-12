//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_GetClientVersion
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
	C_LONGINT:C283($_l_Number; $_l_VersionPart1)
	C_TEXT:C284($_t_ApplicationVersion; $_t_ClientVersion; $_t_oldMethodName; $_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetClientVersion")

//$_t_oldMethodName:=ERR_MethodTracker ("DB_GetClientVersion")` Keeps login faster

$_t_ClientVersion:=""
$0:=""

If (Application type:C494=4D Remote mode:K5:5)  //4D CLIENT
	$_t_ApplicationVersion:=Application version:C493
	// Example: The string"0600"stands for version 6.0.0.
	If ($_t_ApplicationVersion#"")
		$_t_VersionPart1:=Substring:C12($_t_ApplicationVersion; 1; 2)
		$_l_VersionPart1:=Num:C11($_t_VersionPart1)
		$_t_VersionPart1:=String:C10($_l_VersionPart1)  //LOSES THE LEADING 0
		$_t_VersionPart2:=Substring:C12($_t_ApplicationVersion; 3; 1)
		$_t_VersionPart3:=Substring:C12($_t_ApplicationVersion; 4; 1)
		Case of 
			: ($_l_VersionPart1<7)
				$_t_ClientVersion:=$_t_VersionPart1+"."+$_t_VersionPart2+"."+$_t_VersionPart3
			Else 
				$_l_Number:=2000+((Num:C11($_t_VersionPart1))-4)
				
				$_t_ClientVersion:=String:C10($_l_Number)+"."+$_t_VersionPart3
		End case 
		
	End if 
End if 

$0:=$_t_ClientVersion
//ERR_MethodTrackerReturn ("DB_GetClientVersion";$_t_oldMethodName)