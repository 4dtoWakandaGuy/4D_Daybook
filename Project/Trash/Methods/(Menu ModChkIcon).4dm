//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu ModChkIcon
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu ModChkIcon")
//Menuu ModChkIcon
//temporary proc to remove crashing icons from Windows version
If (Is Windows:C1573)
	If (($1=19702) | ($1=19705) | ($1=19708) | ($1=197014) | ($1=19717) | ($1=19718) | ($1=19721) | ($1=19730) | ($1=19737))
		If ((DB_GetModuleSettingByNUM(1)=5) & ($1=19702))  //change Silver icon to GL
			$0:=19806
		Else 
			If ((DB_GetModuleSettingByNUM(1)=5) & ($1=19730))  //change Silver+ icon to SO
				$0:=19817
			Else 
				$0:=$1  //  `Rollo 7/29/2004 - was set to 19797 - didn't exist
			End if 
		End if 
	Else 
		$0:=$1
	End if 
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("Menu ModChkIcon"; $_t_oldMethodName)