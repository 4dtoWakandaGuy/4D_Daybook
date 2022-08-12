//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CreateDocument
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Can Create Directories)
	//C_UNKNOWN(Floating Panel)
	//C_UNKNOWN(Modal_save_panel)
	//C_UNKNOWN(Works When Modal)
	ARRAY TEXT:C222($_at_SystemObjects; 0)
	C_BOOLEAN:C305(<>DB_bo_useFileOpenPlugin; $_bo_CreateDocument; $4)
	C_LONGINT:C283($_l_Flages; $_l_Result)
	C_POINTER:C301($5)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentType; $_t_Label; $_t_Message; $_t_Name; $_t_oldMethodName; $_t_SavePrompt; $_t_Title; $1; $2; $3)
	C_TEXT:C284($6)
	C_TIME:C306($0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CreateDocument")
//Here is an extra line

If (Count parameters:C259>=1)
	$_t_DocumentName:=$1
	$_t_DocumentType:=""
	If (Count parameters:C259>=2)  //this is not relevant now
		$_t_DocumentType:=$2
	End if 
	If (Count parameters:C259>=3)
		$_t_Message:=$3
	Else 
		$_t_Message:="Save Document"
	End if 
	If (Count parameters:C259>=5)
		$_bo_CreateDocument:=$4
	Else 
		$_bo_CreateDocument:=True:C214
	End if 
	$_t_Label:="Document"
	$_t_Title:="Save"
	$_t_SavePrompt:="Save"
	
	
	$0:=Create document:C266($_t_DocumentName)
	
	
	
End if 
ERR_MethodTrackerReturn("DB_CreateDocument"; $_t_oldMethodName)