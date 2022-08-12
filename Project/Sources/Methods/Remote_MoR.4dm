//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_MoR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/10/2011 14:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Unload)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount)
	C_TEXT:C284(<>OfficeCode; <>SYS_t_MainorRemote; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_MoR")
While (<>SYS_t_MainorRemote="")
	Gen_Confirm("Are you a Main System User"+Char:C90(13)+"or a Remote User?"+Char:C90(13)+Char:C90(13)+"Ask your System Administrator if unsure"; "Main"; "Remote")
	READ WRITE:C146([USER:15])
	$_bo_Unload:=(Records in selection:C76([USER:15])=0)
	If (<>SYS_l_LoggedInaccount=0)
		QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
	Else 
		QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
	End if 
	
	LOAD RECORD:C52([USER:15])
	If (OK=1)
		Are_You_Sure
		If (OK=1)
			[USER:15]Main or Remote:115:="M"
			<>SYS_t_MainorRemote:="M"
			DB_SaveRecord(->[USER:15])
		End if 
	Else 
		Are_You_Sure
		If (OK=1)
			[USER:15]Main or Remote:115:="R"
			[USER:15]Office Code:13:="??"
			<>SYS_t_MainorRemote:="R"
			<>OfficeCode:="??/"
			DB_SaveRecord(->[USER:15])
			Gen_Alert("You must now Upload data from the Main System before"+" you can use any Modules"; "")
			Menu_Remote
		End if 
	End if 
	If ($_bo_Unload)
		UNLOAD RECORD:C212([USER:15])
	End if 
	READ ONLY:C145([USER:15])
End while 
ERR_MethodTrackerReturn("Remote_MoR"; $_t_oldMethodName)
