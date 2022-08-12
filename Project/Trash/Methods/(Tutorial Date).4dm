//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tutorial Date
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
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_Number)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tutorial Date")
//Tutorial Date - sets the Limit Date such that on next launch will get x days
READ WRITE:C146([USER:15])
$_bo_Unload:=(Records in selection:C76([USER:15])=0)
If (<>SYS_l_LoggedInaccount=0)
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
Else 
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
End if 
If ([USER:15]Tutorial Data:228)
	$_l_Number:=Num:C11(Gen_Request("How many days from next launch?"; "30"))
	If ((OK=1) & ($_l_Number>0))
		If ($_l_Number<364)
			[USER:15]Limit Date:58:=!1975-01-01!+$_l_Number
			DB_SaveRecord(->[USER:15])
		Else 
			Gen_Alert("A maximum of 363 days is allowed")
		End if 
	End if 
Else 
	Gen_Alert("This is not a Tutorial Data File")
End if 
If ($_bo_Unload)
	UNLOAD RECORD:C212([USER:15])
End if 
READ ONLY:C145([USER:15])
ERR_MethodTrackerReturn("Tutorial Date"; $_t_oldMethodName)
