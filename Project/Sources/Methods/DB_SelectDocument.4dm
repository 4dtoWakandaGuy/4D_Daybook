//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SelectDocument
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
	//C_UNKNOWN(Allows Multiple Selection)
	//C_UNKNOWN(Can Choose FIles)
	//C_UNKNOWN(Modal_open_panel)
	//C_UNKNOWN(Treats Packages As Directories)
	ARRAY TEXT:C222($_at_SystemObjects; 0)
	C_BOOLEAN:C305(<>DB_bo_useFileOpenPlugin; $_bo_AliasSelect; $_bo_MultiFIle; $_bo_PackageOpen; $_bo_PackageSelect; $_bo_SheetWindow)
	C_LONGINT:C283($_l_Flags; $_l_index; $_l_Options; $_l_Result)
	C_POINTER:C301($_ptr_SystemPaths; $5)
	C_REAL:C285($4)
	C_TEXT:C284($_t_FileType; $_t_FolderPath; $_t_Label; $_t_Message; $_t_name; $_t_oldMethodName; $_t_PanelTitle; $_t_Path; $_t_Prompt; $_t_WindowTitle; $0)
	C_TEXT:C284($1; $2; $3; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SelectDocument")

//Gen_Alert (DB_t_ErrTrackingStack)  `26/1/2010
$_t_oldMethodName:=ERR_MethodTracker("DB_SelectDocument")
If (Count parameters:C259>=1)
	$_t_FolderPath:=$1
Else 
	$_t_FolderPath:=""
End if 
If (Count parameters:C259>=2)
	$_t_FileType:=$2
Else 
	$_t_FileType:="*"
End if 
//TRACE
If (Count parameters:C259>=3)  //note this is not the window title just the message in it..
	$_t_WindowTitle:=$3
Else 
	$_t_WindowTitle:="Select Document"
End if 
If (Count parameters:C259>=4)
	$_l_Options:=$4
Else 
	$_l_Options:=0
End if 
If (Count parameters:C259>=5)  //Note that this has to be a pointer
	$_ptr_SystemPaths:=$5
Else 
	ARRAY TEXT:C222($_at_SystemObjects; 0)
	$_ptr_SystemPaths:=->$_at_SystemObjects
End if 
<>DB_bo_useFileOpenPlugin:=False:C215

$_t_Path:=Select document:C905($_t_FolderPath; $_t_FileType; $_t_WindowTitle; $_l_Options; $_at_SystemObjects)
If ($_t_Path#"")
	$0:=document
	If (Count parameters:C259>=5)
		For ($_l_index; 1; Size of array:C274($_at_SystemObjects))
			APPEND TO ARRAY:C911($5->; $_at_SystemObjects{$_l_index})
		End for 
	End if 
Else 
	$0:=""
End if 

ERR_MethodTrackerReturn("DB_SelectDocument"; $_t_oldMethodName)