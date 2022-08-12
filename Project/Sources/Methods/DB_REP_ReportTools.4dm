//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_REP_ReportTools
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 12:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DBQR_bo_MENUSDISPLAYED)
	C_LONGINT:C283($_l_Error; DB_l_ReportType; DB_l_SRarea; DBQR_l_EDITORAREA; DBQR_l_SetPreferences)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_REP_ReportTools")

If (DB_l_ReportType=SuperWrite Report Template)
	If (Not:C34(DBQR_bo_MENUSDISPLAYED))
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view menubar:K14905:1; 1)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view standard toolbar:K14905:2; 1)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view style toolbar:K14905:3; 1)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view operators toolbar:K14905:4; 1)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view color toolbar:K14905:5; 1)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view column toolbar:K14905:6; 1)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; qr view contextual menus:K14905:7; 1)
		DBQR_bo_MENUSDISPLAYED:=True:C214
		OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; False:C215)
		
	Else 
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view menubar:K14905:1; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view standard toolbar:K14905:2; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view style toolbar:K14905:3; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view operators toolbar:K14905:4; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view color toolbar:K14905:5; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; _o_qr view column toolbar:K14905:6; 0)
		QR SET AREA PROPERTY:C796(DBQR_l_EDITORAREA; qr view contextual menus:K14905:7; 1)
		DBQR_bo_MENUSDISPLAYED:=False:C215
		OBJECT SET VISIBLE:C603(DBQR_l_SetPreferences; True:C214)
		OBJECT SET VISIBLE:C603(*; "oDBQR_styleSettings"; True:C214)
		
	End if 
Else 
	If (Not:C34(DBQR_bo_MENUSDISPLAYED))
		If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
			//$_l_Error:=SR Set Options (DB_l_SRarea;1;1;96;"")
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 1)
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 1)
			//32(SR Options Hide Menubar)– Hide Menubar
			//64(SR Options Hide Toolbar)– Hide Toolbar
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 1)
		Else 
			//$_l_Error:=SR Set Options (DB_l_SRarea;0;0;96;"")
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 0)
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 0)
			//32(SR Options Hide Menubar)– Hide Menubar
			//64(SR Options Hide Toolbar)– Hide Toolbar
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 0)
		End if 
		DBQR_bo_MENUSDISPLAYED:=True:C214
	Else 
		If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
			$_l_Error:=SR Set Options(DB_l_SRarea; 1; 1; 0; "")
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 1)
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 1)
			//32(SR Options Hide Menubar)– Hide Menubar
			//64(SR Options Hide Toolbar)– Hide Toolbar
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 1)
		Else 
			$_l_Error:=SR Set Options(DB_l_SRarea; 0; 0; 0; "")
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowMenubar; 0)
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_EnableScripts; 0)
			//32(SR Options Hide Menubar)– Hide Menubar
			//64(SR Options Hide Toolbar)– Hide Toolbar
			SR_SetLongProperty(DB_l_SRarea; 1; SRP_Report_ShowToolbar; 0)
		End if 
		DBQR_bo_MENUSDISPLAYED:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("DB_REP_ReportTools"; $_t_oldMethodName)