//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAdd; vAdd2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PP1")
//Gen_PP1
If (Modified record:C314($1->))
	DB_SaveRecord($1)
End if 
COPY NAMED SELECTION:C331($1->; $2)
ONE RECORD SELECT:C189($1->)
FIRST RECORD:C50($1->)
vAdd2:=vAdd
ERR_MethodTrackerReturn("Gen_PP1"; $_t_oldMethodName)