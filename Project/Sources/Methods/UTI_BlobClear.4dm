//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_BlobClear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($i)
	C_POINTER:C301($BlobPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_BlobClear")
//Method: UTI_BlobClear
//
//Purpose: Clears BLObs passed as pointers
//
//$1...$n: Pointer(s) to BLObs
//
If (Count parameters:C259>=1)
	For ($i; 1; Count parameters:C259)
		$BlobPtr:=${$i}
		SET BLOB SIZE:C606($BlobPtr->; 0)
	End for 
End if 
//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_BlobClear"; $_t_oldMethodName)