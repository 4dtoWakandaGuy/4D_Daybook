//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SequencesCopyRelations
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

$_t_oldMethodName:=ERR_MethodTracker("SD_SequencesCopyRelations")
//this method will get the people attached
// to the old diary item and attach them to the new
ERR_MethodTrackerReturn("SD_SequencesCopyRelations"; $_t_oldMethodName)