//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_FileP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 13:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; vLongDate)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_FileP")
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([DIARY:12])
End if 
Start_ProcMail
Start_ProcDry
vDate:=<>DB_d_CurrentDate
vUser2:=<>PER_t_CurrentUserInitials
Long_Date2
vLongDate:=vLongDate+"  "+Lowercase:C14(String:C10(Current time:C178; 5))
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Diary_SV
End if 
ERR_MethodTrackerReturn("Diary_FileP"; $_t_oldMethodName)