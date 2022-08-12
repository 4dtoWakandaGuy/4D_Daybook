//%attributes = {}
If (False:C215)
	//Project Method Name:      MOVE_TO_ARCHIVE
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
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MOVE_TO_ARCHIVE")
//$1 File path to move
//$2 File path where to move
//This will create folder if not found

If (Test path name:C476($1)=Is a document:K24:1)
	MOVE DOCUMENT:C540($1; $2)
End if 
ERR_MethodTrackerReturn("MOVE_TO_ARCHIVE"; $_t_oldMethodName)