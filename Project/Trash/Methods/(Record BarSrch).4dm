//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_BarSrch
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
	C_BOOLEAN:C305(<>FindMy)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; s1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarSrch")
//Record_BarSrch
If (s1=1)
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Same_Process:6=True:C214; *)
	QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Table_Number:8=<>DB_at_TableNamesMacro)
Else 
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Same_Process:6=False:C215; *)
	QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Table_Number:8=<>DB_at_TableNamesMacro; *)
	QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#"©@")
End if 
If (<>FindMy)
	QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
End if 
Record_BarArr
ERR_MethodTrackerReturn("Record_BarSrch"; $_t_oldMethodName)