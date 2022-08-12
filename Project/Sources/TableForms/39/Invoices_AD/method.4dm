If (False:C215)
	//Table Form Method Name: [INVOICES]Invoices_AD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/04/2011 12:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate; DB_bo_NoLoad)
	C_DATE:C307(vDate)
	C_LONGINT:C283($No; vCalls; vContr)
	C_REAL:C285(v0; v31; v61; v91; vTot; VTOT0; VTOT1; VTOT31; VTOT61; VTOT91; vTotal)
	C_REAL:C285(VTOTP0; VTOTP31; VTOTP61; VTOTP91)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; CUR_t_ouputCurrency; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Invoices_AD"; Form event code:C388)
//NOTE NG March 2003
//THIS FORM NOW REQUIRES THAT THE OUTPUT CURRENCY IS DECLARED
//IN "CUR_t_ouputCurrency'
//Invoices_AD

Case of 
	: (Form event code:C388=On Header:K2:17)
		
	: (Form event code:C388=On Printing Detail:K2:18)
		Invoices_ADTot
		If (False:C215)
			vTotal:=CurrConv_Convert(vTotal; [INVOICES:39]Invoice_Date:4; [INVOICES:39]Currency_Code:27)
		Else 
			
			Vtotal:=CUR_ConvertValue(Vtotal; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		End if 
		
		
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		v91:=0
		v61:=0
		v31:=0
		v0:=0
		Invoices_ADCalc(vTotal)
		vTot:=v91+v61+v31+v0
		If (DB_t_CurrentFormUsage="AA")
			vCalls:=vDate-[INVOICES:39]Invoice_Date:4
			If ([INVOICES:39]Total_Due:7>0)
				If ([INVOICES:39]Due_Date:18#!00-00-00!)
					vContr:=vDate-[INVOICES:39]Due_Date:18
				Else 
					vContr:=vDate-[INVOICES:39]Invoice_Date:4
				End if 
			Else 
				vContr:=0
			End if 
			If (vContr<0)
				vContr:=0
			End if 
		Else 
			Invoices_LPAge
		End if 
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		Else 
			COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236([COMPANIES:2]Telephone:9; COM_t_TelephoneNumberFormat)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [INVOICES].Invoices_AD"; $_t_oldMethodName)
