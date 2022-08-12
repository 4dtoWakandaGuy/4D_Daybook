//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_IMPSTOCKISTSFROMDOC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocInText; 0)
	ARRAY TEXT:C222($_at_RecordsInText; 0)
	C_LONGINT:C283($_l_GetRecord; $_l_GetRecords; $_l_Pos; $_l_position)
	C_TEXT:C284($_t_accountCode; $_t_Address1; $_t_Address2; $_t_Address3; $_t_Address4; $_t_addressCountry; $_t_addressCounty; $_t_addressTown; $_t_CallFrequency; $_t_Comment; $_t_COmpanyName)
	C_TEXT:C284($_t_Competitor; $_t_Contactname1; $_t_Contactname2; $_t_CoreditInsAmount; $_T_COuntry; $_t_County; $_T_CREATEDDate; $_T_Credit; $_T_CreditLimit; $_t_CUrrency; $_T_DaysOver)
	C_TEXT:C284($_T_Dedupe; $_t_DiscountPC; $_t_DocumentText; $_t_Eastings; $_T_Email; $_T_Enclosures; $_t_Facilities; $_t_Fax; $_t_InvoiceAccount; $_t_LastInvoiceDate; $_T_LASTVISITDATE)
	C_TEXT:C284($_T_Lat; $_T_Long; $_t_Northing; $_T_NumberOfVisits; $_t_oldMethodName; $_t_OnStop; $_t_OtherProduct; $_t_Outaddress1; $_t_Outaddress2; $_t_Outaddress3; $_t_Outaddress4)
	C_TEXT:C284($_T_PARENTACCOUNT; $_t_POS; $_t_postCode; $_t_PriceList; $_t_RebateAccount; $_t_Record; $_t_Remainder; $_T_ResolveError; $_t_RSMAREA; $_T_Sales; $_T_Sales00)
	C_TEXT:C284($_T_Sales01; $_T_Sales3; $_T_SalesY0; $_T_SalesY1; $_T_SalesY2; $_T_SalesY3; $_T_SalesY4; $_T_SalesY5; $_T_SalesY6; $_T_SalesY7; $_T_Salutation)
	C_TEXT:C284($_T_SEQaddress1; $_T_SEQName; $_T_SETT; $_T_SignOff; $_T_SpecialPrice; $_t_StatementAccount; $_t_Stockisttype; $_t_Telephone; $_T_TempFlag; $_T_TempNMBSAcc; $_T_TNPassword)
	C_TEXT:C284($_t_Town; $_T_TSA; $_T_TypeDN; $_T_TypeINV; $_T_TypeStatement; $_T_VAT; $_T_Website; $_T_xmasFlags)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_IMPSTOCKISTSFROMDOC")

$_ti_DocumentRef:=Open document:C264(""; "TEXT")
ARRAY TEXT:C222($_at_DocInText; 0)
$_t_DocumentText:=""
Repeat 
	RECEIVE PACKET:C104($_ti_DocumentRef; $_t_DocumentText; 32000)
	If ($_t_DocumentText#"")
		APPEND TO ARRAY:C911($_at_DocInText; $_t_DocumentText)
	End if 
Until (OK=0) | ($_t_DocumentText="")
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ARRAY TEXT:C222($_at_RecordsInText; 0)
$_t_Remainder:=""
For ($_l_GetRecords; 1; Size of array:C274($_at_DocInText))
	If ($_t_Remainder#"")
		$_at_DocInText{$_l_GetRecords}:=$_t_Remainder+$_at_DocInText{$_l_GetRecords}
		$_t_Remainder:=""
	End if 
	Repeat 
		$_l_position:=Position:C15("|"; $_at_DocInText{$_l_GetRecords})
		If ($_l_position>0)
			$_t_Record:=Substring:C12($_at_DocInText{$_l_GetRecords}; 1; $_l_position-1)
			$_at_DocInText{$_l_GetRecords}:=Substring:C12($_at_DocInText{$_l_GetRecords}; $_l_position+1)
			APPEND TO ARRAY:C911($_at_RecordsInText; $_t_Record)
		End if 
		If ($_l_position=0)
			$_t_Remainder:=$_at_DocInText{$_l_GetRecords}
			$_at_DocInText{$_l_GetRecords}:=""
		End if 
	Until ($_l_position=0) | ($_at_DocInText{$_l_GetRecords}="")
End for 
If ($_t_Remainder#"")
	
End if 
//each row is one record
For ($_l_GetRecord; 1; Size of array:C274($_at_RecordsInText))
	$_t_Contactname1:=""
	$_t_Contactname2:=""
	$_t_accountCode:=""
	$_t_COmpanyName:=""
	$_t_Address1:=""
	$_t_Address2:=""
	$_t_Address3:=""
	$_t_Address4:=""
	$_t_Town:=""
	$_t_County:=""
	$_T_COuntry:=""
	$_t_Fax:=""
	$_t_Telephone:="'"
	$_t_CUrrency:=""
	$_t_Record:=$_at_RecordsInText{$_l_GetRecord}
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //²
		$_t_accountCode:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //²
		$_t_COmpanyName:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //$²
		$_t_Address1:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //²
		$_t_Address2:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //²
		$_t_Address3:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //²
		$_t_Address4:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Fax:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //
		$_t_Telephone:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //$_t_Town
		$_t_Town:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_County:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_InvoiceAccount:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_StatementAccount:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Stockisttype:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_DiscountPC:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_RebateAccount:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_CUrrency:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_PriceList:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	//take out the formatted address from the export
	If ($_l_Pos>0)
		$_t_LastInvoiceDate:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	
	If ($_l_Pos>0)
		$_t_OnStop:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Comment:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Contactname1:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Contactname2:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	//take out addressUUID from the export and last modified stamp
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_CoreditInsAmount:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_OtherProduct:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Facilities:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_POS:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //Point of sale
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_CallFrequency:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Competitor:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Eastings:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_Northing:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_t_RSMAREA:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_LASTVISITDATE:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_PARENTACCOUNT:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_CREATEDDate:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_DaysOver:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_xmasFlags:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_TempFlag:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_ResolveError:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Salutation:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SignOff:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Enclosures:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_NumberOfVisits:=Substring:C12($_t_Record; 1; $_l_Pos-1)
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SEQName:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //y/n
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SEQaddress1:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_TypeDN:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_TypeINV:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_TypeStatement:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Sales00:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Sales01:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY7:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY6:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY5:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY4:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY3:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY2:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY1:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SalesY0:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_TNPassword:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_TempNMBSAcc:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Dedupe:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_CreditLimit:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SETT:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_VAT:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Credit:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //E/p?
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)  //²
		$_T_COuntry:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_SpecialPrice:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Website:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Email:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Lat:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_Long:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	//take out stockist UUID and parent UUID
	
	$_l_Pos:=Position:C15(Char:C90(9); $_t_Record)
	If ($_l_Pos>0)
		$_T_TSA:=Substring:C12($_t_Record; 1; $_l_Pos-1)  //yn
		$_t_Record:=Substring:C12($_t_Record; $_l_Pos+1)
	End if 
	READ WRITE:C146([COMPANIES:2])
	
	If ($_t_accountCode#"")
		MESSAGE:C88($_t_accountCode+(String:C10($_l_GetRecord))+"of "+(String:C10(Size of array:C274($_at_RecordsInText))))
		
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_accountCode)
		If (Records in selection:C76([COMPANIES:2])=0)
			CREATE RECORD:C68([COMPANIES:2])
			[COMPANIES:2]Company_Code:1:=$_t_accountCode
		End if 
		[COMPANIES:2]Company_Name:2:=$_t_COmpanyName
		$_t_addressTown:=$_t_Town
		$_t_Town:=""
		$_t_addressCounty:=$_t_County
		$_t_County:=""
		$_t_addressCountry:=$_t_Country
		$_t_Country:=""
		$_t_postCode:=""
		UTIL_SmartConstructAddress($_t_address1; $_t_address2; $_t_address3; $_t_address4; $_t_addressTown; $_t_addressCounty; $_t_addressCountry; ""; ->$_t_Outaddress1; ->$_t_Outaddress2; ->$_t_Outaddress3; ->$_t_Outaddress4; ->$_t_Town; ->$_t_County; ->$_t_Country; ->$_t_Postcode)
		If ($_t_outaddress3#"") | ($_t_outaddress4#"")
			If ($_t_outaddress4="")
				$_t_outaddress2:=$_t_outaddress2+", "+$_t_outaddress3
			Else 
				
				$_t_outaddress1:=$_t_outaddress1+", "+$_t_outaddress2
				$_t_outaddress2:=$_t_outaddress3+", "+$_t_outaddress4
			End if 
			
		End if 
		[COMPANIES:2]Address_Line_one:3:=$_t_outaddress1
		[COMPANIES:2]Address_Line_two:4:=$_t_outaddress2
		[COMPANIES:2]Country:8:=$_t_Country
		[COMPANIES:2]County_or_State:6:=$_t_County
		[COMPANIES:2]Town_or_City:5:=$_t_Town
		[COMPANIES:2]Postal_Code:7:=$_t_Postcode
		[COMPANIES:2]Fax:10:=$_t_Fax
		[COMPANIES:2]Telephone:9:=$_t_Telephone
		If ($_t_InvoiceAccount#"")
			[COMPANIES:2]Invoice_Superior:57:=True:C214
			[COMPANIES:2]Superior:34:=$_t_InvoiceAccount
		End if 
		[COMPANIES:2]Company_Type:13:=$_t_Stockisttype
		[COMPANIES:2]Default_Currency:59:=$_t_CUrrency
		[COMPANIES:2]Area:11:=$_t_RSMAREA
		[COMPANIES:2]Entry_Date:16:=Date:C102($_T_CREATEDDate)
		[COMPANIES:2]Sales_Credit:35:=Num:C11($_T_CreditLimit)
		[COMPANIES:2]Home_Page_URL:56:=$_T_Website
		[COMPANIES:2]x_Latitude:72:=Num:C11($_T_Lat)
		[COMPANIES:2]x_Longitude:71:=Num:C11($_T_Long)
		
		[COMPANIES:2]Phonetic_Name:64:=DB_BuildSoundex(DB_CompanyNameClean([COMPANIES:2]Company_Name:2))
		[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS([COMPANIES:2]Address_Line_one:3; [COMPANIES:2]Address_Line_two:4; [COMPANIES:2]Town_or_City:5; [COMPANIES:2]County_or_State:6; [COMPANIES:2]Postal_Code:7; [COMPANIES:2]Country:8)
		
		DB_SaveRecord(->[COMPANIES:2])
		
		If ($_t_Contactname1#"")
			
		End if 
		If ($_t_Contactname2#"")
			
		End if 
		
	End if 
	
End for 
ALERT:C41("DONE")

ERR_MethodTrackerReturn("TREND_IMPSTOCKISTSFROMDOC"; $_t_oldMethodName)
