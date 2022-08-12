//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_CopyFilesUsingOS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 17:59`Method: DOC_CopyFilesUsingOS
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CopyFolder; $_bo_OverWrite; $3; $4)
	C_TEXT:C284($_t_DestinationPath; $_t_DestinationPath2; $_t_oldMethodName; $_t_OSAScript; $_t_SourcePath; $_t_WinScript; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_CopyFilesUsingOS")

//This method will create a shell script(on OSX) to copy a file from the path($1) to the path($2)
If (Count parameters:C259>=2)
	$_t_SourcePath:=$1
	$_t_DestinationPath:=$2
	If (Is macOS:C1572)
		
		
		//Example 1 via applescript
		If (False:C215)
			$_t_DestinationPath2:=PathFromPathName($_t_DestinationPath)
			$_t_OSAScript:="tell application"+Char:C90(34)+"Finder"+Char:C90(34)+Char:C90(13)+" duplicate file "+Char:C90(34)+$_t_SourcePath+Char:C90(34)+" to "+Char:C90(34)+$_t_DestinationPath2+Char:C90(34)+Char:C90(13)+" end tell"
			LAUNCH EXTERNAL PROCESS:C811("OSASCRIPT"; $_t_OSAScript)
			//2 via shell
		End if 
		$_t_SourcePath:=$1
		$_t_DestinationPath:=$2
		$_t_SourcePath:=Convert path system to POSIX:C1106($_t_SourcePath)
		$_t_DestinationPath:=Convert path system to POSIX:C1106($_t_DestinationPath)
		If (Count parameters:C259>=3)
			$_bo_OverWrite:=$3
		Else 
			$_bo_OverWrite:=False:C215
		End if 
		If (Count parameters:C259>=4)
			$_bo_CopyFolder:=$4
		Else 
			$_bo_CopyFolder:=False:C215
		End if 
		If ($_bo_OverWrite)
			If ($_bo_CopyFolder)
				$_t_OSAScript:="CP  -fR "+$_t_SourcePath+" "+$_t_DestinationPath
				
			Else 
				$_t_OSAScript:="CP  -f "+$_t_SourcePath+" "+$_t_DestinationPath
			End if 
		Else 
			If ($_bo_CopyFolder)
				$_t_OSAScript:="CP  -fR "+$_t_SourcePath+" "+$_t_DestinationPath
			Else 
				$_t_OSAScript:="CP  "+$_t_SourcePath+" "+$_t_DestinationPath
			End if 
		End if 
		//$_t_OSAScript:="CP  -f"+$_t_SourcePath+" "+$_t_DestinationPath
		LAUNCH EXTERNAL PROCESS:C811($_t_OSAScript)
		
	Else 
		$_t_WinScript:="copy "+Char:C90(34)+$_t_SourcePath+Char:C90(34)+" "+Char:C90(34)+$_t_DestinationPath
		LAUNCH EXTERNAL PROCESS:C811($_t_WinScript)
	End if 
End if 
ERR_MethodTrackerReturn("DOC_CopyFilesUsingOS"; $_t_oldMethodName)