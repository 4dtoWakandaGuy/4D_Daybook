If (False:C215)
	//object Name: [USER]User_In.Check Box16
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
	C_BOOLEAN:C305(JC_bo_PostActualTime; JC_bo_PostWIP)
	C_LONGINT:C283(SYS_cb_PostActualTime; SYS_cb_PostWIP)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box16"; Form event code:C388)
If (SYS_cb_PostWIP=1) & (SYS_cb_PostActualTime=0)
	SYS_cb_PostWIP:=0
End if 

If (SYS_cb_PostWIP=1)
	JC_bo_PostWIP:=True:C214
Else 
	JC_bo_PostWIP:=False:C215
End if 

If (SYS_cb_PostActualTime=1)
	JC_bo_PostActualTime:=True:C214
Else 
	JC_bo_PostActualTime:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box16"; $_t_oldMethodName)
