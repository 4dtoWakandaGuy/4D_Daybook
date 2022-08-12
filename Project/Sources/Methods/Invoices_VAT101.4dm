//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_VAT101
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDateF; vDateT)
	C_LONGINT:C283($_l_OK; vIn; vNo; vNo1; vNo2; vNo3)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName; $Pref; $Qtr; $Reg; $_t_CurrentOutputform; ACC_t_AnalysisCodeFrom; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(vAnalCodeT; vDetails; vTitle1; vTitle5; vTitle6; vTitle7; vTitle8; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_VAT101")
//Invoices_VAT101
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Invoices_File)
	READ ONLY:C145([INVOICES:39])
	While (vIn=1)
		DB_t_CurrentFormUsage:="VAT"
		Invoices_SelP
		If (vIn=1)
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]TAX_Prefix:19#""; *)
			QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]TAX_Registration_Number:20#"")
			If (Records in selection:C76([INVOICES:39])>0)
				vNo:=Records in selection:C76([INVOICES:39])
				DB_t_CurrentFormUsage:="Print"
				ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >)
				Open_Pro_Window("EU Sales List"; 0; 1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
				FS_SetFormSort(WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
				DISPLAY SELECTION:C59([INVOICES:39]; *)  //NG may 2004 added table
				If (OK=1)
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
										$Qtr:="1"
									: (Month of:C24(vDateT)<7)
										$Qtr:="2"
									: (Month of:C24(vDateT)<10)
										$Qtr:="3"
									: (Month of:C24(vDateT)<=12)
										$Qtr:="4"
								End case 
								vTitle5:=Substring:C12(String:C10(Year of:C25(vDateT)); 3; 2)+"/"+$Qtr
								
								ORDER BY:C49([INVOICES:39]; [INVOICES:39]TAX_Prefix:19; >; [INVOICES:39]TAX_Registration_Number:20; >)
								FIRST RECORD:C50([INVOICES:39])
								vNo2:=1
								vNo3:=1
								While (Not:C34(End selection:C36([INVOICES:39])))
									$Pref:=[INVOICES:39]TAX_Prefix:19
									$Reg:=[INVOICES:39]TAX_Registration_Number:20
									While ((Not:C34(End selection:C36)) & ([INVOICES:39]TAX_Prefix:19=$Pref) & ([INVOICES:39]TAX_Registration_Number:20=$Reg))
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
									$Pref:=[INVOICES:39]TAX_Prefix:19
									$Reg:=[INVOICES:39]TAX_Registration_Number:20
									vAmount:=0
									While ((Not:C34(End selection:C36([INVOICES:39]))) & ([INVOICES:39]TAX_Prefix:19=$Pref) & ([INVOICES:39]TAX_Registration_Number:20=$Reg))
										vAmount:=vAmount+[INVOICES:39]Total_Invoiced:5
										NEXT RECORD:C51([INVOICES:39])
									End while 
									vTitle6:=$Pref
									vTitle7:=$Reg
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
				Close_ProWin
				vIn:=0
			Else 
				Gen_None("Invoices"; ->vIn)
			End if 
		End if 
	End while 
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Invoices_VAT101"; $_t_oldMethodName)