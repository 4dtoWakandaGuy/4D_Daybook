//%attributes = {}
If (False:C215)
	//Project Method Name:      DirectoryFromPathName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/08/2012 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_BuildDirectory; $_t_Directory; $_t_oldMethodName; $_t_Path; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DirectoryFromPathName")

If ($1#"")
	$_t_Path:=$1
	If ($_t_Path[[Length:C16($_t_Path)]]=Folder separator:K24:12)
		$_t_Path:=Substring:C12($_t_Path; 1; Length:C16($_t_Path)-1)
	End if 
	$_t_Directory:=""
	$_t_BuildDirectory:=""
	Repeat 
		If (Length:C16($_t_Path)>0)
			If ($_t_Path[[Length:C16($_t_Path)]]=Folder separator:K24:12)
				$_t_Directory:=$_t_BuildDirectory
			Else 
				$_t_BuildDirectory:=$_t_Path[[Length:C16($_t_Path)]]+$_t_BuildDirectory
				$_t_Path:=Substring:C12($_t_Path; 1; Length:C16($_t_Path)-1)
			End if 
		End if 
	Until ($_t_Directory#"") | ($_t_Path="")
	$0:=$_t_Directory
	
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("DirectoryFromPathName"; $_t_oldMethodName)