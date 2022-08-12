//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayvMT
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; SCPT_t_Description1; SCPT_t_Description2; SCPT_t_Description3; SCPT_t_Description4; SCPT_t_Description5; vMT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayvMT")
Case of 
	: ($1=1)
		vMT:=SCPT_t_Description1
	: ($1=2)
		vMT:=SCPT_t_Description2
	: ($1=3)
		vMT:=SCPT_t_Description3
	: ($1=4)
		vMT:=SCPT_t_Description4
	: ($1=5)
		vMT:=SCPT_t_Description5
	Else 
		//BEEP
End case 

ERR_MethodTrackerReturn("Record_PlayvMT"; $_t_oldMethodName)
