If (False:C215)
	//Table Form Method Name: [COMPANIES]Aged Creditors
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
	//C_UNKNOWN(v31)
	//C_UNKNOWN(v61)
	//C_UNKNOWN(v91)
	//C_UNKNOWN(vTot)
	//C_UNKNOWN(vTotal)
	C_BOOLEAN:C305(CB_bo_ConvertAtOldRate; DB_bo_NoLoad; CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate; DB_bo_NoLoad)
	C_LONGINT:C283($No; $_l_event)
	C_REAL:C285(v31; v61; v91; vTot; vTotal; v0)
	C_TEXT:C284(CUR_t_ouputCurrency; $_t_oldMethodName; CUR_t_ouputCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Aged_Creditors"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "Aged_Creditors")
		MESSAGES OFF:C175
		QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=[COMPANIES:2]Company_Code:1)
		MESSAGES ON:C181
		CREATE SET:C116([PURCHASE_INVOICES:37]; "Extra")
		INTERSECTION:C121("Master2"; "Extra"; "Extra")
		USE SET:C118("Extra")
		v91:=0
		v61:=0
		v31:=0
		v0:=0
		FIRST RECORD:C50([PURCHASE_INVOICES:37])
		While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
			IDLE:C311  // 03/04/03 pb
			Purchases_ACTot
			If (False:C215)
				vTotal:=CurrConv_Convert(vTotal; [PURCHASE_INVOICES:37]Invoice_Date:5; [PURCHASE_INVOICES:37]Currency_Code:23)
			Else 
				Vtotal:=CUR_ConvertValue(Vtotal; [PURCHASE_INVOICES:37]Currency_Code:23; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
			End if 
			Purchases_ACCal(vTotal)
			NEXT RECORD:C51([PURCHASE_INVOICES:37])
		End while 
		vTot:=v91+v61+v31+v0
End case 
ERR_MethodTrackerReturn("FM:Aged Creditors"; $_t_oldMethodName)
