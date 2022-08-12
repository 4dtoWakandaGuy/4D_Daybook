//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices AD
	//------------------ Method Notes ------------------
	//Replaced by called by INV_SalesDaybook
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CurrencyToConvert; 0)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305(DM_bo_CustomSort)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_CurrencyComversionRow; $_l_CurrencyconversionRow; $_l_CurrencyRow; $_l_Element; $_l_Index; ch0; vIn; vNo; vNo2)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_OutputCurrency; $_t_CurrentOutputform; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCallCode; vTitle; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices AD")
//Invoices Aged Debtors
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (Invoices_File)
	READ ONLY:C145([INVOICES:39])
	While (vIn=1)
		DB_t_CurrentFormUsage:="AD"
		Invoices_Sel
		
		If (vIn=1)
			If (Records in selection:C76([INVOICES:39])>0)
				vNo:=Records in selection:C76([INVOICES:39])
				vNo2:=vNo
				vDate:=<>DB_d_CurrentDate
				DB_t_CurrentFormUsage:="Print"
				//ORDER BY([INVOICES]Company Code;>;[INVOICES]Invoice Date;>)
				//Open_Pro_Window (Term_SLPLWT ("Aged Debtors");0;1;->[INVOICES];WIN_t_CurrentOutputform)
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[INVOICES];WIN_t_CurrentOutputform)
				CREATE SET:C116([INVOICES:39]; "PrintSelection")
				ARRAY TEXT:C222(CUR_at_CurrencyToconvert; 0)
				DISTINCT VALUES:C339([INVOICES:39]Currency_Code:27; $_at_CurrencyToConvert)
				If (False:C215)
					ARRAY TEXT:C222($_at_CurrencyToConvert; Records in selection:C76([INVOICES:39]))
					FIRST RECORD:C50([INVOICES:39])
					$_l_Element:=0
					For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
						$_l_CurrencyconversionRow:=Find in array:C230($_at_CurrencyToConvert; [INVOICES:39]Currency_Code:27)
						If ($_l_CurrencyconversionRow<0)
							$_l_Element:=$_l_Element+1
							$_at_CurrencyToConvert{$_l_Element}:=[INVOICES:39]Currency_Code:27
						End if 
						NEXT RECORD:C51([INVOICES:39])
					End for 
					ARRAY TEXT:C222($_at_CurrencyToConvert; $_l_Element)
				End if 
				$_l_CurrencyRow:=Find in array:C230($_at_CurrencyToConvert; "")
				If ($_l_CurrencyRow>0)
					$_l_CurrencyComversionRow:=Find in array:C230($_at_CurrencyToConvert; <>SYS_t_BaseCurrency)
					If ($_l_CurrencyComversionRow<0)
						$_at_CurrencyToConvert{$_l_CurrencyRow}:=<>SYS_t_BaseCurrency
					Else 
						DELETE FROM ARRAY:C228($_at_CurrencyToConvert; $_l_CurrencyRow)
					End if 
				End if 
				
				Case of 
					: (Size of array:C274($_at_CurrencyToConvert)=1)
						If ($_at_CurrencyToConvert{1}="")
							$_at_CurrencyToConvert{1}:=<>SYS_t_BaseCurrency
						End if 
						ACC_t_CurrencyCode:=$_at_CurrencyToConvert{1}
					Else 
						ACC_t_CurrencyCode:=""
				End case 
				
				$_t_OutputCurrency:=Cur_ConvAsk(ACC_t_CurrencyCode; <>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert; Table:C252(->[INVOICES:39]); "PrintSelection")
				USE SET:C118("PrintSelection")
				
				
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])))
				
				ORDER BY:C49([INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
				vTitle:=""
				If (OK=1)
					// ($_t_OutputCurrency;->CUR_at_CurrencyToconvert)
					//ACC_t_CurrencyCode:=""
					
					If (Not:C34(DM_bo_CustomSort))
						ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
					End if 
					
					If ($_t_OutputCurrency#<>SYS_t_BaseCurrency)
						vCallCode:=$_t_OutputCurrency
					End if 
					//CurrConv_Ask (39)
					ch0:=1
					vTitle:=vTitle+"  "+CurrConv_Title($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)+"  "
					If ($_t_OutputCurrency#"")
						If (Not:C34(SR_ReportOK("SLAged")))
							Invoices_AD2($_t_OutputCurrency; ->CUR_at_CurrencyToconvert)
							
						End if 
					End if 
				End if 
				vIn:=0
			Else 
				Gen_None(Term_SLPLWT("Sales Ledger Items"); ->vIn)
			End if 
		End if 
	End while 
	
	CLEAR SET:C117("PrintSelection")  //BSW 29/04/03
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Invoices AD"; $_t_oldMethodName)