If (False:C215)
	//Table Form Method Name: Object Name:      [PURCHASE_INVOICES].Purchases_AC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/04/2011 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate; DB_bo_NoLoad)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_event; $No; vCalls; vContr)
	C_REAL:C285(v0; v31; v61; v91; vTot; vTotal)
	C_TEXT:C284($_t_oldMethodName; CUR_t_ouputCurrency; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Purchases_AC"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18) | ($_l_event=On Header:K2:17) & (Not:C34(DB_bo_NoLoad))
		
		
		//TRACE
		LOAD RECORD:C52([PURCHASE_INVOICES:37])
		
		Purchases_ACTot
		If (False:C215)
			vTotal:=CurrConv_Convert(vTotal; [PURCHASE_INVOICES:37]Invoice_Date:5; [PURCHASE_INVOICES:37]Currency_Code:23)
		Else 
			Vtotal:=CUR_ConvertValue(Vtotal; [PURCHASE_INVOICES:37]Currency_Code:23; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
		End if 
		
		RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
		v91:=0
		v61:=0
		v31:=0
		v0:=0
		Purchases_ACCal(vTotal)
		vTot:=v91+v61+v31+v0
		If (DB_t_CurrentFormUsage="AA")
			vCalls:=vDate-[PURCHASE_INVOICES:37]Invoice_Date:5
			If ([PURCHASE_INVOICES:37]Total_Due:9#0)
				If ([PURCHASE_INVOICES:37]Due_Date:17#!00-00-00!)
					vContr:=vDate-[PURCHASE_INVOICES:37]Due_Date:17
				Else 
					vContr:=vDate-[PURCHASE_INVOICES:37]Invoice_Date:5
				End if 
			Else 
				VContr:=0
			End if 
			If (vCOntr<0)
				Vcontr:=0
			End if 
		Else 
			Purchases_LPAge
		End if 
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Purchases_AC"; $_t_oldMethodName)
