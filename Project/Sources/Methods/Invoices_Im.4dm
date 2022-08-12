//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Im
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_InvoiceCode; $_t_oldMethodName; vFld; vRec; vT; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Im")
//Invoices_Import

SET CHANNEL:C77(10; "")
vFld:=Char:C90(200)
vRec:=Char:C90(201)
vText:="sdfsdfsd"
If (OK=1)
	FIRST RECORD:C50([INVOICES:39])
	While (Length:C16(vText)>5)
		IDLE:C311  // 03/04/03 pb
		RECEIVE PACKET:C104(vText; vRec)
		vT:=vText
		If (Length:C16(vT)>5)
			CREATE RECORD:C68([INVOICES:39])
			
			[INVOICES:39]Invoice_Number:1:=First_Field(->vT; vFld)
			[INVOICES:39]Company_Code:2:=First_Field(->vT; vFld)
			[INVOICES:39]Contact_Code:3:=First_Field(->vT; vFld)
			[INVOICES:39]Invoice_Date:4:=Date:C102(First_Field(->vT; vFld))
			[INVOICES:39]Total_Invoiced:5:=Num:C11(First_Field(->vT; vFld))
			[INVOICES:39]Total_Paid:6:=Num:C11(First_Field(->vT; vFld))
			[INVOICES:39]Total_Due:7:=Num:C11(First_Field(->vT; vFld))
			[INVOICES:39]Posted_Date:8:=Date:C102(First_Field(->vT; vFld))
			$_t_InvoiceCode:=First_Field(->vT; vFld)
			[INVOICES:39]Terms:11:=First_Field(->vT; vFld)
			[INVOICES:39]Comments:12:=First_Field(->vT; vFld)
			[INVOICES:39]Period_Code:13:=First_Field(->vT; vFld)
			[INVOICES:39]Your_Order_Number:14:=First_Field(->vT; vFld)
			[INVOICES:39]Debtors_Account:15:=First_Field(->vT; vFld)
			$_t_InvoiceCode:=First_Field(->vT; vFld)
			If ($_t_InvoiceCode#"")
				[INVOICES:39]Comments:12:="Attendee: "+$_t_InvoiceCode+Char:C90(13)
			End if 
			[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Num:C11(First_Field(->vT; vFld))
			[INVOICES:39]Total_Tax:35:=Num:C11(First_Field(->vT; vFld))
			
			While (Length:C16(vT)>5)
				CREATE RECORD:C68([INVOICES_ITEMS:161])
				[INVOICES_ITEMS:161]INVOICES_CODE:18:=[INVOICES:39]Invoice_Number:1
				[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
				
				[INVOICES_ITEMS:161]Product_Code:1:=First_Field(->vT; vFld)
				[INVOICES_ITEMS:161]Product_Name:2:=First_Field(->vT; vFld)
				[INVOICES_ITEMS:161]Quantity:3:=Num:C11(First_Field(->vT; vFld))
				[INVOICES_ITEMS:161]Sales_Price:4:=Num:C11(First_Field(->vT; vFld))
				[INVOICES_ITEMS:161]Amount:5:=Num:C11(First_Field(->vT; vFld))
				[INVOICES_ITEMS:161]Tax_Code:6:=First_Field(->vT; vFld)
				[INVOICES_ITEMS:161]Tax_Amount:7:=Num:C11(First_Field(->vT; vFld))
				[INVOICES_ITEMS:161]Total_Amount:8:=Num:C11(First_Field(->vT; vFld))
				[INVOICES_ITEMS:161]Sales_Account:9:=First_Field(->vT; vFld)
				[INVOICES_ITEMS:161]Analysis_Code:10:=First_Field(->vT; vFld)
				DB_SaveRecord(->[INVOICES_ITEMS:161])
				
			End while 
			
			[INVOICES:39]Currency_Code:27:="£"
			[INVOICES:39]Layer_Code:38:="A"
			[INVOICES:39]State:10:=3
			DB_SaveRecord(->[INVOICES:39])
		End if 
		
	End while 
End if 
SET CHANNEL:C77(11)
ERR_MethodTrackerReturn("Invoices_Im"; $_t_oldMethodName)