//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_DisButt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:58:48If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_DisButt")
If ((DB_GetModuleSettingByNUM($1))<2)
	OBJECT SET ENABLED:C1123($2->; False:C215)
	//_O_DISABLE BUTTON($2->)
Else 
	OBJECT SET ENABLED:C1123($2->; True:C214)
	//_O_ENABLE BUTTON($2->)
End if 
ERR_MethodTrackerReturn("Gen_DisButt"; $_t_oldMethodName)