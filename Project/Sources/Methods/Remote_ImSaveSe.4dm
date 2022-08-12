//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImSaveSe
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
	C_BOOLEAN:C305($2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ImSaveSe")
DB_SaveRecord($1)
ONE RECORD SELECT:C189($1->)
FIRST RECORD:C50($1->)
If ($2)
	ADD TO SET:C119($1->; "Extra")
Else 
	ADD TO SET:C119($1->; "Master")
End if 
ERR_MethodTrackerReturn("Remote_ImSaveSe"; $_t_oldMethodName)