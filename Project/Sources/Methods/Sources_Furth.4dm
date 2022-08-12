//%attributes = {}
If (False:C215)
	//Project Method Name:      Sources_Furth
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

$_t_oldMethodName:=ERR_MethodTracker("Sources_Furth")
//Sources - Furthers (Add Further)
CREATE RECORD:C68([ADDITIONAL_RECORD_ANALYSIS:53])
[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1:=[SOURCES:6]Source_Code:1
[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2:=[SOURCES:6]Source_Name:2
DB_SaveRecord(->[ADDITIONAL_RECORD_ANALYSIS:53])
ERR_MethodTrackerReturn("Sources_Furth"; $_t_oldMethodName)