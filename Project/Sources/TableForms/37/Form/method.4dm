If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Form
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/03/2010 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>DataSize; <>TextSize; $_l_event)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; vInvTitle; vNumber; vTitle; vTitle1; vTitle12; vTitle13; vTitle14; vTitle15; vTitle18; vTitle2)
	C_TEXT:C284(vTitle3; vTitle4; vTitle8)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Form"; Form event code:C388)
//Form Method [PURCHASES].Form 26• /3/2(ID 7039-1402)
$_l_event:=Form event code:C388

Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->vDetails; ->[PURCHASE_INVOICES:37]Purchase_Code:1; ->[PURCHASE_INVOICES:37]Due_Date:17)
		SetFontsByPointerParameter(<>TextSize; ""; 0; ->vTitReg; ->vTitDepCoP; ->vTitAdd)
		
		//Set_Fonts ("vNumber+vDate+vDetails";◊DataSize)
		//Set_Fonts ("[PURCHASES]Purchase Code+[PURCHASES]Due Date";◊DataSize)
		//Set_Fonts ("vTitReg+vTitDepCoP+vTitAdd";◊TextSize)
		RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
		//QUERY([PURCHASES_ITEMS];[PURCHASES_ITEMS]Parent_Record_Code=[PURCHASES]Purchase Code)
		
		Address_Details
		vTitle1:="From"
		vTitle3:="Invoice No"
		vTitle4:="Date"
		vTitle2:="Our Ref"
		vTitle8:="Date Due"
		vTitle12:="Description"
		vTitle13:="Cost Price"
		vTitle14:="Qty"
		vTitle15:="Cost Amount "+[PURCHASE_INVOICES:37]Currency_Code:23
		vTitle18:=Term_VATWT("VAT %")
		Forms_Tit567Cur([PURCHASE_INVOICES:37]Currency_Code:23)
		vSubtotal:=[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19
		vVAT:=Round:C94(([PURCHASE_INVOICES:37]Total_Invoiced:7-[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19); 2)
		vTotal:=[PURCHASE_INVOICES:37]Total_Invoiced:7
		Purchases_LPSt
		vTitle:=vInvTitle
		vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
		vNumber:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
		Forms_GenTit(->[PURCHASE_INVOICES:37]Analysis_Code:15)
End case 

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		
		Set_FontsTitle
End case 
ERR_MethodTrackerReturn("FM:Form"; $_t_oldMethodName)
