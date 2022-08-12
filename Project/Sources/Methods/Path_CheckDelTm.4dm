//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_CheckDelTm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_VersionCalc; $_l_VersionNumber)
	C_TEXT:C284(<>SYS_t_VersionNumber; $_t_CurrentVersion; $_t_Demo; $_t_oldMethodName; $_t_PN)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_CheckDelTm")
//Path_CheckDelTmp - delete Tmp file
//See also Path_Check
If ((DB_GetModuleSettingByNUM(34))>0)
	$_t_Demo:=" Demo"
Else 
	$_t_Demo:=""
End if 
If ((DB_GetModuleSettingByNUM(1))=5)
	$_t_CurrentVersion:="Silver"+$_t_Demo
Else 
	$_t_CurrentVersion:="Gold"+$_t_Demo
End if 
Case of   //any old start numbers to identify Types
	: ($_t_CurrentVersion="Silver")
		$_l_VersionCalc:=1273
	: ($_t_CurrentVersion="Gold")
		$_l_VersionCalc:=3419
	: ($_t_CurrentVersion="Silver Demo")
		$_l_VersionCalc:=7541
	: ($_t_CurrentVersion="Gold Demo")
		$_l_VersionCalc:=5826
End case 
$_l_VersionNumber:=Num:C11(RemoveChar(Substring:C12(<>SYS_t_VersionNumber; 1; 3); "."))  //number from first 3 chars of version eg 4.0 = 40
$_t_PN:="M"+String:C10($_l_VersionCalc*$_l_VersionNumber)+".TMP"  //& multiply the 2 to make the file name to check
ON ERR CALL:C155("Remote_Err")
vDoc:=DB_OpenDocument($_t_PN)
If (OK=1)
	CLOSE DOCUMENT:C267(vDoc)
	DELETE DOCUMENT:C159($_t_PN)
End if 
ON ERR CALL:C155("")
ERR_MethodTrackerReturn("Path_CheckDelTm"; $_t_oldMethodName)
