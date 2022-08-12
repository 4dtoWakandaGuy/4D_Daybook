//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_fInsertActionDateandtime
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_fInsertActionDateandtime")

//This method is intended as a function call for the 4D write area on a Diary entry area
//it will return(in string format!) the Date and time for the diary entry) as a refe
ERR_MethodTrackerReturn("SD2_fInsertActionDateandtime"; $_t_oldMethodName)