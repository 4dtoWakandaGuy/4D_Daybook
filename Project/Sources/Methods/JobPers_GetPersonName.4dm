//%attributes = {}
If (False:C215)
	//Project Method Name:      JobPers_GetPersonName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   03/06/2010 12:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers_GetPersonName")
If ([JOB PERSONNEL:48]X_JobPersonnelContactID:13#0)
	If ([CONTACTS:1]x_ID:33#[JOB PERSONNEL:48]X_JobPersonnelContactID:13)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[JOB PERSONNEL:48]X_JobPersonnelContactID:13)
	End if 
	$0:=[CONTACTS:1]Contact_Name:31
Else 
	If ([JOB PERSONNEL:48]Person:3#"")
		If ([PERSONNEL:11]Initials:1#[JOB PERSONNEL:48]Person:3)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[JOB PERSONNEL:48]Person:3)
		End if 
		$0:=[PERSONNEL:11]Name:2
	Else 
		$0:=""
	End if 
End if 
ERR_MethodTrackerReturn("JobPers_GetPersonName"; $_t_oldMethodName)