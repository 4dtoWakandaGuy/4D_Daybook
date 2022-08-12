If (False:C215)
	//Table Form Method Name: [INVOICES_ALLOCATIONS]Alloc_SubRec
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
	C_DATE:C307(SRCH_d_EntryDateFrom)
	C_LONGINT:C283(<>DataSize)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName; vComments)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES_ALLOCATIONS].Alloc_SubRec"; Form event code:C388)

If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->SRCH_d_EntryDateFrom; ->vComments; ->vAmount)
	
	//Set_Fonts ("SRCH_d_EntryDateFrom+vComments+vAmount";◊DataSize)
	vComments:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
	SRCH_d_EntryDateFrom:=[INVOICES_ALLOCATIONS:162]Date:3
	vAmount:=[INVOICES_ALLOCATIONS:162]Amount:2
End if 
ERR_MethodTrackerReturn("FM [INVOICES_ALLOCATIONS].Alloc_SubRec"; $_t_oldMethodName)
