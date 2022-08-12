If (False:C215)
	//Table Form Method Name: [PERSONNEL_DIARY_ACCESS]Access_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/08/2009 20:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL_DIARY_ACCESS].Access_Sub"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Display Detail:K2:22)
	
	
	[PERSONNEL_DIARY_ACCESS:149]Person:1:=Uppercase:C13([PERSONNEL_DIARY_ACCESS:149]Person:1)
End if 
ERR_MethodTrackerReturn("FM [PERSONNEL_DIARY_ACCESS].Access_Sub"; $_t_oldMethodName)
