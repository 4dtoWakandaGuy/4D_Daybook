//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InBTech
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Diary_InBTech")
[DIARY:12]Diary_Code:3:=[SERVICE_CALLS:20]Call_Code:4+String:C10(Gen_Code(3; ->[DIARY:12]Diary_Code:3; [SERVICE_CALLS:20]Call_Code:4))
[DIARY:12]Company_Code:1:=[SERVICE_CALLS:20]Company_Code:1
RELATE ONE:C42([DIARY:12]Company_Code:1)
[DIARY:12]Contact_Code:2:=[SERVICE_CALLS:20]Contact_Code:2
[DIARY:12]Person:8:=[SERVICE_CALLS:20]Person:11
ERR_MethodTrackerReturn("Diary_InBTech"; $_t_oldMethodName)