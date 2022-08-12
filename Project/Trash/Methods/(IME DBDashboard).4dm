//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME DBDashboard
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
	C_TEXT:C284($_t_oldMethodName; IME_t_UserGroupCode; IME_t_UserInitials)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME DBDashboard")
//IME DBDashboard
//Rollo 9/6/2004

//Draw a dashboard page for each user, based on an IMA Macro defined for them
//or a default

IME_DBHeader("Dashboard"; "dbdashboard"; "My dashboard"; ""; "dbdashboard")

IME_ReplyText2("ITX DGDashBody")

READ ONLY:C145([SCRIPTS:80])
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=("IMA DBDashboard"+IME_t_UserInitials))
If (Records in selection:C76([SCRIPTS:80])=0)
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=("IMA DBDashboard_"+IME_t_UserGroupCode))
	If (Records in selection:C76([SCRIPTS:80])=0)
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="IMA DBDashboardDefault")
	End if 
End if 

If (Records in selection:C76([SCRIPTS:80])>0)
	
	Macro2([SCRIPTS:80]Script_Code:1)
	UNLOAD RECORD:C212([SCRIPTS:80])
	
Else 
	IME_Reply("No Dashboard defined - "+"create IMA DBDashboardDefault or IMA DBDashboard+Initials")
End if 

IME_ReplyText2("ITX DGDashBody/")

IME_DBFooter
ERR_MethodTrackerReturn("IME DBDashboard"; $_t_oldMethodName)