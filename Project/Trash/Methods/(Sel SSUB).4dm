//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Sel_SSUB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_RecordCodes; 0)
	C_POINTER:C301($1; $2; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $3; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SSUB")

//This method is for queries where the table was a subtable
$_t_oldMethodName:=ERR_MethodTracker("Sel_SSUB")
MESSAGES OFF:C175
//Sel_S

If ($3#"")
	$3:=Str_StripDel($3)
	If ($3#"")
		$3:=Sel_AtOp($3; "=")
		If ((Character code:C91(Substring:C12($3; 1; 1))=64) & (Length:C16($3)>1))
			Master_UseSS($1)
			SELECTION TO ARRAY:C260($2->; $_at_RecordCodes)
			Case of 
				: (Table:C252($4)=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
					QUERY WITH ARRAY:C644([SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
					QUERY WITH ARRAY:C644([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
					QUERY WITH ARRAY:C644([COMPANIES_RECORD_ANALYSIS:146]Company_Code:4; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
					QUERY WITH ARRAY:C644([CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3; $_at_RecordCodes)
					
				: (Table:C252($4)=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
					QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[INVOICES_ITEMS:161]))
					QUERY WITH ARRAY:C644([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_RecordCodes)
					
			End case 
			QUERY SELECTION:C341($4->; $5->; vRec; $3)
			Case of 
				: (Table:C252($4)=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
					SELECTION TO ARRAY:C260([SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([SERVICE_CALLS:20]Call_Code:4; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
					SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
					SELECTION TO ARRAY:C260([COMPANIES_RECORD_ANALYSIS:146]Company_Code:4; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
					SELECTION TO ARRAY:C260([CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_RecordCodes)
					
				: (Table:C252($4)=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
					SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[INVOICES_ITEMS:161]))
					SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_RecordCodes)
			End case 
			
		Else 
			QUERY:C277($4->; $5->; vRec; $3)
			Case of 
				: (Table:C252($4)=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
					
					SELECTION TO ARRAY:C260([SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([SERVICE_CALLS:20]Call_Code:4; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
					SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
					SELECTION TO ARRAY:C260([COMPANIES_RECORD_ANALYSIS:146]Company_Code:4; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
					SELECTION TO ARRAY:C260([CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_RecordCodes)
					
				: (Table:C252($4)=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
					SELECTION TO ARRAY:C260([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_RecordCodes)
				: (Table:C252($4)=Table:C252(->[INVOICES_ITEMS:161]))
					SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_RecordCodes)
					QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_RecordCodes)
			End case 
			
		End if 
		Master2($1)
	End if 
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel_S"; $_t_oldMethodName)
