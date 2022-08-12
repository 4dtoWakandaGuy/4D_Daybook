//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_MacRec
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
	C_PICTURE:C286($pict)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_MacRec")
//Tel_MacRec
PLUGCALL_Telephony("PicRecord"; 1)
ERR_MethodTrackerReturn("Tel_MacRec"; $_t_oldMethodName)