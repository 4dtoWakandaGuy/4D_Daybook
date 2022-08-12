//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Developer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Testing; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Developer")

$_bo_Testing:=Test path name:C476(Get 4D folder:C485+"dbdeveloper.txt")=Is a document:K24:1
If (Not:C34($_bo_Testing))
	$_bo_Testing:=Test path name:C476(Get 4D folder:C485+"dbdeveloper")=Is a document:K24:1
End if 

$0:=$_bo_Testing
ERR_MethodTrackerReturn("DB_Developer"; $_t_oldMethodName)