//%attributes = {}
If (False:C215)
	//Project Method Name:      FileLaunch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 15:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Error)
	C_TEXT:C284($_t_Converted; $_t_DocumentPath; $_t_DocumentPath2; $_t_oldMethodName; $_t_OriginalPath; $_t_SepChar; $1)
End if 

//Code Starts Here




$_t_oldMethodName:=ERR_MethodTracker("FileLaunch")
//bwalia 20061007 opens the file for which path is passed as $1, if file launched OK $0 is true else false

If (Count parameters:C259>0)
	$_t_DocumentPath:=$1
Else 
	$_t_DocumentPath:=""
End if 

$_l_Error:=-1  //default to the


Case of 
	: ($_t_DocumentPath="")
		//invalid file path
	: (Test path name:C476($_t_DocumentPath)#Is a document:K24:1)
		
		//no file to launch
		
	: (Is macOS:C1572)  //mac just launch file using AP Sublaunch
		
		$_t_DocumentPath2:=$_t_DocumentPath
		//$tempcreator:=_o_Document creator($_t_DocumentPath2)
		//$temptype:=_o_Document type($_t_DocumentPath2)
		$_t_OriginalPath:=$_t_DocumentPath2
		$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; ":"; "/")
		$_t_OriginalPath:=Replace string:C233($_t_OriginalPath; " "; "\\ ")
		$_t_Converted:="/Volumes/"+$_t_OriginalPath
		$_t_DocumentPath2:=$_t_Converted
		$_t_SepChar:="\""
		$_t_DocumentPath2:=$_t_SepChar+$_t_DocumentPath2+$_t_SepChar
		LAUNCH EXTERNAL PROCESS:C811("open "+$_t_DocumentPath2)
		//$_l_Error:=AP Sublaunch ($_t_DocumentPath)
		//LAUNCH EXTERNAL PROCESS($_t_DocumentPath)
		//$_l_Error:=@XX_AP Sublaunch ($_t_DocumentPath)
		//LAUNCH EXTERNAL PROCESS($_t_DocumentPath)
		
	Else   //it's a PC open file using windows explorer
		
		//$_l_Error:=AP ShellExecute ("C:\\WINDOWS\\explorer.exe";0;$_t_DocumentPath)
		SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
		LAUNCH EXTERNAL PROCESS:C811("cmd.exe /C start \"\" \""+$_t_DocumentPath2+"\"")
		
		//$_l_Error:=AP ShellExecute ($_t_DocumentPath;0)
End case 

$0:=($_l_Error=0)
ERR_MethodTrackerReturn("FileLaunch"; $_t_oldMethodName)


//Nigel Greenlee21/04/2010 14:31
//Nigel Greenlee21/04/2010 14:53
//Nigel Greenlee21/04/2010 14:56
//Nigel Greenlee21/04/2010 15:07
//Nigel Greenlee20/11/2012 14:34 v7.0.0/1
ERR_MethodTrackerReturn("FileLaunch"; $_t_oldMethodName)