//%attributes = {}

If (False:C215)
	//Database Method Name:      TREND_IMPORTPEOPLEFROMFILE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Contacts; 0)
	ARRAY TEXT:C222($_at_DocInText; 0)
	ARRAY TEXT:C222($_at_RecordsInText; 0)
	C_BOOLEAN:C305($_bo_ITC; $_bo_Modified; $_bo_RecordModified)
	C_LONGINT:C283($_l_GetRecord; $_l_GetRecords; $_l_pos; $_l_position)
	C_TEXT:C284($_t_Address; $_t_AdvancePriceNotice; $_t_Comments; $_t_CompanyID; $_t_CurrentInvoiceConfirm; $_t_CurrentMagazine; $_t_CurrentMailshot; $_t_CurrentOrderConfirm; $_t_CurrentPdfStatement; $_t_CurrentPriceNotice; $_t_CurrentPromotionsContact)
	C_TEXT:C284($_t_CurrentSendInProfile; $_t_CurrentSendNewPG; $_t_CurrentSendPR; $_t_CurrentSendPriceFile; $_t_CurrentSendShutDown; $_t_CurrentSendWebFile; $_t_CurrentSendXMAS; $_t_CurrentSendXMASpres; $_t_CurrentSHowOnWeb; $_t_CUrrentSpeedDial; $_t_CurrentTedContact)
	C_TEXT:C284($_t_CurrentTedlink; $_t_CurrentTNCOntact; $_t_CurrentTopsUUID; $_t_CurrentTrendSpecialist; $_t_CurrentUsesFTP; $_t_DocumentText; $_t_EmailAddress; $_t_EmailAfterAt; $_t_emailAstrix; $_t_EmailBeforeAT; $_t_FaxNumber)
	C_TEXT:C284($_t_FirstName; $_t_FullName; $_t_InvoiceConfirm; $_t_ITC; $_t_KeyContact; $_t_Magazine; $_t_Mailshot; $_t_Mobile; $_t_OldCompanyName; $_t_oldMethodName; $_t_OrderConfirm)
	C_TEXT:C284($_t_Owner; $_t_PdfStatement; $_t_PromotionsContact; $_t_Record; $_t_Remainder; $_t_Role; $_t_Salutation; $_t_SendInProfile; $_t_SendNewPG; $_t_SendPR; $_t_SendPriceFile)
	C_TEXT:C284($_t_SendShutDown; $_t_SendWebFile; $_t_SendXMAS; $_t_SHowOnWeb; $_t_Signoff; $_t_SpeedDial; $_t_StockiestAccount; $_t_Surname; $_t_TedContact; $_t_Tedlink; $_t_TelephoneNumber)
	C_TEXT:C284($_t_Title; $_t_TNCOntact; $_t_TopsUUID; $_t_TrendSpecialist; $_t_UsesFTP; $_t_XmasPres; $_t_Year)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TREND_IMPORTPEOPLEFROMFILE")


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
		$_l_position:=Position:C15(Char:C90(13); $_at_DocInText{$_l_GetRecords})
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
	$_t_FullName:=""
	$_t_TelephoneNumber:=""
	$_t_FaxNumber:=""
	$_t_PromotionsContact:=""
	$_t_OldCompanyName:=""
	$_t_EmailAddress:=""
	$_t_Role:=""
	$_t_Mobile:=""
	$_t_Salutation:=""
	$_t_Signoff:=""
	$_t_SpeedDial:=""
	$_t_Owner:=""
	$_t_FirstName:=""
	$_t_Surname:=""
	$_t_Title:=""
	$_t_SendNewPG:=""
	$_t_SendInProfile:=""
	$_t_SendPR:=""
	$_t_SendXMAS:=""
	$_t_SendShutDown:=""
	$_t_emailAstrix:=""
	$_t_Comments:=""
	$_t_Address:=""
	$_t_StockiestAccount:=""
	$_t_CompanyID:=""
	$_t_KeyContact:=""
	$_t_Mailshot:=""
	$_t_OrderConfirm:=""
	$_t_SHowOnWeb:=""
	$_t_TNCOntact:=""
	$_t_TrendSpecialist:=""
	$_t_SendPriceFile:=""
	$_t_SendWebFile:=""
	$_t_TedContact:=""
	$_t_Tedlink:=""
	$_t_InvoiceConfirm:=""
	$_t_AdvancePriceNotice:=""
	$_t_UsesFTP:=""
	$_t_TopsUUID:=""
	$_t_PromotionsContact:=""
	$_t_Magazine:=""
	$_t_XmasPres:=""
	$_t_PdfStatement:=""
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_OldCompanyName:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_FullName:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_TelephoneNumber:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_FaxNumber:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_EmailAddress:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Role:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Mobile:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Salutation:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Signoff:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SpeedDial:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Owner:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_FirstName:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Surname:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Title:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SendNewPG:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SendInProfile:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SendPR:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SendXMAS:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SendShutDown:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_XmasPres:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_emailAstrix:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Comments:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Magazine:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)  //if private
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Address:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)  //if private
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_StockiestAccount:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_CompanyID:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_KeyContact:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Mailshot:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_OrderConfirm:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SHowOnWeb:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_TNCOntact:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_TrendSpecialist:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SendPriceFile:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_SendWebFile:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_TedContact:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_Tedlink:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_InvoiceConfirm:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_AdvancePriceNotice:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_UsesFTP:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_PdfStatement:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_TopsUUID:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	End if 
	$_l_Position:=Position:C15(Char:C90(9); $_at_RecordsInText{$_l_GetRecord})
	If ($_l_position>0)
		$_t_PromotionsContact:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; 1; $_l_Position-1)
		$_at_RecordsInText{$_l_GetRecord}:=Substring:C12($_at_RecordsInText{$_l_GetRecord}; $_l_position+1)
	Else 
		$_t_PromotionsContact:=$_at_RecordsInText{$_l_GetRecord}
		
	End if 
	If ($_t_StockiestAccount#"")
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_StockiestAccount)
		If (Records in selection:C76([COMPANIES:2])>0)
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1)
			ARRAY TEXT:C222($_at_Contacts; 0)
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_Contacts)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_Contacts)
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_FirstName; *)
			QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
			If (Records in selection:C76([CONTACTS:1])=0)
				CREATE RECORD:C68([CONTACTS:1])
				[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
				Contact_Code
				CREATE RECORD:C68([CONTACTS_COMPANIES:145])
				[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
				[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
				SAVE RECORD:C53([CONTACTS_COMPANIES:145])
				
				$_bo_Modified:=True:C214
			End if 
			If ([CONTACTS:1]Extn:9#$_t_TelephoneNumber)
				[CONTACTS:1]Extn:9:=$_t_TelephoneNumber
				$_bo_Modified:=True:C214
			End if 
			If ([CONTACTS:1]Mobile:12#$_t_Mobile)
				[CONTACTS:1]Mobile:12:=$_t_Mobile
				$_bo_Modified:=True:C214
			End if 
			If ([CONTACTS:1]Fax:19#$_t_FaxNumber)
				[CONTACTS:1]Fax:19:=$_t_FaxNumber
				$_bo_Modified:=True:C214
			End if 
			
			If ([CONTACTS:1]Forename:4#$_t_FirstName)
				[CONTACTS:1]Forename:4:=$_t_FirstName
				$_bo_Modified:=True:C214
			End if 
			If ([CONTACTS:1]Surname:5#$_t_Surname)
				[CONTACTS:1]Surname:5:=$_t_Surname
				$_bo_Modified:=True:C214
			End if 
			If ([CONTACTS:1]Title:3#$_t_Title)
				[CONTACTS:1]Title:3:=$_t_Title
				$_bo_Modified:=True:C214
			End if 
			//build full name
			If ([CONTACTS:1]Salutation:7#$_t_Salutation)
				[CONTACTS:1]Salutation:7:=$_t_Salutation
				$_bo_Modified:=True:C214
			End if 
			$_t_EmailBeforeAT:=""
			$_t_EmailAfterAt:=""
			If ($_t_EmailAddress#"")
				$_l_pos:=Position:C15(Char:C90(64); $_t_EmailAddress)
				$_t_EmailBeforeAT:=Substring:C12($_t_EmailAddress; 1; $_l_pos-1)
				$_t_EmailAfterAt:=Substring:C12($_t_EmailAddress; $_l_pos+1)
			End if 
			If ($_t_EmailBeforeAT#[CONTACTS:1]Email_Before_At:30)
				$_t_EmailBeforeAT:=[CONTACTS:1]Email_Before_At:30
				$_bo_Modified:=True:C214
			End if 
			If ($_t_EmailAfterAT#[CONTACTS:1]EMail_After_At:24)
				$_t_EmailAfterAT:=[CONTACTS:1]EMail_After_At:24
				$_bo_Modified:=True:C214
			End if 
			If ([CONTACTS:1]Job_Title:6#$_t_Role)
				[CONTACTS:1]Job_Title:6:=$_t_Role
				$_bo_Modified:=True:C214
			End if 
			If ($_t_KeyContact#"")
				QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2="Key Contact")
				QUERY:C277([ROLES:87];  | ; [ROLES:87]Role_Code:1="P")
				If (Records in selection:C76([ROLES:87])=0)
					CREATE RECORD:C68([ROLES:87])
					[ROLES:87]Role_Code:1:="P"
					[ROLES:87]Role_Name:2:="Key Contact"
					SAVE RECORD:C53([ROLES:87])
				End if 
				$_T_KeyContact:="P"
			End if 
			If ([CONTACTS:1]Role:11#$_T_KeyContact)
				[CONTACTS:1]Role:11:=$_T_KeyContact
				$_bo_Modified:=True:C214
			End if 
			If ([CONTACTS:1]Comments:10="")
				If ($_t_Comments#"")
					[CONTACTS:1]Comments:10:=$_t_Comments
					$_bo_Modified:=True:C214
				End if 
			End if 
			If ($_t_OrderConfirm#"")
				
				$_t_CurrentOrderConfirm:=FurthFld_Get("Contacts"; "Order Confirmation")
				If (($_t_CurrentOrderConfirm="Yes")#($_t_OrderConfirm="TRUE"))
					If ($_t_OrderConfirm="TRUE")
						FurthFld_Set("Contacts"; "Order Confirmation"; "Yes")
					Else 
						If ($_t_CurrentOrderConfirm#"")
							FurthFld_Set("Contacts"; "Order Confirmation"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_TedContact#"")
				
				$_t_CurrentTedContact:=FurthFld_Get("Contacts"; "TED Contact")
				If (($_t_CurrentTedContact="Yes")#($_t_TedContact="TRUE"))
					If ($_t_TedContact="TRUE")
						FurthFld_Set("Contacts"; "TED Contact"; "Yes")
					Else 
						If ($_t_CurrentTedContact#"")
							FurthFld_Set("Contacts"; "TED Contact"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_InvoiceConfirm#"")
				
				$_t_CurrentInvoiceConfirm:=FurthFld_Get("Contacts"; "Invoice Confirmation")
				If (($_t_CurrentInvoiceConfirm="Yes")#($_t_InvoiceConfirm="TRUE"))
					If ($_t_InvoiceConfirm="TRUE")
						FurthFld_Set("Contacts"; "Invoice Confirmation"; "Yes")
					Else 
						If ($_t_CurrentInvoiceConfirm#"")
							FurthFld_Set("Contacts"; "Invoice Confirmation"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_PdfStatement#"")
				
				$_t_CurrentPdfStatement:=FurthFld_Get("Contacts"; "PDF Statement")
				If (($_t_CurrentPdfStatement="Yes")#($_t_PdfStatement="TRUE"))
					If ($_t_PdfStatement="TRUE")
						FurthFld_Set("Contacts"; "PDF Statement"; "Yes")
					Else 
						If ($_t_CurrentPdfStatement#"")
							FurthFld_Set("Contacts"; "PDF Statement"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			If ($_t_PromotionsContact#"")
				
				$_t_CurrentPromotionsContact:=FurthFld_Get("Contacts"; "Promotions Contact")
				If (($_t_CurrentPromotionsContact="Yes")#($_t_PromotionsContact="TRUE"))
					If ($_t_PromotionsContact="TRUE")
						FurthFld_Set("Contacts"; "Promotions Contact"; "Yes")
					Else 
						If ($_t_CurrentPromotionsContact#"")
							FurthFld_Set("Contacts"; "Promotions Contact"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			If ($_t_SHowOnWeb#"")
				
				$_t_CurrentSHowOnWeb:=FurthFld_Get("Contacts"; "Show On Web")
				If (($_t_CurrentSHowOnWeb="Yes")#($_t_SHowOnWeb="TRUE"))
					If ($_t_SHowOnWeb="TRUE")
						FurthFld_Set("Contacts"; "Show On Web"; "Yes")
					Else 
						If ($_t_CurrentSHowOnWeb#"")
							FurthFld_Set("Contacts"; "Show On Web"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_TNCOntact#"")
				
				$_t_CurrentTNCOntact:=FurthFld_Get("Contacts"; "Trendnet Contact")
				If (($_t_CurrentTNCOntact="Yes")#($_t_TNCOntact="TRUE"))
					If ($_t_TNCOntact="TRUE")
						FurthFld_Set("Contacts"; "Trendnet Contact"; "Yes")
					Else 
						If ($_t_CurrentTNCOntact#"")
							FurthFld_Set("Contacts"; "Trendnet Contact"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_TrendSpecialist#"")
				
				$_t_CurrentTrendSpecialist:=FurthFld_Get("Contacts"; "Trend Specialist")
				If (($_t_CurrentTrendSpecialist="Yes")#($_t_TrendSpecialist="TRUE"))
					If ($_t_TrendSpecialist="TRUE")
						FurthFld_Set("Contacts"; "Trend Specialist"; "Yes")
					Else 
						If ($_t_CurrentTrendSpecialist#"")
							FurthFld_Set("Contacts"; "Trend Specialist"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_UsesFTP#"")
				
				$_t_CurrentUsesFTP:=FurthFld_Get("Contacts"; "Uses FTP")
				If (($_t_CurrentUsesFTP="Yes")#($_t_UsesFTP="TRUE"))
					If ($_t_UsesFTP="TRUE")
						FurthFld_Set("Contacts"; "Uses FTP"; "Yes")
					Else 
						If ($_t_CurrentUsesFTP#"")
							FurthFld_Set("Contacts"; "Uses FTP"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			///$_t_TedContact:=""
			
			
			
			$_t_Signoff:=""
			
			
			If ($_t_SpeedDial#"")
				$_t_CUrrentSpeedDial:=FurthFld_Get("Contacts"; "Speed Dial")
				If ($_t_CUrrentSpeedDial#$_t_SpeedDial)
					FurthFld_Set("Contacts"; "Speed Dial"; $_t_SpeedDial)
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			$_t_Owner:=""
			
			
			If ($_t_Mailshot#"")
				
				$_t_CurrentMailshot:=FurthFld_Get("Contacts"; "Mailshot")
				If (($_t_CurrentMailshot="Yes")#($_t_Mailshot="TRUE"))
					If ($_t_Mailshot="TRUE")
						FurthFld_Set("Contacts"; "Mailshot"; "Yes")
					Else 
						If ($_t_CurrentMailshot#"")
							FurthFld_Set("Contacts"; "Mailshot"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_SendNewPG#"")
				
				$_t_CurrentSendNewPG:=FurthFld_Get("Contacts"; "Send New PG")
				If (($_t_CurrentSendNewPG="Yes")#($_t_SendNewPG="TRUE"))
					If ($_t_SendNewPG="TRUE")
						FurthFld_Set("Contacts"; "Send New PG"; "Yes")
					Else 
						If ($_t_CurrentSendNewPG#"")
							FurthFld_Set("Contacts"; "Send New PG"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			If ($_t_SendInProfile#"")
				
				$_t_CurrentSendInProfile:=FurthFld_Get("Contacts"; "Send In Profile")
				If (($_t_CurrentSendInProfile="Yes")#($_t_SendInProfile="TRUE"))
					If ($_t_SendInProfile="TRUE")
						FurthFld_Set("Contacts"; "Send In Profile"; "Yes")
					Else 
						If ($_t_CurrentSendInProfile#"")
							FurthFld_Set("Contacts"; "Send In Profile"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_SendPR#"")
				$_t_CurrentSendPR:=FurthFld_Get("Contacts"; "Send PR")
				If (($_t_CurrentSendPR="Yes")#($_t_SendPR="TRUE"))
					If ($_t_SendPR="TRUE")
						FurthFld_Set("Contacts"; "Send PR"; "Yes")
					Else 
						If ($_t_CurrentSendPR#"")
							FurthFld_Set("Contacts"; "Send PR"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_SendXMAS#"")
				$_t_CurrentSendXMAS:=FurthFld_Get("Contacts"; "Send XMAS card")
				If (($_t_CurrentSendXMAS="Yes")#($_t_SendXMAS="TRUE"))
					If ($_t_SendXMAS="TRUE")
						FurthFld_Set("Contacts"; "Send XMAS card"; "Yes")
					Else 
						If ($_t_CurrentSendXMAS#"")
							FurthFld_Set("Contacts"; "Send XMAS card"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_XmasPres#"")
				$_t_CurrentSendXMASpres:=FurthFld_Get("Contacts"; "Send XMAS present")
				If (($_t_CurrentSendXMASPres="Yes")#($_t_XmasPres="TRUE"))
					If ($_t_XmasPres="TRUE")
						FurthFld_Set("Contacts"; "Send XMAS Present"; "Yes")
					Else 
						If ($_t_CurrentSendXMASpres#"")
							FurthFld_Set("Contacts"; "Send XMAS Present"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_SendShutDown#"")
				$_t_CurrentSendShutDown:=FurthFld_Get("Contacts"; "Send Shutdown")
				If (($_t_CurrentSendShutDown="Yes")#($_t_SendShutDown="TRUE"))
					If ($_t_SendShutDown="TRUE")
						FurthFld_Set("Contacts"; "Send Shutdown"; "Yes")
					Else 
						If ($_t_CurrentSendShutDown#"")
							FurthFld_Set("Contacts"; "Send Shutdown"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			If ($_t_SendPriceFile#"")
				$_t_CurrentSendPriceFile:=FurthFld_Get("Contacts"; "Send Price File")
				If (($_t_CurrentSendPriceFile="Yes")#($_t_SendPriceFile="TRUE"))
					If ($_t_SendPriceFile="TRUE")
						FurthFld_Set("Contacts"; "Send Price File"; "Yes")
					Else 
						If ($_t_CurrentSendPriceFile#"")
							FurthFld_Set("Contacts"; "Send Price File"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_SendWebFile#"")
				$_t_CurrentSendWebFile:=FurthFld_Get("Contacts"; "Send Web File")
				If (($_t_CurrentSendWebFile="Yes")#($_t_SendWebFile="TRUE"))
					If ($_t_SendWebFile="TRUE")
						FurthFld_Set("Contacts"; "Send Web File"; "Yes")
					Else 
						If ($_t_CurrentSendWebFile#"")
							FurthFld_Set("Contacts"; "Send Web File"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_Tedlink#"")
				$_t_CurrentTedlink:=FurthFld_Get("Contacts"; "Send TED Link")
				If (($_t_CurrentTedlink="Yes")#($_t_Tedlink="TRUE"))
					If ($_t_Tedlink="TRUE")
						FurthFld_Set("Contacts"; "Send TED Link"; "Yes")
					Else 
						If ($_t_CurrentTedlink#"")
							FurthFld_Set("Contacts"; "Send TED Link"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_AdvancePriceNotice#"")
				$_t_CurrentPriceNotice:=FurthFld_Get("Contacts"; "Send Advance Price Notice")
				If (($_t_CurrentPriceNotice="Yes")#($_t_AdvancePriceNotice="TRUE"))
					If ($_t_AdvancePriceNotice="TRUE")
						FurthFld_Set("Contacts"; "Send Advance Price Notice"; "Yes")
					Else 
						If ($_t_CurrentPriceNotice#"")
							FurthFld_Set("Contacts"; "Send Advance Price Notice"; "No")
						End if 
					End if 
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			
			If ($_t_AdvancePriceNotice#"")
				$_t_CurrentTopsUUID:=FurthFld_Get("Contacts"; "TOPS RecordID")
				If ($_t_CurrentTopsUUID#$_t_TopsUUID)
					
					FurthFld_Set("Contacts"; "TOPS RecordID"; $_t_TopsUUID)
					
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_t_Magazine#"")
				$_t_CurrentMagazine:=FurthFld_Get("Contacts"; "Magazine")
				If ($_t_CurrentMagazine#$_t_Magazine)
					
					FurthFld_Set("Contacts"; "Magazine"; $_t_Magazine)
					
					$_bo_RecordModified:=True:C214
				End if 
			End if 
			
			If ($_bo_RecordModified)
				SAVE RECORD:C53([CONTACTS:1])
				
				
				//$_t_Address:=""  //private Address
				
				//$_t_TopsUUID:=""
				
			End if 
		End if 
	End if 
End for 
ERR_MethodTrackerReturn("TREND_IMPORTPEOPLEFROMFILE"; $_t_oldMethodName)
