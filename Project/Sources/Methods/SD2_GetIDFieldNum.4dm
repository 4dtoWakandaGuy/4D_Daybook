//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetIDFieldNum
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
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetIDFieldNum")
//This method returns the field number for the table passed in $1 that contains the numeric ID
//Note this is similar to AA_CheckFileID except that it returns the field number not a boolean
ERR_MethodTrackerReturn("SD2_GetIDFieldNum"; $_t_oldMethodName)