If (False:C215)
	//object Name: [USER]Email_Choice.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DOC_at_EmailChoices;0)
	C_LONGINT:C283($_l_event; DOC_l_CallBack; DOC_l_CallEvent; EmailChoiceProc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Email_Choice.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DOC_l_CallBack>0)
			SET PROCESS VARIABLE:C370(DOC_l_CallBack; DOC_l_CallEvent; DOC_at_EmailChoices)
			EmailChoiceProc:=0
			SET PROCESS VARIABLE:C370(DOC_l_CallBack; EmailChoiceProc; EmailChoiceProc)
			POST OUTSIDE CALL:C329(DOC_l_Callback)
		End if 
		CANCEL:C270
End case 
ERR_MethodTrackerReturn("OBJ [USER].Email_Choice.Variable1"; $_t_oldMethodName)
