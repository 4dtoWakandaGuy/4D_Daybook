//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SelectFolder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Can Choose Directories)
	//C_UNKNOWN(Modal_open_panel)
	ARRAY TEXT:C222($_at_FileSystemObjects; 0)
	C_BOOLEAN:C305(<>DB_bo_useFileOpenPlugin)
	C_LONGINT:C283($_l_Flags; $_l_Result)
	C_TEXT:C284($_t_Label; $_t_Message; $_t_Name; $_t_oldMethodName; $_t_Path; $_t_Prompt; $_t_WindowTItle; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SelectFolder")
<>DB_bo_useFileOpenPlugin:=False:C215
If (<>DB_bo_useFileOpenPlugin)
	If (Count parameters:C259>=2)
		$_t_WindowTItle:=$2
	Else 
		$_t_WindowTItle:="Choose a folder"
	End if 
	$_t_Prompt:="Select"
	$_t_Message:=$1
	$_t_Label:="OK OK"
	If (Count parameters:C259>=3)
		$_t_Name:="default file name"
	End if 
	
	//$_l_Flags:=Allows Multiple Selection  | Treats Packages As Directories  | Shows Hidden Files  | Can Choose FIles  | Can Choose Directories
	//$_l_Flags:=‘k13004;4‘
	
	$_l_Flags:=0
	ARRAY TEXT:C222($_at_FileSystemObjects; 0)
	$_t_SelectedPath:=Select folder:C670($_t_WindowTItle; $_t_Path)
	
	//$_l_Result:=‘13004;1‘($_t_Path; $_t_WindowTItle; $_t_Prompt; $_t_Message; $_t_Label; $_t_Name; $_l_Flags; $_at_FileSystemObjects)
	If ($_t_SelectedPath#"")
		$0:=$_t_SelectedPath
		OK:=1
	Else 
		$0:=""
		OK:=0
	End if 
	
Else 
	$0:=Select folder:C670($1)
	
	
End if 
ERR_MethodTrackerReturn("DB_SelectFolder"; $_t_oldMethodName)