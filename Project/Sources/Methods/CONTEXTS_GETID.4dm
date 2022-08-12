//%attributes = {}
If (False:C215)
	//Project Method Name:      CONTEXTS_GETID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 11:46`Method: CONTEXTS_GETID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($1)
	//C_UNKNOWN($3)
	//C_UNKNOWN(MACSTATECLASSLOADED)
	//C_UNKNOWN(PT_PricetableClassLoaded)
	//C_UNKNOWN(PT_PurchasetableClassLoaded)
	//ARRAY LONGINT(CA_al_ListIDs;0)
	//ARRAY LONGINT(MOD_al_ModuleIDS;0)
	//ARRAY LONGINT(PG_al_PriceGroupClass;0)
	//ARRAY LONGINT(SCPT_al_ScriptClassIDs;0)
	//ARRAY TEXT(MOD_at_ModuleNames;0)
	//ARRAY TEXT(PG_at_PriceGroupClassShort;0)
	//ARRAY TEXT(PG_S80_aPriceGroupClassShort;0)
	//ARRAY TEXT(SYS_at_DocContexts;0)
	//ARRAY TEXT(SYS_at_ScriptClassNames;0)
	//ARRAY TEXT(SYS_at_ScriptStateNames;0)
	C_BOOLEAN:C305(DOC_bo_ClassLoaded; MACSTATECLASSLOADED; MOD_bo_ModulesLoaded; PT_PricetableClassLoaded; PT_PurchasetableClassLoaded; SCPT_bo_ClassesLoaded; DOC_bo_ClassLoaded; MOD_bo_ModulesLoaded; SCPT_bo_ClassesLoaded)
	C_LONGINT:C283($_l_ContextRow; $_l_ModuleRow; $_l_PGClassRow; $_l_ScriptClassRow; $_l_StatetRow; $0; $_l_ContextRow; $_l_ModuleRow; $_l_PGClassRow; $_l_ScriptClassRow; $_l_StatetRow)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName; $1; $3; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CONTEXTS_GETID")

Case of 
	: ($1="DocClass")
		If (Not:C34(DOC_bo_ClassLoaded))
			ARRAY TEXT:C222(SYS_at_DocContexts; 24)
			ARRAY LONGINT:C221(CA_al_ListIDs; 24)
			SYS_at_DocContexts{1}:="4D Write Letter Template"
			CA_al_ListIDs{1}:=4D Write Letter Template
			SYS_at_DocContexts{2}:="4D Write Letter"
			CA_al_ListIDs{2}:=4D Write Letter
			SYS_at_DocContexts{3}:="4D Write Email Template"
			CA_al_ListIDs{3}:=4D Write Email Template
			SYS_at_DocContexts{4}:="4D Write Email"
			CA_al_ListIDs{4}:=4D Write Email
			SYS_at_DocContexts{5}:="4D Write ReportTemplate"
			CA_al_ListIDs{5}:=4D Write ReportTemplate
			SYS_at_DocContexts{6}:="4D Write Report"
			CA_al_ListIDs{6}:=4D Write Report
			SYS_at_DocContexts{7}:="Text Letter Template"
			CA_al_ListIDs{7}:=Text Letter Template
			SYS_at_DocContexts{8}:="Text Letter"
			CA_al_ListIDs{8}:=Text Letter
			SYS_at_DocContexts{9}:="Text Email Template"
			CA_al_ListIDs{9}:=Text Email Template
			SYS_at_DocContexts{10}:="Text Email"
			CA_al_ListIDs{10}:=Text Email
			SYS_at_DocContexts{11}:="Text Report Template"
			CA_al_ListIDs{11}:=Text Report Template
			SYS_at_DocContexts{12}:="Text Report"
			CA_al_ListIDs{12}:=Text Report
			SYS_at_DocContexts{13}:="SuperWrite Letter Template"
			CA_al_ListIDs{13}:=SuperWrite Letter Template
			SYS_at_DocContexts{14}:="SuperWrite Letter"
			CA_al_ListIDs{14}:=SuperWrite Letter
			SYS_at_DocContexts{15}:="SuperWrite Email Template"
			CA_al_ListIDs{15}:=SuperWrite Email Template
			SYS_at_DocContexts{16}:="SuperWrite Email"
			CA_al_ListIDs{16}:=SuperWrite Email
			SYS_at_DocContexts{17}:="SuperWrite Report Template"
			CA_al_ListIDs{17}:=SuperWrite Report Template
			SYS_at_DocContexts{18}:="SuperWrite Report"
			CA_al_ListIDs{18}:=SuperWrite Report
			SYS_at_DocContexts{19}:="SuperReport Letter Template"
			CA_al_ListIDs{19}:=SuperReport Letter Template
			SYS_at_DocContexts{20}:="SuperReport Letter"
			CA_al_ListIDs{20}:=SuperReport Letter
			SYS_at_DocContexts{21}:="SuperReport Email Template"
			CA_al_ListIDs{21}:=SuperReport Email Template
			SYS_at_DocContexts{22}:="SuperReport Email"
			CA_al_ListIDs{22}:=SuperReport Email
			SYS_at_DocContexts{23}:="SuperReportReport Template"
			CA_al_ListIDs{23}:=SuperReportReport Template
			SYS_at_DocContexts{24}:="SuperReport Report"
			CA_al_ListIDs{24}:=SuperReport Report
			DOC_bo_ClassLoaded:=True:C214
		End if 
		$_l_ContextRow:=Find in array:C230(SYS_at_DocContexts; $3)
		If ($_l_ContextRow>0)
			$0:=CA_al_ListIDs{$_l_ContextRow}
		End if 
		
	: ($1="PTClass")  //Price table class
		If (Not:C34(PT_PricetableClassLoaded))
			Case of 
				: ($2=Table:C252(->[ORDERS:24]))
					If (Not:C34(PT_PricetableClassLoaded))
						PG_LoadPGoptions($2)
						PT_PricetableClassLoaded:=True:C214
						
					End if 
				: ($2=Table:C252(->[PURCHASE_ORDERS:57]))
					If (Not:C34(PT_PurchasetableClassLoaded))
						PG_LoadPGoptions($2)
						PT_PurchasetableClassLoaded:=True:C214
					End if 
			End case 
		End if 
		$_l_PGClassRow:=Find in array:C230(PG_at_PriceGroupClassShort; $3)
		If ($_l_PGClassRow>0)
			$0:=PG_al_PriceGroupClass{$_l_PGClassRow}
		End if 
	: ($1="MacroClass")
		If (Not:C34(SCPT_bo_ClassesLoaded))
			ARRAY TEXT:C222(SYS_at_ScriptClassNames; 21)
			ARRAY LONGINT:C221(SCPT_al_ScriptClassIDs; 21)
			SYS_at_ScriptClassNames{1}:="System Owned Macro"
			SCPT_al_ScriptClassIDs{1}:=System Owned Macro
			SYS_at_ScriptClassNames{2}:="Owner Owned Macro"
			SCPT_al_ScriptClassIDs{2}:=Owner Owned Macro
			SYS_at_ScriptClassNames{3}:="System DataList Macro"
			SCPT_al_ScriptClassIDs{3}:=System DataList Macro
			SYS_at_ScriptClassNames{4}:="Owner DataList Macro"
			SCPT_al_ScriptClassIDs{4}:=Owner DataList Macro
			SYS_at_ScriptClassNames{5}:="System Print Macro"
			SCPT_al_ScriptClassIDs{5}:=System Print Macro
			SYS_at_ScriptClassNames{6}:="Owner Print Macro"
			SCPT_al_ScriptClassIDs{6}:=Owner Print Macro
			SYS_at_ScriptClassNames{7}:="Data Export Query Macro"
			SCPT_al_ScriptClassIDs{7}:=Data Export Query Macro  // 20/09/02 pb"
			SYS_at_ScriptClassNames{8}:="Data Export Data Macro"
			SCPT_al_ScriptClassIDs{8}:=Data Export Data Macro  // must fill variable EW_t_ExportValue 30/09/02 pb"
			SYS_at_ScriptClassNames{9}:="System Sales Pipeline Macro"
			SCPT_al_ScriptClassIDs{9}:=System Sales Pipeline Macro
			SYS_at_ScriptClassNames{10}:="Owner Sales Pipeline Macro"
			SCPT_al_ScriptClassIDs{10}:=Owner Sales Pipeline Macro
			SYS_at_ScriptClassNames{11}:="Data Import Macro"
			SCPT_al_ScriptClassIDs{11}:=Data Import Macro
			SYS_at_ScriptClassNames{12}:="IMA Internal Internet Macro"
			SCPT_al_ScriptClassIDs{12}:=IMA Internal Internet Macro
			SYS_at_ScriptClassNames{13}:="IMA Owner Internet Macro"
			SCPT_al_ScriptClassIDs{13}:=IMA Owner Internet Macro
			SYS_at_ScriptClassNames{14}:="ITX Internal Internet Text"
			SCPT_al_ScriptClassIDs{14}:=ITX Internal Internet Text
			SYS_at_ScriptClassNames{15}:="ITX Owner Internet Text"
			SCPT_al_ScriptClassIDs{16}:=ITX Owner Internet Text
			SYS_at_ScriptClassNames{16}:="ITO Internal Internet Tool"
			SCPT_al_ScriptClassIDs{17}:=ITO Internal Internet Tool
			SYS_at_ScriptClassNames{17}:="ITO Owner Internet Tool"
			SCPT_al_ScriptClassIDs{17}:=ITO Owner Internet Tool
			SYS_at_ScriptClassNames{18}:="ICA Owner Internet Cache"
			SCPT_al_ScriptClassIDs{18}:=ICA Owner Internet Cache
			SYS_at_ScriptClassNames{19}:="SM Macro"
			SCPT_al_ScriptClassIDs{19}:=SM Macro
			SYS_at_ScriptClassNames{20}:="SM AutoSearch"
			SCPT_al_ScriptClassIDs{20}:=SM AutoSearch
			SYS_at_ScriptClassNames{21}:="WF Macros"
			SCPT_al_ScriptClassIDs{21}:=WF Macros
			SCPT_bo_ClassesLoaded:=True:C214
		End if 
		$_l_ScriptClassRow:=Find in array:C230(SYS_at_ScriptClassNames; $3)
		If ($_l_ScriptClassRow>0)
			$0:=SCPT_al_ScriptClassIDs{$_l_ScriptClassRow}
		End if 
	: ($1="MacroStateClass")
		If (Not:C34(MACSTATECLASSLOADED))
			ARRAY TEXT:C222(SYS_at_ScriptStateNames; 4)
			
			SYS_at_ScriptStateNames{1}:="Active in Testing"
			
			SYS_at_ScriptStateNames{2}:="Active"
			
			SYS_at_ScriptStateNames{3}:="Active LOCKED"
			SYS_at_ScriptStateNames{4}:="Disabled"
			MACSTATECLASSLOADED:=True:C214
		End if 
		$_l_StatetRow:=Find in array:C230(SYS_at_ScriptStateNames; $3)
		If ($_l_StatetRow>0)
			$0:=$_l_StatetRow
		End if 
	: ($1="ModuleClass")
		If (Not:C34(MOD_bo_ModulesLoaded))
			ARRAY TEXT:C222(MOD_at_ModuleNames; 0)
			ARRAY LONGINT:C221(MOD_al_ModuleIDS; 0)
			
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_DataManager")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_DataManager)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_Enquiries")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Enquiries)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_SalesManager")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_SalesManager)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_WPManager")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_WPManager)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_StockControl")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_StockControl)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_Assemblies")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Assemblies)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_SalesOrders")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_SalesOrders)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_PurchaseOrders")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_PurchaseOrders)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_SalesLedger")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_SalesLedger)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_PurchaseLedger")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_PurchaseLedger)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_NominalLedger")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_NominalLedger)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_MultiCurrency")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_MultiCurrency)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_ServiceCentre")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_ServiceCentre)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_JobCosting")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_JobCosting)
			
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_FaxManager")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_FaxManager)
			
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_Sequences")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Sequences)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_PriceTable")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_PriceTable)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_SerialNos")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_SerialNos)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_ChequeWriter")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_ChequeWriter)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_MultiLayer")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_MultiLayer)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_Subscriptions")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Subscriptions)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_Companies")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Products)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_Products")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Companies)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_IntServer")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Macros)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_Macros")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_Macros)
			APPEND TO ARRAY:C911(MOD_at_ModuleNames; "Module_DiaryManager")
			APPEND TO ARRAY:C911(MOD_al_ModuleIDS; Module_DiaryManager)
			MOD_bo_ModulesLoaded:=True:C214
		End if 
		$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleNames; $3)
		If ($_l_ModuleRow>0)
			$0:=MOD_al_ModuleIDS{$_l_ModuleRow}
		Else 
			$0:=0
			
		End if 
		
End case 
ERR_MethodTrackerReturn("CONTEXTS_GETID"; $_t_oldMethodName)
