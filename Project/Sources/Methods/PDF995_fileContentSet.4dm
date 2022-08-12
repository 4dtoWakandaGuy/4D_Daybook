//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_fileContentSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($_ptr_DocumentContext; $2)
	C_TEXT:C284($_t_DocumentContents; $_t_DocumentPath; $_t_oldMethodName; $1)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_fileContentSet")

If (Count parameters:C259>0)
	$_t_DocumentPath:=$1
Else 
	$_t_DocumentPath:=DOCUMENT
End if 
//
If (Count parameters:C259>1)
	$_ptr_DocumentContext:=$2
Else 
	$_ptr_DocumentContext:=$_ptr_DocumentContext
End if 

$_t_DocumentContents:=""
$0:=False:C215

If (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
	$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentPath)
Else 
	$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentPath)
End if 

If (OK=1)
	If (Not:C34(Is nil pointer:C315($_ptr_DocumentContext)))  //if not content is provided a blank empty doc is created
		$_t_DocumentContents:=$_ptr_DocumentContext->
		SEND PACKET:C103($_ti_DocumentRef; $_t_DocumentContents)
		$0:=True:C214
	End if 
End if 
CLOSE DOCUMENT:C267($_ti_DocumentRef)

ERR_MethodTrackerReturn("PDF995_fileContentSet"; $_t_oldMethodName)
