//%attributes = {}
If (False:C215)
	//Project Method Name:      Modules_PopMenuBuild
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2010 16:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	//ARRAY TEXT(BAR_at_FunctionParamter;0)
	//ARRAY TEXT(BAT_at_MenuFunctions;0)
	C_BOOLEAN:C305(<>OneEntry; <>StatesLoaded; MENU_bo_Overwrite)
	C_LONGINT:C283(<>Bar; <>PER_l_AccessLevel)
	C_TEXT:C284($_t_Assembly; $_t_Companies; $_t_Contacts; $_t_Contracts; $_t_CreditNotes; $_t_Deposits; $_t_DissAssembly; $_t_EnterEnquiry; $_t_EnterEstimate; $_t_EnterNewOrder; $_t_EnterProspects)
	C_TEXT:C284($_t_EnterQuotation; $_t_Invoices; $_t_Jobs; $_t_MenuString; $_t_NewDocument; $_t_oldMethodName; $_t_PostCodes; $_t_Prices; $_t_ProcessName; $_t_Products; $_t_Proformas)
	C_TEXT:C284($_t_Projects; $_t_Prospects; $_t_PurchaseCredits; $_t_PurchaseOrders; $_t_PurchasePayments; $_t_PurchasePrePayments; $_t_Purchases; $_t_SalesLedger; $_t_ServiceCalls; $_t_Space; $_t_Space1)
	C_TEXT:C284($_t_Space2; $_t_Space3; $_t_StockMovements; $_t_TransIn; $_t_ViewDocuments; $_t_ViewEnquiryWriter; $_t_VIewEstimateWriter; $_t_ViewLetterQuotes; $_t_VIewProspects; $0; $1)
	C_TEXT:C284(MenuString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Modules_PopMenuBuild")
//TRACE
//NIgel March 2008 Builds a string of the significant menu items so they can be displayed ina pop up
//2010 modifiying for V11



$_t_ProcessName:=$1
$_t_MenuString:=""
$_t_Products:=""
$_t_Space1:="    "
$_t_Space2:="   "
$_t_Space3:=" "
If (<>OneEntry)
	$_t_Products:=Get localized string:C991("MenuItem_Product")
	$_t_Companies:=Get localized string:C991("MenuItem_Company")
	$_t_Contacts:=Get localized string:C991("MenuItem_Contact")
	$_t_Prices:=Get localized string:C991("MenuItem_Price")
	
	$_t_StockMovements:=Get localized string:C991("MenuItem_StockMovement")
	$_t_Assembly:=Get localized string:C991("MenuItem_Assembly")
	$_t_DissAssembly:=Get localized string:C991("MenuItem_Disassembly")
	$_t_Proformas:=Get localized string:C991("MenuItem_Proforma")
	$_t_Invoices:=Get localized string:C991("MenuItem_Invoice")
	$_t_CreditNotes:=Get localized string:C991("MenuItem_CreditNote")
	$_t_CreditNotes:=Term_SLPLWT($_t_CreditNotes)
	$_t_Deposits:=Get localized string:C991("MenuItem_Deposit")
	$_t_TransIn:=Get localized string:C991("MenuItem_TransBatch")
	$_t_ServiceCalls:=Get localized string:C991("MenuItem_ServiceCall")
	$_t_Contracts:=Get localized string:C991("MenuItem_Contract")
	$_t_Prospects:=Get localized string:C991("MenuItem_Prospect")
	$_t_Projects:=Get localized string:C991("MenuItem_Project")
	$_t_Jobs:=Get localized string:C991("MenuItem_Job")
	$_t_Purchases:=Get localized string:C991("MenuItem_PurchaseInvoice")
	$_t_PurchaseCredits:=Get localized string:C991("MenuItem_PurchaseCredit")
	$_t_PurchasePrePayments:=Get localized string:C991("MenuItem_PurchasePrepayment")
	$_t_PurchasePayments:=Get localized string:C991("MenuItem_PurchasePayment")
	$_t_PurchaseOrders:=Get localized string:C991("MenuItem_PurchaseOrder")
	
Else 
	$_t_Products:=Get localized string:C991("MenuItem_Products")
	$_t_Companies:=Get localized string:C991("MenuItem_Companies")
	$_t_Contacts:=Get localized string:C991("MenuItem_Contacts")
	$_t_Prices:=Get localized string:C991("MenuItem_Prices")
	$_t_StockMovements:=Get localized string:C991("MenuItem_StockMovements")
	$_t_Assembly:=Get localized string:C991("MenuItem_Assemblies")
	$_t_DissAssembly:=Get localized string:C991("MenuItem_Disassemblies")
	$_t_Invoices:=Get localized string:C991("MenuItem_Invoices")
	$_t_Proformas:=Get localized string:C991("MenuItem_Proformas")
	$_t_CreditNotes:=Get localized string:C991("MenuItem_CreditNotes")
	$_t_CreditNotes:=Term_SLPLWT($_t_CreditNotes)
	$_t_Deposits:=Get localized string:C991("MenuItem_Deposits")
	$_t_TransIn:=Get localized string:C991("MenuItem_TransBatches")
	$_t_ServiceCalls:=Get localized string:C991("MenuItem_ServiceCalls")
	$_t_Contracts:=Get localized string:C991("MenuItem_Contracts")
	$_t_Prospects:=Get localized string:C991("MenuItem_Prospects")
	$_t_Projects:=Get localized string:C991("MenuItem_Projects")
	$_t_Jobs:=Get localized string:C991("MenuItem_Jobs")
	$_t_Purchases:=Get localized string:C991("MenuItem_PurchaseInvoices")
	$_t_PurchaseCredits:=Get localized string:C991("MenuItem_PurchaseCredit")
	$_t_PurchasePrePayments:=Get localized string:C991("MenuItem_PurchasePrepayments")
	$_t_PurchasePayments:=Get localized string:C991("MenuItem_PurchasePrepayment")
	$_t_PurchaseOrders:=Get localized string:C991("MenuItem_PurchaseOrders")
	
End if 
If ($_t_ProcessName#"")
	ARRAY TEXT:C222(BAT_at_MenuFunctions; 0)
	ARRAY TEXT:C222(BAR_at_FunctionParamter; 0)
	//Modules_MenuExe - replacing an Execute
	Case of 
		: (<>Bar=1) | (<>Bar=20)
			If (Not:C34(<>StatesLoaded))
				States_Load
			End if 
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				$_t_EnterNewOrder:=Get localized string:C991("MenuItem_Enter")+$_t_Space3+Substring:C12(<>SYS_at_RecStateNames{24}{3}; 1; 25)  // 113
				$_t_EnterQuotation:=Get localized string:C991("MenuItem_Enter")+$_t_Space3+Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 25)  // 112
				$_t_EnterEnquiry:=Get localized string:C991("MenuItem_Enter")+$_t_Space3+Substring:C12(<>SYS_at_RecStateNames{24}{1}; 1; 25)
				$_t_EnterProspects:=Get localized string:C991("MenuItem_Enter")+$_t_Space3+Get localized string:C991("MenuItem_Prospects")
				$_t_VIewProspects:=Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prospects")
				$_t_ViewEnquiryWriter:=Get localized string:C991("MenuItem_ViewEnquiryWriter")
				
				// SET MENU ITEM(6;4;"Enter "+◊SYS_at_RecordStateNames{24}{1};◊MenuProc)
				//  SET MENU ITEM(6;5;"Enter "+◊SYS_at_RecordStateNames{24}{2};◊MenuProc)
				//   SET MENU ITEM(6;6;"Enter "+◊SYS_at_RecordStateNames{24}{3};◊MenuProc)
			Else 
				$_t_EnterQuotation:=""
				$_t_EnterNewOrder:=""
				$_t_EnterEnquiry:=""
				$_t_EnterProspects:=Get localized string:C991("MenuItem_Enter")+$_t_Space3+Get localized string:C991("MenuItem_Prospects")
				$_t_VIewProspects:=Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prospects")
				$_t_ViewEnquiryWriter:=Get localized string:C991("MenuItem_ViewEnquiryWriter")
				
				$_t_EnterProspects:=Get localized string:C991("MenuItem_Enter")+$_t_Space3+Get localized string:C991("MenuItem_Enquirer")  //"Enter Inquiriers"
				$_t_EnterProspects:=Term_OrdWT($_t_EnterProspects)
				$_t_VIewProspects:=Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Enquirer")  //"View Inquiriers"
				$_t_VIewProspects:=Term_OrdWT($_t_VIewProspects)
				
				
				$_t_ViewEnquiryWriter:=Get localized string:C991("MenuItem_ViewInqqotord")
				$_t_ViewEnquiryWriter:=Term_OrdWT($_t_ViewEnquiryWriter)
				$_t_EnterEnquiry:=Get localized string:C991("MenuItem_EnterEstimates")
				
				$_t_ViewEnquiryWriter:=Get localized string:C991("MenuItem_EQO")
				
				
				
				$_t_VIewEstimateWriter:=Get localized string:C991("MenuItem_ViewInqestord")
				$_t_VIewEstimateWriter:=Term_OrdWT($_t_VIewEstimateWriter)
				$_t_EnterEstimate:=Get localized string:C991("MenuItem_EnterEstimates")
				$_t_EnterEstimate:=Term_OrdWT($_t_EnterEstimate)
				
				
			End if 
			
			
			//File
			//Edit
			//Volumes
			//Companies
			
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Contacts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_PriceTable")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
			End if 
			//Diary
			If ((DB_GetModuleSettingByNUM(Module_DiaryManager)>=2))
				
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Diary")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enterincalendar")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryCalendar")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterinWorkflow")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryWorkflow")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Entercompleted")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryCompleted")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Automatedactions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryAutomated")
				
				
				
				
				
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZDiary_In")
				//diaryCalendar
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewWorkflow")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_ShowWorkflow")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCalendar")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZDiary_Mod")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewHistory")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_ShowHistory")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewAutomatedActions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_ShowAutomater")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			End if 
			//EnquiryWriter
			If ((DB_GetModuleSettingByNUM(Module_Enquiries))<2)
				
				//Menu disabled so dont create it
			Else 
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_EnquiryWriter")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				If ((DB_GetModuleSettingByNUM(14))<2)  //campaign manager controls Enquirers
					//Menu disabled so dont create it
				Else 
					If ($_t_EnterProspects#"") | ($_t_VIewProspects#"")
						
						If ($_t_EnterProspects#"")
							
							$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_EnterProspects
							APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
							APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
							
							
						End if 
						If ($_t_VIewProspects#"")
							$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_VIewProspects
							APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
							APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ContactsProspects")
						End if 
					End if 
				End if 
				If ($_t_ViewEnquiryWriter#"") | ($_t_EnterEnquiry#"") | ($_t_EnterQuotation#"") | ($_t_EnterNewOrder#"") | ($_t_VIewEstimateWriter#"") | ($_t_EnterEstimate#"")
					
					$_t_MenuString:=$_t_MenuString+";"+"   (-"
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
					
					If ($_t_EnterEnquiry#"")
						
						$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_EnterEnquiry
						//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZOrders_InE")
						APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
						APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersEnquiries")
						
					End if 
					If ($_t_EnterQuotation#"")
						$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_EnterQuotation
						//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZOrders_InQ")
						APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
						APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersQuotations")
					End if 
					If ($_t_EnterNewOrder#"")
						$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_EnterNewOrder
						APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
						APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ORDERS:24])))
					End if 
					If ($_t_ViewEnquiryWriter#"")
						$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_ViewEnquiryWriter
						
						APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
						APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ORDERS:24])))
					End if 
					
					If ($_t_EnterEstimate#"") & ($_t_EnterEstimate#$_t_EnterQuotation)
						$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_EnterEstimate
						APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
						APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersQuotations")
					End if 
				End if 
			End if 
		: (<>Bar=2)  //Data manager
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Core")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			$_t_MenuString:=$_t_MenuString+";"+" (<B "+Get localized string:C991("MenuItem_Contactscompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Areas")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[AREAS:3])))
			
			$_t_PostCodes:=Get localized string:C991("MenuItem_Postcodes")
			$_t_PostCodes:=Term_FSWT($_t_PostCodes)
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+$_t_PostCodes
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[POSTAL_CODES:50])))
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPostcodes_Mod")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Countries")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZCountries_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COUNTRIES:73])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_AddressFormats")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ADDRESS_FORMATS:74])))
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZAddTypes_Mod")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Status")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZStatus_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STATUS:4])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Types")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTypes Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TYPES:5])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Sources")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZSources_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[SOURCES:6])))
			
			If ((DB_GetModuleSettingByNUM(14)>=2) & (DB_GetModuleSettingByNUM(Module_SalesManager)>=2))
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Publications")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PUBLICATIONS:52])))
				
				
				
			End if 
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_FurtherAnalysis")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZFurthers_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Roles")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZRoles_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ROLES:87])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B   "+Get localized string:C991("MenuItem_SECURITY")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			If (Not:C34(((<>PER_l_AccessLevel<2) & (DB_GetModuleSettingByNUM(Module_DataManager)=2)) | (<>PER_l_AccessLevel=0)))
			Else 
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_ChangePassword")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "Edit Pass")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			End if 
			If (((<>PER_l_AccessLevel>1) | (DB_GetModuleSettingByNUM(Module_DataManager)#2)) & (<>PER_l_AccessLevel#0))
			Else 
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_PersonnelGroups")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PERSONNEL_GROUPS:92])))
				
				
			End if 
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Personnel")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PERSONNEL:11])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B   "+Get localized string:C991("MenuItem_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+"Collections"
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZGroups_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CATALOGUE:108])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Groups")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZGroups_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCT_GROUPS:10])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Brands")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCT_BRANDS:8])))
			
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Tables  "
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_PriceGroups")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_GROUPS:18])))
				
				
			End if 
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B   "+Get localized string:C991("MenuItem_Settings")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			If ((DB_GetModuleSettingByNUM(Module_Macros))>=2)  //Macros"
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Macros")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZMacros_ModM")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[SCRIPTS:80])))
				
				
			End if 
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Pictures")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPictures_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PICTURES:85])))
			
			
			If ((DB_GetModuleSettingByNUM(40))=0)  //not international
			Else 
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Terminology")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TERMINOLOGY:75])))
				
				
			End if 
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_FileStates")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZStates_Mod")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Lists")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZLists_Mod")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_FurtherFields")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZFurthFldD_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			//APPEND TO ARRAY(BAR_at_FunctionParamter;"Further FIelds")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Preferences")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZUser_Mod")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B   "+Get localized string:C991("Menu_Financials")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)
				$_t_MenuString:=$_t_MenuString+";"+"(<B    "+Get localized string:C991("MenuItem_StockControl")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_StockTypes")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZStockTypes_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_TYPES:59])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_StockLocations")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[LOCATIONS:61])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_MovementTypes")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZMoveTypes_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[MOVEMENT_TYPES:60])))
				
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2) | ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>=2)
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B    "+Get localized string:C991("MenuItem_Ledgers")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_CreditStages")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvStages_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CREDIT_STAGES:54])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_CreditCardProvision")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "*zCards_Mod")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			End if 
			If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>=2)
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B    "+Get localized string:C991("MenuItem_NominalLedger")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Accounts")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZAccounts_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ACCOUNTS:32])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_AccountsHeadings")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZHeadings_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[HEADINGS:84])))
				
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Yearsperiods")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZPeriods_Mod")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_TransactionTypes")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TRANSACTION_TYPES:31])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Analyses")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ANALYSES:36])))
				
				
				If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //Multi-Layer"
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Layers")
					
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[LAYERS:76])))
					
				End if 
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_TaxCodes")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZVAT Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TAX_CODES:35])))
				
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Currencies")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CURRENCIES:71])))
				
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_DiaryManager))>=2)
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B  "+Get localized string:C991("Menu_Others")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B    "+Get localized string:C991("MenuItem_DiaryUC")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Actions")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZActions_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ACTIONS:13])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Results")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZResults_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[RESULTS:14])))
				
				
				If ((DB_GetModuleSettingByNUM(Module_Sequences))>=2)  //Sequences     "
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Workflow")
					//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZSequences_Mod")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[WORKFLOW_CONTROL:51])))
					
					
				End if 
			End if 
			
			If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>=2)
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("MenuItem_ServiceControl")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Problems")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZProblems_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PROBLEMS:22])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_Solutions")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZSolutions_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[SOLUTIONS:23])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_ContractTypes")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZSolutions_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTRACT_TYPES:19])))
				
				
			End if 
		: (<>Bar=3)
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Stock")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_StockMovements
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewMovements")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewMovementItems")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewStockHistory")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Stock ItemsHistory")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZStock_Hist")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCurrentStock")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CURRENT_STOCK:62])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewConsolidatedLevels")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZStockLev_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_LEVELS:58])))
				
				If ((DB_GetModuleSettingByNUM(Module_Assemblies))>=2)
					$_t_MenuString:=$_t_MenuString+";"+"   (-"
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
					
					$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("MenuItem_Assemblies")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_Assembly
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "StockMovementsAssembly")
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_DissAssembly
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "StockMovementsDissasembly")
					
				End if 
			End if 
		: (<>Bar=4)  // sales ledger
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
			End if 
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			//TRACE
			$_t_SalesLedger:=Get localized string:C991("Menu_SalesLedger")
			$_t_SalesLedger:=Term_SLPLWT($_t_SalesLedger)
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+$_t_SalesLedger
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Proformas
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesProForma")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Invoices
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_CreditNotes
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesCreditNote")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewSalesLedger")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCreditNotes")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "CreditNotes")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewReceipts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Receipts")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewDeposits")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Deposits")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProFormas")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ProFormas")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchInvoiceOrders")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersInvoice")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPrintInvoices")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Inv")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPrint")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Nom")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPost")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Deposits
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesDeposit")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_DepositRefund")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesDepRefund")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_InvoiceReceipt")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Pay")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesReceipt")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_UndoReceipt")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "*DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesReceiptRefund")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_RemRec")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Rec")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPrintRemittances")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_DebtorsScreen")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "Zinvoices_ADScr")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
		: (<>Bar=5)  //Nominal Ledger
			$_t_MenuString:="(<B "+Get localized string:C991("MenuItem_NominalLedger")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_TransIn
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewBatch")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTransB_Nom")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "TRANS INPOST")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewAccBalances")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZAccBal_Bal")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ACCOUNT_BALANCES:34])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Setupbudgets")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZAccBal Bud")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ACC BALANCESBUDGETS")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BankRecon")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTrans_Recl")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "TransactionsBankReconcilliation")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_RecurJournals")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[RECURRING_JOURNALS:38])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ReverseBatch")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTransB_Rev")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Trans inREVERSE")
			
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //Currency"
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_CurrencyRates")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZCurrRates_Mod")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			End if 
		: (<>Bar=6)  // Purchase Ledger
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
			End if 
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_PurchaseLedger")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Invoices
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
			
			
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_In")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterCreditNote")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesCredit")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_InCr")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewLedger")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPost")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterPrePayment")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPrePayment")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_InP")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterPayment")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPayment")
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			If ((DB_GetModuleSettingByNUM(Module_ChequeWriter))>=2)  //Cheque Printing"
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Remit")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesCheques")
				
			End if 
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_AutopayList")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesAutopay")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_CreditorsScreen")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZPurchases_ACSc")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
		: (<>Bar=7)  //Service Centre
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
				
			End if 
			//Diary
			If ((DB_GetModuleSettingByNUM(Module_DiaryManager)>=2))
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Diary")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enterincalendar")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "diaryCalendar")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterinWorkflow")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "diaryWorkflow")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Entercompleted")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryNotes")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Automatedactions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryAutomated")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Automatedactions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryAutomated")
				
				
				
				
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZDiary_In")
				//diaryCalendar
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewWorkflow")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_Showtodo")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCalendar")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZDiary_Mod")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewHistory")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_ShowHistory")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewAutomatedActions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_ShowAutomater")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			End if 
			//Call centre
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_CallCentre")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_ServiceCalls
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[SERVICE_CALLS:20])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCalls")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZCalls_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[SERVICE_CALLS:20])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_OutstandingCalls")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZCalls_ModO")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Service CallsOutstanding")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_StartCheckingCalls")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZCalls_CheckLau")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contracts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTRACTS:17])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContracts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContracts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTRACTS:17])))
			
			
			
			
		: (<>Bar=9)
		: (<>Bar=10)  //Job costing
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
			End if 
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Jobs")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Projects
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PROJECTS:89])))
			
			
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZProjects_In")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProjects")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PROJECTS:89])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Jobs
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[JOBS:26])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewJobs")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[JOBS:26])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewJobStages")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[JOB_STAGES:47])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewJobPersonnel")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[JOB PERSONNEL:48])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterTimeCosts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersTimeCosts")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZJobs_TCIn")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space1+Get localized string:C991("MenuItem_EnterTime")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryTime")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTime_In")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewTime")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTime_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryJobTime")
			
			
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)>=2))
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_SalesLedger:=Get localized string:C991("Menu_SalesLedger")
				$_t_SalesLedger:=Term_SLPLWT($_t_SalesLedger)
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+$_t_SalesLedger
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Proformas
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesProForma")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Invoices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
				
				
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_CreditNotes
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesCreditNote")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewSalesLedger")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
				
				
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCreditNotes")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "CreditNotes")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewReceipts")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Receipts")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewDeposits")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Deposits")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProFormas")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ProFormas")
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPrintInvoices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Inv")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPrint")
				//`````````
				
				
				//`````````
			End if 
			
		: (<>Bar=11) | (<>Bar=22)  // SIlver
			
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPrint")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			
			
			//Diary
			If ((DB_GetModuleSettingByNUM(Module_DiaryManager)>=2))
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Diary")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enterincalendar")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "diaryCalendar")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterinWorkflow")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "diaryWorkflow")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Entercompleted")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryNotes")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Automatedactions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryAutomated")
				
				//$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string("MenuItem_Automatedactions")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"DB_MenuNewRecord")
				//APPEND TO ARRAY(BAR_at_FunctionParamter;"DiaryAutomated")
				
				
				
				
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZDiary_In")
				//diaryCalendar
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewWorkflow")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_Showtodo")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCalendar")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZDiary_Mod")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewHistory")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_ShowHistory")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewAutomatedActions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "SD_l_ShowAutomater")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			End if 
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			
			//`Sales
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Sales")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+Get localized string:C991("Menu_Sales")+$_t_Space3+$_t_Invoices
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+Get localized string:C991("Menu_Sales")+$_t_Space3+$_t_CreditNotes
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesCreditNote")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewSalesLedger")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCreditNotes")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "CreditNotes")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewReceipts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Receipts")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewDeposits")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Deposits")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProFormas")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ProFormas")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPrintInvoices")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Inv")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPrint")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Nom")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPost")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Deposits
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesDeposit")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_DepositRefund")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesDepRefund")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_InvoiceReceipt")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Pay")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesReceipt")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_UndoReceipt")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "*DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesReceiptRefund")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_PurchaseLedger")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Purchases
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
			
			
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_In")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_PurchaseCredits
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesCreditNote")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_InCr")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewPurchaseLedger")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
			
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Nom")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPost")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_PurchasePrePayments
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPrePayment")
			
			//$_t_MenuString:=$_t_MenuString+";"+"   Purchase Pre-Payment"
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_InP")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_PurchasePayments
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPayment")
			
			//z$_t_MenuString:=$_t_MenuString+";"+"   Purchase Payment"
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Pay")
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Remit")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Cheq")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesCheques")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("MenuItem_NominalLedger")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_TransIn
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewBatch")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTransB_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[TRANSACTION_BATCHES:30])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTransB_Nom")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Trans inPost")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewAccBalances")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZAccBal_Bal")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ACCOUNT_BALANCES:34])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BankRecon")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTrans_Rec")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "TransactionsBankReconcilliation")
			
		: (<>Bar=13) | (<>Bar=90)  //WP Menu
			//```
			//Here
			$_t_ViewLetterQuotes:=Get localized string:C991("MenuItem_ViewLetters")
			$_t_ViewLetterQuotes:=Term_OrdWT($_t_ViewLetterQuotes)
			$_t_NewDocument:=Get localized string:C991("MenuItem_NewDocument")
			$_t_NewDocument:=Term_OrdWT($_t_NewDocument)
			$_t_ViewDocuments:=Get localized string:C991("MenuItem_ViewDocuments")
			$_t_ViewDocuments:=Term_OrdWT($_t_ViewDocuments)
			
			//````
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Documents")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_NewDocument
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DIaryLetter")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZDiary_InQ")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterEmail")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DIaryEmail")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"zDiary_InEmail")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_ViewLetterQuotes
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZDiary_ModL")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryLetters")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterLetTemplates")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DocumentsLetters")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZLetters_In")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterSRTemplates")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZSuperReport_In")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DocumentsReports")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewLetTemplates")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZLetters_Mod_1")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DocumentsLetterTemplates")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewRepTemplates")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"zLetters_Mod_2")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DocumentsReportTemplates")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewEmailTemplates")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"zLetters_Mod_3")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DocumentsEmailTemplates")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewOtherTemplates")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZLetters_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DocumentsEmailTemplates")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Mailing")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_MailCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "CompaniesMailing")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_MailContacts")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ContactsMailing")
			
			If ((DB_GetModuleSettingByNUM(Module_DiaryManager))<2)
			Else 
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_MailDiary")
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryMailing")
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_Enquiries)>=2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)>=2) | (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2) | (DB_GetModuleSettingByNUM(Module_Subscriptions)>2))
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				If ((DB_GetModuleSettingByNUM(Module_Enquiries)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2))
				Else 
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EQO")
					//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZMail_Ord")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersMailing")
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)  //Sales Ledger"
				Else 
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_PaymentsChasing")
					//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZMail_InvA")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesChasing")
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Statements")
					//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZMail_State")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesStatementMailing")
					
				End if 
				If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)
				Else 
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Contracts")
					
					
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ContractsMailing")
					
				End if 
				
				If ((DB_GetModuleSettingByNUM(Module_Subscriptions))<2)  //Subscriptions"
				Else 
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_SubscriptionRenewal")
					//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZMail_Subs")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "SubscriptionsRenewalMailing")
					
				End if 
			End if 
		: (<>Bar=14)  //Internet manager/remote access
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_WebServer")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_InternetMacros")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "MacrosInternet")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_WebAccess")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZWebAccess_Mod")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_StartWebServer")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "IWS_StartWebServer")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_StopWebServer")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "IWS_StopWebServer")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ConfigureWebServer")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "IWS_WebSetup")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
		: (<>Bar=15)  // SOP
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
			End if 
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_SalesOrders")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+Get localized string:C991("MenuItem_SalesOrders")
			
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZOrders_In")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ORDERS:24])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewSalesOrders")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ORDERS:24])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewOrderItems")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[ORDER_ITEMS:25])))
			
			
			
			If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>=2)  //Subscriptions"
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Subscriptions")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_IssueDeliveries")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZSubscript_Del")
				//here
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "SubscriptionsDeliver")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_SubBilling")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZSubscript_Inv")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "SubscriptionsInvoice")
				
				If ((DB_GetModuleSettingByNUM(Module_WPManager))>=2)  //WP"
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_RenewalMailing")
					//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZMail_Subs")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "SubscriptionsRenewalMailing")
					
				End if 
			End if 
		: (<>Bar=16)  // Purchase order processing
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
			End if 
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_PurchaseOrders")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			//here
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_PurchaseOrders
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchOrd_In")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_PurchaseOrders")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
			
		: (<>Bar=17)
			
			
		: (<>Bar=20)
			//See bar 1
		: (<>Bar=21)
			
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
			End if 
			If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Inventory")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				
				$_t_MenuString:=$_t_MenuString+";"+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_StockMovements
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewMovements")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewInventoryItems")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewInventoryHistory")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZStock_Hist")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Stock ItemsHistory")
				
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCurrentInventory")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZStockCurr_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CURRENT_STOCK:62])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewInventoryLevels")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZStockLev_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[STOCK_LEVELS:58])))
				
				
				If ((DB_GetModuleSettingByNUM(Module_Assemblies))>=2)
					
					$_t_MenuString:=$_t_MenuString+";"+"   (-"
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
					
					$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("MenuItem_Assemblies")
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
					
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_Assembly
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "StockMovementsAssembly")
					
					$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+$_t_DissAssembly
					APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
					APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "StockMovementsDissasembly")
					
				End if 
			End if 
		: (<>Bar=22)
			//see bar 11
		: (<>Bar=23)
		: (<>Bar=24)
		: (<>Bar=25)
		: (<>Bar=26)
		: (<>Bar=27)
		: (<>Bar=28)
		: (<>Bar=29)
		: (<>Bar=30)
		: (<>Bar=30)
		: (<>Bar=31)
		: (<>Bar=32)
		: (<>Bar=33)
		: (<>Bar=34)
		: (<>Bar=35)
		: (<>Bar=36)
		: (<>Bar=37)
		: (<>Bar=38)
		: (<>Bar=39)
		: (<>Bar=40)
		: (<>Bar=41)
		: (<>Bar=42)
		: (<>Bar=42)
		: (<>Bar=43)
		: (<>Bar=44)
		: (<>Bar=45)
		: (<>Bar=46)
		: (<>Bar=47)
		: (<>Bar=48)
		: (<>Bar=49)
		: (<>Bar=50)
		: (<>Bar=51)
		: (<>Bar=52)
		: (<>Bar=53)
		: (<>Bar=54)
		: (<>Bar=55)
		: (<>Bar=56)
		: (<>Bar=57)
		: (<>Bar=58)
		: (<>Bar=59)
		: (<>Bar=60)
		: (<>Bar=61)
		: (<>Bar=62)
		: (<>Bar=63)
		: (<>Bar=64)
		: (<>Bar=65)
		: (<>Bar=66)
		: (<>Bar=67)
		: (<>Bar=68)
		: (<>Bar=69)
		: (<>Bar=70)
		: (<>Bar=71)
		: (<>Bar=72)
		: (<>Bar=73)
		: (<>Bar=74)
		: (<>Bar=75)
		: (<>Bar=76)
		: (<>Bar=77)
		: (<>Bar=78)
		: (<>Bar=79)
		: (<>Bar=80)
		: (<>Bar=81)
		: (<>Bar=82)
		: (<>Bar=83)
		: (<>Bar=84)
		: (<>Bar=85)
		: (<>Bar=86)
		: (<>Bar=87)
		: (<>Bar=88)
		: (<>Bar=89)  //Job COsting=was for silver....
			
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Jobs")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"   Enter Jobs"+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Jobs
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[JOBS:26])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Jobs")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZJobs_Mod"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[JOBS:26])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterTimeCosts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersTimeCosts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZJobs_TCIn")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewTime")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZTime_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "DiaryTime")
			
			
		: (<>Bar=90)
		: (<>Bar=91)
		: (<>Bar=92)
		: (<>Bar=93)
		: (<>Bar=94)
		: (<>Bar=95)
		: (<>Bar=96)
		: (<>Bar=97)
		: (<>Bar=98)
		: (<>Bar=99)
		: (<>Bar=100)
		: (<>Bar=101)
		: (<>Bar=102)
			$_t_MenuString:="(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			//TRACE
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
			End if 
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_SalesLedger:=Get localized string:C991("Menu_SalesLedger")
			$_t_SalesLedger:=Term_SLPLWT($_t_SalesLedger)
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+$_t_SalesLedger
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Proformas
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesProForma")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Invoices
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_CreditNotes
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesCreditNote")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewSalesLedger")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[INVOICES:39])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCreditNotes")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "CreditNotes")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewReceipts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Receipts")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewDeposits")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Deposits")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProFormas")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "ProFormas")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchInvoiceOrders")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZOrders_InvB")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "OrdersInvoice")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPrintInvoices")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Inv")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPrint")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Nom")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesPost")
			
			MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Deposits
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesDeposit")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_DepositRefund")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesDepRefund")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_InvoiceReceipt")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZInvoices_Pay")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "InvoicesReceipt")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_UndoReceipt")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "*INV_ReceiptsRefund")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_RemRec")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZInvoices_Rec")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ReceivablesScreenReport")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "Zinvoices_ADScr")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
		: (<>Bar=103)
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Companies")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Companies
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewCompanies")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZCompanies_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[COMPANIES:2])))
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Contacts
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewContacts")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZContacts_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[CONTACTS:1])))
			
			
			//Products
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Products")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Products
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewProducts")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>=2)  //Price Table"
				
				$_t_MenuString:=$_t_MenuString+";"+"   (-"
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Prices
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_View")+$_t_Space3+Get localized string:C991("MenuItem_Prices")
				//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPriceT_Mod")
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PRICE_TABLE:28])))
				
				
			End if 
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+"(<B "+Get localized string:C991("Menu_Payables")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_Enter")+$_t_Space3+$_t_Purchases
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_In")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
			
			//here
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_EnterAdhocCreditMemo")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_InCr")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesCreditNote")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_ViewAccountsPayable")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Mod")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])))
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_BatchPost")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Nom")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPost")
			
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_PrePayment")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_InP")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesPrepayment")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_PurchasePayment")
			//APPEND TO ARRAY(BAT_at_MenuFunctions;"ZPurchases_Pay")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DB_MenuNewRecord")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "Purchasespayment")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			If ((DB_GetModuleSettingByNUM(Module_ChequeWriter))>=2)  //Cheque Printing"
				$_t_MenuString:=$_t_MenuString+";"+"   Remittances & Checks"
				
				APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
				APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesCheques")
				
			End if 
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_AutopayList")
			
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "DBI_MenuDisplayRecords")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "PurchasesAutopay")
			
			$_t_MenuString:=$_t_MenuString+";"+"   (-"
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
			$_t_MenuString:=$_t_MenuString+";"+$_t_Space2+Get localized string:C991("MenuItem_PayablesScreenReport")
			APPEND TO ARRAY:C911(BAT_at_MenuFunctions; "ZPurchases_ACSc")
			APPEND TO ARRAY:C911(BAR_at_FunctionParamter; "")
			
		: (<>Bar=104)
		: (<>Bar=105)
		: (<>Bar=106)
		: (<>Bar=107)
		: (<>Bar=108)
		: (<>Bar=109)
	End case 
End if 
$0:=$_t_MenuString
//ARRAY STRING(55;BAT_at_MenuFunctions;0)
//Just make sure everything is the same size!
If (Size of array:C274(BAR_at_FunctionParamter)#Size of array:C274(BAT_at_MenuFunctions))
	//TRACE
End if 
ARRAY TEXT:C222(BAR_at_FunctionParamter; Size of array:C274(BAT_at_MenuFunctions))


//
ERR_MethodTrackerReturn("Modules_PopMenuBuild"; $_t_oldMethodName)
