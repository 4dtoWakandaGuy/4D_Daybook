//%attributes = {}
If (False:C215)
	//Project Method Name:      SelectFolderOnServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $_l_Process; DOC_l_RetreivedDocument)
	C_TEXT:C284($_t_oldMethodName; DOC_t_RetreivedDocumentpath)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SelectFolderOnServer")

// SelectFolderOnServer
// 18/10/03 pb
// 'cos the picture pathnmae must be server-relevent
// $1 = the process number of the process that started this one

//TRACE
$_l_Process:=$1
DOC_l_RetreivedDocument:=0
$_t_oldMethodName:=ERR_MethodTracker("SelectFolderOnServer"; Form event code:C388)
DOC_t_RetreivedDocumentpath:=""
DOC_t_RetreivedDocumentpath:=DB_SelectFolder("Select directory containing images:")
If (OK=0)
	DOC_t_RetreivedDocumentpath:="stop"
End if 
While (DOC_l_RetreivedDocument=0)
	DelayTicks(10)
End while 
ERR_MethodTrackerReturn("SelectFolderOnServer"; $_t_oldMethodName)