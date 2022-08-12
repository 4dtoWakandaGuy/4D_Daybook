//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      In ButtSilver
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284(<>UserAdd; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In ButtSilver")
$0:=((DB_GetModuleSettingByNUM(1)=5) & (<>UserAdd#"@XSB@"))
ERR_MethodTrackerReturn("In ButtSilver"; $_t_oldMethodName)