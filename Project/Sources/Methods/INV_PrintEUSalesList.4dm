//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_PrintEUSalesList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/11/2010 14:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_StartProcess)
	C_DATE:C307(vDateF; vDateT)
	C_LONGINT:C283($_l_OK; $_l_Process; DB_l_CurrentDisplayedForm; vNo1; vNo2; vNo3)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_InvoiceTaxPrefix; $_t_MenuItemParameter; $_t_oldMethodName; $_t_Quarter; $_t_TaxRegistrationNumber; $1; ACC_t_AnalysisCodeFrom; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentContext; DB_t_CurrentFormUsage)
	C_TEXT:C284(vAnalCodeT; vDetails; vTitle1; vTitle5; vTitle6; vTitle7; vTitle8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_PrintEUSalesList")

$_t_MenuItemParameter:=""
If (Count parameters:C259>=1)
	$_t_MenuItemParameter:=$1
Else 
	//this is directly from the menu
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
End if 
$_bo_StartProcess:=False:C215
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	
	CREATE SET:C116([INVOICES:39]; "$temp")
	If (Records in set:C195("ListboxSet0")>0)
		Gen_Confirm("Print Selected Records?"; "Yes"; "No")
		If (OK=1)
			USE SET:C118("ListboxSet0")
		Else 
			$_bo_StartProcess:=True:C214
		End if 
		OK:=1
	Else 
		If (Records in selection:C76([INVOICES:39])>0)
			Gen_Confirm("Print on screen selection?"; "Yes"; "No")
			If (OK=0)
				REDUCE SELECTION:C351([INVOICES:39]; 0)
				$_bo_StartProcess:=True:C214
			End if 
			OK:=1
			
		Else 
			$_bo_StartProcess:=True:C214
		End if 
	End if 
Else 
	If ($_t_MenuItemParameter="NoCurrentSelection")
		
		$_bo_StartProcess:=True:C214
	End if 
End if 
If ($_bo_StartProcess)
	$_l_Process:=New process:C317("INV_StatementDueAmounts"; 128000; "Sales Daybook"; "NoCurrentSelection2")
	
Else 
	If (Records in selection:C76([INVOICES:39])=0)
		
		DB_t_CurrentFormUsage:="VAT"
		Invoices_SelP
		
	Else 
		
	End if 
End if 


If (Records in selection:C76([INVOICES:39])>0)
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]TAX_Prefix:19#""; *)
	QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]TAX_Registration_Number:20#"")
	If (OK=1) & (Records in selection:C76([INVOICES:39])>0)
		If (Not:C34(SR_ReportOK("SLEUList")))
			$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Vat101")
			If ($_l_OK>=0)
				If ($_l_OK=1)
					PRINT SETTINGS:C106
					$_l_OK:=OK
				Else 
					$_l_OK:=1
				End if 
				If ($_l_OK=1)
					If ((ACC_t_AnalysisCodeFrom#"") & (vAnalCodeT=ACC_t_AnalysisCodeFrom))
						QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=ACC_t_AnalysisCodeFrom)
						If ([ANALYSES:36]TAX_Registered_No:8#"")
							vTitle1:=[ANALYSES:36]TAX_Registered_No:8
							vDetails:=[ANALYSES:36]Analysis_Name:2+Char:C90(13)+DB_GetOrganisationAddress
						Else 
							vTitle1:=DB_GetOrganisationVAT
							vDetails:=DB_GetOrganisation+Char:C90(13)+DB_GetOrganisationAddress
						End if 
					Else 
						vTitle1:=DB_GetOrganisationVAT
						vDetails:=DB_GetOrganisation+Char:C90(13)+DB_GetOrganisationAddress
					End if 
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodFrom)
					vDateF:=[PERIODS:33]From_Date:3
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=ACC_t_PeriodTo)
					vDateT:=[PERIODS:33]To_Date:4
					Case of 
						: (Month of:C24(vDateT)<4)
							$_t_Quarter:="1"
						: (Month of:C24(vDateT)<7)
							$_t_Quarter:="2"
						: (Month of:C24(vDateT)<10)
							$_t_Quarter:="3"
						: (Month of:C24(vDateT)<=12)
							$_t_Quarter:="4"
					End case 
					vTitle5:=Substring:C12(String:C10(Year of:C25(vDateT)); 3; 2)+"/"+$_t_Quarter
					
					ORDER BY:C49([INVOICES:39]; [INVOICES:39]TAX_Prefix:19; >; [INVOICES:39]TAX_Registration_Number:20; >)
					FIRST RECORD:C50([INVOICES:39])
					vNo2:=1
					vNo3:=1
					While (Not:C34(End selection:C36([INVOICES:39])))
						$_t_InvoiceTaxPrefix:=[INVOICES:39]TAX_Prefix:19
						$_t_TaxRegistrationNumber:=[INVOICES:39]TAX_Registration_Number:20
						While ((Not:C34(End selection:C36)) & ([INVOICES:39]TAX_Prefix:19=$_t_InvoiceTaxPrefix) & ([INVOICES:39]TAX_Registration_Number:20=$_t_TaxRegistrationNumber))
							NEXT RECORD:C51([INVOICES:39])
						End while 
						vNo2:=vNo2+1
						If (vNo2>15)
							vNo2:=1
							vNo3:=vNo3+1
						End if 
					End while 
					
					Print form:C5([INVOICES:39]; "Vat_101_Hdr")
					FIRST RECORD:C50([INVOICES:39])
					vNo1:=1
					vNo2:=1
					vTitle8:=""
					While (Not:C34(End selection:C36([INVOICES:39])))
						$_t_InvoiceTaxPrefix:=[INVOICES:39]TAX_Prefix:19
						$_t_TaxRegistrationNumber:=[INVOICES:39]TAX_Registration_Number:20
						vAmount:=0
						While ((Not:C34(End selection:C36([INVOICES:39]))) & ([INVOICES:39]TAX_Prefix:19=$_t_InvoiceTaxPrefix) & ([INVOICES:39]TAX_Registration_Number:20=$_t_TaxRegistrationNumber))
							vAmount:=vAmount+[INVOICES:39]Total_Invoiced:5
							NEXT RECORD:C51([INVOICES:39])
						End while 
						vTitle6:=$_t_InvoiceTaxPrefix
						vTitle7:=$_t_TaxRegistrationNumber
						Print form:C5([INVOICES:39]; "Vat_101_Det")
						vNo1:=vNo1+1
						vNo2:=vNo2+1
						If (vNo2>15)
							If (Not:C34(End selection:C36([INVOICES:39])))
								vNo2:=vNo2-1
								Print form:C5([INVOICES:39]; "Vat_101_Ftr")
								PAGE BREAK:C6
								Print form:C5([INVOICES:39]; "Vat_101_Hdr")
							End if 
							vNo1:=1
							vNo2:=1
						End if 
					End while 
					vTitle6:=""
					vTitle7:=""
					vTitle8:=""
					vAmount:=0
					While (vNo1<16)
						Print form:C5([INVOICES:39]; "Vat_101_Det")
						vNo1:=vNo1+1
					End while 
					vNo2:=vNo2-1
					Print form:C5([INVOICES:39]; "Vat_101_Ftr")
					Print form:C5([INVOICES:39]; "Vat_101_Ftr2")
					PAGE BREAK:C6
					PRT_SetPrinterPaperOptions("Vat101")  //NG June 2005
				End if 
			End if 
		End if 
	End if 
End if 
If ($_t_MenuItemParameter#"NoCurrentSelection@")
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
End if 
ERR_MethodTrackerReturn("INV_PrintEUSalesList"; $_t_oldMethodName)