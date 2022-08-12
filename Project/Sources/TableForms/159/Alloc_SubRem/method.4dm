If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICE_ALLOCATIONS]Alloc_SubRem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2009 15:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(ACC_d_EntryDateFrom)
	C_LONGINT:C283(<>DataSize; $_l_event)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName; vComments; vDesc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICE_ALLOCATIONS].Alloc_SubRem"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		If (Form event code:C388=On Printing Detail:K2:18)
			
			
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDesc; ->ACC_d_EntryDateFrom; ->vComments; ->vAmount)
			
			//Set_Fonts ("vDesc+ACC_d_EntryDateFrom+vComments+vAmount";◊DataSize)
			vDesc:=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4
			vComments:=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1
			ACC_d_EntryDateFrom:=[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3
			vAmount:=[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
		End if 
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICE_ALLOCATIONS].Alloc_SubRem"; $_t_oldMethodName)
