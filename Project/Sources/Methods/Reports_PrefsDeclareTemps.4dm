//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsDeclareTemps
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsDeclareTemps
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(SR_at_PreferencesName;0)
	//Array TEXT(SR_at_TempTextOfBLOB;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsDeclareTemps")

//added 28/11/08 v631b120i -kmw



If ((Type:C295(SR_at_TempTextOfBLOB)=Is undefined:K8:13) | (Is a variable:C294(->SR_at_TempTextOfBLOB)=False:C215))
	ARRAY TEXT:C222(SR_at_TempTextOfBLOB; 0)
End if 
If ((Type:C295(SR_at_PreferencesName)=Is undefined:K8:13) | (Is a variable:C294(->SR_at_PreferencesName)=False:C215))
	ARRAY TEXT:C222(SR_at_PreferencesName; 0)
End if 
ERR_MethodTrackerReturn("Reports_PrefsDeclareTemps"; $_t_oldMethodName)