If (False:C215)
	//Table Form Method Name: [INVOICES]Receipt_Rem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2009 21:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DataSize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Receipt_Rem"; Form event code:C388)
//Form Method [INVOICES].Receipt_Rem 26• /3/2(ID 12977-1500)

If (Form event code:C388=On Printing Detail:K2:18)
	
	Forms_SetFonts
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->vDetails; ->vOrderCode; ->vTitReg; ->vTitDepCo; ->vTitAdd)
	INV_ReceiptFormMethod
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("FM [INVOICES].Receipt_Rem"; $_t_oldMethodName)
