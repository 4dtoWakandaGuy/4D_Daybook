//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsInitTemps
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsInitTemps
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_PreferencesName;0)
	//ARRAY TEXT(SR_at_TempTextOfBLOB;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsInitTemps")

//added 28/11/08 v631b120i -kmw



ARRAY TEXT:C222(SR_at_TempTextOfBLOB; 0)

ARRAY TEXT:C222(SR_at_PreferencesName; 0)
ERR_MethodTrackerReturn("Reports_PrefsInitTemps"; $_t_oldMethodName)