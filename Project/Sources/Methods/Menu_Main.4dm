//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Main
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2010 09:36
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_ModuleMenuShortCuts;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; <>TermInq; DB_bo_MenusInited; DB_bo_ModuleArrayInited; MENU_bo_Overwrite)
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $2; ModuleNumber)
	C_TEXT:C284($_t_CompaniesMenuName; $_t_CompaniesMenuReference; $_t_EditMenuName; $_t_EditMenuReference; $_t_EnqMenuReference; $_t_EnquiryWriterName; $_t_Enter; $_t_EnterEnquiry; $_t_EnterEnquiryTranslated; $_t_FileMenuName; $_t_FIleMenuReference)
	C_TEXT:C284($_t_MenuEnquiries; $_t_MenuType; $_t_oldMethodName; $_t_ProductsMenuName; $_t_ProductsMenuReference; $_t_TimeMenuName; $_t_TimeMenuReference; $_t_VolumesMenuName; $_t_VolumesMenuReference; $1; DB_t_MainMenuBar)
	C_TEXT:C284(DB_t_MenusFormat; Db_t_MenuType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Main")

$_t_EnquiryWriterName:=Get localized string:C991("Menu_EnquiryWriter")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_l_MenuProc:=<>MenuProc
$_t_MenuType:="4D menu"
If (Count parameters:C259>=1)
	$_t_MenuType:=$1
	
	If (Count parameters:C259>2)
		$_l_MenuProc:=$2
	End if 
End if 
Check_Mod(Module_DiaryManager; "Diary Manager")
If (False:C215)
	If (OK=1)
		If ((<>Bar#1) & (<>Bar#20)) | (MENU_bo_Overwrite)
			Menu_ModEnable
			$_t_EnterEnquiry:=Get localized string:C991("MenuItem_EnterEstimates")
			//TRACE
			$_t_EnterEnquiryTranslated:=Term_OrdWT($_t_EnterEnquiry)
			
			If ($_t_EnterEnquiryTranslated#$_t_EnterEnquiry)
				<>Bar:=20  //Inquiries
			Else 
				<>Bar:=1
			End if 
			<>MENU_l_BarModule:=2
			<>BarPos:=1
			DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
			If ((DB_GetModuleSettingByNUM(Module_Enquiries))<2)  // & (DB_GetModuleSetting(Module_SalesOrders)<2))  `Enquiries (or Sales Orders?)
				DB_MenuAction($_t_EnquiryWriterName; ""; 3; ""; $_l_MenuProc; False:C215)
			Else 
				If ((DB_GetModuleSettingByNUM(14))<2)  //campaign manager controls Enquirers
					DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterProspects"); 3; ""; $_l_MenuProc; False:C215)
					DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_ViewProspects"); 3; ""; $_l_MenuProc; False:C215)
					
				End if 
			End if 
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
				DB_MenuAction(Get localized string:C991("Menu_Products"); Get localized string:C991("MenuItem_EnterPricetable"); 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction(Get localized string:C991("Menu_Products"); Get localized string:C991("MenuItem_ViewPricetable"); 3; ""; $_l_MenuProc; False:C215)
				
			End if 
			Menu_DisComp
			Menu_DisFile
			If (Not:C34(<>StatesLoaded))
				States_Load
			End if 
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				$_t_Enter:=Get localized string:C991("MenuItem_Enter")
				DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterEnquiry"); 1; $_t_Enter+" "+Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 25); $_l_MenuProc; False:C215)
				DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterQuotation"); 1; $_t_Enter+" "+Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 25); $_l_MenuProc; False:C215)
				DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterNewOrder"); 1; $_t_Enter+" "+Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 25); $_l_MenuProc; False:C215)
			Else 
				Term_MenuEnq
			End if 
		End if 
		BRING TO FRONT:C326($_l_MenuProc)
	End if 
Else 
	
	If (<>TermInq)
		<>Bar:=20  //Inquiries
	Else 
		<>Bar:=1
	End if 
	<>MENU_l_BarModule:=2
	<>BarPos:=1
	ModuleNumber:=Module_DiaryManager
	DB_t_MainMenuBar:=Get menu bar reference:C979($_l_MenuProc)
	If (DB_t_MainMenuBar#"")
		RELEASE MENU:C978(DB_t_MainMenuBar)
	End if 
	$_t_EnqMenuReference:=""
	$_t_TimeMenuReference:=""
	$_t_ProductsMenuReference:=""
	$_t_CompaniesMenuReference:=""
	$_t_FileMenuName:=Get localized string:C991("Menu_File")
	If (Db_t_MenuType#"menu string")
		$_t_FIleMenuReference:=DB_CreateFilemenu
	Else 
		$_t_FIleMenuReference:=DB_CreateFilemenu
		If (DB_t_MenusFormat="JSON")
			
			
			
		End if 
	End if 
	If (Db_t_MenuType="menu string")
	Else 
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
		$_t_ProductsMenuName:=Get localized string:C991("Menu_Products")
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
			$_t_ProductsMenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products")
		Else 
			$_t_ProductsMenuReference:=DB_BuildModuleMenu("Products"; "Enter Products"; "View Products"; "Enter to Price Table"; "View Price Table")
		End if 
		$_t_TimeMenuName:=Get localized string:C991("Menu_TimeManager")
		$_t_TimeMenuReference:=DB_BuildModuleMenu("TIme Management"; "Enter in Calendar"; "Enter in Workflow"; "Enter Completed Activity"; "Automated Action"; "View Workflow Tasks"; "View Calendar"; "View History"; "View Automated Actions")
		$_t_MenuEnquiries:=Get localized string:C991("Menu_Enquiries")
		
		If ((DB_GetModuleSettingByNUM(Module_Enquiries))>=2)
			If ((DB_GetModuleSettingByNUM(14))<2)  //campaign manager controls Enquirers
				
				$_t_EnqMenuReference:=DB_BuildModuleMenu("Enquiries"; "Enter Enquiries"; "Enter Quotations"; "Enter New Orders"; "View Enquiry Writer")
			Else 
				$_t_EnqMenuReference:=DB_BuildModuleMenu("Enquiries"; "Enter Prospects"; "View Prospects"; "Enter Enquiries"; "Enter New Orders"; "View Enquiry Writer")
			End if 
		End if 
		DB_t_MainMenuBar:=Create menu:C408
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 1); $_t_FIleMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; Get indexed string:C510(79; 5); $_t_EditMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_VolumesMenuName; $_t_VolumesMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_CompaniesMenuName; $_t_CompaniesMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_ProductsMenuName; $_t_ProductsMenuReference)
		INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_TimeMenuName; $_t_TimeMenuReference)
		If ($_t_EnqMenuReference#"")
			INSERT MENU ITEM:C412(DB_t_MainMenuBar; -1; $_t_MenuEnquiries; $_t_EnqMenuReference)
		End if 
		SET MENU BAR:C67(DB_t_MainMenuBar; $_l_MenuProc)
		SET MENU BAR:C67(DB_t_MainMenuBar)
		If ((DB_GetModuleSettingByNUM(Module_Enquiries)<2))
			// & (DB_GetModuleSetting(Module_SalesOrders)<2))  `Enquiries (or Sales Orders?)
			DB_MenuAction($_t_EnquiryWriterName; ""; 3; ""; $_l_MenuProc; False:C215)
		Else 
			If ((DB_GetModuleSettingByNUM(14))<2)  //campaign manager controls Enquirers
				DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterProspects"); 3; ""; $_l_MenuProc; False:C215)
				DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_ViewProspects"); 3; ""; $_l_MenuProc; False:C215)
				
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)  //Price Table"
			DB_MenuAction(Get localized string:C991("Menu_Products"); Get localized string:C991("MenuItem_EnterPricetable"); 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction(Get localized string:C991("Menu_Products"); Get localized string:C991("MenuItem_ViewPricetable"); 3; ""; $_l_MenuProc; False:C215)
			
		End if 
		Menu_DisComp
		Menu_DisFile
		If (Not:C34(<>StatesLoaded))
			States_Load
		End if 
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
			$_t_Enter:=Get localized string:C991("MenuItem_Enter")
			DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterEnquiry"); 1; $_t_Enter+" "+Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 25); $_l_MenuProc; False:C215)
			DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterQuotation"); 1; $_t_Enter+" "+Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 25); $_l_MenuProc; False:C215)
			DB_MenuAction($_t_EnquiryWriterName; Get localized string:C991("MenuItem_EnterNewOrder"); 1; $_t_Enter+" "+Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 25); $_l_MenuProc; False:C215)
		Else 
			Term_MenuEnq
		End if 
		//◊Bar:=DB_t_MainMenuBar
		BRING TO FRONT:C326($_l_MenuProc)
	End if 
	
	
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_Main"; $_t_oldMethodName)
