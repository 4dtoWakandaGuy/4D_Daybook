If (False:C215)
	//object Name: [USER]User_In.Check Box17
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
	C_BOOLEAN:C305(JC_bo_PostWIP)
	C_LONGINT:C283(SYS_cb_PostActualTime; SYS_cb_PostWIP)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box17"; Form event code:C388)
If (([USER:15]WIP TR Trans:200="") | ([USER:15]WIP CI Trans:201="") | ([USER:15]WIP TRWO Trans:202="") | ([USER:15]WIP CIWO Trans:203=""))
	SYS_cb_PostWIP:=0
	Gen_Alert("Sorry, to set up WIP postings you must first assign WIP transaction types."; "OK")
Else 
	If (SYS_cb_PostWIP=1) & (SYS_cb_PostActualTime=0)
		SYS_cb_PostWIP:=0
		Gen_Alert("Sorry, Jobs can't be set to allow WIP posts if they have not also been set to all"+"ow Actu"+"al Time_Posts."; "OK")
	End if 
	
End if 

If (SYS_cb_PostWIP=1)
	JC_bo_PostWIP:=True:C214
Else 
	JC_bo_PostWIP:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box17"; $_t_oldMethodName)
