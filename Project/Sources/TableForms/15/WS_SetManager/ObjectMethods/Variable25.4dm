If (False:C215)
	//object Name: [USER]WS_SetManager.Variable25
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FindMy)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; r1; r2)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable25"; Form event code:C388)
r1:=1
r2:=0
MESSAGES OFF:C175
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Same_Process:6=True:C214; *)
QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Table_Number:8=<>DB_at_TableNamesMacro)
If (<>FindMy)
	QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
End if 
MESSAGES ON:C181

Record_BarArr
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable25"; $_t_oldMethodName)
