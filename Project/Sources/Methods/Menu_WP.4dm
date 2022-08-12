//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_WP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/05/2010 19:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_ModuleMenuShortCuts;0)
	C_BOOLEAN:C305(DB_bo_MenusInited; DB_bo_ModuleArrayInited; MENU_bo_Overwrite)
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_DiaryModule; $_l_JobCostingModule; $_l_MenuProc; $_l_ServiceCallModule; $1; ModuleNumber)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_CompaniesMenuName; $_t_CompaniesMenuReference; $_t_DocumentsMenuName; $_t_DocumentsMenuReference; $_t_EditMenuName; $_t_EditMenuReference; $_t_FileMenuName; $_t_FileMenuReference; $_t_MailingMenuName; $_t_MailingMenuReference)
	C_TEXT:C284($_t_oldMethodName; $_t_VolumesMenuName; $_t_VolumesMenuReference; DB_t_MainMenuBar)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_WP")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
Check_Mod(Module_WPManager; "Word Processing")
If (False:C215)
	If (OK=1)
		If ((<>Bar#13) & (<>Bar#90)) | (MENU_bo_Overwrite)
			Menu_ModEnable
			If ((DB_GetModuleSettingByNUM(1))=5)
				<>Bar:=90
				<>BarPos:=3
			Else 
				//     If ((◊Write="SW") | (◊Write="WS"))  `SuperWrite or 4DWrite Silver
				If (<>SYS_t_4DWriteType="WS")  //4DWrite Silver 24/04/02 pb
					<>Bar:=93
					If (DB_GetModuleSettingByNUM(Module_DiaryManager)<2)
						DB_MenuAction("Documents"; "View Document History"; 3; ""; $_l_MenuProc; False:C215)
						
					End if 
				Else 
					<>Bar:=13
				End if 
				<>BarPos:=2  //4
			End if 
			<>MENU_l_BarModule:=3
			DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
			DB_SetMenuChecks  //Checks the current menu is set correctly
			
			If ((DB_GetModuleSettingByNUM(1))#5)
				$_l_DiaryModule:=Module_DiaryManager
				
				Gen_Disable($_l_DiaryModule; 5; 3; "Mailing"; "Mail_Diary ")  //Diary"
				If ((DB_GetModuleSettingByNUM(Module_Enquiries)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2))  //Enquiries or Sales Orders"
					DB_MenuAction("Mailing"; "Enquiries, Qtns, Orders"; 3; ""; $_l_MenuProc; False:C215)
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)  //Sales Ledger
					DB_MenuAction("Mailing"; "Payments Chasing"; 3; ""; $_l_MenuProc; False:C215)
					DB_MenuAction("Mailing"; "Statements"; 3; ""; $_l_MenuProc; False:C215)
					
				End if 
				$_l_ServiceCallModule:=Module_ServiceCentre
				Gen_Disable($_l_ServiceCallModule; 5; 8; "Mailing"; "Contracts")  //Service
				$_l_JobCostingModule:=Module_JobCosting
				
				Gen_Disable($_l_JobCostingModule; 5; 9; "Mailing"; "Jobs")  //Jobs
				
				If ((DB_GetModuleSettingByNUM(31))<2)
					DB_MenuAction("Mailsort"; ""; 3; ""; $_l_MenuProc; False:C215)
					//   DISABLE MENU ITEM(6;0;◊MenuProc)
				End if 
				If ((DB_GetModuleSettingByNUM(31)=3) | (DB_GetModuleSettingByNUM(Module_Companies)=3))
					DB_MenuAction("Mailsort"; "Update Mailsort Files"; 3; ""; $_l_MenuProc; False:C215)
					DB_MenuAction("Mailsort"; "Update Company SSCs"; 3; ""; $_l_MenuProc; False:C215)
					//DISABLE MENU ITEM(6;1;◊MenuProc)
					//   DISABLE MENU ITEM(6;2;◊MenuProc)
				End if 
				If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)  //Subscriptions
					DB_MenuAction("Mailsort"; "Subscription Renewals"; 3; ""; $_l_MenuProc; False:C215)
					//DISABLE MENU ITEM(5;10;◊MenuProc)
				End if 
			End if 
			
			Menu_DisComp
			Menu_DisFile
		End if 
		Term_MenuWP
		BRING TO FRONT:C326($_l_MenuProc)
	End if 
Else 
	DB_t_MainMenuBar:=Get menu bar reference:C979($_l_MenuProc)
	If (DB_t_MainMenuBar#"")
		RELEASE MENU:C978(DB_t_MainMenuBar)
	End if 
	<>Bar:=13
	<>BarPos:=2  //4
	<>MENU_l_BarModule:=3
	ModuleNumber:=Module_WPManager
	$_t_FileMenuName:=Get localized string:C991("Menu_File")
	$_t_FileMenuReference:=DB_CreateFilemenu
	
	$_t_EditMenuName:=Get localized string:C991("Menu_Edit")
	$_t_EditMenuReference:=DB_CreateEditMenu
	
	$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
	$_t_VolumesMenuReference:=DB_BuildVolumesMenu
	$_t_CompaniesMenuName:=Get localized string:C991("Menu_Companies")
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	ARRAY LONGINT:C221(DB_al_ModuleMenuShortCuts; 0)  //Copied to at the bottom of this method
	DB_bo_MenusInited:=False:C215
	DB_bo_ModuleArrayInited:=True:C214
	
	$_t_CompaniesMenuReference:=DB_BuildModuleMenu("Companies"; "Enter Companies"; "View Companies"; "Enter Contacts"; "View Contacts")
	$_t_DocumentsMenuName:=Get localized string:C991("Menu_Documents")
	If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
		
		$_t_DocumentsMenuReference:=DB_BuildModuleMenu("Documents"; "Enter Letters"; "Enter Quotations"; "Enter E-Mail"; "View Letters & Quotes"; "Enter Letter Templates"; "Enter Report Templates"; "Enter Email Templates"; "View Letter Templates"; "View Report Templates"; "View Email Templates"; "View Other Templates")
		
	Else 
		$_t_DocumentsMenuReference:=DB_BuildModuleMenu("Documents"; "Enter Letters"; "Enter Quotations"; "Enter E-Mail"; "View Letters & Quotes"; "Enter Letter Templates"; "Enter Report Templates"; "Enter Email Templates"; "View Letter Templates"; "View Report Templates"; "View Email Templates"; "View Other Templates")
		
	End if 
	$_t_MailingMenuName:=Get localized string:C991("Menu_Mailing")
	
	$_t_MailingMenuReference:=DB_BuildModuleMenu("Mailing"; "Mail_Companies"; "Mail_Contacts"; "Mail_Diary"; "Enquiries"; "Quotations"; "Orders"; "Payments Chasing"; "Statements"; "Contracts")
	
	DB_t_MainMenuBar:=Create menu:C408
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 1); $_t_FileMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 5); $_t_EditMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_VolumesMenuName; $_t_VolumesMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_CompaniesMenuName; $_t_CompaniesMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_DocumentsMenuName; $_t_DocumentsMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_MailingMenuName; $_t_MailingMenuReference)
	
	SET MENU BAR:C67(DB_t_MainMenuBar; $_l_MenuProc)
	SET MENU BAR:C67(DB_t_MainMenuBar)
	DB_SetMenuChecks  //Checks the current menu is set correctly
	If ((DB_GetModuleSettingByNUM(1))#5)
		$_l_DiaryModule:=Module_DiaryManager
		
		Gen_Disable($_l_DiaryModule; 5; 3; "Mailing"; "Mail_Diary ")  //Diary"
		If ((DB_GetModuleSettingByNUM(Module_Enquiries)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2))  //Enquiries or Sales Orders"
			DB_MenuAction("Mailing"; "Enquiries, Qtns, Orders"; 3; ""; $_l_MenuProc; False:C215)
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)  //Sales Ledger
			DB_MenuAction("Mailing"; "Payments Chasing"; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Mailing"; "Statements"; 3; ""; $_l_MenuProc; False:C215)
			
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)
			$_l_ServiceCallModule:=Module_ServiceCentre
			Gen_Disable($_l_ServiceCallModule; 5; 8; "Mailing"; "Contracts")  //Service
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
			$_l_JobCostingModule:=Module_JobCosting
			
			Gen_Disable($_l_JobCostingModule; 5; 9; "Mailing"; "Jobs")  //Jobs
		End if 
		If ((DB_GetModuleSettingByNUM(31))<2)
			DB_MenuAction("Mailsort"; ""; 3; ""; $_l_MenuProc; False:C215)
			
		End if 
		If ((DB_GetModuleSettingByNUM(31)=3) | (DB_GetModuleSettingByNUM(Module_Companies)=3))
			DB_MenuAction("Mailsort"; "Update Mailsort Files"; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Mailsort"; "Update Company SSCs"; 3; ""; $_l_MenuProc; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)  //Subscriptions
			DB_MenuAction("Mailsort"; "Subscription Renewals"; 3; ""; $_l_MenuProc; False:C215)
		End if 
	End if 
	
	Menu_DisComp
	Menu_DisFile
	
	Term_MenuWP
	//◊Bar:=DB_t_MainMenuBar
	BRING TO FRONT:C326($_l_MenuProc)
	
	
End if 
MENU_bo_Overwrite:=True:C214
ERR_MethodTrackerReturn("Menu_WP"; $_t_oldMethodName)
