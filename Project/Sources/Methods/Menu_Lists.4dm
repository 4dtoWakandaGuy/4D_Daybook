//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Lists
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/05/2010 15:18
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
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; <>PER_l_AccessLevel; $_l_MenuProc; $1; ModuleNumber)
	C_TEXT:C284($_t_CompaniesMenuReference; $_t_CoreMenuName; $_t_CoreMenuReference; $_t_EditMenuName; $_t_EditMenuReference; $_t_EnquiriesMenuReference; $_t_FileMenuName; $_t_FileMenuReference; $_t_FinancialsMenuName; $_t_FinancialsMenuReference; $_t_oldMethodName)
	C_TEXT:C284($_t_OthersMenuName; $_t_OthersMenuReference; $_t_ProductsMenuReference; $_t_TimeMenuReference; $_t_UtilitiesMenuName; $_t_UtilitiesMenuReference; $_t_VolumesMenuName; $_t_VolumesMenuReference; DB_t_MainMenuBar)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Lists")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
Check_Mod(Module_DataManager; "Data Manager")
If (False:C215)
	If (OK=1)
		If (<>Bar#2) | (MENU_bo_Overwrite)
			Menu_ModEnable
			<>Bar:=2
			<>MENU_l_BarModule:=Module_DataManager
			<>BarPos:=16  //20
			DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
			Menu_DisFile
			Menu_ListsP
			If ((DB_GetModuleSettingByNUM(1))=5)  //Silver loses
				//formats & Recode & Dedup
				DB_MenuAction(Get localized string:C991("Menu_Core"); "  Address Formats"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(3;5;◊MenuProc)
				DB_MenuAction(Get localized string:C991("Menu_Utilities"); " Recode Companies"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(6;1;◊MenuProc)
				DB_MenuAction(Get localized string:C991("Menu_Utilities"); " Recode Contacts"; 3; ""; $_l_MenuProc; False:C215)
				// DISABLE MENU ITEM(6;2;◊MenuProc)
				DB_MenuAction(Get localized string:C991("Menu_Utilities"); " Deduplicate Companies"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(6;3;◊MenuProc)
				DB_MenuAction(Get localized string:C991("Menu_Utilities"); " Deduplicate Contacts"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(6;4;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)  //Multi-Currency"
				//   DISABLE MENU ITEM(4;18;◊MenuProc)
				DB_MenuAction(Get localized string:C991("Menu_Financials"); "  Currencies"; 3; ""; $_l_MenuProc; False:C215)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)  //Multi-Layer"
				DB_MenuAction(Get localized string:C991("Menu_Financials"); "   Layers"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(4;16;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)  //Jobs "
				DB_MenuAction(Get localized string:C991("Menu_Others"); "   Personnel Categories  "; 3; ""; $_l_MenuProc; False:C215)
				//  DISABLE MENU ITEM(5;7;◊MenuProc)
			End if 
			
			If ((DB_GetModuleSettingByNUM(Module_JobCosting)<2))
				
				
				DB_MenuAction(Get localized string:C991("Menu_Others"); "   Job  Stages"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(5;8;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_JobCosting)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) & (DB_GetModuleSettingByNUM(Module_Enquiries)<2))
				//Jobs, Applic,  Orders, Enquiries
				DB_MenuAction(Get localized string:C991("Menu_Others"); "  Job Types"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(5;9;◊MenuProc)
			End if 
			
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)  //Service"
				DB_MenuAction(Get localized string:C991("Menu_Others"); "   Problems"; 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction(Get localized string:C991("Menu_Others"); "  Solutions"; 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction(Get localized string:C991("Menu_Others"); "  Contract Types  "; 3; ""; $_l_MenuProc; False:C215)
				// DISABLE MENU ITEM(5;21;◊MenuProc)
				//DISABLE MENU ITEM(5;22;◊MenuProc)
				//DISABLE MENU ITEM(5;23;◊MenuProc)
				
			End if 
			
			If ((DB_GetModuleSettingByNUM(Module_DiaryManager))<2)  //Diary"
				DB_MenuAction(Get localized string:C991("Menu_Others"); "  Actions"; 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction(Get localized string:C991("Menu_Others"); "  Results"; 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction(Get localized string:C991("Menu_Others"); "  Sequences"; 3; ""; $_l_MenuProc; False:C215)
				
				//  ` DISABLE MENU ITEM(5;2;◊MenuProc)
				//DISABLE MENU ITEM(5;3;◊MenuProc)
				// DISABLE MENU ITEM(5;4;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_Sequences))<2)  //Sequences      "
				
				DB_MenuAction(Get localized string:C991("Menu_Others"); "  Sequences"; 3; ""; $_l_MenuProc; False:C215)
				//  DISABLE MENU ITEM(5;4;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Tables   "
				DB_MenuAction(Get localized string:C991("Menu_Core"); "  Price Groups"; 3; ""; $_l_MenuProc; False:C215)
				//   DISABLE MENU ITEM(3;21;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_Macros))<2)  //Macros"
				DB_MenuAction(Get localized string:C991("Menu_Core"); "  Macros"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(3;24;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(14)<2) & (DB_GetModuleSettingByNUM(Module_SalesManager)<2))  //Campaign/Sales Manager only for Publications   "
				DB_MenuAction(Get localized string:C991("Menu_Core"); "  Publications"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(3;9;◊MenuProc)
			End if 
			If (((<>PER_l_AccessLevel>1) | (DB_GetModuleSettingByNUM(Module_DataManager)#2)) & (<>PER_l_AccessLevel#0))
				
				DB_MenuAction(Get localized string:C991("Menu_Core"); "  Personnel Groups"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(3;15;◊MenuProc)
			End if 
			If ((DB_GetModuleSettingByNUM(Module_StockControl))#2)
				DB_MenuAction(Get localized string:C991("Menu_Utilities"); "Consolidate Stock Levels"; 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction(Get localized string:C991("Menu_Utilities"); "Recreate Stock Levels"; 3; ""; $_l_MenuProc; False:C215)
				// DISABLE MENU ITEM(6;16)
				// DISABLE MENU ITEM(6;17)
			End if 
			If ((DB_GetModuleSettingByNUM(40))=0)  //not international
				DB_MenuAction(Get localized string:C991("Menu_Core"); "  Terminology"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(3;26;◊MenuProc)
			End if 
			If (Not:C34(((<>PER_l_AccessLevel<2) & (DB_GetModuleSettingByNUM(Module_DataManager)=2)) | (<>PER_l_AccessLevel=0)))
				DB_MenuAction(Get localized string:C991("Menu_Core"); "  Change Password"; 3; ""; $_l_MenuProc; False:C215)
				//DISABLE MENU ITEM(3;14;◊MenuProc)  `disable the Password item
			End if 
			
			If ((Not:C34(User in group:C338(Current user:C182; "Administrator"))) & (Not:C34(User in group:C338(Current user:C182; "4D write Group"))) & (Not:C34(User in group:C338(Current user:C182; "Designer"))))
				DB_MenuAction(Get localized string:C991("Menu_Utilities"); "Check Record ID clash"; 3; ""; $_l_MenuProc; False:C215)
				// DISABLE MENU ITEM(6;19;◊MenuProc)
			End if 
		End if 
		BRING TO FRONT:C326($_l_MenuProc)
	End if 
Else 
	Menu_ModEnable
	<>Bar:=2
	<>MENU_l_BarModule:=Module_DataManager
	<>BarPos:=16  //20
	ModuleNumber:=Module_DataManager
	DB_t_MainMenuBar:=Get menu bar reference:C979($_l_MenuProc)
	If (DB_t_MainMenuBar#"")
		RELEASE MENU:C978(DB_t_MainMenuBar)
	End if 
	$_t_EnquiriesMenuReference:=""
	$_t_TimeMenuReference:=""
	$_t_ProductsMenuReference:=""
	$_t_CompaniesMenuReference:=""
	$_t_FileMenuName:=Get localized string:C991("Menu_File")
	
	$_t_FileMenuReference:=DB_CreateFilemenu
	$_t_EditMenuName:=Get localized string:C991("Menu_Edit")
	
	$_t_EditMenuReference:=DB_CreateEditMenu
	$_t_VolumesMenuName:=Get localized string:C991("Menu_Volumes")
	$_t_VolumesMenuReference:=DB_BuildVolumesMenu
	ARRAY LONGINT:C221(DB_al_MenuShortCutsUsed; 0)
	ARRAY LONGINT:C221(DB_al_ModuleMenuShortCuts; 0)  //Copied to at the bottom of this method
	DB_bo_MenusInited:=False:C215
	DB_bo_ModuleArrayInited:=True:C214
	
	$_t_CoreMenuName:=Get localized string:C991("Menu_Core")
	$_t_CoreMenuReference:=DB_BuildModuleMenu("Core"; "Areas"; "PostCodes"; "Countries"; "Address Formats"; "Status"; "Types"; "Sources"; "Publications"; "Further Analyses"; "Roles"; "Change Password"; "Personnel Groups"; "Personnel & Resources"; "Groups"; "Brands"; "Price Groups"; "Macros"; "Pictures"; "Terminology"; "Record States"; "Lists"; "Further Fields"; "Update Licence"; "Preferences")
	$_t_FinancialsMenuName:=Get localized string:C991("Menu_Financials")
	$_t_FinancialsMenuReference:=DB_BuildModuleMenu("Financials"; "Stock Types"; "Stock Locations"; "Movement Types"; "Credit Stages"; "Credit Card Provision"; "Accounts"; "Account Headings"; "Years & Periods"; "Transaction Types"; "Analyses"; "Layers"; "Tax Codes"; "Currencies")
	$_t_OthersMenuName:=Get localized string:C991("Menu_Others")
	$_t_OthersMenuReference:=DB_BuildModuleMenu("Others"; "Actions"; "Results"; "Workflow Manager"; "Personnel Catagories"; "Job Stages"; "Job Types"; "Problems"; "Solutions"; "Contract Types")
	$_t_UtilitiesMenuName:=Get localized string:C991("Menu_Utilities")
	$_t_UtilitiesMenuReference:=DB_BuildModuleMenu("Utilities"; "Recode Companies"; "Recode Contacts"; "De-Duplicate Companies"; "De-Duplicate Contacts"; "Close Period"; "Close Financial Year"; "Reset Data")
	
	$_t_FileMenuName:=Get localized string:C991("Menu_File")
	
	$_t_FileMenuReference:=DB_CreateFilemenu
	$_t_EditMenuName:=Get localized string:C991("Menu_Edit")
	
	$_t_EditMenuReference:=DB_CreateEditMenu
	
	DB_t_MainMenuBar:=Create menu:C408
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 1); $_t_FileMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 5); $_t_EditMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_VolumesMenuName; $_t_VolumesMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_CoreMenuName; $_t_CoreMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_FinancialsMenuName; $_t_FinancialsMenuReference)
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_OthersMenuName; $_t_OthersMenuReference)
	
	INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_UtilitiesMenuName; $_t_UtilitiesMenuReference)
	
	SET MENU BAR:C67(DB_t_MainMenuBar; $_l_MenuProc)
	SET MENU BAR:C67(DB_t_MainMenuBar)
	Menu_DisFile
	Menu_ListsP
	If ((DB_GetModuleSettingByNUM(1))=5)  //Silver loses
		//formats & Recode & Dedup
		DB_MenuAction(Get localized string:C991("Menu_Core"); Get localized string:C991("MenuItem_AddressFormats"); 3; ""; $_l_MenuProc; False:C215)
		//DISABLE MENU ITEM(3;5;◊MenuProc)
		DB_MenuAction(Get localized string:C991("Menu_Utilities"); Get localized string:C991("MenuItem_RecodeCompanies"); 3; ""; $_l_MenuProc; False:C215)
		//DISABLE MENU ITEM(6;1;◊MenuProc)
		DB_MenuAction(Get localized string:C991("Menu_Utilities"); Get localized string:C991("MenuItem_RecodeContacts"); 3; ""; $_l_MenuProc; False:C215)
		// DISABLE MENU ITEM(6;2;◊MenuProc)
		DB_MenuAction(Get localized string:C991("Menu_Utilities"); Get localized string:C991("MenuItem_DedupCompanies"); 3; ""; $_l_MenuProc; False:C215)
		//DISABLE MENU ITEM(6;3;◊MenuProc)
		DB_MenuAction(Get localized string:C991("Menu_Utilities"); Get localized string:C991("MenuItem_DedupContacts"); 3; ""; $_l_MenuProc; False:C215)
		//DISABLE MENU ITEM(6;4;◊MenuProc)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)  //Multi-Currency
		
		DB_MenuAction(Get localized string:C991("Menu_Financials"); Get localized string:C991("MenuItem_Currencies"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)  //Multi-Layer
		DB_MenuAction(Get localized string:C991("Menu_Financials"); Get localized string:C991("MenuItem_Layers"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)  //Jobs
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_PersonnelCategories"); 3; ""; $_l_MenuProc; False:C215)
		
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_JobCosting)<2))
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_JobStages"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_JobCosting)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) & (DB_GetModuleSettingByNUM(Module_Enquiries)<2))
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_JobTypes"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)  //Service"
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_Problems"); 3; ""; $_l_MenuProc; False:C215)
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_Solutions"); 3; ""; $_l_MenuProc; False:C215)
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_ContractTypes"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_DiaryManager))<2)  //Diary"
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_Actions"); 3; ""; $_l_MenuProc; False:C215)
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_Results"); 3; ""; $_l_MenuProc; False:C215)
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_WorkflowManager"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Sequences))<2)  //Sequences
		
		DB_MenuAction(Get localized string:C991("Menu_Others"); Get localized string:C991("MenuItem_WorkflowManager"); 3; ""; $_l_MenuProc; False:C215)
		//  DISABLE MENU ITEM(5;4;◊MenuProc)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Tables
		DB_MenuAction(Get localized string:C991("Menu_Core"); Get localized string:C991("MenuItem_PriceGroups"); 3; ""; $_l_MenuProc; False:C215)
		//   DISABLE MENU ITEM(3;21;◊MenuProc)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Macros))<2)  //Macros
		DB_MenuAction(Get localized string:C991("Menu_Core"); Get localized string:C991("MenuItem_Macros"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(14)<2) & (DB_GetModuleSettingByNUM(Module_SalesManager)<2))  //Campaign/Sales Manager only for Publications   "
		DB_MenuAction(Get localized string:C991("Menu_Core"); Get localized string:C991("MenuItem_Publications"); 3; ""; $_l_MenuProc; False:C215)
		
	End if 
	If (((<>PER_l_AccessLevel>1) | (DB_GetModuleSettingByNUM(Module_DataManager)#2)) & (<>PER_l_AccessLevel#0))
		DB_MenuAction(Get localized string:C991("Menu_Core"); Get localized string:C991("MenuItem_PersonnelGroups"); 3; ""; $_l_MenuProc; False:C215)
		
	End if 
	If ((DB_GetModuleSettingByNUM(Module_StockControl))#2)
		DB_MenuAction(Get localized string:C991("Menu_Utilities"); Get localized string:C991("MenuItem_ConsolidateStockLevels"); 3; ""; $_l_MenuProc; False:C215)
		DB_MenuAction(Get localized string:C991("Menu_Utilities"); Get localized string:C991("MenuItem_RecreateStockLevels"); 3; ""; $_l_MenuProc; False:C215)
		
	End if 
	If ((DB_GetModuleSettingByNUM(40))=0)  //not international
		DB_MenuAction(Get localized string:C991("Menu_Core"); Get localized string:C991("MenuItem_Terminology"); 3; ""; $_l_MenuProc; False:C215)
		
	End if 
	If (Not:C34(((<>PER_l_AccessLevel<2) & (DB_GetModuleSettingByNUM(Module_DataManager)=2)) | (<>PER_l_AccessLevel=0)))
		DB_MenuAction(Get localized string:C991("Menu_Core"); Get localized string:C991("MenuItem_ChangePassword"); 3; ""; $_l_MenuProc; False:C215)
		
	End if 
	
	If ((Not:C34(User in group:C338(Current user:C182; "Administrator"))) & (Not:C34(User in group:C338(Current user:C182; "4D write Group"))) & (Not:C34(User in group:C338(Current user:C182; "Designer"))))
		DB_MenuAction(Get localized string:C991("Menu_Utilities"); Get localized string:C991("MenuItem_CheckRecordIDCrash"); 3; ""; $_l_MenuProc; False:C215)
	End if 
	
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_Lists"; $_t_oldMethodName)
