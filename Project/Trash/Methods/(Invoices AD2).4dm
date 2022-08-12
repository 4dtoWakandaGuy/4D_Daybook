//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_AD2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/06/2010 15:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	//ARRAY TEXT(CUR_at_InputCurrencies;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Itemised; $_bo_Messaging; $4; CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate; DM_bo_CustomSort)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CompaniesIndex; $_l_OK; $_l_SortedOrder; $5; vIn)
	C_POINTER:C301($_Ptr_Table; $10; $11; $2; $7; $8; $9)
	C_REAL:C285(v0; v31; v61; v91; VGtotal; vTot; vTot0; vtot1; vTot31; vTot61; vTot91)
	C_REAL:C285(Vtotal)
	C_TEXT:C284($_t_oldMethodName; $_t_ReportName; $1; CUR_t_ouputCurrency; vanalcodes; vInvTitle; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
	C_TIME:C306($6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_AD2")

If (Count parameters:C259>=4)
	$_bo_Messaging:=False:C215
Else 
	$_bo_Messaging:=True:C214
End if 

If (Count parameters:C259>=2)
	ARRAY TEXT:C222(CUR_at_InputCurrencies; 0)
	CUR_t_ouputCurrency:=$1
	COPY ARRAY:C226($2->; CUR_at_InputCurrencies)
Else 
	//TRACE
End if 

If (OK=1)
	vTitle1:="0-"+String:C10(DB_GetLedgerADStageOne)
	vTitle2:=String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)
	vTitle3:=String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)
	vTitle4:="Over "+String:C10(DB_GetLedgerADStageThree)
	vTitle5:="Total"
	v0:=0
	v31:=0
	v61:=0
	v91:=0
	vInvTitle:=Uppercase:C13(Term_SLPLWT("AGED DEBTORS"))
	$_l_SortedOrder:=2
	If (Not:C34(DM_bo_CustomSort))
		Gen_Confirm("Sort by Company"; "Name"; "Code")
		If (OK=1)
			$_l_SortedOrder:=1
		End if 
	Else 
		OK:=1
		If (Count parameters:C259>=5)
			$_l_SortedOrder:=$5
		Else 
			$_l_SortedOrder:=2
		End if 
		DM_bo_CustomSort:=False:C215
	End if 
	$_bo_Continue:=False:C215
	If ($_bo_Messaging)
		Gen_Confirm("Print itemised Invoices or consolidate by Company?"; "Itemise"; "Consolidate")
		$_bo_Itemised:=(OK=1)
	Else 
		$_bo_Itemised:=False:C215
	End if 
	If ($_bo_Itemised)
		SELECTION TO ARRAY:C260([INVOICES:39]Company_Code:2; $_at_CompanyCodes)
		QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
		//If (vNo2#vNo)
		SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
		Case of 
			: ($_l_SortedOrder=1)
				ORDER BY:C49([INVOICES:39]; [COMPANIES:2]Company_Name:2; >; [INVOICES:39]Invoice_Date:4; >)
			: ($_l_SortedOrder=0)
				ORDER BY:C49([INVOICES:39]; [COMPANIES:2]Company_Code:1; >; [INVOICES:39]Invoice_Date:4; >)
			Else 
				//custom sort
		End case 
		
		$_Ptr_Table:=->[INVOICES:39]
		
		SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
		//End if
		FORM SET OUTPUT:C54([INVOICES:39]; "Invoices_AD")
		BREAK LEVEL:C302(1)
		ACCUMULATE:C303(v0; v31; v61; v91)
		$_t_ReportName:="itemisedAD"
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "ItemisedAD")
		$_bo_Continue:=($_l_OK>=0)  // NG see inside Print_SetSize
	Else 
		SELECTION TO ARRAY:C260([INVOICES:39]Company_Code:2; $_at_CompanyCodes)
		QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
		
		//TRACE
		Mail_StateComp($_l_SortedOrder)
		$_Ptr_Table:=->[COMPANIES:2]
		If (Count parameters:C259<6)
			FORM SET OUTPUT:C54([COMPANIES:2]; "Aged Debtors")
			BREAK LEVEL:C302(0)
			ACCUMULATE:C303(v0; v31; v61; v91)
		End if 
		SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
		Case of 
			: ($_l_SortedOrder=1)
				//ORDER BY([COMPANIES]Company Name;>;[INVOICES]Invoice Date;>)
			: ($_l_SortedOrder=0)
				//ORDER BY([COMPANIES]Company Code;>;[INVOICES]Invoice Date;>)
			Else 
				//custom sort
		End case 
		//ORDER BY([COMPANIES]Company Name;>)
		SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		$_t_ReportName:="ConsolidatedAD"
		If (Count parameters:C259<6)
			$_l_OK:=PRINT_SetSIZE("A4"; "L"; "ConsolidatedAD")
			$_bo_Continue:=($_l_OK>=0)
		Else 
			$_bo_Continue:=True:C214
		End if 
	End if 
	If ($_bo_Continue)
		If (Count parameters:C259>=6)
			//Here we are going to run through the records
			//This will always be through companies
			vTot91:=0
			vTot61:=0
			vTot31:=0
			vTot0:=0
			VGtotal:=0
			If ($6>?00:00:00?)
				//Send Column Titles to document
				SEND PACKET:C103($6; "Company Code"+Char:C90(Tab:K15:37)+"Company Name"+Char:C90(Tab:K15:37)+"Company Telephone"+Char:C90(Tab:K15:37)+"Default Stage"+Char:C90(Tab:K15:37)+"Default Terms"+Char:C90(Tab:K15:37)+"Analyses"+Char:C90(Tab:K15:37)+vTitle1+Char:C90(Tab:K15:37)+vTitle2+Char:C90(Tab:K15:37)+vTitle3+Char:C90(Tab:K15:37)+Vtitle4+Char:C90(Tab:K15:37)+vTitle5+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40))
				
				
				
				//ACCUMULATE(v0;v31;v61;v91)
				
			End if 
			For ($_l_CompaniesIndex; 1; Records in selection:C76([COMPANIES:2]))
				
				QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
				CREATE SET:C116([INVOICES:39]; "Extra")
				INTERSECTION:C121("Master2"; "Extra"; "Extra")
				USE SET:C118("Extra")
				v91:=0
				v61:=0
				v31:=0
				v0:=0
				vanalcodes:=""
				ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Date:4; >)
				
				FIRST RECORD:C50([INVOICES:39])
				While (Not:C34(End selection:C36([INVOICES:39])))
					If ([INVOICES:39]Analysis_Code:17#"")
						If (vanalcodes="")
							vanalcodes:=[INVOICES:39]Analysis_Code:17+" "
						Else 
							$_l_CharacterPosition:=Position:C15([INVOICES:39]Analysis_Code:17+" "; vanalcodes; *)
							If ($_l_CharacterPosition<0)
								vanalcodes:=vanalcodes+", "+[INVOICES:39]Analysis_Code:17+" "
							End if 
						End if 
					End if 
					Invoices_ADTot
					Vtotal:=CUR_ConvertValue(Vtotal; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
					Invoices_ADCalc(vTotal)
					NEXT RECORD:C51([INVOICES:39])
				End while 
				vTot91:=vTot91+V91
				vTot61:=vTot61+V61
				vTot31:=vTot31+V31
				vTot0:=vTot0+V0
				vTot:=v91+v61+v31+v0
				VGtotal:=VGtotal+Vtot
				If ($6>?00:00:00?)
					SEND PACKET:C103($6; [COMPANIES:2]Company_Code:1+Char:C90(Tab:K15:37)+[COMPANIES:2]Company_Name:2+Char:C90(Tab:K15:37)+[COMPANIES:2]Telephone:9+Char:C90(Tab:K15:37)+[COMPANIES:2]Default_Credit_Stage:42+Char:C90(Tab:K15:37)+[COMPANIES:2]SL_Terms:40+Char:C90(Tab:K15:37)+vanalcodes+Char:C90(Tab:K15:37))
					SEND PACKET:C103($6; String:C10(v0)+Char:C90(Tab:K15:37)+String:C10(v31)+Char:C90(Tab:K15:37)+String:C10(v61)+Char:C90(Tab:K15:37)+String:C10(v91)+Char:C90(Tab:K15:37)+String:C10(Vtotal)+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40))
				End if 
				NEXT RECORD:C51([COMPANIES:2])
			End for 
			If ($6>?00:00:00?)
				
				SEND PACKET:C103($6; Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40))
				SEND PACKET:C103($6; Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40))
				SEND PACKET:C103($6; ""+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Totals:"+Char:C90(Tab:K15:37))
				SEND PACKET:C103($6; String:C10(vtot0)+Char:C90(Tab:K15:37)+String:C10(vtot31)+Char:C90(Tab:K15:37)+String:C10(vtot61)+Char:C90(Tab:K15:37)+String:C10(vtot1)+Char:C90(Tab:K15:37)+String:C10(VGtotal)+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40))
			End if 
			//send totals to document
			If (Count parameters:C259>=11)
				//Send summary totals back to calling method-note that printing to disk and this are not mutually exclusive
				$7->:=vTot0
				$8->:=vTot31
				$9->:=vTot61
				$10->:=vTot91
				$11->:=VGtotal
			End if 
			
		Else 
			PRINT SELECTION:C60($_Ptr_Table->)
			If (OK=1)
				PRT_SetPrinterPaperOptions($_t_ReportName)
			End if 
			
		End if 
	End if 
End if 
If (Count parameters:C259<=6)
	Close_ProWin
End if 
vIn:=0
ERR_MethodTrackerReturn("Invoices_AD2"; $_t_oldMethodName)