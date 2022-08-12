//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintTrans
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   10/11/2010 23:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_NoHideModule)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_MenuParameter; $_l_OK; DB_l_CurrentDisplayedForm; vNo; vNo2)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $_t_Report; $_t_ReportName; $1; DB_t_CurrentContext; DB_t_CurrentFormUsage; vTitle; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintTrans")

CREATE SET:C116([TRANSACTIONS:29]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_bo_NoHideModule:=True:C214
	If (<>MENU_l_BarModule>0)
		ModuleNumber:=<>MENU_l_BarModule
	End if 
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_l_MenuParameter:=Num:C11($_t_MenuItemParameter)
COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$Temp")

Case of 
	: ($_l_MenuParameter=1)
		//TransByDate
		vTitle:="TRANSACTIONS BY DATE"
		vTitle2:="Trans by Date"
		
	: ($_l_MenuParameter=2)
		// by type
		vTitle:="TRANSACTIONS BY TYPE"
		vTitle2:="Trans by Type"
		
	: ($_l_MenuParameter=3)
		//by account
		vTitle:="TRANSACTIONS BY ACCOUNT"
		vTitle2:="Trans by Account"
		
	: ($_l_MenuParameter=4)  //trhans report???
		vTitle:="TRANSACTIONS"
		vTitle2:="Transactions"
		
		Gen_Confirm("Use Current on screen Sort order"; "Yes"; "No")
		If (OK=0)
			OK:=1
			ORDER BY:C49([TRANSACTIONS:29])
		End if 
	: ($_l_MenuParameter=5)
		vTitle:="VAT Listing"
		vTitle2:="VAT Listing"
End case 
If (vTitle="VAT Listing")
	DB_t_CurrentFormUsage:="VAT"
End if 
If (vTitle="VAT Listing")
	Gen_Confirm("Do you want to display only Inputs & Outputs, or include Neithers?"; "I & O"; "I, O & N")
	If (OK=1)
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"N")
	End if 
End if 
If (Records in selection:C76([TRANSACTIONS:29])>0)
	DB_t_CurrentFormUsage:="Print"
	Transactions_Sort
	If (OK=1)
		If (vNo2#Records in selection:C76([TRANSACTIONS:29]))
			Transactions_Sort
		End if 
		$_t_ReportName:=""
		vNo:=Records in selection:C76([TRANSACTIONS:29])
		Case of 
			: (vTitle="TRANSACTIONS BY DATE")
				$_t_ReportName:="Transactions by Date"
				$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Transactions by Date")
				$_bo_Continue:=($_l_OK>=0)
				If ($_bo_Continue)
					FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans_List")
					BREAK LEVEL:C302(1)
					$_t_Report:="TransDate"
				End if 
			: (vTitle="TRANSACTIONS BY TYPE")
				$_t_ReportName:="Transactions by Type"
				$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Transactions by Type")
				$_bo_Continue:=($_l_OK>=0)
				If ($_bo_Continue)
					FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans_Type")
					BREAK LEVEL:C302(1)
					$_t_Report:="TransType"
				End if 
			: (vTitle="TRANSACTIONS BY ACCOUNT")
				$_t_ReportName:="Transactions by Account"
				$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Transactions by Account")
				$_bo_Continue:=($_l_OK>=0)
				If ($_bo_Continue)
					FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans_Accs")
					BREAK LEVEL:C302(1)
					$_t_Report:="TransAcc"
				End if 
			: (vTitle="TRANSACTIONS")
				$_t_ReportName:="Transactions"
				$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Transactions")
				$_bo_Continue:=($_l_OK>=0)
				If ($_bo_Continue)
					FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans_Accs")
					BREAK LEVEL:C302(1)
					$_t_Report:="TransAcc"
				End if 
			: (vTitle="VAT Listing")
				$_t_ReportName:="Vat Listing"
				$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Vat Listing")
				$_bo_Continue:=($_l_OK>=0)
				If ($_bo_Continue)
					Transactions_Sort
					FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans_IO")
					BREAK LEVEL:C302(2)
					$_t_Report:="TransVAT"
				End if 
			Else 
				$_bo_Continue:=False:C215
		End case 
		vTitle2:=Term_VATWT("VAT")
		If ($_bo_Continue)
			If (Not:C34(SR_ReportOK($_t_Report)))
				//Gen_Confirm ("Please choose Print Settings of 100% Landscape";"";"")
				If (OK=1)
					ACCUMULATE:C303([TRANSACTIONS:29]Amount:6; [TRANSACTIONS:29]Tax_Amount:16; [TRANSACTIONS:29]Total:17)
					PRINT SELECTION:C60([TRANSACTIONS:29])
				End if 
				PRT_SetPrinterPaperOptions($_t_ReportName)  //NG June 2005
			End if 
		End if 
		
	End if 
	
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("ACC_PrintTrans"; $_t_oldMethodName)