If (False:C215)
	//Project Form Method Name: RR_ZenCartWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/10/2013 20:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_FieldParsed; 0)
	//ARRAY DATE(CCM_ad_CardExpiries;0)
	ARRAY LONGINT:C221($_al_KnownFieldsTagClasses; 0)
	ARRAY LONGINT:C221($_al_OrderIDS; 0)
	ARRAY LONGINT:C221($_al_TagClasses; 0)
	//ARRAY LONGINT(CCM_al_CardClasses;0)
	//ARRAY LONGINT(CCM_al_CardOwnerIDRange;0)
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY LONGINT(CCM_al_CardTypes;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_AddressFields; 0)
	ARRAY TEXT:C222($_at_AddressLines; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_ContactCompanies1; 0)
	ARRAY TEXT:C222($_at_ContactCompanies2; 0)
	ARRAY TEXT:C222($_at_KnownFieldNames; 0)
	ARRAY TEXT:C222($_at_OrderItemFieldData; 0; 0)
	ARRAY TEXT:C222($_at_OrderItemFieldNames; 0; 0)
	ARRAY TEXT:C222($_at_sOrderCodes; 0)
	ARRAY TEXT:C222($_at_SubFieldData; 0)
	ARRAY TEXT:C222($_at_SubFieldNames; 0)
	ARRAY TEXT:C222($_at_TagTypes; 0)
	ARRAY TEXT:C222($_at_TagTypesEnd; 0)
	ARRAY TEXT:C222($_at_ZenFieldData; 0)
	ARRAY TEXT:C222($_at_ZenFieldNames; 0)
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	//ARRAY TEXT(CCM_at_AVSFailCodes;0)
	//ARRAY TEXT(CCM_at_CardClasses;0)
	//ARRAY TEXT(CCM_at_CardExpiries;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardNumbers;0)
	//ARRAY TEXT(CCM_at_CardOwnerName;0)
	//ARRAY TEXT(CCM_at_CardOwnersRange;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	//ARRAY TEXT(CCM_at_DecodedCardNumber;0)
	//ARRAY TEXT(DB_at_Legend;0)
	//ARRAY TEXT(DB_at_OrderIDs;0)
	C_BOOLEAN:C305(<>MultiCo; <>ResetNumber; <>SalesItemDP; <>StatesLoaded; <>SYS_bo_DefaultSalutation; <>SYS_bo_QuitCalled; $_bo_CardisMasked; $_bo_Continue; $_bo_DataParameter; $_bo_Exit; $_bo_ExitZip)
	C_BOOLEAN:C305($_bo_NoCreate; $_bo_NoFIeld; $_bo_NoSave; $_bo_RowAdded; DB_bo_NoLoad; DB_t_Ordersinited; MAddressesExported; PROD_bo_GetCodeFromItem; PROD_bo_GetValuesFromItem; PROD_bo_iscancelled)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_EndDate; $_d_EndDate1; $_d_OrderDate)
	C_LONGINT:C283(<>OINo; <>PER_l_CurrentUserID; $_l_AddedItemID; $_l_AddMode; $_l_AtPosition; $_l_BuildOrderIDSIndex; $_l_CardNumberChar1; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_CharacterPosition3; $_l_CharacterPosition4)
	C_LONGINT:C283($_l_CharacterPosition5; $_l_CharacterPosition6; $_l_CharacterPositionEnc; $_l_Clash; $_l_Class2; $_l_Class3; $_l_classRow; $_l_CompaniesIndex; $_l_CompaniesMatching; $_l_CompanyCodeSuffix; $_l_EditOrderProcess)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_FieldsIndex; $_l_FirstID; $_l_FixIDProcess; $_l_HighestNumber; $_l_ListID; $_l_MonthIndex; $_l_NewCompanyCodeLength; $_l_NextOrderSortSeq; $_l_OrderItemNumber)
	C_LONGINT:C283($_l_OrderItemsArraySize; $_l_OrderItemsColumnsCount; $_l_OrderItemsIndex; $_l_OrderNumber; $_l_Process; $_l_RecordNumber; $_l_Retries; $_l_Row; $_l_SubFieldRow; $_l_TableNumber; $_l_TagClass)
	C_LONGINT:C283($_l_TextPosition; $_l_ZenFieldRow; $_l_ZenFieldRow2; $_l_ZenFieldRow3; DB_l_HideWindow; DB_l_RetryOrder; DB_l_WebProgress; RR_l_WebRetries; vAdd; vCM; xNext)
	C_POINTER:C301($_ptr_LBTable)
	C_REAL:C285($_r_AbsDifference; $_r_AbsDifference2; $_r_CommidityQTY; $_r_MaybeUnitPrice; $_r_Price; $_r_QTY; $_r_TaxAmount; $_r_UnitPrice)
	C_TEXT:C284(<>DefRole; <>SYS_t_BaseCurrency; $_t_addressBlock; $_t_AddressLine1; $_t_addressLine2; $_t_addressLine3; $_t_CardExpires; $_t_CardNumber; $_t_CardOwner; $_t_CardType; $_t_CCNumbers)
	C_TEXT:C284($_t_CommodityCode; $_t_CompanyCode; $_t_CompanyName; $_t_ContactCode; $_t_Country; $_t_CurrentDateString; $_t_CurrentTimeString; $_t_Data; $_t_EmailAddress; $_t_EmailAfter; $_t_EmailBefore)
	C_TEXT:C284($_t_FieldDataSTR; $_t_FieldName; $_t_First3; $_t_FIrst4; $_t_First4A; $_t_FIrstName; $_t_FormName; $_t_Forth4; $_t_Forth4A; $_t_Header; $_t_Header2)
	C_TEXT:C284($_t_ID2; $_t_Last4Digits; $_t_LastCodeCodeSTR; $_t_LastName; $_t_Model; $_t_ModelRaw; $_t_ModelVar; $_t_ModelVar2; $_t_Month; $_t_NewCompanyCode; $_t_oldMethodName)
	C_TEXT:C284($_t_OrderID; $_t_OrderITemFieldNamesSTR; $_t_OrderItemsBlock; $_t_OrderItemText; $_t_OrderReference; $_t_OrdersBlock; $_t_OrdersRecordCode; $_t_OrderText; $_t_OtherCommodityCode; $_t_PersonName; $_t_PriceSTR)
	C_TEXT:C284($_t_Product; $_t_ProductVar; $_t_QuantitySTR; $_t_Salutation; $_t_Second4; $_t_Second4A; $_t_ShippingAddressBlock; $_t_State; $_t_StateandZip; $_t_StateCode; $_t_String)
	C_TEXT:C284($_t_TaxAmountSTR; $_t_Telephone; $_t_Text; $_t_TextAfterChars; $_t_TextBeforeChars; $_t_TextToFind; $_t_TextToFInd2; $_t_TextToFInd3; $_t_Third4; $_t_Third4A; $_t_Town)
	C_TEXT:C284($_t_Year; $_t_Zip; CC_T_CCX99999999999; CCM_t_CardOwnerName; CCM_T_Warning; DB_t_Default; DB_t_DefaultWebUrl; DB_T_TExt; DB_t_WebUrl; DB_t_WebUrlBase; mCompExport)
	C_TEXT:C284(SD2_T_Dataform; WIN_t_CurrentInputForm)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RR_ZenCartWindow"; Form event code:C388)


$_t_oldMethodName:=ERR_MethodTracker("FM RR_ZenCartWindow"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		SET TIMER:C645(60*2)
		WA SET PREFERENCE:C1041(SD2_T_Dataform; 2; True:C214)
		WA SET PREFERENCE:C1041(SD2_T_Dataform; 3; True:C214)
		WA SET PREFERENCE:C1041(SD2_T_Dataform; 4; True:C214)
		//$Err:=Web_SetPreferences(SD2_l_Dataform;Web_kVisible;1;"")  `0=hide the browser; 1=show the browser (2) SET VISIBLE doesn't fully hide web area
		//DB_t_WebUrl:="http://digitalmedia.creamermedia.co.za:8080/Cumulus"
		DB_t_WebUrl:="http://renaissanceribbons.com/~renaissa/admin/login.php?"
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="ZENCART")
		If (Records in selection:C76([SCRIPTS:80])>0)
			Macro("ZENCART")
		End if 
		DB_t_WebUrlBase:=DB_t_WebUrl
		DB_t_WebUrlBase:=Replace string:C233(DB_t_WebUrlBase; "Http:"; "Https:")
		DB_t_WebUrlBase:=Replace string:C233(DB_t_WebUrlBase; "login.php"; "orders.php")
		DB_t_DefaultWebUrl:=""
		WS_AutoscreenSize(3; 300; 600)
		//zenAdminID=d427c066e1c9e5814f1da4ad2dcb6317"
		DB_l_WebProgress:=0
		//WA OPEN URL(SD2_T_Dataform;DB_t_WebUrl)
		//SET TIMER(10)
		ARRAY TEXT:C222(DB_at_OrderIDs; 0)
		ARRAY TEXT:C222(DB_at_Legend; 0)
		APPEND TO ARRAY:C911(DB_at_Legend; "Loading Form Initing Variables")
	: ($_l_event=On Outside Call:K2:11)
		
		APPEND TO ARRAY:C911(DB_at_Legend; "Outside Call")
		If (Not:C34(<>SYS_bo_QuitCalled))
			If (DB_l_HideWindow=1)
				APPEND TO ARRAY:C911(DB_at_Legend; "WIndow Hidden(outside call)")
				HIDE WINDOW:C436
			Else 
				APPEND TO ARRAY:C911(DB_at_Legend; "WIndow Shown(outside call)")
				SHOW WINDOW:C435
				
			End if 
		Else 
			$_t_CurrentDateString:=String:C10(Current date:C33)
			$_t_CurrentDateString:=Replace string:C233($_t_CurrentDateString; "/"; "_")
			$_t_CurrentTimeString:=Time string:C180(Current time:C178)
			$_t_CurrentTimeString:=Replace string:C233($_t_CurrentTimeString; ":"; "_")
			If (False:C215)
				$_ti_DocumentRef:=Create document:C266("ZenWindowInfo"+$_t_CurrentDateString+$_t_CurrentTimeString; "TEXT")
				
				APPEND TO ARRAY:C911(DB_at_Legend; "Exit WIndow-quitting (outside call)")
				For ($_l_MonthIndex; 1; Size of array:C274(DB_at_Legend))
					SEND PACKET:C103($_ti_DocumentRef; DB_at_Legend{$_l_MonthIndex}+Char:C90(13))
				End for 
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
			End if 
			CANCEL:C270
		End if 
	: ($_l_event=On Resize:K2:27)
		
		APPEND TO ARRAY:C911(DB_at_Legend; "Resize Form")
		WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
	: ($_l_event=On Timer:K2:25)
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			If (DB_l_HideWindow=1)
				APPEND TO ARRAY:C911(DB_at_Legend; "WIndow Hidden(Timer)")
				HIDE WINDOW:C436
			Else 
				APPEND TO ARRAY:C911(DB_at_Legend; "WIndow Shown(Timer)")
				SHOW WINDOW:C435
			End if 
			If (False:C215)
				If (DB_t_DefaultWebUrl#"")
					DB_t_WebUrl:=DB_t_DefaultWebUrl
					WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
				End if 
			End if 
			APPEND TO ARRAY:C911(DB_at_Legend; "Get Page Content")
			DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
			$_l_TextPosition:=Position:C15("Admin Login"; DB_T_TExt)
			If ($_l_TextPosition=0)
				APPEND TO ARRAY:C911(DB_at_Legend; "Logged In")
				// we are logged in.
				
				If (Not:C34(DB_t_Ordersinited))
					APPEND TO ARRAY:C911(DB_at_Legend; "Initing Arrays")
					
					ARRAY TEXT:C222(DB_at_OrderIDs; 0)
					DB_t_Ordersinited:=True:C214
				End if 
				SET TIMER:C645(60*5)
				WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
				APPEND TO ARRAY:C911(DB_at_Legend; "Refresh Page Loaded(1)")
				
				If (Size of array:C274(DB_at_OrderIDs)>0)
					APPEND TO ARRAY:C911(DB_at_Legend; "Processing Order numbers ("+DB_at_OrderIDs{1}+")")
					
					
					//HIDE WINDOW
					APPEND TO ARRAY:C911(DB_at_Legend; "Get Page Content")
					DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
					$_l_TextPosition:=Position:C15("Customer:"; DB_T_TExt)
					If ($_l_TextPosition>0)
						APPEND TO ARRAY:C911(DB_at_Legend; "'Customer' is on page")
						RR_l_WebRetries:=0
						ARRAY TEXT:C222($_at_KnownFieldNames; 0)
						ARRAY LONGINT:C221($_al_KnownFieldsTagClasses; 0)
						ARRAY TEXT:C222($_at_TagTypes; 0)
						ARRAY TEXT:C222($_at_TagTypesEnd; 0)
						ARRAY LONGINT:C221($_al_TagClasses; 0)
						ARRAY BOOLEAN:C223($_abo_FieldParsed; 0)
						
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Customer:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 2)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Telephone Number:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 1)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "E-Mail Address:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 1)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "IP Address: ")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 1)
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "IP Address:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 1)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Shipping Address:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 2)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Billing Address:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 2)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Invoice No.")  //note this is appended with the ticket number
						
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 1)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Date Purchased:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 1)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Payment Method:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 1)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Credit Card Type:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 3)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Credit Card Owner:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 3)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Credit Card Number:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 3)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Credit Card CVV Number:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 3)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Credit Card Expires:")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 3)
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Quantity")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 8)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Products")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 5)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Model")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 4)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Availability")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 4)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Tax")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 8)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Price (ex)")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 8)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Price (inc)")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 8)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Total (ex)")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 8)
						
						APPEND TO ARRAY:C911($_at_KnownFieldNames; "Total (inc)")
						APPEND TO ARRAY:C911($_al_KnownFieldsTagClasses; 8)
						
						
						ARRAY BOOLEAN:C223($_abo_FieldParsed; Size of array:C274($_at_KnownFieldNames))
						
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<td class="+Char:C90(34)+"main"+Char:C90(34)+"><strong>")
						APPEND TO ARRAY:C911($_at_TagTypesEnd; "</strong></td>")
						APPEND TO ARRAY:C911($_al_TagClasses; 1)
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<td class="+Char:C90(34)+"main"+Char:C90(34)+" valign="+Char:C90(34)+"top"+Char:C90(34)+"><strong>")
						APPEND TO ARRAY:C911($_at_TagTypesEnd; "</strong></td>")
						APPEND TO ARRAY:C911($_al_TagClasses; 2)
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<td class="+Char:C90(34)+"main"+Char:C90(34)+">")
						APPEND TO ARRAY:C911($_at_TagTypesEnd; "</td>")
						APPEND TO ARRAY:C911($_al_TagClasses; 3)
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<td class="+Char:C90(34)+"dataTableHeadingContent"+Char:C90(34)+">")
						APPEND TO ARRAY:C911($_at_TagTypesEnd; "</td>")
						APPEND TO ARRAY:C911($_al_TagClasses; 4)
						
						//APPEND TO ARRAY($_at_TagTypes;"<a href>")
						//APPEND TO ARRAY($_at_TagTypesEnd;"</a>")
						//APPEND TO ARRAY($_al_TagClasses;10)
						
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<td class="+Char:C90(34)+"dataTableHeadingContent"+Char:C90(34)+" align="+Char:C90(34)+"right"+Char:C90(34)+">")
						APPEND TO ARRAY:C911($_at_TagTypesEnd; "</td>")
						APPEND TO ARRAY:C911($_al_TagClasses; 8)
						
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<td class="+Char:C90(34)+"dataTableHeadingContent"+Char:C90(34)+" colspan="+Char:C90(34)+"2"+Char:C90(34)+">")
						APPEND TO ARRAY:C911($_at_TagTypesEnd; "</td>")
						APPEND TO ARRAY:C911($_al_TagClasses; 5)
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<tr class="+Char:C90(34)+"dataTableHeadingRow"+Char:C90(34)+">")  //This is the start of the table definition
						
						APPEND TO ARRAY:C911($_al_TagClasses; 6)
						
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<tr class="+Char:C90(34)+"dataTableRow"+Char:C90(34)+">")  //This is the order item there can be many of these
						
						APPEND TO ARRAY:C911($_al_TagClasses; 7)
						
						APPEND TO ARRAY:C911($_at_TagTypes; "<td class="+Char:C90(34)+"dataTableContent"+Char:C90(34)+" valign="+Char:C90(34)+"top"+Char:C90(34)+" align="+Char:C90(34)+"right"+Char:C90(34)+">")
						APPEND TO ARRAY:C911($_al_TagClasses; 9)
						
						ARRAY TEXT:C222($_at_ZenFieldNames; 0)
						ARRAY TEXT:C222($_at_ZenFieldData; 0)
						ARRAY TEXT:C222($_at_OrderItemFieldNames; 0; 0)
						ARRAY TEXT:C222($_at_OrderItemFieldData; 0; 0)
						For ($_l_FieldsIndex; 1; Size of array:C274($_abo_FieldParsed))
							$_abo_FieldParsed{$_l_FieldsIndex}:=False:C215
						End for 
						$_bo_DataParameter:=False:C215  //Set this to true when you find the field label because the next one is the field data
						
						
						$_t_OrderText:=Substring:C12(DB_T_TExt; $_l_TextPosition-100)
						$_bo_NoFIeld:=False:C215
						For ($_l_FieldsIndex; 1; Size of array:C274($_at_KnownFieldNames))
							
							If (Not:C34($_abo_FieldParsed{$_l_FieldsIndex}))
								$_l_TagClass:=$_al_KnownFieldsTagClasses{$_l_FieldsIndex}
								$_l_Row:=Find in array:C230($_al_TagClasses; $_l_TagClass)
								APPEND TO ARRAY:C911(DB_at_Legend; "'Looking for Field"+$_at_KnownFieldNames{$_l_FieldsIndex})
								
								If ("Invoice No."=$_at_KnownFieldNames{$_l_FieldsIndex})
									$_bo_NoFIeld:=True:C214
									$_t_TextToFind:=$_at_TagTypes{$_l_Row}+$_at_KnownFieldNames{$_l_FieldsIndex}+" "+DB_at_OrderIDs{1}+$_at_TagTypesEnd{$_l_Row}
									APPEND TO ARRAY:C911(DB_at_Legend; "'Field string "+$_t_TextToFind)
									
								Else 
									$_bo_NoFIeld:=False:C215
									$_t_TextToFind:=$_at_TagTypes{$_l_Row}+$_at_KnownFieldNames{$_l_FieldsIndex}+$_at_TagTypesEnd{$_l_Row}
									APPEND TO ARRAY:C911(DB_at_Legend; "'Field string "+$_t_TextToFind)
									
								End if 
								If ($_l_TagClass>=4)
									APPEND TO ARRAY:C911(DB_at_Legend; "'Handling type 4+ Fields  "+$_t_TextToFind)
									
									
									//Handled differently
									$_l_Class2:=$_al_TagClasses{7}
									$_l_Class3:=$_al_TagClasses{8}
									$_t_TextToFInd2:=$_at_TagTypes{7}
									$_l_TextPosition:=Position:C15($_t_TextToFInd2; $_t_OrderText)
									$_t_OrderItemsBlock:=Substring:C12($_t_OrderText; $_l_TextPosition)
									$_l_CharacterPosition3:=Position:C15("</tr>"; $_t_OrderItemsBlock)
									$_t_OrderITemFieldNamesSTR:=Substring:C12($_t_OrderItemsBlock; 1; $_l_CharacterPosition3-1)
									$_l_TextPosition:=Position:C15($_at_TagTypes{$_l_Row}; $_t_OrderITemFieldNamesSTR)
									ARRAY TEXT:C222($_at_SubFieldNames; 0)
									ARRAY TEXT:C222($_at_SubFieldData; 0)
									APPEND TO ARRAY:C911($_at_SubFieldNames; "Quantity")
									APPEND TO ARRAY:C911(DB_at_Legend; "'Adding Order Item Field Name"+"Quantity")
									
									Repeat 
										$_l_TextPosition:=Position:C15("<td"; $_t_OrderITemFieldNamesSTR)
										If ($_l_TextPosition>0)
											$_t_FieldName:=Substring:C12($_t_OrderITemFieldNamesSTR; $_l_TextPosition)
											$_l_CharacterPosition2:=Position:C15("</td>"; $_t_FieldName)
											$_t_OrderITemFieldNamesSTR:=Substring:C12($_t_FieldName; $_l_CharacterPosition2+Length:C16("</td>")+1)
											$_t_FieldName:=Substring:C12($_t_FieldName; 1; $_l_CharacterPosition2+Length:C16("</td>")-1)
											APPEND TO ARRAY:C911($_at_SubFieldNames; $_t_FieldName)
											APPEND TO ARRAY:C911(DB_at_Legend; "'Adding Order Item Field Name"+$_t_FieldName)
											
										End if 
									Until ($_l_TextPosition=0)
									$_l_SubFieldRow:=Find in array:C230($_at_SubFieldNames; $_t_TextToFind)
									$_t_TextToFInd2:=$_at_TagTypes{8}  // beginning of field data
									
									Repeat 
										ARRAY TEXT:C222($_at_SubFieldData; 0)
										$_l_TextPosition:=Position:C15($_t_TextToFInd2; $_t_OrderItemsBlock)
										If ($_l_TextPosition>0)
											$_t_OrderItemsBlock:=Substring:C12($_t_OrderItemsBlock; $_l_TextPosition)
											$_l_CharacterPosition3:=Position:C15("</tr>"; $_t_OrderItemsBlock)
											$_t_OrderItemText:=Substring:C12($_t_OrderItemsBlock; 1; $_l_CharacterPosition3+Length:C16("/tr"))
											$_t_OrderItemsBlock:=Substring:C12($_t_OrderItemsBlock; $_l_CharacterPosition3+Length:C16("/tr")+1)  //the next order items
											
											//this is the whole order item in $_t_OrderItemText
											//parse that into fields and get the correct field data
											APPEND TO ARRAY:C911(DB_at_Legend; "'Order item Data(Raw)"+$_t_OrderItemText)
											
											Repeat 
												$_l_CharacterPosition4:=Position:C15("<td"; $_t_OrderItemText)
												If ($_l_CharacterPosition4>0)
													$_t_OrderItemText:=Substring:C12($_t_OrderItemText; $_l_CharacterPosition4-1)
													$_l_CharacterPosition5:=Position:C15("</td>"; $_t_OrderItemText)
													If ($_l_CharacterPosition5>0)
														$_t_FieldDataSTR:=Substring:C12($_t_OrderItemText; 1; $_l_CharacterPosition5-1)
														$_t_OrderItemText:=Substring:C12($_t_OrderItemText; $_l_CharacterPosition5+Length:C16("</td")+1)
														$_l_CharacterPosition6:=Position:C15(">"; $_t_FieldDataSTR)
														If ($_l_CharacterPosition6>0)
															$_t_FieldDataSTR:=Substring:C12($_t_FieldDataSTR; $_l_CharacterPosition6+1)
															If (Position:C15("&nbsp;x"; $_t_FieldDataSTR)=0)
																
																$_t_FieldDataSTR:=Replace string:C233($_t_FieldDataSTR; "<strong>"; "")
																$_t_FieldDataSTR:=Replace string:C233($_t_FieldDataSTR; "</strong>"; "")
																APPEND TO ARRAY:C911($_at_SubFieldData; $_t_FieldDataSTR)
																APPEND TO ARRAY:C911(DB_at_Legend; "'Order item Data Field"+$_t_FieldDataSTR+String:C10(Size of array:C274($_at_SubFieldData)))
																
															Else 
																$_l_classRow:=Find in array:C230($_al_TagClasses; 9)
																$_t_FieldDataSTR:=Replace string:C233($_t_FieldDataSTR; $_at_TagTypes{$_l_classRow}; "")
																$_t_FieldDataSTR:=Replace string:C233($_t_FieldDataSTR; "<strong>"; "")
																$_t_FieldDataSTR:=Replace string:C233($_t_FieldDataSTR; "</strong>"; "")
																$_t_FieldDataSTR:=Replace string:C233($_t_FieldDataSTR; "&nbsp;x"; "")
																APPEND TO ARRAY:C911($_at_SubFieldData; $_t_FieldDataSTR)
																APPEND TO ARRAY:C911(DB_at_Legend; "'Order item Data Field"+$_t_FieldDataSTR+String:C10(Size of array:C274($_at_SubFieldData)))
																
															End if 
														Else 
															APPEND TO ARRAY:C911(DB_at_Legend; "DId not add Data Field no >")
															
															//APPEND TO ARRAY($_at_SubFieldData;"")
														End if 
													Else 
														APPEND TO ARRAY:C911(DB_at_Legend; "DId not add Data Field no </td>")
														
														//`APPEND TO ARRAY($_at_SubFieldData;"")
													End if 
													//an order item
												End if 
											Until ($_l_CharacterPosition4=0)
											//we have an order item. there is no point in reparsing this for every field
											$_bo_RowAdded:=False:C215
											For ($_l_FieldsIndex; 1; Size of array:C274($_at_KnownFieldNames))
												If (Not:C34($_abo_FieldParsed{$_l_FieldsIndex}))
													$_l_TagClass:=$_al_KnownFieldsTagClasses{$_l_FieldsIndex}
													If ($_l_TagClass>=4)
														$_l_Row:=Find in array:C230($_al_TagClasses; $_l_TagClass)
														If ($_at_KnownFieldNames{$_l_FieldsIndex}="Quantity")
															$_t_TextToFInd3:=$_at_KnownFieldNames{$_l_FieldsIndex}
														Else 
															$_t_TextToFInd3:=$_at_TagTypes{$_l_Row}+$_at_KnownFieldNames{$_l_FieldsIndex}+$_at_TagTypesEnd{$_l_Row}
														End if 
														APPEND TO ARRAY:C911(DB_at_Legend; "'Appending Field Data to 2D array, field name"+$_t_TextToFInd3)
														
														$_l_ZenFieldRow:=Find in array:C230($_at_SubFieldNames; $_t_TextToFInd3)
														If ($_l_ZenFieldRow>0)
															APPEND TO ARRAY:C911(DB_at_Legend; "'FIeld Name  found at "+String:C10($_l_ZenFieldRow))
															
															If ($_bo_RowAdded=False:C215)
																APPEND TO ARRAY:C911(DB_at_Legend; "Adding Row for record")
																
																INSERT IN ARRAY:C227($_at_OrderItemFieldNames; Size of array:C274($_at_OrderItemFieldNames)+1; 1)
																INSERT IN ARRAY:C227($_at_OrderItemFieldData; Size of array:C274($_at_OrderItemFieldData)+1; 1)
																$_bo_RowAdded:=True:C214
															End if 
															$_t_FieldName:=$_at_KnownFieldNames{$_l_FieldsIndex}
															If ($_t_FieldName#"")
																$_l_CharacterPosition4:=Position:C15(":"; $_t_FieldName)
																If ($_l_CharacterPosition4>0)
																	$_t_FieldName:=Substring:C12($_t_FieldName; 1; $_l_CharacterPosition4-1)
																End if 
																$_l_OrderItemsArraySize:=Size of array:C274($_at_OrderItemFieldNames)
																$_l_OrderItemsColumnsCount:=Size of array:C274($_at_OrderItemFieldNames{$_l_OrderItemsArraySize})
																INSERT IN ARRAY:C227($_at_OrderItemFieldNames{$_l_OrderItemsArraySize}; $_l_OrderItemsColumnsCount+1; 1)
																INSERT IN ARRAY:C227($_at_OrderItemFieldData{$_l_OrderItemsArraySize}; $_l_OrderItemsColumnsCount+1; 1)
																$_at_OrderItemFieldNames{$_l_OrderItemsArraySize}{$_l_OrderItemsColumnsCount+1}:=$_t_FieldName
																If (Size of array:C274($_at_SubFieldData)>=$_l_ZenFieldRow)
																	APPEND TO ARRAY:C911(DB_at_Legend; "'Field Data Found")
																	
																	$_at_OrderItemFieldData{$_l_OrderItemsArraySize}{$_l_OrderItemsColumnsCount+1}:=$_at_SubFieldData{$_l_ZenFIeldRow}
																Else 
																	APPEND TO ARRAY:C911(DB_at_Legend; "'Field Data Element not found size is"+String:C10(Size of array:C274($_at_SubFieldData)))
																	
																	
																End if 
																
															End if 
														Else 
															APPEND TO ARRAY:C911(DB_at_Legend; "'FIeld Name not found!!")
															
															
														End if 
													End if 
												End if 
												// do not take the sub fields as parsed at this point-there may be more records
											End for 
											
										End if 
									Until ($_l_TextPosition=0)
									//We have now parsed the order items.
									For ($_l_FieldsIndex; 1; Size of array:C274($_at_KnownFieldNames))
										If (Not:C34($_abo_FieldParsed{$_l_FieldsIndex}))
											$_l_TagClass:=$_al_KnownFieldsTagClasses{$_l_FieldsIndex}
											If ($_l_TagClass>=4)
												$_abo_FieldParsed{$_l_FieldsIndex}:=True:C214
											End if 
										End if 
										
									End for 
									
								Else 
									$_l_TextPosition:=Position:C15($_t_TextToFind; $_t_OrderText)
									If ($_l_TextPosition>0)
										APPEND TO ARRAY:C911(DB_at_Legend; "Found text string at position  "+String:C10($_l_TextPosition))
										
										If (Not:C34($_bo_NoFIeld))
											$_t_TextAfterChars:=Substring:C12($_t_OrderText; $_l_TextPosition+Length:C16($_t_TextToFind))
											
											$_t_Header2:="<!--<td class="+Char:C90(34)+"main"+Char:C90(34)+">"
											If ($_at_KnownFieldNames{$_l_FieldsIndex}="Credit Card Number:")
												
												//$_t_TextAfterChars:=Substring($_t_TextAfterChars;$Pos+Length("&nbsp")+3)
											End if 
											$_l_CharacterPosition2:=Position:C15("</td>"; $_t_TextAfterChars)
											$_t_Data:=Substring:C12($_t_TextAfterChars; 1; $_l_CharacterPosition2-1)
											$_t_Data:=Replace string:C233($_t_Data; "&nbsp"; "")
											
											$_t_Header:="<td class="+Char:C90(34)+"main"+Char:C90(34)+">"
											$_l_CharacterPosition3:=Position:C15($_t_Header; $_t_Data)
											If ($_l_CharacterPosition3>0)
												$_t_Data:=Substring:C12($_t_Data; $_l_CharacterPosition3+Length:C16($_t_Header))
												$_l_TextPosition:=Position:C15("&nbsp;"; $_t_Data)
												If ($_l_TextPosition>0)
													$_t_Data:=Substring:C12($_t_Data; 1; $_l_TextPosition-1)
												End if 
												If ($_at_KnownFieldNames{$_l_FieldsIndex}="Credit Card Number:")
													$_l_TextPosition:=Position:C15(";;"; $_t_Data)
													If ($_l_TextPosition>0)
														
														$_t_Data:=Substring:C12($_t_Data; 1; $_l_TextPosition-1)
													Else 
														$_l_TextPosition:=Position:C15("<td>"; $_t_Data)
														If ($_l_TextPosition>0)
															$_t_Data:=Substring:C12($_t_Data; 1; $_l_TextPosition-1)
														End if 
													End if 
												End if 
												$_t_Data:=Replace string:C233($_t_Data; "<br />"; Char:C90(13))
												$_t_FieldName:=$_at_KnownFieldNames{$_l_FieldsIndex}
												If ($_t_FieldName#"")
													$_l_CharacterPosition4:=Position:C15(":"; $_t_FieldName)
													If ($_l_CharacterPosition4>0)
														$_t_FieldName:=Substring:C12($_t_FieldName; 1; $_l_CharacterPosition4-1)
													End if 
													
													APPEND TO ARRAY:C911($_at_ZenFieldNames; $_t_FieldName)
													If ($_t_FieldName="E-Mail Address")
														$_l_TextPosition:=Position:C15(">"; $_t_Data)
														If ($_l_TextPosition>0)
															$_t_Data:=Substring:C12($_t_Data; $_l_TextPosition+1)
															$_l_TextPosition:=Position:C15("</a>"; $_t_Data)
															If ($_l_TextPosition>0)
																$_t_Data:=Substring:C12($_t_Data; 1; $_l_TextPosition-1)
																
															End if 
															
														End if 
													End if 
													
													APPEND TO ARRAY:C911($_at_ZenFieldData; $_t_Data)
													$_abo_FieldParsed{$_l_FieldsIndex}:=True:C214
													If ($_t_FieldName#"Credit Card Number")
														
														APPEND TO ARRAY:C911(DB_at_Legend; "Field Data Added"+$_t_Data)
													Else 
														APPEND TO ARRAY:C911(DB_at_Legend; "Field Data Added"+"XXXXXXXXXXXXXXXXXXXX")
													End if 
												End if 
											Else 
												APPEND TO ARRAY:C911(DB_at_Legend; "Expected header not found"+$_t_Header)
												
											End if 
										Else 
											APPEND TO ARRAY:C911(DB_at_Legend; "Invoice number field handling")
											
											$_t_FieldName:=$_at_KnownFieldNames{$_l_FieldsIndex}
											If ($_t_FieldName#"")
												$_l_CharacterPosition4:=Position:C15("."; $_t_FieldName)
												If ($_l_CharacterPosition4>0)
													$_t_FieldName:=Substring:C12($_t_FieldName; 1; $_l_CharacterPosition4-1)
												End if 
												
												APPEND TO ARRAY:C911($_at_ZenFieldNames; $_t_FieldName)
												APPEND TO ARRAY:C911($_at_ZenFieldData; DB_at_OrderIDs{1})
												$_abo_FieldParsed{$_l_FieldsIndex}:=True:C214
												APPEND TO ARRAY:C911(DB_at_Legend; "Field Data added"+DB_at_OrderIDs{1})
												
											End if 
										End if 
									Else 
										APPEND TO ARRAY:C911(DB_at_Legend; "text string NOT FOUND")
										
									End if 
								End if 
							End if 
						End for 
						APPEND TO ARRAY:C911(DB_at_Legend; "Web order Parsed")
						
						$_l_ZenFieldRow:=Find in array:C230($_at_ZenFieldNames; "Invoice No")
						If ($_l_ZenFieldRow>0)
							APPEND TO ARRAY:C911(DB_at_Legend; "Order(Invoice) Field Found at"+String:C10($_l_ZenFieldRow))
							
							DB_l_RetryOrder:=0
							$_t_OrderReference:=DB_at_OrderIDs{1}
							QUERY:C277([ORDERS:24]; [ORDERS:24]x_ExternalSourceRecordCode:60=$_t_OrderReference)
							If (Records in selection:C76([ORDERS:24])=0)
								
								
								APPEND TO ARRAY:C911(DB_at_Legend; "Order not already Found")
								
								//TRACE
								$_l_ZenFieldRow:=Find in array:C230($_at_ZenFieldNames; "Customer")
								$_t_AddressLine1:=""
								$_t_addressLine2:=""
								$_t_StateandZip:=""
								$_t_Zip:=""
								$_t_Country:=""
								$_t_CompanyName:=""
								$_t_Last4Digits:=""
								If ($_l_ZenFieldRow>0)
									APPEND TO ARRAY:C911(DB_at_Legend; "Customer field Found")
									
									$_l_ZenFIeldRow:=Find in array:C230($_at_ZenFieldNames; "Customer")
									$_t_addressBlock:=$_at_ZenFieldData{$_l_ZenFieldRow}
									//SEND PACKET(MDOC;$_t_addressBlock+Char(13))
									If (True:C214)
										//$_t_addressBlock:=Replace string($_t_addressBlock;",";Char(13))
										
										ARRAY TEXT:C222($_at_AddressLines; 0)
										ARRAY TEXT:C222($_at_AddressFields; 0)
										RR_ZenCartAddressDecode($_t_addressBlock; ->$_at_AddressFields; ->$_at_AddressLines)
										$_t_CompanyName:=""
										$_t_PersonName:=""
										$_t_AddressLine1:=""
										$_t_addressLine2:=""
										$_t_addressLine3:=""
										$_t_Town:=""
										$_t_State:=""
										$_t_Zip:=""
										$_t_Country:=""
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Company")
										If ($_l_ZenFieldRow>0)
											$_t_CompanyName:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										If (Position:C15("ZOLA"; $_t_CompanyName)>0)
											//TRACE
										End if 
										If ($_t_CompanyName="Existing Customer")
											$_l_ZenFieldRow:=Find in array:C230($_at_ZenFieldNames; "Billing Address")
											$_t_addressBlock:=$_at_ZenFieldData{$_l_ZenFieldRow}
											ARRAY TEXT:C222($_at_AddressLines; 0)
											ARRAY TEXT:C222($_at_AddressFields; 0)
											RR_ZenCartAddressDecode($_t_addressBlock; ->$_at_AddressFields; ->$_at_AddressLines)
											$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Company")
											If ($_l_ZenFieldRow>0)
												$_t_CompanyName:=$_at_AddressLines{$_l_ZenFIeldRow}
											End if 
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Name")
										
										If ($_l_ZenFieldRow>0)
											$_t_PersonName:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line1")
										If ($_l_ZenFieldRow>0)
											$_t_AddressLine1:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line2")
										If ($_l_ZenFieldRow>0)
											$_t_addressLine2:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line3")
										If ($_l_ZenFieldRow>0)
											$_t_addressLine3:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "City")
										If ($_l_ZenFieldRow>0)
											$_t_Town:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "State")
										If ($_l_ZenFieldRow>0)
											$_t_State:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Zip")
										If ($_l_ZenFieldRow>0)
											$_t_Zip:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Country")
										If ($_l_ZenFieldRow>0)
											$_t_Country:=$_at_AddressLines{$_l_ZenFIeldRow}
										End if 
										$_bo_ExitZip:=False:C215
										If ($_t_Zip#"")
											Repeat 
												If ($_t_Zip[[1]]=" ")
													$_t_Zip:=Substring:C12($_t_Zip; 2)
												End if 
												If (Length:C16($_t_Zip)>0)
													If ($_t_Zip[[1]]#"")
														$_bo_ExitZip:=True:C214
													End if 
												Else 
													$_bo_ExitZip:=True:C214
												End if 
											Until ($_bo_ExitZip)
											
										End if 
										//If ($_t_PersonName)
										$_t_PersonName:=Uppercase:C13($_t_PersonName)
										$_t_Salutation:=""
										$_t_FIrstName:=""
										$_t_LastName:=""
										If ($_t_PersonName#"")
											AA_LoadNameArrays
											AA_ParseName($_t_PersonName; 0; ->$_t_Salutation; ->$_t_FIrstName; ->$_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
										End if 
										If ($_t_LastName="")
											//TRACE
										End if 
										$_t_EmailAddress:=""
										$_t_EmailBefore:=""
										$_t_EmailAfter:=""
										$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "E-Mail Address")
										If ($_l_ZenFieldRow2>0)
											$_t_EmailAddress:=$_at_ZenFieldData{$_l_ZenFieldRow2}
											If ($_t_EmailAddress#"")
												$_l_AtPosition:=Position:C15(Char:C90(64); $_t_EmailAddress)
												If ($_l_AtPosition>0)
													$_t_EmailBefore:=Substring:C12($_t_EmailAddress; 1; $_l_AtPosition-1)
													$_t_EmailAfter:=Substring:C12($_t_EmailAddress; $_l_AtPosition+1)
												End if 
											End if 
										End if 
										If ($_t_LastName#"")
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_LastName+"@")
											If (Records in selection:C76([CONTACTS:1])>0)
												CREATE SET:C116([CONTACTS:1]; "$possible")
												If ($_t_EmailBefore#"") & ($_t_EmailAfter#"")
													QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_EmailBefore; *)
													QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24=$_t_EmailAfter)
													If (Records in selection:C76([CONTACTS:1])>0)
														CREATE SET:C116([CONTACTS:1]; "$possible")
													Else 
														USE SET:C118("$Possible")
													End if 
													
												End if 
												If (Records in selection:C76([CONTACTS:1])>=1)
													CREATE SET:C116([CONTACTS:1]; "$possible")
													SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes; [CONTACTS:1]Company_Code:1; $_at_ContactCompanies1)
													QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
													SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_ContactCompanies2)
													SORT ARRAY:C229($_at_ContactCompanies1; <)
													$_bo_Exit:=False:C215
													Repeat 
														If ($_at_ContactCompanies1{1}="")
															DELETE FROM ARRAY:C228($_at_ContactCompanies1; 1)
														Else 
															$_bo_Exit:=True:C214
														End if 
													Until ($_bo_Exit) | (Size of array:C274($_at_ContactCompanies1)=0)
													If (Size of array:C274($_at_ContactCompanies2)>0)
														SORT ARRAY:C229($_at_ContactCompanies2; <)
														$_bo_Exit:=False:C215
														Repeat 
															If ($_at_ContactCompanies2{1}="")
																DELETE FROM ARRAY:C228($_at_ContactCompanies2; 1)
															Else 
																$_bo_Exit:=True:C214
															End if 
														Until ($_bo_Exit) | (Size of array:C274($_at_ContactCompanies2)=0)
													End if 
													For ($_l_CompaniesIndex; 1; Size of array:C274($_at_ContactCompanies2))
														$_l_ZenFieldRow:=Find in array:C230($_at_ContactCompanies1; $_at_ContactCompanies2{$_l_CompaniesIndex})
														If ($_l_ZenFIeldRow<0)
															APPEND TO ARRAY:C911($_at_ContactCompanies1; $_at_ContactCompanies2{$_l_CompaniesIndex})
														End if 
													End for 
													QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_ContactCompanies1)
													CREATE SET:C116([COMPANIES:2]; "$possibleCos")
													If ($_t_Zip#"")
														If ($_t_CompanyName#"")
															QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName)
															If (Records in selection:C76([COMPANIES:2])=0)
																USE SET:C118("$possibleCos")
															Else 
																CREATE SET:C116([COMPANIES:2]; "$possibleCos")
															End if 
														End if 
														QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$_t_Zip)
														If (Records in selection:C76([COMPANIES:2])=0)
															USE SET:C118("$possibleCos")
															$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Telephone Number")
															If ($_l_ZenFieldRow2>0)
																$_t_Telephone:=$_at_ZenFieldData{$_l_ZenFieldRow2}
																If ($_t_Country="United States")
																	If (Length:C16($_t_Telephone)>=10)
																		$_t_Telephone:=Replace string:C233($_t_Telephone; " "; "")
																		$_t_Telephone:=Replace string:C233($_t_Telephone; "-"; "")
																		$_t_Telephone:="("+Substring:C12($_t_Telephone; 1; 3)+") "+Substring:C12($_t_Telephone; 4; 3)+"-"+Substring:C12($_t_Telephone; 7)
																		[COMPANIES:2]Telephone:9:=$_t_Telephone
																	End if 
																End if 
																
																QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_Telephone)
																If (Records in selection:C76([COMPANIES:2])=0)
																	CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																Else 
																	CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																End if 
															End if 
														Else 
															CREATE SET:C116([COMPANIES:2]; "$possibleCos")
														End if 
													Else 
														If ($_t_CompanyName#"")
															QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName)
															If (Records in selection:C76([COMPANIES:2])=0)
																CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																
																
															Else 
																CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Telephone Number")
																If ($_l_ZenFieldRow2>0)
																	$_t_Telephone:=$_at_ZenFieldData{$_l_ZenFieldRow2}
																	If ($_t_Country="United States")
																		If (Length:C16($_t_Telephone)>=10)
																			$_t_Telephone:=Replace string:C233($_t_Telephone; " "; "")
																			$_t_Telephone:=Replace string:C233($_t_Telephone; "-"; "")
																			$_t_Telephone:="("+Substring:C12($_t_Telephone; 1; 3)+") "+Substring:C12($_t_Telephone; 4; 3)+"-"+Substring:C12($_t_Telephone; 7)
																			//[COMPANIES]Telephone:=$_t_Telephone
																		End if 
																	End if 
																	QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_Telephone)
																	If (Records in selection:C76([COMPANIES:2])=0)
																		USE SET:C118("$possibleCos")
																	Else 
																		CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																	End if 
																End if 
															End if 
														End if 
														
													End if 
													SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
													QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)
													SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
													QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
													CREATE SET:C116([CONTACTS:1]; "$PosFromCompanies")
													QUERY WITH ARRAY:C644([CONTACTS:1]Company_Code:1; $_at_CompanyCodes)
													CREATE SET:C116([CONTACTS:1]; "$PosFromCompanies2")
													UNION:C120("$PosFromCompanies2"; "$PosFromCompanies"; "$PosFromCompanies")
													INTERSECTION:C121("$PosFromCompanies"; "$possible"; "$possible")
													USE SET:C118("$possible")
													If (Records in selection:C76([CONTACTS:1])#1)
														REDUCE SELECTION:C351([CONTACTS:1]; 0)
													End if 
													$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
													$_t_CompanyCode:=[CONTACTS:1]Company_Code:1
												Else 
													$_t_ContactCode:=""
													$_t_CompanyCode:=""
												End if 
											Else 
												$_t_ContactCode:=""
												$_t_CompanyCode:=""
												
											End if 
											$_bo_NoSave:=True:C214
											If ($_t_ContactCode#"")
												
											Else 
												If (True:C214)
													
													$_t_CompanyName:=Uppercase:C13($_t_CompanyName)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName)
													$_bo_NoCreate:=False:C215
													If (Records in selection:C76([COMPANIES:2])>0)
														CREATE SET:C116([COMPANIES:2]; "$possibleCos")
														$_bo_NoCreate:=False:C215
														If (Records in selection:C76([COMPANIES:2])>1)
															If ($_t_Zip#"")
																QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$_t_Zip)
																If (Records in selection:C76([COMPANIES:2])=0)
																	USE SET:C118("$possibleCos")
																	$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Telephone Number")
																	If ($_l_ZenFieldRow2>0)
																		$_t_Telephone:=$_at_ZenFieldData{$_l_ZenFieldRow2}
																		If ($_t_Country="United States")
																			If (Length:C16($_t_Telephone)>=10)
																				$_t_Telephone:=Replace string:C233($_t_Telephone; " "; "")
																				$_t_Telephone:=Replace string:C233($_t_Telephone; "-"; "")
																				$_t_Telephone:="("+Substring:C12($_t_Telephone; 1; 3)+") "+Substring:C12($_t_Telephone; 4; 3)+"-"+Substring:C12($_t_Telephone; 7)
																			End if 
																		End if 
																		QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_Telephone)
																		If (Records in selection:C76([COMPANIES:2])=0)
																			
																		Else 
																			CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																		End if 
																	End if 
																Else 
																	CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																End if 
															Else 
																$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Telephone Number")
																If ($_l_ZenFieldRow2>0)
																	$_t_Telephone:=$_at_ZenFieldData{$_l_ZenFieldRow2}
																	If ($_t_Country="United States")
																		If (Length:C16($_t_Telephone)>=10)
																			$_t_Telephone:=Replace string:C233($_t_Telephone; " "; "")
																			$_t_Telephone:=Replace string:C233($_t_Telephone; "-"; "")
																			$_t_Telephone:="("+Substring:C12($_t_Telephone; 1; 3)+") "+Substring:C12($_t_Telephone; 4; 3)+"-"+Substring:C12($_t_Telephone; 7)
																			//[COMPANIES]Telephone:=$_t_Telephone
																		End if 
																	End if 
																	QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_Telephone)
																	If (Records in selection:C76([COMPANIES:2])=0)
																		
																	Else 
																		CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																	End if 
																End if 
															End if 
														Else 
															CREATE SET:C116([COMPANIES:2]; "$possibleCos")
															If ($_t_Zip#"")
																QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$_t_Zip)
																If (Records in selection:C76([COMPANIES:2])=0)
																	USE SET:C118("$possibleCos")
																	$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Telephone Number")
																	If ($_l_ZenFieldRow2>0)
																		$_t_Telephone:=$_at_ZenFieldData{$_l_ZenFieldRow2}
																		If ($_t_Country="United States")
																			If (Length:C16($_t_Telephone)>=10)
																				$_t_Telephone:=Replace string:C233($_t_Telephone; " "; "")
																				$_t_Telephone:=Replace string:C233($_t_Telephone; "-"; "")
																				$_t_Telephone:="("+Substring:C12($_t_Telephone; 1; 3)+") "+Substring:C12($_t_Telephone; 4; 3)+"-"+Substring:C12($_t_Telephone; 7)
																			End if 
																		End if 
																		QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_Telephone)
																		If (Records in selection:C76([COMPANIES:2])=0)
																			
																		Else 
																			CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																		End if 
																	End if 
																Else 
																	CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																End if 
															Else 
																If ($_t_CompanyName#"")
																	$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Telephone Number")
																	If ($_l_ZenFieldRow2>0)
																		$_t_Telephone:=$_at_ZenFieldData{$_l_ZenFieldRow2}
																		If ($_t_Country="United States")
																			If (Length:C16($_t_Telephone)>=10)
																				$_t_Telephone:=Replace string:C233($_t_Telephone; " "; "")
																				$_t_Telephone:=Replace string:C233($_t_Telephone; "-"; "")
																				$_t_Telephone:="("+Substring:C12($_t_Telephone; 1; 3)+") "+Substring:C12($_t_Telephone; 4; 3)+"-"+Substring:C12($_t_Telephone; 7)
																				
																			End if 
																		End if 
																		QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_Telephone)
																		If (Records in selection:C76([COMPANIES:2])=0)
																			USE SET:C118("$possibleCos")
																		Else 
																			CREATE SET:C116([COMPANIES:2]; "$possibleCos")
																		End if 
																	End if 
																	
																End if 
																
															End if 
															
														End if 
														If (Records in selection:C76([COMPANIES:2])=1)
															$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
															
															CREATE RECORD:C68([CONTACTS:1])
															Contact_Code
															
															If (<>MultiCo)
																CREATE RECORD:C68([CONTACTS_COMPANIES:145])
																[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
																[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
																[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
																
																[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
																DB_SaveRecord(->[CONTACTS_COMPANIES:145])
																[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
															Else 
																[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
															End if 
															//$_t_Salutation:=""
															//$_t_FIrstName:=""
															//$_t_LastName:=""
															If ($_t_PersonName#"")
																AA_LoadNameArrays
																AA_ParseName($_t_PersonName; 0; ->$_t_Salutation; ->$_t_FIrstName; ->$_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
															End if 
															[CONTACTS:1]Title:3:=Uppercase:C13($_t_Salutation)
															[CONTACTS:1]Forename:4:=Uppercase:C13($_t_FIrstName)
															[CONTACTS:1]Surname:5:=Uppercase:C13($_t_LastName)
															[CONTACTS:1]Contact_Name:31:=Uppercase:C13(CON_BuildContactName)
															
															[CONTACTS:1]Role:11:=<>DefRole
															If (([CONTACTS:1]Forename:4#"") & (<>SYS_bo_DefaultSalutation))
																If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
																	[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
																End if 
															End if 
															[CONTACTS:1]EMail_After_At:24:=$_t_EmailAfter
															[CONTACTS:1]Email_Before_At:30:=$_t_EmailBefore
															[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
															[CONTACTS:1]Entry_Date:17:=[COMPANIES:2]Entry_Date:16
															DB_SaveRecord(->[CONTACTS:1])
															$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
															AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
															$_bo_NoCreate:=True:C214
														Else 
															REDUCE SELECTION:C351([COMPANIES:2]; 0)
															$_bo_NoCreate:=False:C215
														End if 
													End if 
													
													If ($_bo_NoCreate=False:C215)
														//TRACE
														//looks like the company exists
														
														
														//Company_No
														//if($_bo_NoCreate=false)
														$_l_CompanyCodeSuffix:=0
														$_t_NewCompanyCode:=[COMPANIES:2]Company_Code:1
														If ($_t_CompanyName#"")
															
															Case of 
																: (Substring:C12([COMPANIES:2]Company_Name:2; 1; 4)="The ")
																	//[COMPANIES]Company Code:=Substring([COMPANIES]Company Name;5;11)
																	$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 5; 11)
																: (Substring:C12([COMPANIES:2]Company_Name:2; 1; 2)="A ")
																	// [COMPANIES]Company Code:=Substring([COMPANIES]Company Name;3;11)
																	$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 3; 11)
																Else 
																	// [COMPANIES]Company Code:=Substring([COMPANIES]Company Name;1;11)
																	$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 1; 11)
															End case 
															
															//Edit 4/6/08 TQW to remove * in Company Code.
															$_t_NewCompanyCode:=Replace string:C233($_t_NewCompanyCode; "*"; "")
															
															//Remove the last character if blank
															Repeat 
																$_l_NewCompanyCodeLength:=Length:C16($_t_NewCompanyCode)
																$_t_LastCodeCodeSTR:=Substring:C12($_t_NewCompanyCode; $_l_NewCompanyCodeLength; 1)
																If ($_t_LastCodeCodeSTR=" ")
																	$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; $_l_NewCompanyCodeLength-1)
																End if 
															Until ($_t_LastCodeCodeSTR#" ")
															
															//Find if this already exists
															$_l_CompanyCodeSuffix:=1
															SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesMatching)
															
															Repeat 
																QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
																If ($_l_CompaniesMatching>0)
																	$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; Length:C16($_t_NewCompanyCode)-2)+"-"+String:C10($_l_CompanyCodeSuffix)
																	
																Else 
																	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=1; *)
																	QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
																	//Query Selection([COMPANIES];[COMPANIES]Company Code=mNewCompCode)
																	If ($_l_CompaniesMatching>0)
																		$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; Length:C16($_t_NewCompanyCode)-2)+"-"+String:C10($_l_CompanyCodeSuffix)
																		
																	End if 
																End if 
																
																$_l_CompanyCodeSuffix:=$_l_CompanyCodeSuffix+1
															Until (($_l_CompaniesMatching=0) | ($_l_CompanyCodeSuffix=9))
															SET QUERY DESTINATION:C396(Into current selection:K19:1)
															
														End if 
													End if 
												End if 
												If ($_bo_NoCreate=False:C215)
													CREATE RECORD:C68([COMPANIES:2])
													If (Is compiled mode:C492)
														Macro("Load 2")
													End if 
													[COMPANIES:2]Company_Name:2:=Uppercase:C13($_t_CompanyName)
													
													Company_No
													$_l_CompanyCodeSuffix:=0
													$_t_NewCompanyCode:=[COMPANIES:2]Company_Code:1
													If ($_t_CompanyName#"")
														
														Case of 
															: (Substring:C12([COMPANIES:2]Company_Name:2; 1; 4)="The ")
																//[COMPANIES]Company Code:=Substring([COMPANIES]Company Name;5;11)
																$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 5; 11)
															: (Substring:C12([COMPANIES:2]Company_Name:2; 1; 2)="A ")
																// [COMPANIES]Company Code:=Substring([COMPANIES]Company Name;3;11)
																$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 3; 11)
															Else 
																// [COMPANIES]Company Code:=Substring([COMPANIES]Company Name;1;11)
																$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 1; 11)
														End case 
														
														//Edit 4/6/08 TQW to remove * in Company Code.
														$_t_NewCompanyCode:=Replace string:C233($_t_NewCompanyCode; "*"; "")
														
														//Remove the last character if blank
														Repeat 
															$_l_NewCompanyCodeLength:=Length:C16($_t_NewCompanyCode)
															$_t_LastCodeCodeSTR:=Substring:C12($_t_NewCompanyCode; $_l_NewCompanyCodeLength; 1)
															If ($_t_LastCodeCodeSTR=" ")
																$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; $_l_NewCompanyCodeLength-1)
															End if 
														Until ($_t_LastCodeCodeSTR#" ")
														
														//Find if this already exists
														$_l_CompanyCodeSuffix:=1
														SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesMatching)
														
														Repeat 
															QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
															If ($_l_CompaniesMatching>0)
																$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; Length:C16($_t_NewCompanyCode)-2)+"-"+String:C10($_l_CompanyCodeSuffix)
																
															Else 
																QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=1; *)
																QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
																//Query Selection([COMPANIES];[COMPANIES]Company Code=mNewCompCode)
																If ($_l_CompaniesMatching>0)
																	$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; Length:C16($_t_NewCompanyCode)-2)+"-"+String:C10($_l_CompanyCodeSuffix)
																	
																End if 
															End if 
															
															$_l_CompanyCodeSuffix:=$_l_CompanyCodeSuffix+1
														Until (($_l_CompaniesMatching=0) | ($_l_CompanyCodeSuffix=9))
														SET QUERY DESTINATION:C396(Into current selection:K19:1)
														
													End if 
													
													If ($_l_CompanyCodeSuffix>=9)
														Company_No
													Else 
														[COMPANIES:2]Company_Code:1:=Uppercase:C13($_t_NewCompanyCode)
													End if 
													If ([COMPANIES:2]Company_Name:2#"")
														Gen_Alert("New Company ("+[COMPANIES:2]Company_Name:2+") Received For Website Order. Please confirm the company Code")
													Else 
														
														Gen_Alert("New Contact address (No Company Name) For Contact "+$_t_PersonName+"Please confirm the company(address) Code")
														Gen_Confirm("Do you want to also add a company name for "+$_t_PersonName; "Yes"; "No")
														If (OK=1)
															$_t_CompanyName:=Gen_Request("Enter company name for "+$_t_PersonName; "")
															[COMPANIES:2]Company_Name:2:=Uppercase:C13($_t_CompanyName)
															If ($_t_CompanyName#"")
																
																Case of 
																	: (Substring:C12([COMPANIES:2]Company_Name:2; 1; 4)="The ")
																		//[COMPANIES]Company Code:=Substring([COMPANIES]Company Name;5;11)
																		$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 5; 11)
																	: (Substring:C12([COMPANIES:2]Company_Name:2; 1; 2)="A ")
																		// [COMPANIES]Company Code:=Substring([COMPANIES]Company Name;3;11)
																		$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 3; 11)
																	Else 
																		// [COMPANIES]Company Code:=Substring([COMPANIES]Company Name;1;11)
																		$_t_NewCompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 1; 11)
																End case 
																
																//Edit 4/6/08 TQW to remove * in Company Code.
																$_t_NewCompanyCode:=Replace string:C233($_t_NewCompanyCode; "*"; "")
																
																//Remove the last character if blank
																Repeat 
																	$_l_NewCompanyCodeLength:=Length:C16($_t_NewCompanyCode)
																	$_t_LastCodeCodeSTR:=Substring:C12($_t_NewCompanyCode; $_l_NewCompanyCodeLength; 1)
																	If ($_t_LastCodeCodeSTR=" ")
																		$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; $_l_NewCompanyCodeLength-1)
																	End if 
																Until ($_t_LastCodeCodeSTR#" ")
																
																//Find if this already exists
																$_l_CompanyCodeSuffix:=1
																SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesMatching)
																
																Repeat 
																	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
																	If ($_l_CompaniesMatching>0)
																		$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; Length:C16($_t_NewCompanyCode)-2)+"-"+String:C10($_l_CompanyCodeSuffix)
																		
																	Else 
																		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=1; *)
																		QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
																		//Query Selection([COMPANIES];[COMPANIES]Company Code=mNewCompCode)
																		If ($_l_CompaniesMatching>0)
																			$_t_NewCompanyCode:=Substring:C12($_t_NewCompanyCode; 1; Length:C16($_t_NewCompanyCode)-2)+"-"+String:C10($_l_CompanyCodeSuffix)
																			
																		End if 
																	End if 
																	
																	$_l_CompanyCodeSuffix:=$_l_CompanyCodeSuffix+1
																Until (($_l_CompaniesMatching=0) | ($_l_CompanyCodeSuffix=9))
																SET QUERY DESTINATION:C396(Into current selection:K19:1)
																
															End if 
															
															If ($_l_CompanyCodeSuffix>=9)
																Company_No
															Else 
																[COMPANIES:2]Company_Code:1:=Uppercase:C13($_t_NewCompanyCode)
															End if 
														End if 
														OK:=1
													End if 
													$_bo_NoSave:=False:C215
													$_t_NewCompanyCode:=Gen_Request("Company Code for "+$_t_CompanyName; [COMPANIES:2]Company_Code:1)
													If ($_t_NewCompanyCode#"")
														[COMPANIES:2]Company_Code:1:=$_t_NewCompanyCode
														SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesMatching)
														
														QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
														If ($_l_CompaniesMatching>0)
															$_bo_NoSave:=True:C214
														End if 
														SET QUERY DESTINATION:C396(Into current selection:K19:1)
														
													End if 
													//TRACE
													If ($_bo_NoSave)
														QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
														$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
														QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_t_NewCompanyCode; *)
														QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_LastName; *)
														If ($_t_FIrstName#"")
															QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_FIrstName[[1]]+"@")
														Else 
															QUERY:C277([CONTACTS:1])
														End if 
														If (Records in selection:C76([CONTACTS:1])=0)
															CREATE RECORD:C68([CONTACTS:1])
															Contact_Code
															
															If (<>MultiCo)
																CREATE RECORD:C68([CONTACTS_COMPANIES:145])
																[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
																[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
																[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
																
																[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
																DB_SaveRecord(->[CONTACTS_COMPANIES:145])
																[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
															Else 
																[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
															End if 
															//$_t_Salutation:=""
															//$_t_FIrstName:=""
															//$_t_LastName:=""
															If ($_t_PersonName#"")
																AA_LoadNameArrays
																AA_ParseName($_t_PersonName; 0; ->$_t_Salutation; ->$_t_FIrstName; ->$_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
															End if 
															[CONTACTS:1]Title:3:=Uppercase:C13($_t_Salutation)
															[CONTACTS:1]Forename:4:=Uppercase:C13($_t_FIrstName)
															[CONTACTS:1]Surname:5:=Uppercase:C13($_t_LastName)
															[CONTACTS:1]Contact_Name:31:=Uppercase:C13(CON_BuildContactName)
															
															[CONTACTS:1]Role:11:=<>DefRole
															If (([CONTACTS:1]Forename:4#"") & (<>SYS_bo_DefaultSalutation))
																If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
																	[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
																End if 
															End if 
															[CONTACTS:1]EMail_After_At:24:=$_t_EmailAfter
															[CONTACTS:1]Email_Before_At:30:=$_t_EmailBefore
															[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
															[CONTACTS:1]Entry_Date:17:=[COMPANIES:2]Entry_Date:16
															DB_SaveRecord(->[CONTACTS:1])
															$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
															AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
															
														Else 
															Gen_Confirm("is the contact "+$_t_PersonName+" from this order the same as "+[CONTACTS:1]Contact_Name:31; "Yes"; "No")
															If (OK=0)
																CREATE RECORD:C68([CONTACTS:1])
																Contact_Code
																
																If (<>MultiCo)
																	CREATE RECORD:C68([CONTACTS_COMPANIES:145])
																	[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
																	[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
																	[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
																	
																	[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
																	DB_SaveRecord(->[CONTACTS_COMPANIES:145])
																	[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
																Else 
																	[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
																End if 
																//$_t_Salutation:=""
																//$_t_FIrstName:=""
																//$_t_LastName:=""
																If ($_t_PersonName#"")
																	AA_LoadNameArrays
																	AA_ParseName($_t_PersonName; 0; ->$_t_Salutation; ->$_t_FIrstName; ->$_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
																End if 
																[CONTACTS:1]Title:3:=Uppercase:C13($_t_Salutation)
																[CONTACTS:1]Forename:4:=Uppercase:C13($_t_FIrstName)
																[CONTACTS:1]Surname:5:=Uppercase:C13($_t_LastName)
																[CONTACTS:1]Contact_Name:31:=Uppercase:C13(CON_BuildContactName)
																
																[CONTACTS:1]Role:11:=<>DefRole
																If (([CONTACTS:1]Forename:4#"") & (<>SYS_bo_DefaultSalutation))
																	If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
																		[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
																	End if 
																End if 
																[CONTACTS:1]EMail_After_At:24:=$_t_EmailAfter
																[CONTACTS:1]Email_Before_At:30:=$_t_EmailBefore
																[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
																[CONTACTS:1]Entry_Date:17:=[COMPANIES:2]Entry_Date:16
																DB_SaveRecord(->[CONTACTS:1])
																$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
																AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
															Else 
																$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
															End if 
															OK:=1
														End if 
														QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_NewCompanyCode)
														$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
													Else 
														[COMPANIES:2]Company_Code:1:=Uppercase:C13([COMPANIES:2]Company_Code:1)
														
														
														
														//````
														Companies_InBDe
														[COMPANIES:2]x_ID:63:=AA_GetNextIDinMethod(->[COMPANIES:2]x_ID:63)
														[COMPANIES:2]Address_Line_one:3:=Uppercase:C13($_t_AddressLine1)
														[COMPANIES:2]Town_or_City:5:=Uppercase:C13($_t_Town)
														[COMPANIES:2]County_or_State:6:=Uppercase:C13($_t_State)
														If ($_t_Country="U.S") | ($_t_Country="U.S.A.") | ($_t_Country="United States")
															
															If (Length:C16([COMPANIES:2]County_or_State:6)>2)
																$_t_StateCode:=Get_USAstateCodes([COMPANIES:2]County_or_State:6)
																If ($_t_StateCode#"")
																	[COMPANIES:2]County_or_State:6:=$_t_StateCode
																End if 
															End if 
															[COMPANIES:2]Country:8:=""
														Else 
															[COMPANIES:2]Country:8:=Uppercase:C13($_t_Country)
														End if 
														[COMPANIES:2]Postal_Code:7:=Uppercase:C13($_t_Zip)
														If (Is compiled mode:C492)
															mCompExport:="ITSNOTNEW"
															Macro("Modified 2/7")
														End if 
														$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Telephone Number")
														If ($_l_ZenFieldRow2>0)
															[COMPANIES:2]Telephone:9:=$_at_ZenFieldData{$_l_ZenFieldRow2}
															If ([COMPANIES:2]Country:8="") | ([COMPANIES:2]Country:8="U.S.A") | ([COMPANIES:2]Country:8="U.S") | ([COMPANIES:2]Country:8="United States")
																If (Length:C16([COMPANIES:2]Telephone:9)>=10)
																	$_t_Telephone:=Replace string:C233([COMPANIES:2]Telephone:9; " "; "")
																	$_t_Telephone:=Replace string:C233($_t_Telephone; "-"; "")
																	$_t_Telephone:="("+Substring:C12($_t_Telephone; 1; 3)+") "+Substring:C12($_t_Telephone; 4; 3)+"-"+Substring:C12($_t_Telephone; 7)
																	[COMPANIES:2]Telephone:9:=$_t_Telephone
																End if 
																
															End if 
															[COMPANIES:2]Default_Currency:59:=<>SYS_t_BaseCurrency
															[COMPANIES:2]Source:14:="NET"
															[COMPANIES:2]SL_Terms:40:="Credit Card"
															[COMPANIES:2]SO_Price_Group:44:="WSALE"
															[COMPANIES:2]Default_TAX:41:="S"
															DB_SaveRecord(->[COMPANIES:2])
															
															$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
															
															CREATE RECORD:C68([CONTACTS:1])
															Contact_Code
															
															If (<>MultiCo)
																CREATE RECORD:C68([CONTACTS_COMPANIES:145])
																[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
																[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
																[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
																
																[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
																DB_SaveRecord(->[CONTACTS_COMPANIES:145])
																[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
															Else 
																[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
															End if 
															//$_t_Salutation:=""
															//$_t_FIrstName:=""
															//$_t_LastName:=""
															If ($_t_PersonName#"")
																AA_LoadNameArrays
																AA_ParseName($_t_PersonName; 0; ->$_t_Salutation; ->$_t_FIrstName; ->$_t_LastName; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
															End if 
															[CONTACTS:1]Title:3:=Uppercase:C13($_t_Salutation)
															[CONTACTS:1]Forename:4:=Uppercase:C13($_t_FIrstName)
															[CONTACTS:1]Surname:5:=Uppercase:C13($_t_LastName)
															[CONTACTS:1]Contact_Name:31:=Uppercase:C13(CON_BuildContactName)
															
															[CONTACTS:1]Role:11:=<>DefRole
															If (([CONTACTS:1]Forename:4#"") & (<>SYS_bo_DefaultSalutation))
																If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
																	[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
																End if 
															End if 
															[CONTACTS:1]EMail_After_At:24:=$_t_EmailAfter
															[CONTACTS:1]Email_Before_At:30:=$_t_EmailBefore
															[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
															[CONTACTS:1]Entry_Date:17:=[COMPANIES:2]Entry_Date:16
															DB_SaveRecord(->[CONTACTS:1])
															$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
															AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
															
														End if 
													End if 
												End if 
											End if 
											If ([CONTACTS:1]Contact_Code:2#$_t_ContactCode)
												QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
											End if 
											$_t_CardNumber:=""
											$_t_Last4Digits:=""
											$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Credit Card Number")
											$_bo_CardisMasked:=False:C215
											If ($_l_ZenFieldRow2>0)
												$_t_CardNumber:=$_at_ZenFieldData{$_l_ZenFieldRow2}
												$_l_CharacterPositionEnc:=Position:C15("********"; $_t_CardNumber)
												If ($_l_CharacterPositionEnc>0)
													$_bo_CardisMasked:=True:C214
												End if 
												$_t_Last4Digits:=Substring:C12($_t_CardNumber; Length:C16($_t_CardNumber)-3)
												
											End if 
											$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Credit Card Expires")
											If ($_l_ZenFieldRow2>0)
												$_t_CardExpires:=$_at_ZenFieldData{$_l_ZenFieldRow2}
											End if 
											$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Credit Card Owner")
											If ($_l_ZenFieldRow2>0)
												$_t_CardOwner:=$_at_ZenFieldData{$_l_ZenFieldRow2}
											End if 
											$_l_ZenFieldRow2:=Find in array:C230($_at_ZenFieldNames; "Credit Card Type")
											If ($_l_ZenFieldRow2>0)
												$_t_CardType:=$_at_ZenFieldData{$_l_ZenFieldRow2}
											End if 
											If ($_t_CardNumber#"")
												ARRAY TEXT:C222(CCM_at_CardTypes; 0)
												ARRAY LONGINT:C221(CCM_al_CardTypes; 0)
												$_l_ListID:=AA_LoadList(->[xCreditCardDetails:132]Card_TypeNUM:4; ->CCM_at_CARDTYPES; ->CCM_al_CardTypes; False:C215)
												If (Size of array:C274(CCM_al_CardTypes)=0)
													$_l_AddedItemID:=AA_ListAddItem(->[xCreditCardDetails:132]Card_TypeNUM:4; "Visa"; "Amex"; "Mastercard")
												End if 
												
												ARRAY TEXT:C222(CCM_at_CardOwnersRange; 0)
												ARRAY LONGINT:C221(CCM_al_CardOwnerIDRange; 0)
												ARRAY LONGINT:C221(CCM_al_CardRecordIDs; 0)
												ARRAY TEXT:C222(CCM_at_CardExpiries; 0)
												ARRAY TEXT:C222(CCM_at_CardTypes; 0)
												ARRAY TEXT:C222(CCM_at_CardIssuers; 0)
												ARRAY TEXT:C222(CCM_at_CardNumbers; 0)
												ARRAY TEXT:C222(CCM_at_CardOwnerName; 0)
												ARRAY DATE:C224(CCM_ad_CardExpiries; 0)
												ARRAY TEXT:C222(CCM_at_AVSFailCodes; 0)
												CCM_T_Warning:=""
												CCM_LoadRelatedCards(1; [CONTACTS:1]x_ID:33; ->[xCreditCardDetails:132]Card_TypeName:5; ->CCM_at_CardTypes; ->[xCreditCardDetails:132]Card_Issuer:6; ->CCM_at_CardIssuers; ->[xCreditCardDetails:132]CardNumber:9; ->CCM_at_CardNumbers; ->[xCreditCardDetails:132]EndDate:8; ->CCM_at_CardExpiries; ->[xCreditCardDetails:132]x_ID:1; ->CCM_al_CardRecordIDs; ->[xCreditCardDetails:132]NameonCard:11; ->CCM_at_CardOwnerName; ->[xCreditCardDetails:132]xAVSStatus:19; ->CCM_at_AVSFailCodes)
												ARRAY TEXT:C222(CCM_at_DecodedCardNumber; 0)
												ARRAY TEXT:C222(CCM_at_DecodedCardNumber; Size of array:C274(CCM_at_CardTypes))
												For ($_l_MonthIndex; 1; Size of array:C274(CCM_al_CardRecordIDs))
													QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=CCM_al_CardRecordIDs{$_l_MonthIndex})
													CCM_DecryptCardNumber
													If (Position:C15(" "; CC_T_CCX99999999999)=0)
														If (Length:C16(CC_T_CCX99999999999)=15)
															$_t_First3:=Substring:C12(CC_T_CCX99999999999; 1; 3)
															$_t_Second4:=Substring:C12(CC_T_CCX99999999999; 4; 4)
															$_t_Third4:=Substring:C12(CC_T_CCX99999999999; 8; 4)
															$_t_Forth4:=Substring:C12(CC_T_CCX99999999999; 12)
															CC_T_CCX99999999999:=$_t_First3+" "+$_t_Second4+" "+$_t_Third4+" "+$_t_Forth4
														Else 
															$_t_FIrst4:=Substring:C12(CC_T_CCX99999999999; 1; 4)
															$_t_Second4:=Substring:C12(CC_T_CCX99999999999; 5; 4)
															$_t_Third4:=Substring:C12(CC_T_CCX99999999999; 9; 4)
															$_t_Forth4:=Substring:C12(CC_T_CCX99999999999; 13)
															CC_T_CCX99999999999:=$_t_FIrst4+" "+$_t_Second4+" "+$_t_Third4+" "+$_t_Forth4
														End if 
													End if 
													CCM_at_DecodedCardNumber{$_l_MonthIndex}:=CC_T_CCX99999999999
												End for 
												ARRAY TEXT:C222(CCM_at_CardClasses; 2)
												ARRAY LONGINT:C221(CCM_al_CardClasses; 2)
												CCM_at_CardClasses{1}:="Debit Card"
												CCM_at_CardClasses{2}:="Credit Card"
												CCM_al_CardClasses{1}:=1
												CCM_al_CardClasses{2}:=2
												If (Position:C15(" "; $_t_CardNumber)=0)
													If (Length:C16($_t_CardNumber)=15)
														$_t_First3:=Substring:C12($_t_CardNumber; 1; 3)
														$_t_Second4:=Substring:C12($_t_CardNumber; 4; 4)
														$_t_Third4:=Substring:C12($_t_CardNumber; 8; 4)
														$_t_Forth4:=Substring:C12($_t_CardNumber; 12)
														$_t_CardNumber:=$_t_First3+" "+$_t_Second4+" "+$_t_Third4+" "+$_t_Forth4
													Else 
														$_t_FIrst4:=Substring:C12($_t_CardNumber; 1; 4)
														$_t_Second4:=Substring:C12($_t_CardNumber; 5; 4)
														$_t_Third4:=Substring:C12($_t_CardNumber; 9; 4)
														$_t_Forth4:=Substring:C12($_t_CardNumber; 13)
														$_t_CardNumber:=$_t_FIrst4+" "+$_t_Second4+" "+$_t_Third4+" "+$_t_Forth4
													End if 
												End if 
												If ($_bo_CardisMasked)
													$_t_FIrst4:=Substring:C12($_t_CardNumber; 1; 4)
													$_t_Second4:=Substring:C12($_t_CardNumber; 5; 4)
													$_t_Third4:=Substring:C12($_t_CardNumber; 9; 4)
													$_t_Forth4:=Substring:C12($_t_CardNumber; 13)
													$_l_ZenFieldRow:=-1
													For ($_l_MonthIndex; Size of array:C274(CCM_at_DecodedCardNumber); 1; -1)
														$_t_First4A:=Substring:C12(CCM_at_DecodedCardNumber{$_l_MonthIndex}; 1; 4)
														$_t_Second4A:=Substring:C12(CCM_at_DecodedCardNumber{$_l_MonthIndex}; 5; 4)
														$_t_Third4A:=Substring:C12(CCM_at_DecodedCardNumber{$_l_MonthIndex}; 9; 4)
														$_t_Forth4A:=Substring:C12(CCM_at_DecodedCardNumber{$_l_MonthIndex}; 13)
														If ($_t_First4A=$_t_FIrst4) & ($_t_Forth4=$_t_Forth4A)
															$_t_CardNumber:=CCM_at_DecodedCardNumber{$_l_MonthIndex}
															$_l_ZenFieldRow:=$_l_MonthIndex
															$_l_MonthIndex:=1
														End if 
													End for 
													
												Else 
													$_l_ZenFieldRow:=Find in array:C230(CCM_at_DecodedCardNumber; $_t_CardNumber)
												End if 
												If ($_l_ZenFieldRow<0)
													If ($_bo_CardisMasked)
														$_t_CardNumber:=Gen_Request("Please Enter the Card number"; $_t_CardNumber)
													End if 
													CREATE RECORD:C68([xCreditCardDetails:132])
													[xCreditCardDetails:132]AddedBy:15:=<>PER_l_CurrentUserID
													If (Length:C16($_t_CardNumber)>0)
														$_l_CardNumberChar1:=Num:C11($_t_CardNumber[[1]])
														Case of 
															: ($_l_CardNumberChar1=3)  //Amex
																
																$_l_ZenFieldRow:=Find in array:C230(CCM_at_CARDTYPES; "AMEX")
																If ($_l_ZenFieldRow>0)
																	[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_ZenFieldRow}
																	[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_ZenFieldRow}
																End if 
															: ($_l_CardNumberChar1=4)  // Visa
																
																$_l_ZenFieldRow:=Find in array:C230(CCM_at_CARDTYPES; "Visa")
																If ($_l_ZenFieldRow>0)
																	[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_ZenFieldRow}
																	[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_ZenFieldRow}
																End if 
															: ($_l_CardNumberChar1=5)  //MasterCard
																
																$_l_ZenFieldRow:=Find in array:C230(CCM_at_CARDTYPES; "MasterCard")
																If ($_l_ZenFieldRow>0)
																	[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_ZenFieldRow}
																	[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_ZenFieldRow}
																End if 
														End case 
													End if 
													CCM_EncryptCardNumber($_t_CardNumber)
													[xCreditCardDetails:132]x_ID:1:=AA_GetNextID(->[xCreditCardDetails:132]x_ID:1)
													[xCreditCardDetails:132]RelatedTableNumber:12:=Table:C252(->[CONTACTS:1])
													
													[xCreditCardDetails:132]CardHolderClass:2:=1
													[xCreditCardDetails:132]RelatedRecordIdent:13:=[CONTACTS:1]x_ID:33
													
													CCM_EncryptCardName($_t_CardOwner)
													$_t_Month:=Substring:C12($_t_CardExpires; 1; 2)
													$_t_Year:=Substring:C12($_t_CardExpires; 3; 2)
													[xCreditCardDetails:132]EndDate:8:=Date:C102("01/01/"+$_t_Year)
													$_d_EndDate:=[xCreditCardDetails:132]EndDate:8
													For ($_l_MonthIndex; 1; 365; 27)
														If ((Month of:C24($_d_EndDate))<Num:C11($_t_Month))
															$_d_EndDate:=[xCreditCardDetails:132]EndDate:8+$_l_MonthIndex
														Else 
															$_l_MonthIndex:=366
														End if 
													End for 
													$_d_EndDate1:=$_d_EndDate
													Repeat 
														$_d_EndDate:=$_d_EndDate+1
													Until (Month of:C24($_d_EndDate)#Month of:C24($_d_EndDate1))
													[xCreditCardDetails:132]EndDate:8:=$_d_EndDate-1
													
													DB_SaveRecord(->[xCreditCardDetails:132])
													//Gen_Alert ("CREDIT CARD Details added")
													
													$_l_ZenFieldRow:=Find in array:C230($_at_ZenFieldNames; "Billing Address")
													$_t_addressBlock:=$_at_ZenFieldData{$_l_ZenFieldRow}
													ARRAY TEXT:C222($_at_AddressLines; 0)
													ARRAY TEXT:C222($_at_AddressFields; 0)
													RR_ZenCartAddressDecode($_t_addressBlock; ->$_at_AddressFields; ->$_at_AddressLines)
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line1")
													$_t_AddressLine1:=""
													$_t_addressLine2:=""
													$_t_addressLine3:=""
													$_t_State:=""
													$_t_Town:=""
													$_t_Zip:=""
													$_t_Country:=""
													If ($_l_ZenFieldRow>0)
														$_t_AddressLine1:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line2")
													If ($_l_ZenFieldRow>0)
														$_t_addressLine2:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line3")
													If ($_l_ZenFieldRow>0)
														$_t_addressLine3:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "City")
													If ($_l_ZenFieldRow>0)
														$_t_Town:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "State")
													If ($_l_ZenFieldRow>0)
														$_t_State:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Zip")
													If ($_l_ZenFieldRow>0)
														$_t_Zip:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Country")
													If ($_l_ZenFieldRow>0)
														$_t_Country:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
													
													CREATE RECORD:C68([AddressRecords:125])
													[AddressRecords:125]X_OwnerTableID:4:=Table:C252(->[xCreditCardDetails:132])
													[AddressRecords:125]X_OwnerRecordID:5:=[xCreditCardDetails:132]x_ID:1
													[AddressRecords:125]AddressLine1:6:=Uppercase:C13($_t_AddressLine1)
													[AddressRecords:125]AddressLine2:7:=Uppercase:C13($_t_addressLine2+$_t_addressLine3)
													
													[AddressRecords:125]Town_City:8:=Uppercase:C13($_t_Town)
													[AddressRecords:125]County_State:9:=Uppercase:C13($_t_State)
													[AddressRecords:125]Postal_Code:10:=Uppercase:C13($_t_Zip)
													If ($_t_Country="United States") | ($_t_Country="U.S.") | ($_t_Country="U.S.A.")
													Else 
														[AddressRecords:125]Country:11:=Uppercase:C13($_t_Country)
													End if 
													
													DB_SaveRecord(->[AddressRecords:125])
													
												Else 
													
												End if 
												
											End if 
											If (Not:C34(<>StatesLoaded))
												States_Load
											End if 
											
											CREATE RECORD:C68([ORDERS:24])
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
											[ORDERS:24]Company_Code:1:=[COMPANIES:2]Company_Code:1
											[ORDERS:24]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
											[ORDERS:24]Person:5:=[COMPANIES:2]Sales_Person:29
											Orders_Code
											Orders_InLPBDef
											//[ORDERS]Enclosures:=$_t_OrderReference
											[ORDERS:24]State:15:="024"+<>SYS_at_RecStateCodes{24}{3}
											
											$_l_ZenFieldRow3:=Find in array:C230($_at_ZenFieldNames; "Date Purchased")
											If ($_l_ZenFieldRow3>0)
												[ORDERS:24]Order_Date:4:=Date:C102($_at_ZenFieldData{$_l_ZenFieldRow3})
												[ORDERS:24]Order_Period:42:=ACC_GetCurrentperiod
											End if 
											If ([ORDERS:24]Order_Date:4=!00-00-00!)
												[ORDERS:24]Order_Date:4:=<>DB_d_CurrentDate
												[ORDERS:24]Order_Period:42:=ACC_GetCurrentperiod
											End if 
											[ORDERS:24]x_ID:58:=AA_GetNextIDinMethod(->[ORDERS:24]x_ID:58)
											Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
											Orders_InLPArea
											
											If ([COMPANIES:2]Default_Layer:51#"")
												[ORDERS:24]Layer_Code:47:=[COMPANIES:2]Default_Layer:51
											End if 
											If ([COMPANIES:2]Default_Currency:59#"")
												[ORDERS:24]Currency_Code:32:=[COMPANIES:2]Default_Currency:59
											End if 
											//z[ORDERS]Required Date:=◊CDate+◊DefReqDays
											//analysis
											If (([ORDERS:24]Currency_Code:32="") & (Records in selection:C76([ORDER_ITEMS:25])=0))
												[ORDERS:24]Currency_Code:32:=<>SYS_t_BaseCurrency
											End if 
											[ORDERS:24]Source:18:="NET"
											
											[ORDERS:24]Credit_Card_No:49:=$_t_Last4Digits
											If ($_t_Last4Digits="")
												$_l_ZenFieldRow3:=Find in array:C230($_at_ZenFieldNames; "Payment Method")
												If ($_l_ZenFieldRow3>0)
													If (Position:C15("Pay by Card on File"; $_at_ZenFieldData{$_l_ZenFieldRow3})>0)
														$_t_CCNumbers:=Replace string:C233($_at_ZenFieldData{$_l_ZenFieldRow3}; "<b>Pay by Card on File</b> (Last 4 digits of the desired credit card: <b>"; "")
														$_t_CCNumbers:=Replace string:C233($_t_CCNumbers; "</b>)"; "")
														If ($_t_CCNumbers#"")
															[ORDERS:24]Credit_Card_No:49:=$_t_CCNumbers
														End if 
													End if 
												End if 
											End if 
											
											Macro_AccType("Load "+String:C10(Table:C252(->[ORDERS:24])))
											For ($_l_OrderItemsIndex; 1; Size of array:C274($_at_OrderItemFieldNames))
												CREATE RECORD:C68([ORDER_ITEMS:25])
												[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
												//[ORDER ITEMS]Required Date:=[ORDERS]Required Date
												[ORDER_ITEMS:25]Person:14:=[ORDERS:24]Person:5
												[ORDERS:24]Sort_Number:27:=[ORDERS:24]Sort_Number:27+1
												$_l_NextOrderSortSeq:=[ORDERS:24]Sort_Number:27
												//$_l_NextOrderSortSeq:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextOrderSortSeq)
												$_l_NextOrderSortSeq:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderSortSeq; Records in selection:C76([ORDER_ITEMS:25]))
												
												[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortSeq
												[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26
												If ([ORDER_ITEMS:25]Tax_Code:12="")
													If ([COMPANIES:2]Default_TAX:41="")
														[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
													Else 
														[ORDER_ITEMS:25]Tax_Code:12:=[COMPANIES:2]Default_TAX:41
													End if 
												End if 
												If ([ORDER_ITEMS:25]Item_Number:27=0)  //$_l_OrderNumber)
													
													If (<>OINo=0)
														READ ONLY:C145([IDENTIFIERS:16])
														QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
														<>OINo:=[IDENTIFIERS:16]Number:2
														UNLOAD RECORD:C212([IDENTIFIERS:16])
													End if 
													Repeat 
														$_l_OrderItemNumber:=<>OINo+AA_GetNextIDinMethod(->[ORDER_ITEMS:25]Item_Number:27; Sequence number:C244([ORDER_ITEMS:25]))
														SET QUERY DESTINATION:C396(3; $_l_Clash)
														QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_OrderItemNumber)
														SET QUERY DESTINATION:C396(0)
														If ($_l_Clash>0)
															$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
															$_l_FieldNumber:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
															<>ResetNumber:=False:C215
															$_l_FixIDProcess:=New process:C317("AA_SetNextID"; 64000; "FIxingNumber"; $_l_TableNumber; $_l_FieldNumber; $_l_OrderItemNumber; <>OINo)
															Repeat 
																DelayTicks(60)
															Until (<>ResetNumber)
															<>ResetNumber:=False:C215
														End if 
														
													Until ($_l_Clash=0)
													
													//Copied to OrderI SubLPB
													[ORDER_ITEMS:25]Item_Number:27:=$_l_OrderItemNumber
													[ORDER_ITEMS:25]Print_Description:45:=<>SalesItemDP
												End if 
												If ([ORDER_ITEMS:25]State:46="")
													[ORDER_ITEMS:25]State:46:="A"
												End if 
												$_t_Product:=""
												$_t_Model:=""
												$_l_ZenFieldRow:=Find in array:C230($_at_OrderItemFieldNames{$_l_OrderItemsIndex}; "Products")
												If ($_l_ZenFieldRow>0)
													$_t_Product:=$_at_OrderItemFieldData{$_l_OrderItemsIndex}{$_l_ZenFieldRow}
													$_l_CharacterPosition:=Position:C15("_"; $_t_Product)
													$_t_TextBeforeChars:=Substring:C12($_t_Product; 1; $_l_CharacterPosition-1)
													$_t_TextAfterChars:=Substring:C12($_t_Product; $_l_CharacterPosition+1)
													$_t_TextAfterChars:=Replace string:C233($_t_TextAfterChars; "_"; " ")
													$_t_Product:=$_t_TextBeforeChars+"/"+$_t_TextAfterChars
													$_t_ProductVar:=$_t_TextBeforeChars+" "+$_t_TextAfterChars
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_OrderItemFieldNames{$_l_OrderItemsIndex}; "Model")
												If ($_l_ZenFieldRow>0)
													$_t_ModelRaw:=$_at_OrderItemFieldData{$_l_OrderItemsIndex}{$_l_ZenFieldRow}
													If (Length:C16($_t_ModelRaw)>0)
														Repeat 
															If ($_t_ModelRaw[[1]]=" ")
																$_t_ModelRaw:=Substring:C12($_t_ModelRaw; 2)
															End if 
														Until ($_t_ModelRaw[[1]]#" ")
														Repeat 
															If ($_t_ModelRaw[[Length:C16($_t_ModelRaw)]]=" ")
																$_t_ModelRaw:=Substring:C12($_t_ModelRaw; 1; Length:C16($_t_ModelRaw)-1)
															End if 
														Until ($_t_ModelRaw[[Length:C16($_t_ModelRaw)]]#" ")
													Else 
														//TRACE
													End if 
													
													$_t_Model:=$_at_OrderItemFieldData{$_l_OrderItemsIndex}{$_l_ZenFieldRow}
													If (Length:C16($_t_Model)>0)
														Repeat 
															If ($_t_Model[[1]]=" ")
																$_t_Model:=Substring:C12($_t_Model; 2)
															End if 
														Until ($_t_Model[[1]]#" ")
														Repeat 
															If ($_t_Model[[Length:C16($_t_Model)]]=" ")
																$_t_Model:=Substring:C12($_t_Model; 1; Length:C16($_t_Model)-1)
															End if 
														Until ($_t_Model[[Length:C16($_t_Model)]]#" ")
													End if 
													
													$_l_CharacterPosition:=Position:C15("_"; $_t_Model)
													$_t_TextBeforeChars:=Substring:C12($_t_Model; 1; $_l_CharacterPosition-1)
													$_t_TextAfterChars:=Substring:C12($_t_Model; $_l_CharacterPosition+1)
													$_t_TextAfterChars:=Replace string:C233($_t_TextAfterChars; "_"; " ")
													$_t_Model:=$_t_TextBeforeChars+"/"+$_t_TextAfterChars
													$_t_ModelVar:=$_t_TextBeforeChars+" "+$_t_TextAfterChars
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_OrderItemFieldNames{$_l_OrderItemsIndex}; "Quantity")
												If ($_l_ZenFieldRow>0)
													$_t_QuantitySTR:=$_at_OrderItemFieldData{$_l_OrderItemsIndex}{$_l_ZenFieldRow}
													
													$_r_QTY:=Num:C11($_t_QuantitySTR)
												End if 
												If ($_t_Model="zbk-3780@")  //nast specific rule!!
													
													$_t_Model:=Substring:C12($_t_Model; 2)
													$_t_ModelVar:=Substring:C12($_t_ModelVar; 2)
												End if 
												If ($_t_Model="ZA-Place vendome")  //another bad rule
													
													$_t_Model:="Z-Place vendome"
												End if 
												If ($_t_ModelVar="ZA-Place vendome")  //another bad rule
													
													$_t_ModelVar:="Z-Place vendome"
												End if 
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_Model)
												If (Records in selection:C76([PRODUCTS:9])=0)
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ModelVar)
												End if 
												If (Records in selection:C76([PRODUCTS:9])=0)
													$_t_ModelVar2:=Replace string:C233($_t_ModelRaw; "_"; "@")
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ModelVar2)
												End if 
												$_bo_Continue:=True:C214
												If (Records in selection:C76([PRODUCTS:9])=0)
													xNext:=0
													Gen_Confirm3("Processing Orders (order "+$_t_OrderReference+") from the website has encountered a problem! The product "+$_t_ModelRaw+" has been received on an order. This product should be "+$_t_Model+" in Daybook. This product does not exist in Daybook. You may choose to ignore(which will not add this product to the order in Daybook), Create(which will allow you to create the product), or change which will allow you to enter an alternative product "+"c"+"ode"; "Create"; "Change"; "Ignore")
													Case of 
														: (OK=0)
															$_bo_Exit:=False:C215
															Repeat 
																$_t_Model:=Gen_Request("Enter the product code to use"; $_t_Model)
																QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_Model)
																If (Records in selection:C76([PRODUCTS:9])=0)
																	Gen_Confirm("That product does not exist either"; "Retry"; "Ignore")
																	If (OK=0)
																		$_bo_Exit:=True:C214
																		$_bo_Continue:=False:C215
																		Gen_Alert("The Product "+$_t_Model+" Will not be added to the order")
																	End if 
																Else 
																	$_bo_Exit:=True:C214
																End if 
															Until ($_bo_Exit)
															
														: (xNext=1)
															//ignore
															$_bo_Continue:=False:C215
														Else 
															//Create the product
															$_l_AddMode:=vAdd
															vAdd:=1
															vCM:=1
															[ORDER_ITEMS:25]Product_Code:2:=$_t_Model
															PROD_CheckIfDefaultFromItem(->[ORDER_ITEMS:25]Product_Code:2)  //added kmw 03/09/08
															
															
															PROD_bo_GetCodeFromItem:=True:C214
															PROD_bo_iscancelled:=False:C215
															Products_FileI
															Open_Pro_Window("Enter Product"; 0; 2; ->[PRODUCTS:9]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
															
															ADD RECORD:C56([PRODUCTS:9]; *)
															Close_ProWin(Table name:C256(->[PRODUCTS:9])+"_"+WIN_t_CurrentInputForm)  //NG may 2004 added input form name
															
															PROD_bo_GetValuesFromItem:=False:C215
															
															vCM:=0
															vAdd:=$_l_AddMode
															If (PROD_bo_iscancelled)
																$_bo_Continue:=False:C215
																Gen_Alert("The Product "+$_t_Model+" Will not be added to the order")
															End if 
													End case 
													OK:=1
												End if 
												If ($_bo_Continue)
													$_t_CommodityCode:=[PRODUCTS:9]Commodity_Code:38
													$_l_CharacterPosition:=Position:C15("&"; $_t_CommodityCode)
													$_t_OtherCommodityCode:=""
													If ($_l_CharacterPosition>0)
														$_t_OtherCommodityCode:=Substring:C12($_t_CommodityCode; $_l_CharacterPosition+1; Length:C16($_t_CommodityCode))
														$_t_CommodityCode:=Substring:C12($_t_CommodityCode; 1; $_l_CharacterPosition-1)
													End if 
													$_r_CommidityQTY:=Num:C11($_t_CommodityCode)
													If ($_r_CommidityQTY=0)
														$_r_CommidityQTY:=27
													End if 
													$_l_ZenFieldRow:=Find in array:C230($_at_OrderItemFieldNames{$_l_OrderItemsIndex}; "Price (ex)")
													$_r_Price:=0
													If ($_l_ZenFieldRow>0)
														$_t_PriceSTR:=$_at_OrderItemFieldData{$_l_OrderItemsIndex}{$_l_ZenFieldRow}
														$_r_Price:=Num:C11($_t_PriceSTR)
													End if 
													$_r_UnitPrice:=$_r_Price/$_r_CommidityQTY
													If ($_t_OtherCommodityCode#"")
														$_r_MaybeUnitPrice:=$_r_Price/(Num:C11($_t_OtherCommodityCode))
														$_r_AbsDifference:=Abs:C99($_r_UnitPrice-[PRODUCTS:9]Sales_Price:9)
														
														$_r_AbsDifference2:=Abs:C99($_r_MaybeUnitPrice-[PRODUCTS:9]Sales_Price:9)
														If ($_r_AbsDifference2<$_r_AbsDifference)
															//the other commodity is the right on
															$_r_UnitPrice:=$_r_MaybeUnitPrice
															$_r_CommidityQTY:=Num:C11($_t_OtherCommodityCode)
															
														End if 
														
														
													End if 
													
													[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
													[ORDER_ITEMS:25]Product_Code:2:=[PRODUCTS:9]Product_Code:1
													[ORDER_ITEMS:25]Product_Name:13:=[PRODUCTS:9]Product_Name:2
													[ORDER_ITEMS:25]Quantity:3:=$_r_QTY*$_r_CommidityQTY
													[ORDER_ITEMS:25]Price_Per:50:=$_r_CommidityQTY
													OrderI_SubLPPC2
													OrderI_SubRel
													
													[ORDER_ITEMS:25]Sales_Price:4:=$_r_UnitPrice
													$_l_ZenFieldRow:=Find in array:C230($_at_OrderItemFieldNames{$_l_OrderItemsIndex}; "Tax")
													$_r_TaxAmount:=0
													If ($_l_ZenFieldRow>0)
														$_t_TaxAmountSTR:=$_at_OrderItemFieldData{$_l_OrderItemsIndex}{$_l_ZenFieldRow}
														$_r_TaxAmount:=Num:C11($_t_TaxAmountSTR)
													End if 
													If ($_r_TaxAmount>0)
														QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Rate:3=$_r_TaxAmount)
														[ORDER_ITEMS:25]Tax_Code:12:=[TAX_CODES:35]Tax_Code:1
													End if 
													[ORDER_ITEMS:25]Price_Per:50:=1
													Calc_Item
													If ([ORDER_ITEMS:25]Discount:37<0.1)
														[ORDER_ITEMS:25]Discount:37:=0
													End if 
													
													DB_SaveRecord(->[ORDER_ITEMS:25])
												End if 
												
											End for 
											QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
											OrderI_SubCostT
											[ORDERS:24]x_ExternalSourceRecordCode:60:=$_t_OrderReference
											Orders_InLPTot
											
											DB_SaveRecord(->[ORDERS:24])
											
											$_l_ZenFIeldRow:=Find in array:C230($_at_ZenFieldNames; "Customer")
											$_t_addressBlock:=$_at_ZenFieldData{$_l_ZenFieldRow}
											$_l_ZenFIeldRow:=Find in array:C230($_at_ZenFieldNames; "Shipping Address")
											$_t_ShippingAddressBlock:=$_at_ZenFieldData{$_l_ZenFieldRow}
											If ($_t_addressBlock#$_t_ShippingAddressBlock)
												//the shipping address is different
												
												ARRAY TEXT:C222($_at_AddressLines; 0)
												ARRAY TEXT:C222($_at_AddressFields; 0)
												RR_ZenCartAddressDecode($_t_ShippingAddressBlock; ->$_at_AddressFields; ->$_at_AddressLines)
												$_t_CompanyName:=""
												$_t_PersonName:=""
												$_t_AddressLine1:=""
												$_t_addressLine2:=""
												$_t_addressLine3:=""
												$_t_Town:=""
												$_t_State:=""
												$_t_Zip:=""
												$_t_Country:=""
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Company")
												If ($_l_ZenFieldRow>0)
													$_t_CompanyName:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												If ($_t_CompanyName="Existing Customer")
													$_l_ZenFieldRow:=Find in array:C230($_at_ZenFieldNames; "Billing Address")
													$_t_addressBlock:=$_at_ZenFieldData{$_l_ZenFieldRow}
													ARRAY TEXT:C222($_at_AddressLines; 0)
													ARRAY TEXT:C222($_at_AddressFields; 0)
													RR_ZenCartAddressDecode($_t_addressBlock; ->$_at_AddressFields; ->$_at_AddressLines)
													$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Company")
													If ($_l_ZenFieldRow>0)
														$_t_CompanyName:=$_at_AddressLines{$_l_ZenFIeldRow}
													End if 
												End if 
												
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Name")
												
												If ($_l_ZenFieldRow>0)
													$_t_PersonName:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line1")
												If ($_l_ZenFieldRow>0)
													$_t_AddressLine1:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line2")
												If ($_l_ZenFieldRow>0)
													$_t_addressLine2:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Address Line3")
												If ($_l_ZenFieldRow>0)
													$_t_addressLine3:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "City")
												If ($_l_ZenFieldRow>0)
													$_t_Town:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "State")
												If ($_l_ZenFieldRow>0)
													$_t_State:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Zip")
												If ($_l_ZenFieldRow>0)
													$_t_Zip:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												$_l_ZenFieldRow:=Find in array:C230($_at_AddressFields; "Country")
												If ($_l_ZenFieldRow>0)
													$_t_Country:=$_at_AddressLines{$_l_ZenFIeldRow}
												End if 
												CREATE RECORD:C68([AddressRecords:125])
												[AddressRecords:125]X_OwnerTableID:4:=Table:C252(->[ORDERS:24])
												[AddressRecords:125]X_OwnerRecordID:5:=[ORDERS:24]x_ID:58
												[AddressRecords:125]AddressLine1:6:=Uppercase:C13($_t_AddressLine1)
												[AddressRecords:125]AddressLine2:7:=Uppercase:C13($_t_addressLine2+$_t_addressLine3)
												[AddressRecords:125]Town_City:8:=Uppercase:C13($_t_Town)
												[AddressRecords:125]County_State:9:=Uppercase:C13($_t_State)
												[AddressRecords:125]Postal_Code:10:=Uppercase:C13($_t_Zip)
												If ($_t_Country="United States") | ($_t_Country="U.S.") | ($_t_Country="U.S.A.")
												Else 
													[AddressRecords:125]Country:11:=Uppercase:C13($_t_Country)
												End if 
												DB_SaveRecord(->[AddressRecords:125])
												[ORDERS:24]X_DeliveryAddressID:59:=[AddressRecords:125]X_ID:1
												DB_SaveRecord(->[ORDERS:24])
												
												
											End if 
											Gen_Confirm("A new Order has been created from the website"; "See Order"; "Later")
											If (OK=1)
												
												$_l_TableNumber:=Table:C252(->[ORDERS:24])
												$_l_FieldNumber:=Field:C253(->[ORDERS:24]Order_Code:3)
												$_t_FormName:="Order_In"
												$_ptr_LBTable:=Table:C252($_l_TableNumber)
												$_l_RecordNumber:=Record number:C243([ORDERS:24])
												$_l_Process:=0
												$_t_OrdersRecordCode:=[ORDERS:24]Order_Code:3
												UNLOAD RECORD:C212([ORDERS:24])
												
												$_l_EditOrderProcess:=New process:C317("LBi_InclEdit_InProcess"; 64000; "Edit "+(Table name:C256($_ptr_LBTable))+" "+$_t_OrdersRecordCode; $_l_TableNumber; $_l_FieldNumber; $_t_FormName; $_l_RecordNumber; $_l_Process; *)
												
												SHOW PROCESS:C325($_l_EditOrderProcess)
												BRING TO FRONT:C326($_l_EditOrderProcess)
												$_l_Retries:=0
												While (Process state:C330($_l_EditOrderProcess)>=0) & ((Process_Name($_l_EditOrderProcess))=("Edit "+(Table name:C256($_ptr_LBTable))+" "+$_t_OrdersRecordCode))
													
													
													$_l_Retries:=$_l_Retries+1
													If ($_l_Retries>50)
														$_l_Retries:=1
													End if 
													DelayTicks(90*$_l_Retries)
												End while 
											End if 
											
											
											
											
										End if 
										
										
										
										
									End if 
								Else 
									APPEND TO ARRAY:C911(DB_at_Legend; "Customer field NOT Found=BIG PROBLEM")
									
								End if 
								
								
								
								
								
								
								
							End if 
							//Note that address one is the company or person name.
							//and address 2 is the person name
							
							
							
							
							
							
							
							//Process this one then load the next one and then delete the element from the array
							//DB_at_OrderIDs{1}:="555"
						Else 
							
							
							//Something is causing the order sequence to skip orders but when i debug its fine..so retry
							APPEND TO ARRAY:C911(DB_at_Legend; "Invoice field NOT Found Retry number "+String:C10(DB_l_RetryOrder))
							DB_l_RetryOrder:=DB_l_RetryOrder+1
							
						End if 
						If (DB_l_RetryOrder=0) | (DB_l_RetryOrder>5)
							If (DB_l_RetryOrder>5)
								APPEND TO ARRAY:C911(DB_at_Legend; "Giving up on order "+DB_at_OrderIDs{1})
							End if 
							DELETE FROM ARRAY:C228(DB_at_OrderIDs; 1; 1)
							If (Size of array:C274(DB_at_OrderIDs)>0)
								$_l_MonthIndex:=1
								DB_t_WebUrl:=DB_t_WebUrlBase+"origin=index&page=1&oID="+DB_at_OrderIDs{1}+"&action=edit"
								//DB_t_WebUrl:=$urL
								APPEND TO ARRAY:C911(DB_at_Legend; "Refresh Page Loaded(3) "+"Order "+DB_at_OrderIDs{1})
								
								WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
								DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
							End if 
							DB_l_RetryOrder:=0
						Else 
							If (Size of array:C274(DB_at_OrderIDs)>0)
								APPEND TO ARRAY:C911(DB_at_Legend; "Refresh Page Loaded(4) "+"Order "+DB_at_OrderIDs{1})
								//http://renaissanceribbons.com/~renaissa/loginRR2309/orders.php?origin=index&page=1&oID=2241&action=edit
								DB_t_WebUrl:=DB_t_WebUrlBase+"origin=index&page=1&oID="+DB_at_OrderIDs{1}+"&action=edit"
								WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
								DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
							End if 
						End if 
						
					Else 
						
						RR_l_WebRetries:=RR_l_WebRetries+1
						APPEND TO ARRAY:C911(DB_at_Legend; "'Customer' is on NOT on page"+"Retry number"+String:C10(RR_l_WebRetries))
						
						If (RR_l_WebRetries<5)
							DB_t_WebUrl:=DB_t_WebUrlBase+"origin=index&page=1&oID="+DB_at_OrderIDs{1}+"&action=edit"
							
							WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
							APPEND TO ARRAY:C911(DB_at_Legend; "Refresh Page Loaded(2)")
							
							DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
						Else 
							APPEND TO ARRAY:C911(DB_at_Legend; "'Customer' is on NOT on page"+"Giving up on this number"+DB_at_OrderIDs{1})
							
							RR_l_WebRetries:=0
							DELETE FROM ARRAY:C228(DB_at_OrderIDs; 1; 1)
							If (Size of array:C274(DB_at_OrderIDs)>0)
								$_l_MonthIndex:=1
								APPEND TO ARRAY:C911(DB_at_Legend; "Moving to Processing Order number ("+DB_at_OrderIDs{1}+")")
								
								DB_t_WebUrl:=DB_t_WebUrlBase+"origin=index&page=1&oID="+DB_at_OrderIDs{1}+"&action=edit"
								//DB_t_WebUrl:=$urL
								APPEND TO ARRAY:C911(DB_at_Legend; "Refresh Page Loaded(3)")
								
								WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
								DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
							End if 
							
						End if 
					End if 
				Else 
					//TRACE
					//http://renaissanceribbons.com/~renaissa/loginRR2309/orders.php?selected_box=customers&status=1
					//DB_t_WebUrl:="http://renaissanceribbons.com/~renaissa/admin/orders.php?origin=index&page=1&oID="+DB_at_OrderIDs{1}+"&action=edit"
					If (True:C214)  //& (MAddressesExported=False)
						
						
						If (DB_t_DefaultWebUrl#"")
							DB_t_WebUrl:=DB_t_DefaultWebUrl
							WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
						End if 
						
						DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
						$_l_CharacterPosition:=Position:C15("New orders:"; DB_T_TExt)
						APPEND TO ARRAY:C911(DB_at_Legend; "Refresh Admin page loaded")
						
						If ($_l_CharacterPosition>0)
							APPEND TO ARRAY:C911(DB_at_Legend; "New orders Position found")
							
							If (DB_t_DefaultWebUrl="")
								//TRACE
								//WA REFRESH CURRENT URL(SD2_T_Dataform)
								DB_t_DefaultWebUrl:=WA Get current URL:C1025(*; "oCumulus")
							End if 
							DB_t_Default:=SD2_T_Dataform
							$_t_Text:=Substring:C12(DB_T_TExt; $_l_CharacterPosition+1)
							$_l_CharacterPosition2:=Position:C15("<div"; $_t_Text)
							If ($_l_CharacterPosition2>0)
								$_t_OrdersBlock:=Substring:C12($_t_Text; $_l_CharacterPosition2+Length:C16("<div")+1)
								$_l_CharacterPosition2:=Position:C15("</div>"; $_t_OrdersBlock)
								If ($_l_CharacterPosition2>0)
									$_t_OrdersBlock:=Substring:C12($_t_OrdersBlock; 1; $_l_CharacterPosition-1)
									ARRAY TEXT:C222(DB_at_OrderIDs; 0)
									Repeat 
										$_l_CharacterPosition3:=Position:C15("http"; $_t_OrdersBlock)
										If ($_l_CharacterPosition3>0)
											$_t_OrdersBlock:=Substring:C12($_t_OrdersBlock; $_l_CharacterPosition3)
											$_l_CharacterPosition4:=Position:C15("</span>"; $_t_OrdersBlock)
											If ($_l_CharacterPosition4>0)
												$_t_OrderText:=Substring:C12($_t_OrdersBlock; 1; $_l_CharacterPosition4-1)
												$_t_OrdersBlock:=Substring:C12($_t_OrdersBlock; $_l_CharacterPosition4+Length:C16("</span>"))
												$_l_CharacterPosition5:=Position:C15("oID="; $_t_OrderText)
												If ($_l_CharacterPosition5>0)
													$_t_OrderText:=Substring:C12($_t_OrderText; $_l_CharacterPosition5+Length:C16("oID="))
													$_l_CharacterPosition6:=Position:C15("&"; $_t_OrderText)
													If ($_l_CharacterPosition6>0)
														$_t_OrderText:=Substring:C12($_t_OrderText; 1; $_l_CharacterPosition6-1)
														If ($_t_OrderText#"")
															APPEND TO ARRAY:C911(DB_at_OrderIDs; $_t_OrderText)
															APPEND TO ARRAY:C911(DB_at_Legend; "Found on screen"+$_t_OrderText)
															
														End if 
													Else 
														$_l_CharacterPosition3:=0
													End if 
												Else 
													$_l_CharacterPosition3:=0
												End if 
											Else 
												$_l_CharacterPosition3:=0
											End if 
										End if 
									Until ($_l_CharacterPosition3=0)
									$_t_OrderID:=DB_at_OrderIDs{Size of array:C274(DB_at_OrderIDs)}
									QUERY:C277([ORDERS:24]; [ORDERS:24]x_ExternalSourceRecordCode:60#"")
									
									
									If (Records in selection:C76([ORDERS:24])>0)  //| (True)
										
										//TRACE
										ORDER BY:C49([ORDERS:24]; [ORDERS:24]Order_Date:4; <)
										$_d_OrderDate:=[ORDERS:24]Order_Date:4
										QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Date:4=$_d_OrderDate)
										ARRAY TEXT:C222($_at_sOrderCodes; 0)
										SELECTION TO ARRAY:C260([ORDERS:24]x_ExternalSourceRecordCode:60; $_at_sOrderCodes)
										ARRAY LONGINT:C221($_al_OrderIDS; 0)
										ARRAY LONGINT:C221($_al_OrderIDS; Size of array:C274($_at_sOrderCodes))
										For ($_l_BuildOrderIDSIndex; 1; Size of array:C274($_at_sOrderCodes))
											$_al_OrderIDS{$_l_BuildOrderIDSIndex}:=Num:C11($_at_sOrderCodes{$_l_BuildOrderIDSIndex})
										End for 
										SORT ARRAY:C229($_al_OrderIDS; >)
										$_l_HighestNumber:=$_al_OrderIDS{1}
										APPEND TO ARRAY:C911(DB_at_Legend; "There are web Orders_In the system")
										$_bo_Exit:=False:C215
										Repeat 
											$_l_OrderNumber:=Num:C11($_t_OrderID)
											$_l_OrderNumber:=$_l_OrderNumber-1
											
											$_t_OrderID:=String:C10($_l_OrderNumber)
											APPEND TO ARRAY:C911(DB_at_Legend; "Looking for order reference "+$_t_OrderID)
											
											QUERY:C277([ORDERS:24]; [ORDERS:24]x_ExternalSourceRecordCode:60=$_t_OrderID)
											If (Records in selection:C76([ORDERS:24])=0)
												APPEND TO ARRAY:C911(DB_at_OrderIDs; $_t_OrderID)
												APPEND TO ARRAY:C911(DB_at_Legend; "No  order reference "+$_t_OrderID+" Found so will add this to the list")
												
												
											Else 
												APPEND TO ARRAY:C911(DB_at_Legend; "  order reference "+$_t_OrderID+" Found so stopping adding to list")
												
												$_bo_Exit:=True:C214
											End if 
										Until ($_bo_Exit) | ($_l_OrderNumber<400) | ($_l_HighestNumber>$_l_OrderNumber)
									Else 
										$_t_ID2:=DB_at_OrderIDs{Size of array:C274(DB_at_OrderIDs)}
										
										Gen_Alert("As this is the first time you are running the Zen Cart Processing for Daybook you may want Daybook to process orders starting at a different point than"+$_t_ID2+"In the following window confirm the first order you would like Daybook to process")
										$_l_FirstID:=Gen_RequestAmount("First Order to process?"; Is longint:K8:6; Num:C11($_t_ID2))
										
										Case of 
											: ($_l_FirstID<Num:C11($_t_ID2))
												Repeat 
													$_l_OrderNumber:=Num:C11($_t_ID2)
													$_l_OrderNumber:=$_l_OrderNumber-1
													$_t_ID2:=String:C10($_l_OrderNumber)
													APPEND TO ARRAY:C911(DB_at_OrderIDs; String:C10($_l_OrderNumber))
													
												Until ($_l_OrderNumber<=$_l_FirstID)
											: ($_l_FirstID>Num:C11($_t_ID2))
												$_l_ZenFieldRow:=Find in array:C230(DB_at_OrderIDs; String:C10($_l_FirstID))
												If ($_l_ZenFIeldRow<0)
													Gen_Alert("That number does not exist yet, processing cannot start at that point")
													ARRAY TEXT:C222(DB_at_OrderIDs; 0)
												Else 
													Repeat 
														$_l_OrderNumber:=Num:C11(DB_at_OrderIDs{Size of array:C274(DB_at_OrderIDs)})
														If ($_l_OrderNumber<$_l_FirstID)
															DELETE FROM ARRAY:C228(DB_at_OrderIDs; Size of array:C274(DB_at_OrderIDs))
														End if 
														$_l_OrderNumber:=Num:C11(DB_at_OrderIDs{Size of array:C274(DB_at_OrderIDs)})
													Until ($_l_OrderNumber>=$_l_FirstID)
													
												End if 
										End case 
										
										
										
									End if 
									$_t_String:=""
									For ($_l_MonthIndex; 1; Size of array:C274(DB_at_OrderIDs))
										$_t_String:=$_t_String+DB_at_OrderIDs{$_l_MonthIndex}
										If ($_l_MonthIndex<Size of array:C274(DB_at_OrderIDs))
											$_t_String:=$_t_String+","
											
										End if 
									End for 
									APPEND TO ARRAY:C911(DB_at_Legend; "These are the order numbers to parse:"+$_t_String)
									$_l_MonthIndex:=1
									DB_t_WebUrl:=DB_t_WebUrlBase+"origin=index&page=1&oID="+DB_at_OrderIDs{$_l_MonthIndex}+"&action=edit"
									//DB_t_WebUrl:=$urL
									APPEND TO ARRAY:C911(DB_at_Legend; "Refresh Page Loaded(4)")
									
									WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
									DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
									
									
								End if 
							End if 
						End if 
					Else 
						//Close DocUMENT(MDOC)
						
						//ALERT("ADDRESSES EXPORTED")
						CANCEL:C270
					End if 
				End if 
				
			End if 
			
		Else 
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("FM RR_ZenCartWindow"; $_t_oldMethodName)
