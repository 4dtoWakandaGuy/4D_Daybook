//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_StateLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>DataSize; <>TextSize)
	C_REAL:C285(v0; v31; v61; v91; vSubtotal; vTotal; vVAT)
	C_TEXT:C284(<>STS_t_CRMDefaultAccountsRole; <>SYS_t_BaseCurrency; $_t_ContactName; $_t_oldMethodName; ACC_t_CurrencyCode; vCompany; vDetails; vNumber; vTitle; vTitle1; vTitle10)
	C_TEXT:C284(vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle17; vTitle18; vTitle19; vTitle20; vTitle3)
	C_TEXT:C284(vTitle4; vTitle5; vTitle6; vTitle7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_StateLP")
//Comp_StateLP
Forms_SetFonts
SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->vDetails)
SetFontsByPointerParameter(<>DataSize; ""; 0; ->v0; ->v31; ->v61; ->v91)
SetFontsByPointerParameter(<>TextSize; ""; 0; ->vTitReg; ->vTitDepCo; ->vTitAdd)

//Set_Fonts ("vNumber+vDate+vDetails";◊DataSize)
//Set_Fonts ("v0+v31+v61+v91";◊DataSize)
//Set_Fonts ("vTitReg+vTitDepCo+vTitAdd";◊TextSize)
If (vCompany#[COMPANIES:2]Company_Code:1)
	vSubtotal:=0
	vVAT:=0
	vTotal:=0
	QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
	vCompany:=[COMPANIES:2]Company_Code:1
	CREATE SET:C116([INVOICES:39]; "Extra")
	INTERSECTION:C121("Extra"; "Master2"; "Extra")
	USE SET:C118("Extra")
	ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Date:4; >; [INVOICES:39]Invoice_Number:1; >)
	FIRST RECORD:C50([INVOICES:39])
	While (Not:C34(End selection:C36([INVOICES:39])))
		vSubtotal:=vSubtotal+[INVOICES:39]Total_Invoiced:5
		vVAT:=vVAT+[INVOICES:39]Total_Paid:6
		vTotal:=vTotal+[INVOICES:39]Total_Due:7
		NEXT RECORD:C51([INVOICES:39])
	End while 
	FIRST RECORD:C50([INVOICES:39])
	If ([INVOICES:39]Currency_Code:27="")
		ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
	Else 
		ACC_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
	End if 
	Forms_InvTit
	vTitle5:="Total Invoiced "+ACC_t_CurrencyCode
	vTitle6:="Total Received "+ACC_t_CurrencyCode
	vTitle7:="Total Due "+ACC_t_CurrencyCode
	If (<>STS_t_CRMDefaultAccountsRole#"")
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Role:11=<>STS_t_CRMDefaultAccountsRole)
		
		Case of 
			: (Records in selection:C76([CONTACTS:1])>1)
				REDUCE SELECTION:C351([CONTACTS:1]; 1)
			Else 
				RELATE ONE:C42([INVOICES:39]Contact_Code:3)
		End case 
	Else 
		RELATE ONE:C42([INVOICES:39]Contact_Code:3)
	End if 
	$_t_ContactName:=[CONTACTS:1]Contact_Name:31
	Comp_DetailsI
	
	//````
	//`````
	If (vDetails="")
		Letter_Details
	End if 
	vDate:=<>DB_d_CurrentDate
	vTitle:="STATEMENT"
	vTitle3:="Account No"
	vNumber:=[COMPANIES:2]Company_Code:1
	vTitle4:="Statement Date"
	vTitle1:="Attn:"+$_t_ContactName
	vTitle10:="Invoice No"
	vTitle11:="Date"
	vTitle12:="Your Order No"
	vTitle13:="Invoiced "+ACC_t_CurrencyCode
	vTitle14:="Received "+ACC_t_CurrencyCode
	vTitle15:="Due "+ACC_t_CurrencyCode
	vTitle16:="0-"+String:C10(DB_GetLedgerADStageOne)
	vTitle17:=String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)
	vTitle18:=String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)
	vTitle19:="Over "+String:C10(DB_GetLedgerADStageThree)
	vTitle20:="AGEING"
	v0:=0
	v31:=0
	v61:=0
	v91:=0
End if 
Set_FontsTitle
ERR_MethodTrackerReturn("Comp_StateLP"; $_t_oldMethodName)