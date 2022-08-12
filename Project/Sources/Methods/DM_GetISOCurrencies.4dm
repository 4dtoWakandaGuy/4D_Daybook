//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_GetISOCurrencies
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2012 07:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_CurrencyNum;0)
	//ARRAY REAL(CCM_ar_MinorUnits;0)
	ARRAY TEXT:C222($_at_AttributeNames; 0)
	ARRAY TEXT:C222($_at_AttributeValues; 0)
	//ARRAY TEXT(CCM_at_CountryCodes;0)
	//ARRAY TEXT(CCM_at_CountryNames;0)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	C_BOOLEAN:C305($_bo_DataOpen; $_bo_RecordOpen; $_bo_Standalone)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_CountryName; $_t_CurrencyCode; $_t_CurrencyCodenum; $_t_CurrencyName; $_t_DocumentPath; $_t_ElementName; $_t_Encoding; $_t_MinorUnit; $_t_oldMethodName; $_t_StructurePath; $_t_ThisElementName)
	C_TEXT:C284($_t_ThisPrefix; $_t_Version)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_GetISOCurrencies")

If (Application type:C494#4D Remote mode:K5:5)
	$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
	
Else 
	$_t_StructurePath:=Get 4D folder:C485(4D Client database folder:K5:13)
End if 
If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")=Is a folder:K24:2))
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources")
	End if 
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")
	End if 
End if 
$_t_DocumentPath:=$_t_StructurePath+"Resources"+Folder separator:K24:12+"Data"+Folder separator:K24:12+"Currencies"+".xml"
If (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
	
	$_bo_DataOpen:=False:C215
	$_t_ElementName:=""
	$_bo_RecordOpen:=False:C215
	$_ti_DocumentRef:=Open document:C264($_t_DocumentPath; "xml"; Read mode:K24:5)
	ARRAY TEXT:C222(CCM_at_CountryCodes; 0)
	ARRAY TEXT:C222(CCM_at_CountryNames; 0)
	ARRAY TEXT:C222(CCM_at_CurrencyNames; 0)
	ARRAY LONGINT:C221(CCM_al_CurrencyNum; 0)
	ARRAY REAL:C219(CCM_ar_MinorUnits; 0)
	
	
	If ($_ti_DocumentRef#?00:00:00?)
		If (OK=1)
			Repeat 
				
				$_l_event:=SAX Get XML node:C860($_ti_DocumentRef)
				Case of 
					: ($_l_event=XML start document:K45:7)
						$_t_Encoding:=""
						$_t_Version:=""
						$_bo_Standalone:=True:C214
						SAX GET XML DOCUMENT VALUES:C873($_ti_DocumentRef; $_t_Encoding; $_t_Version; $_bo_Standalone)
					: ($_l_event=XML DATA:K45:12)
						Case of 
							: ($_t_ElementName="COUNTRY") & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_CountryName:=""
								SAX GET XML ELEMENT VALUE:C877($_ti_DocumentRef; $_t_CountryName)
								
							: ($_t_ElementName="CURRENCYNAME") & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_CurrencyName:=""
								SAX GET XML ELEMENT VALUE:C877($_ti_DocumentRef; $_t_CurrencyName)
							: ($_t_ElementName="CURRENCYCODE") & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_CurrencyCode:=""
								SAX GET XML ELEMENT VALUE:C877($_ti_DocumentRef; $_t_CurrencyCode)
							: ($_t_ElementName="CURRENCYCODENUM") & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_CurrencyCodenum:=""
								SAX GET XML ELEMENT VALUE:C877($_ti_DocumentRef; $_t_CurrencyCodenum)
							: ($_t_ElementName="MINORUNIT") & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_MinorUnit:=""
								SAX GET XML ELEMENT VALUE:C877($_ti_DocumentRef; $_t_MinorUnit)
								
						End case 
						
					: ($_l_event=XML CDATA:K45:13)
						
					: ($_l_event=XML end element:K45:11)
						ARRAY TEXT:C222($_at_AttributeNames; 0)
						ARRAY TEXT:C222($_at_AttributeValues; 0)
						$_t_ThisPrefix:=""
						SAX GET XML ELEMENT:C876($_ti_DocumentRef; $_t_ThisElementName; $_t_ThisPrefix; $_at_AttributeNames; $_at_AttributeValues)
						Case of 
							: (Position:C15("ISO_CCY_CODES"; $_t_ThisElementName)>0) & ($_bo_DataOpen=True:C214)
								$_bo_DataOpen:=False:C215
								$_t_ElementName:=""
							: (Position:C15("ISO_CURRENCY"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214)
								$_bo_RecordOpen:=False:C215
								$_t_ElementName:=""
								If ($_t_CountryName#"") & ($_t_CurrencyName#"") & ($_t_CurrencyCode#"") & ($_t_CurrencyCodenum#"") & ($_t_MinorUnit#"")
									//the following is to deal with format anomolies between the ISO countries and the ISO currencies files!
									If ($_t_CountryName#"Vatican City State (HOLY SEE)")  //this appears twice on the currencies-once as holy see(vatican city state and once like this-on countries it is the holy see
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(ACK ASCII code:K15:7); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(At sign:K15:46); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(Backspace:K15:36); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(BEL ASCII code:K15:8); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(BS ASCII code:K15:9); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(CAN ASCII code:K15:25); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(Carriage return:K15:38); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(CR ASCII code:K15:14); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; Char:C90(Line feed:K15:40); "")
										$_t_CountryName:=Replace string:C233($_t_CountryName; "'"; "’")
										$_t_CountryName:=Replace string:C233($_t_CountryName; "CONGO, THE DEMOCRATIC REPUBLIC OF"; "CONGO, THE DEMOCRATIC REPUBLIC OF THE")
										$_t_CountryName:=Replace string:C233($_t_CountryName; "KOREA, DEMOCRATIC PEOPLE’S REPUBLIC OF"; "KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF")
										$_t_CountryName:=Replace string:C233($_t_CountryName; "LAO PEOPLE’S DEMOCRATIC REPUBLIC"; "LAO PEOPLE'S DEMOCRATIC REPUBLIC")
										$_t_CountryName:=Replace string:C233($_t_CountryName; "VIRGIN ISLANDS (BRITISH)"; "VIRGIN ISLANDS, BRITISH")
										$_t_CountryName:=Replace string:C233($_t_CountryName; "VIRGIN ISLANDS (US)"; "VIRGIN ISLANDS, U.S.")
										//problem with cote d'ivoire-changing in both
										If (Position:C15("CÔTE"; $_t_CountryName)>0)
											$_t_CountryName:="Ivory Coast"
										End if 
										//$_t_CountryName:=Replace string($_t_CountryName;"CÔTE D'IVOIRE";"CÔTE D'IVOIRE")
										APPEND TO ARRAY:C911(CCM_at_CountryCodes; $_t_CurrencyCode)
										APPEND TO ARRAY:C911(CCM_at_CurrencyNames; $_t_CurrencyName)
										APPEND TO ARRAY:C911(CCM_at_CountryNames; $_t_CountryName)
										APPEND TO ARRAY:C911(CCM_al_CurrencyNum; Num:C11($_t_CurrencyCodenum))
										APPEND TO ARRAY:C911(CCM_ar_MinorUnits; Num:C11($_t_MinorUnit))
									End if 
								End if 
							: (Position:C15("ENTITY"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:=""
								//```
							: (Position:C15("CURRENCY"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:=""
								
							: (Position:C15("ALPHABETIC_CODE"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:=""
								If (Size of array:C274(CCM_at_CountryCodes)=280)
									//TRACE
								End if 
							: (Position:C15("NUMERIC_CODE"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:=""
								
							: (Position:C15("MINOR_UNIT"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:=""
						End case 
						
					: ($_l_event=XML entity:K45:14)
						//TRACE
					: ($_l_event=XML processing instruction:K45:9)
						
						//TRACE
					: ($_l_event=XML start element:K45:10)
						ARRAY TEXT:C222($_at_AttributeNames; 0)
						ARRAY TEXT:C222($_at_AttributeValues; 0)
						$_t_ThisPrefix:=""
						SAX GET XML ELEMENT:C876($_ti_DocumentRef; $_t_ThisElementName; $_t_ThisPrefix; $_at_AttributeNames; $_at_AttributeValues)
						Case of 
							: (Position:C15("ISO_CCY_CODES"; $_t_ThisElementName)>0) & ($_bo_DataOpen=False:C215)
								If ($_at_AttributeNames{1}="xml:lang") & ($_at_AttributeValues{1}="EN")
									$_bo_DataOpen:=True:C214
								End if   //SAX GET XML ELEMENT VALUE($_ti_DocumentRef;
								
							: (Position:C15("ISO_CURRENCY"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=False:C215) & ($_bo_DataOpen=True:C214)
								$_bo_RecordOpen:=True:C214
								$_t_CurrencyCode:=""
								$_t_CurrencyName:=""
								$_t_CountryName:=""
								$_t_CurrencyCodenum:=""
								$_t_MinorUnit:=""
								
							: (Position:C15("Entity"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:="COUNTRY"
							: (Position:C15("CURRENCY"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:="CURRENCYNAME"
							: (Position:C15("ALPHABETIC_CODE"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:="CURRENCYCODE"
							: (Position:C15("NUMERIC_CODE"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:="CURRENCYCODENUM"
								If (Size of array:C274(CCM_at_CountryCodes)=277)
									//TRACE
								End if 
							: (Position:C15("MINOR_UNIT"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:="MINORUNIT"
								
								//Country_name
						End case 
					: ($_l_event=XML comment:K45:8)
						//TRACE
				End case 
			Until ($_l_event=XML end document:K45:15)
		End if 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		SORT ARRAY:C229(CCM_at_CurrencyNames; CCM_at_CountryCodes; CCM_at_CountryNames; CCM_al_CurrencyNum; CCM_ar_MinorUnits)
		
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DM_GetISOCurrencies"; $_t_oldMethodName)