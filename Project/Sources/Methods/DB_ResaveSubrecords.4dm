//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ResaveSubrecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:54:01If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ResaveSubrecords")
ERR_MethodTrackerReturn("DB_ResaveSubrecords"; $_t_oldMethodName)