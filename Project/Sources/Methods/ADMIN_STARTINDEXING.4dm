//%attributes = {}
If (False:C215)
	//Project Method Name:      ADMIN_STARTINDEXING
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IndexProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ADMIN_STARTINDEXING")
$_l_IndexProcess:=Execute on server:C373("Set_INDEX_PRIORITIES"; 32000; "OPTIMISE  INDEXES(90%)"; 90)  //this takes a long time!
ERR_MethodTrackerReturn("ADMIN_STARTINDEXING"; $_t_oldMethodName)
