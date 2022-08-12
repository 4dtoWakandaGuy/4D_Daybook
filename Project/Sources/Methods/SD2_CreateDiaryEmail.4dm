//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_CreateDiaryEmail
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
	C_BOOLEAN:C305($_bo_RunInNewProcess; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SD2_CreateDiaryEmail")

//SD2_CopyDiaryEmail added 08/07/08 by kmw

//Called from diary/email function when a User_Modifies/resends a previously sent email.

//Nigel and my idea is that (until we get the workflow working correctly) that when a User_Modifies/resends a previously sent email we will copy the existing email info on a Diary_Out into its OWN "EMAIL" action code diary (or whatever they've specified as being email action code).

//Doing it inside a new process was suggested by Nigel (if we created the email in the current process he was concerned we could lose the diary pointer)
//...The disadvantage is that if the original diary item is being edited or created within a transaction  and the user cancels the transaction after editing an already sent email that the the email will get duplicated out into its own diary item but ALSO still remain in the original diary (according to Nigel Diary_Inside a tramsaction can happen for instance if the diary is created/edited via something like the purchase orders functionality)

$_bo_RunInNewProcess:=$1  //Pass true in First_Parameter to make this create the eMail_Diary item in a new process, FALSE to have it run in current process
//
//C_STRING(19

$_bo_RunInNewProcess:=$1

If ($_bo_RunInNewProcess)
	//New process("SD2_CreateDiaryEmail";256000;"SD2_CreateDiaryEmail";False)  `Re-run this method in a new process and tell it not to re-run itself in a new process a second time (which would lead to infinite recursive new process calls which would be bad)
Else 
	//actual code
	
End if 
ERR_MethodTrackerReturn("SD2_CreateDiaryEmail"; $_t_oldMethodName)
