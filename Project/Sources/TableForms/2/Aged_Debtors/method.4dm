If (False:C215)
	//Table Form Method Name: [COMPANIES]Aged Debtors
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_LONGINT:C283($_l_CharacterPosition; $No)
	C_REAL:C285(v0; v31; v61; v91; vTot; vTotal)
	C_TEXT:C284($_t_oldMethodName; COM_t_TelephoneNumberFormat; CUR_t_ouputCurrency; vanalcodes)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Aged Debtors"; Form event code:C388)
//Companies Aged Debtors
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		MESSAGES OFF:C175
		QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
		MESSAGES ON:C181
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236([COMPANIES:2]Telephone:9; COM_t_TelephoneNumberFormat)
		End if 
		CREATE SET:C116([INVOICES:39]; "Extra")
		INTERSECTION:C121("Master2"; "Extra"; "Extra")
		USE SET:C118("Extra")
		v91:=0
		v61:=0
		v31:=0
		v0:=0
		vanalcodes:=""
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
			If (False:C215)
				vTotal:=CurrConv_Convert(vTotal; [INVOICES:39]Invoice_Date:4; [INVOICES:39]Currency_Code:27)
			Else 
				
				Vtotal:=CUR_ConvertValue(Vtotal; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
				
			End if 
			Invoices_ADCalc(vTotal)
			NEXT RECORD:C51([INVOICES:39])
		End while 
		vTot:=v91+v61+v31+v0
End case 
ERR_MethodTrackerReturn("FM:Aged Debtors"; $_t_oldMethodName)
