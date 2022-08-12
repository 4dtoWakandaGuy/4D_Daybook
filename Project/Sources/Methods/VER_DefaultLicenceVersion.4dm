//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      VER_DefaultLicenceVersion
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 16:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_DefaultLicenceVersion")
//$0:="5.0.000"
$0:="7.0.000"  //set default to 5.3 03/09/08 -kmw
ERR_MethodTrackerReturn("VER_DefaultLicenceVersion"; $_t_oldMethodName)