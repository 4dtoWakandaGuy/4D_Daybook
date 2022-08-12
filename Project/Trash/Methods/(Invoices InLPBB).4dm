//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_InLPBB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>SalesHdrDP; INV_bo_FurtherFieldsLoaded; INV_bo_newInvoice)
	C_LONGINT:C283($_l_FurtherFieldsExist; baddressModify; INV_at_ViewTabsLabelsOLD; INV_l_AdhocMod)
	C_REAL:C285(INV_l_FurtherFieldsMod; vTot)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName; COM_t_titleVAT; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; INV_t_AddressLine1; INV_t_AddressLine1_OLD; INV_t_AddressLine2; INV_t_AddressLine2_OLD; INV_t_Country; INV_t_Country_OLD; INV_t_County; INV_t_County_OLD; INV_t_PostalCode; INV_t_PostalCode_OLD)
	C_TEXT:C284(INV_t_Town; INV_t_Town_OLD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPBB")
INV_bo_newInvoice:=False:C215
Invoices_InLPBC
If ([INVOICES:39]Invoice_Number:1="")
	If (DB_t_CurrentFormUsage2="Proforma")
		[INVOICES:39]State:10:=-1
	End if 
	// Inv_No
	[INVOICES:39]Print_Comments:25:=<>SalesHdrDP
End if 
If (([INVOICES:39]State:10=0) & ([INVOICES:39]Invoice_Date:4=!00-00-00!))
	If ([COMPANIES:2]Default_Credit_Stage:42#"")
		[INVOICES:39]Credit_Stage:22:=[COMPANIES:2]Default_Credit_Stage:42
	Else 
		[INVOICES:39]Credit_Stage:22:=DB_GetLedgerInvoiceDefaultStage
	End if 
End if 
Invoices_InLPB
If (([INVOICES:39]Terms:11="") & ([INVOICES:39]State:10<1) & ([INVOICES:39]State:10>-2))
	If ([COMPANIES:2]SL_Terms:40#"")
		[INVOICES:39]Terms:11:=[COMPANIES:2]SL_Terms:40
	Else 
		[INVOICES:39]Terms:11:=DB_GetLedgerDefaultTerms
	End if 
	Invoices_DueDat
End if 
Invoices_LPAge
QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
If ([INVOICES:39]Debtors_Account:15="")
	[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Debit_Account:4
End if 
vTot:=0
Invoices_InLPTi
COM_t_titleVAT:=Term VATWT("Reg No")
INV_t_AddressLine1:=""
INV_t_AddressLine2:=""
INV_t_Town:=""
INV_t_County:=""
INV_t_PostalCode:=""
INV_t_Country:=""
INV_t_AddressLine1_OLD:=""
INV_t_AddressLine2_OLD:=""
INV_t_Town_OLD:=""
INV_t_County_OLD:=""
INV_t_PostalCode_OLD:=""
INV_t_Country_OLD:=""
DB_t_Address1Label:=<>DB_t_Address1Label
DB_t_Address2Label:=<>DB_t_Address2Label
DB_t_TownLabel:=<>DB_t_TownLabel
DB_t_CountyLabel:=<>DB_t_CountyLabel
DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
DB_t_CountryLabel:=<>DB_t_CountryLabel

OBJECT SET ENTERABLE:C238([INVOICES:39]Deliver_To:32; False:C215)
OBJECT SET VISIBLE:C603([INVOICES:39]Deliver_To:32; True:C214)
OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; True:C214)
OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; False:C215)
OBJECT SET VISIBLE:C603(baddressModify; True:C214)
INV_l_AdhocMod:=0
If ([INVOICES:39]Deliver_To:32="")
	If ([INVOICES:39]x_DeliveryAddressID:48>0)
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[INVOICES:39]x_DeliveryAddressID:48)
		[INVOICES:39]Deliver_To:32:=[AddressRecords:125]FormattedAddress:12
	End if 
End if 
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[INVOICES:39])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "INV_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "INV_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")
INV_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
INV_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
//Note that for a new record this will be false!!!!!

Invoice_Contexts
If (INV_at_ViewTabsLabelsOLD>0)
	INV_at_ViewTabsLabels:=INV_at_ViewTabsLabelsOLD
End if 
If (INV_at_ViewTabsLabels=0)
	INV_at_ViewTabsLabels:=1
	INV_at_ViewTabsLabelsOLD:=0
End if 
DB_t_CallOnCloseorSave:="R:Inv_Accept:D:Inv_Cancel"
Macro_AccType("Load "+String:C10(Table:C252(->[INVOICES:39])))
ERR_MethodTrackerReturn("Invoices_InLPBB"; $_t_oldMethodName)