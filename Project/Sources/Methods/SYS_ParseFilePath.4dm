//%attributes = {}
If (False:C215)
	//Project Method Name:      SYS_ParseFilePath
	//------------------ Method Notes ------------------
	//© 1998 Sextant Technologies, Inc.
	//Method:  _SUM_ParseFilePath
	//Type:  Sextant Shell
	//Purpose:  Parses a full Path Name
	//Inputs:
	//$1:  String (10) - What to Return
	//$2:  Text - Path Name
	//$3:  String (1) - Override Separator Character to Use
	//Outputs:
	//$0:  Text - Parsed Path Name
	//Modification History:
	
	//This method is used to parse a "fully qualified file path name."  It can
	//be used to either get the Directory, or the Document name, specified in $2.
	//$1 takes two values, "Directory" and "Filename" - depending on what you
	//want parsed out of $2, which *should* be a Full Path Name.
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; $3; $_t_DoWhat; $_t_DocumentPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYS_ParseFilePath")


If (Count parameters:C259>1)
	
	
	
	$_t_DoWhat:=$1
	$_t_DocumentPath:=$2
	$0:=""
	
	//This method makes use of the <>_sPlatform variable to determine what character
	//to use for the directory separator
	
	Case of 
		: (Count parameters:C259=3)
			//Folder separator:=$3
		Else 
			//Folder separator:=DB_DirSymbol 
	End case 
	
	//Both loops go backward through $_t_DocumentPath, to find the *last* instance of
	//the Separator character.  Then, if we are looking for the Path, return
	//everything BEFORE the character.  If we're looking for the Filename, return
	//everything AFTER the character.
	
	Case of 
			
		: ($_t_DoWhat="Directory")
			
			For ($_l_Index; Length:C16($_t_DocumentPath); 1; -1)
				If ($_t_DocumentPath[[$_l_Index]]=Folder separator:K24:12)
					$0:=Substring:C12($_t_DocumentPath; 1; $_l_Index)
					$_l_Index:=0  //eject out of loop
				End if 
			End for 
			
		: ($_t_DoWhat="Filename")
			
			$0:=$_t_DocumentPath  //could be we were passed just the file name
			
			For ($_l_Index; Length:C16($_t_DocumentPath); 1; -1)
				If ($_t_DocumentPath[[$_l_Index]]=Folder separator:K24:12)
					$0:=Substring:C12($_t_DocumentPath; $_l_Index+1)
					$_l_Index:=0
				End if 
			End for 
			
			
			
			
			
		Else 
			
			//_DLG_ALERT_MESSAGE("Unexpected Action.";$_t_DoWhat;True)
			
	End case 
	
Else 
	
	//  _DLG_ALERT_MESSAGE("ae";"bp";True)
	
End if 
//end



//end
ERR_MethodTrackerReturn("SYS_ParseFilePath"; $_t_oldMethodName)