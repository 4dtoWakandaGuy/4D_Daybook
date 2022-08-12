//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/06/2010 15:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_OK; vNo; vNo2; vTr)
	C_REAL:C285($_r_Amounts; $_r_Tax; $_r_Total)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_Report; $_t_ReportName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; vTitle2; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_List")
//Trans_List

//modified NG Feb2001 to set form sort and size
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
If (Trans_File)
	READ ONLY:C145([TRANSACTIONS:29])
	$_r_Total:=0
	$_r_Tax:=0
	$_r_Amounts:=0
	While (vTr=1)
		IDLE:C311  // 7/04/03 pb
		If (vTitle="VAT Listing")
			DB_t_CurrentFormUsage:="VAT"
		End if 
		Trans_Sel
		If (vTr=1)
			If (vTitle="VAT Listing")
				Gen_Confirm("Do you want to display only Inputs & Outputs, or include Neithers?"; "I & O"; "I, O & N")
				If (OK=1)
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"N")
				End if 
			End if 
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				DB_t_CurrentFormUsage:="Print"
				vNo:=Records in selection:C76([TRANSACTIONS:29])
				vNo2:=vNo
				Transactions_Sort
				Open_Pro_Window(vTitle2; 0; 1; ->[TRANSACTIONS:29]; WIN_t_CurrentOutputform)
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[TRANSACTIONS:29]; WIN_t_CurrentOutputform)
				DISPLAY SELECTION:C59([TRANSACTIONS:29]; *)
				
				If (OK=1)
					If (vNo2#Records in selection:C76([TRANSACTIONS:29]))
						Transactions_Sort
					End if 
					$_t_ReportName:=""
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
					//Gen_Confirm ("Please choose Print Settings of 90% Portrait, "
					//or 75% Portrait in order to "+"include further Code fields"+
					//Char(13)+Char(13)+"(100% Landscape will also work)";"";"")
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
				Close_ProWin
				vTr:=0
			Else 
				Gen_None("Transactions"; ->vTr)
			End if 
		End if 
	End while 
End if 
//Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Trans_List"; $_t_oldMethodName)
