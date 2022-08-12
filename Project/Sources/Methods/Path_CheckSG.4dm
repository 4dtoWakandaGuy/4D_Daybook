//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_CheckSG
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
	ARRAY TEXT:C222($_at_Versions; 0)
	C_BOOLEAN:C305($_bo_VersionOK)
	C_LONGINT:C283($_l_BaseNumber; $_l_Version)
	C_TEXT:C284(<>SYS_t_PathVersion; <>SYS_t_VersionNumber; $_t_DocumentName; $_t_oldMethodName)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_CheckSG")
//Path_CheckSG - Silver/Gold check only - for Licence No window
ARRAY TEXT:C222($_at_Versions; 1)
ON ERR CALL:C155("Remote_Err")

//Silver
$_l_BaseNumber:=1273
$_l_Version:=Num:C11(RemoveChar(Substring:C12(<>SYS_t_VersionNumber; 1; 3); "."))  //number from first 3 chars of version eg 4.0 = 40
$_t_DocumentName:="M"+String:C10($_l_BaseNumber*$_l_Version)+".TMP"  //& multiply the 2 to make the file name to check
vDoc:=DB_OpenDocument($_t_DocumentName)
If (OK=1)
	$_bo_VersionOK:=True:C214
	$_at_Versions{1}:="Silver"
	ARRAY TO LIST:C287($_at_Versions; "Version")
	CLOSE DOCUMENT:C267(vDoc)
	DELETE DOCUMENT:C159($_t_DocumentName)
Else 
	$_bo_VersionOK:=False:C215
End if 

If ($_bo_VersionOK=False:C215)
	//Gold
	$_l_BaseNumber:=3419
	$_l_Version:=Num:C11(RemoveChar(Substring:C12(<>SYS_t_VersionNumber; 1; 3); "."))  //number from first 3 chars of version eg 4.0 = 40
	$_t_DocumentName:="M"+String:C10($_l_BaseNumber*$_l_Version)+".TMP"  //& multiply the 2 to make the file name to check
	vDoc:=DB_OpenDocument($_t_DocumentName)
	If (OK=1)
		$_bo_VersionOK:=True:C214
		$_at_Versions{1}:="Gold"
		ARRAY TO LIST:C287($_at_Versions; "Version")
		CLOSE DOCUMENT:C267(vDoc)
		DELETE DOCUMENT:C159($_t_DocumentName)
	Else 
		$_bo_VersionOK:=False:C215
	End if 
	
	If ($_bo_VersionOK=False:C215)
		//Silver Demo
		$_l_BaseNumber:=7541
		$_l_Version:=Num:C11(RemoveChar(Substring:C12(<>SYS_t_VersionNumber; 1; 3); "."))  //number from first 3 chars of version eg 4.0 = 40
		$_t_DocumentName:="M"+String:C10($_l_BaseNumber*$_l_Version)+".TMP"  //& multiply the 2 to make the file name to check
		vDoc:=DB_OpenDocument($_t_DocumentName)
		If (OK=1)
			$_bo_VersionOK:=True:C214
			$_at_Versions{1}:="Silver Demo"
			ARRAY TO LIST:C287($_at_Versions; "Version")
			CLOSE DOCUMENT:C267(vDoc)
			DELETE DOCUMENT:C159($_t_DocumentName)
		Else 
			$_bo_VersionOK:=False:C215
		End if 
	End if 
	
	If ($_bo_VersionOK=False:C215)
		//Gold Demo
		$_l_BaseNumber:=5826
		$_l_Version:=Num:C11(RemoveChar(Substring:C12(<>SYS_t_VersionNumber; 1; 3); "."))  //number from first 3 chars of version eg 4.0 = 40
		$_t_DocumentName:="M"+String:C10($_l_BaseNumber*$_l_Version)+".TMP"  //& multiply the 2 to make the file name to check
		vDoc:=DB_OpenDocument($_t_DocumentName)
		If (OK=1)
			$_bo_VersionOK:=True:C214
			$_at_Versions{1}:="Gold Demo"
			ARRAY TO LIST:C287($_at_Versions; "Version")
			CLOSE DOCUMENT:C267(vDoc)
			DELETE DOCUMENT:C159($_t_DocumentName)
		Else 
			$_bo_VersionOK:=False:C215
		End if 
	End if 
End if 
ON ERR CALL:C155("")

If ($_bo_VersionOK=False:C215)
	LIST TO ARRAY:C288("Version"; $_at_Versions)
End if 
<>SYS_t_PathVersion:=$_at_Versions{1}
ERR_MethodTrackerReturn("Path_CheckSG"; $_t_oldMethodName)
