//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetFilePath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Ticks)
	C_TEXT:C284($_t_CurrentActiveDirectory; Folder separator:K24:12; $_t_DocumentName; $_t_DocumentPath; $_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetFilePath")
//this sets the file path according to the platform
//it also test if the directory exists and creates it
$0:=$2
If ($1="")
	$_t_CurrentActiveDirectory:=Get 4D folder:C485
Else 
	$_t_CurrentActiveDirectory:=$1
End if 

//TRACE



//Folder separator:=DB_DirSymbol 

$0:=""

Case of   //C
	: (Application type:C494=4)  //4D Client`C
		$_t_DocumentPath:=DS_GetDocumentFolder($_t_CurrentActiveDirectory)
	Else 
		//single user
		$_t_DocumentPath:=$_t_CurrentActiveDirectory
		If ($_t_DocumentPath[[Length:C16($_t_DocumentPath)]]=Folder separator:K24:12)
			$_t_DocumentPath:=Substring:C12($_t_DocumentPath; 1; Length:C16($_t_DocumentPath)-1)
		End if 
		
End case 

If ($2#"")
	$_t_DocumentName:=$2
Else 
	$_t_DocumentName:="Temp.txt"
End if 
$0:=$_t_DocumentPath+Folder separator:K24:12+$_t_DocumentName
ERR_MethodTrackerReturn("DM_SetFilePath"; $_t_oldMethodName)