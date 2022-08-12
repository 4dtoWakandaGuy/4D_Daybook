//%attributes = {}
If (False:C215)
	//Project Method Name:      DocumentNamecreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DocumentCount)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DocumentNamecreate")
// DocumentNameCreate
//` Creates a unique document name with a number appended
// 13/05/02 pb
// parameters: $1=the base doc name


$_l_DocumentCount:=1
$_t_DocumentName:=$1+String:C10($_l_DocumentCount)+".txt"
While (Test path name:C476($_t_DocumentName)=Is a document:K24:1)
	IDLE:C311  // 7/04/03 pb
	$_l_DocumentCount:=$_l_DocumentCount+1
	$_t_DocumentName:=$1+String:C10($_l_DocumentCount)+".txt"
End while 
$0:=$_t_DocumentName
ERR_MethodTrackerReturn("DocumentNamecreate"; $_t_oldMethodName)