//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_FullCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 08:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_FullCode")

Gen_Confirm("This routine checks that all Products on the system have Full"+" Products Codes.  It may take some time"; ""; "")
If (OK=1)
	READ WRITE:C146([PRODUCTS:9])
	READ WRITE:C146([ORDER_ITEMS:25])
	READ WRITE:C146([INVOICES:39])
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Model_Code:5#"")
	FIRST RECORD:C50([PRODUCTS:9])
	While (Not:C34(End selection:C36([PRODUCTS:9])))
		
		$_t_ProductCode:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
		If ([PRODUCTS:9]Product_Code:1#$_t_ProductCode)
			[PRODUCTS:9]Product_Code:1:=$_t_ProductCode
			DB_SaveRecord(->[PRODUCTS:9])
			AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
		End if 
		
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=[PRODUCTS:9]Model_Code:5)
		$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
		If ($_l_RecordsinSelection>0)
			ARRAY TEXT:C222($_at_Codes; $_l_RecordsinSelection)
			SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Product_Code:2; $_at_Codes)
			For ($_l_Index; 1; $_l_RecordsinSelection)
				$_at_Codes{$_l_Index}:=$_t_ProductCode
			End for 
			ARRAY TO SELECTION:C261($_at_Codes; [ORDER_ITEMS:25]Product_Code:2)
		End if 
		
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Product_Code:1=[PRODUCTS:9]Model_Code:5)
		SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
		QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
		
		$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
		If ($_l_RecordsinSelection>0)
			FIRST RECORD:C50([INVOICES:39])
			While (Not:C34(End selection:C36([INVOICES:39])))
				QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
				QUERY SELECTION:C341([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Product_Code:1=[PRODUCTS:9]Model_Code:5)
				FIRST RECORD:C50([INVOICES_ITEMS:161])
				While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
					[INVOICES_ITEMS:161]Product_Code:1:=$_t_ProductCode
					DB_SaveRecord(->[INVOICES_ITEMS:161])
					NEXT RECORD:C51([INVOICES_ITEMS:161])
				End while 
				DB_SaveRecord(->[INVOICES:39])
				NEXT RECORD:C51([INVOICES:39])
			End while 
		End if 
		
		NEXT RECORD:C51([PRODUCTS:9])
	End while 
End if 
ERR_MethodTrackerReturn("Prod_FullCode"; $_t_oldMethodName)
