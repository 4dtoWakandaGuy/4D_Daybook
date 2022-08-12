If (False:C215)
	//object Method Name: Object Name:      [USER].CCM_Prefs.Popup Drop down List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/04/2012 09:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_AuthorizationProviders;0)
	//ARRAY TEXT(CCM_At_AuthorizationProvider;0)
	C_LONGINT:C283(Badd; CCM_but_ShowLogin; CCM_but_ShowPassword; CCM_l_AuthorizationProvider)
	C_TEXT:C284($_t_oldMethodName; CCM_T_AuthorizationPass; CCM_T_AuthorizationPassID; CCM_t_AuthorizationProvider; CCM_t_AuthorizationService; CCM_t_WebLink)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Popup Drop down List"; Form event code:C388)
If (CCM_At_AuthorizationProvider>0)
	CCM_t_AuthorizationProvider:=CCM_At_AuthorizationProvider{CCM_At_AuthorizationProvider}
	CCM_l_AuthorizationProvider:=CCM_al_AuthorizationProviders{CCM_At_AuthorizationProvider}
	If (CCM_t_AuthorizationService="")
		CCM_t_AuthorizationService:=CCM_t_AuthorizationProvider
	End if 
	Case of 
		: (CCM_t_AuthorizationProvider="Transax")
			CCM_t_WebLink:="www.nelixtransax.com"
			FORM GOTO PAGE:C247(2)
			OBJECT SET TITLE:C194(Badd; "Save Service")
			
		: (CCM_t_AuthorizationProvider="Authorize Net")
			CCM_t_WebLink:="www.authorizenet.com"
			FORM GOTO PAGE:C247(2)
			OBJECT SET TITLE:C194(Badd; "Save Service")
			OBJECT SET VISIBLE:C603(CCM_T_AuthorizationPass; True:C214)
			OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; False:C215)
			OBJECT SET VISIBLE:C603(CCM_T_AuthorizationPassID; True:C214)
			OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; False:C215)
		: (CCM_t_AuthorizationProvider="Planet Payment")
			CCM_t_WebLink:="www.planetpayment.com"
			FORM GOTO PAGE:C247(5)
			OBJECT SET TITLE:C194(Badd; "Save Service")
		: (CCM_t_AuthorizationProvider="e-xact")
			CCM_t_WebLink:="www.e-xact.com"
			FORM GOTO PAGE:C247(3)
			OBJECT SET TITLE:C194(Badd; "Save Service")
		: (CCM_t_AuthorizationProvider="Link Point")
			CCM_t_WebLink:="www.linkpoint.com"
			FORM GOTO PAGE:C247(6)
			OBJECT SET TITLE:C194(Badd; "Save Service")
		: (CCM_t_AuthorizationProvider="Worldpay")
			CCM_t_WebLink:="www.worldpay.com"
			FORM GOTO PAGE:C247(7)
			OBJECT SET TITLE:C194(Badd; "Save Service")
		: (CCM_t_AuthorizationProvider="ION Gate")
			CCM_t_WebLink:="www.iongate.com"
			FORM GOTO PAGE:C247(8)
			OBJECT SET TITLE:C194(Badd; "Save Service")
		: (CCM_t_AuthorizationProvider="Firepay")
			CCM_t_WebLink:="www.firepay.com"
			FORM GOTO PAGE:C247(4)
			OBJECT SET TITLE:C194(Badd; "Save Service")
		: (CCM_t_AuthorizationProvider="Surepay")
			CCM_t_WebLink:="www.surepay.com"
			FORM GOTO PAGE:C247(9)
			OBJECT SET TITLE:C194(Badd; "Save Service")
		: (CCM_t_AuthorizationProvider="Paypal")
			CCM_t_WebLink:="www.paypal.com"
			OBJECT SET VISIBLE:C603(CCM_T_AuthorizationPass; True:C214)
			OBJECT SET VISIBLE:C603(CCM_but_ShowPassword; False:C215)
			OBJECT SET VISIBLE:C603(CCM_T_AuthorizationPassID; True:C214)
			OBJECT SET VISIBLE:C603(CCM_but_ShowLogin; False:C215)
			FORM GOTO PAGE:C247(10)
			OBJECT SET TITLE:C194(Badd; "Save Service")
	End case 
End if 


ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.Popup Drop down List"; $_t_oldMethodName)
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.Popup Drop down List"; $_t_oldMethodName)
