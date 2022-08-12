If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oImport1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 23:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Accounts)
	//C_UNKNOWN(dtd)
	//C_UNKNOWN(Headings)
	//ARRAY BOOLEAN(DB_abo_AccountDefault;0)
	//ARRAY BOOLEAN(DB_abo_NoNominalLedgerPostings;0)
	//ARRAY INTEGER(DB_ai_RowLevel;0)
	//ARRAY LONGINT(DB_al_MultiCurrencyValuation;0)
	ARRAY TEXT:C222($_at_AnalysesCodes; 0)
	ARRAY TEXT:C222($_at_ApplicableAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_ApplicableLayerCodes; 0)
	ARRAY TEXT:C222($_at_LayerCodes; 0)
	//ARRAY TEXT(DB_at_ACCHHeadings1;0)
	//ARRAY TEXT(DB_at_ACCHHeadings2;0)
	//ARRAY TEXT(DB_at_ACCHHeadings3;0)
	//ARRAY TEXT(DB_at_ACCHHeadings4;0)
	//ARRAY TEXT(DB_at_ACCHHeadings5;0)
	//ARRAY TEXT(DB_at_AccountCodes;0)
	//ARRAY TEXT(DB_at_AccountHeadings;0)
	//ARRAY TEXT(DB_at_AccountIO;0)
	//ARRAY TEXT(DB_at_AccountNames;0)
	//ARRAY TEXT(DB_at_AccountPreferenceGroups;0)
	//ARRAY TEXT(DB_at_AnalysisCodes;0)
	//ARRAY TEXT(DB_at_Headings;0)
	//ARRAY TEXT(DB_at_LayerCodes;0)
	//ARRAY TEXT(DB_at_ProfitBalance;0)
	//ARRAY TEXT(DB_at_ReportHeadings;0)
	//ARRAY TEXT(DB_At_SubHeadingLevel;0)
	//ARRAY TEXT(DB_at_SubHeadings;0)
	C_BLOB:C604($_blb_AnalysisCodes; $_blb_LayerCodes)
	C_BOOLEAN:C305($_bo_IncludeAnalysis; $_bo_IncludeLayers; $_bo_True)
	C_LONGINT:C283($_l_AccountsIndex; $_l_AnalysisIndex; $_l_CharacterPosition; $_l_CurrentLevel; $_l_DataType; $_l_ExcelRowNumber; $_l_ExcelRowNumber2; $_l_FindRow; $_l_GroupCount1; $_l_GroupCount2; $_l_GroupCount3)
	C_LONGINT:C283($_l_GroupCount4; $_l_Groups5; $_l_GroupsCount; $_l_GroupsIndex; $_l_Index; $_l_Index2; $_l_Index3; $_l_Index4; $_l_Index5; $_l_LayersIndex; $_l_LevelArrays)
	C_LONGINT:C283($_l_LevelArrays2; $_l_Result; $_l_RowNumber; $_l_SheetCount; $_l_SheetCount2; $_l_SheetCount3; $_l_SheetCount4; $DB_l_DisplayTable)
	C_POINTER:C301($_ptr_AccountCodeRangeFromArray; $_ptr_AccountCodeRangeToArray; $_ptr_EnforceFlag; $_ptr_Field; $_ptr_GroupCode; $_ptr_HeaderNames; $_ptr_HeadingsCodesArray; $_ptr_HeadingsGroupCodeArray; $_ptr_HeadingsLevelArray; $_ptr_HeadingsLevelUpArray; $_ptr_HeadingsNames2Array)
	C_POINTER:C301($_ptr_HeadingsNamesArray; $_ptr_LevelUp; $_ptr_RangeCodeFrom; $_ptr_RangeCodeTo; $_ptr_Table)
	C_TEXT:C284($_t_AccAnalysisRestrictions; $_t_AccLayerRestrictions; $_t_AccountGroup; $_t_AnalysisCodesText; $_t_ArrayAsText; $_t_BaseExportPath; $_t_CodeUp; $_t_CurrentGroupCode; $_t_CurrentHeadingCode; $_t_CurrentHeadingName; $_t_CurrentLevelUpCode)
	C_TEXT:C284($_t_DocumentNotes; $_t_DocumentPath; $_t_DomElement; $_t_DomRecord; $_t_DomXMLRef; $_t_ExportPath; $_t_full_name2; $_t_FullName; $_t_FullName4; $_t_HeadingElementRef; $_t_LayerCodesText)
	C_TEXT:C284($_t_NewDocument; $_t_NewDocumentPath; $_t_oldMethodName; $_t_parentCode1; $_t_ParentCode2; $_t_ParentCode3; $_t_ParentCode4; $_t_ParentCode5; $_t_ParentName0; $_t_ParentName1; $_t_ParentName2)
	C_TEXT:C284($_t_ParentName3; $_t_ParentName4; $_t_ParentName5; $_t_ProjectName; $_t_Reference; $_t_ReplaceDataRef; $_t_TableName; $_t_VatPayment; $_t_VatReturn; $_t_WorkbookReference; $_t_WorkbookReference2)
	C_TEXT:C284($_t_WorkbookReference3; $_t_WorkbookReference4; $domtext; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashTo; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom)
	C_TEXT:C284(DM_T_BankAccTo; DM_T_nomVatInput; DM_T_nomVatOutput)
	C_TIME:C306($_ti_DocRef2; $_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oImport1"; Form event code:C388)
$_t_VatReturn:="VAT Return"
$_t_VatPayment:="VAT Payment"
//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";1;->DB_At_SubHeadingLevel;->DB_at_Headings;->DB_At_headingNames;->DB_at_HeadingACCRange;->DB_api_AddSubHeading;->DB_api_AddAccount;->DB_ai_RowLevel)
//Because i want to keep this simple making a little change here

//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings1;->DB_aI_HeadingLevel1;->DB_at_HeadingNames1;->DB_at_HeadingAccCodeFrom1;->DB_at_HeadingAccCodeTO1;->DB_al_HeadingEnforce1;->DB_at_HeadingGroup1;->DB_at_HeadingLevelup1)
//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings2;->DB_aI_HeadingLevel2;->DB_at_HeadingNames2;->DB_at_HeadingAccCodeFrom2;->DB_at_HeadingAccCodeTO2;->DB_al_HeadingEnforce2;->DB_at_HeadingGroup2;->DB_at_HeadingLevelup2)
//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings3;->DB_aI_HeadingLevel3;->DB_at_HeadingNames3;->DB_at_HeadingAccCodeFrom3;->DB_at_HeadingAccCodeTO3;->DB_al_HeadingEnforce3;->DB_at_HeadingGroup3;->DB_at_HeadingLevelup3)
//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings4;->DB_aI_HeadingLevel4;->DB_at_HeadingNames4;->DB_at_HeadingAccCodeFrom4;->DB_at_HeadingAccCodeTO4;->DB_al_HeadingEnforce4;->DB_at_HeadingGroup4;->DB_at_HeadingLevelup4)
//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings5;->DB_aI_HeadingLevel5;->DB_at_HeadingNames5;->DB_at_HeadingAccCodeFrom5;->DB_at_HeadingAccCodeTO5;->DB_al_HeadingEnforce5;->DB_at_HeadingGroup5;->DB_at_HeadingLevelup5)

//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_AccountCodes;->DB_at_AccountNames;->DB_at_AccountPreferenceGroups;->DB_at_AccountIO;->DB_al_MultiCurrencyValuation;->DB_at_MultiCurrencyValuation;->DB_abo_NoNominalLedgerPostings;->DB_at_ProfitBalance;->DB_at_AnalysisCodes;->DB_at_LayerCodes;->DB_abo_AccountDefault;->DB_at_AccountHeadings;->DB_at_ReportHeadings)
$_t_ProjectName:=""
If (True:C214)
	If (Current user:C182="Designer") & (False:C215)
		
		Gen_Confirm("Export Current Setup as XML?"; "Yes"; "No")
		If (OK=1)
			Gen_Alert("Make sure you name the documents in the correct format (~COUNTRY~(_)CHART NAME) and store them in the appropriate location(which is inside the COATEMPLATES directory) to include them as part of the default setups")
			$_t_ProjectName:=Gen_Request("Enter the Document Name"; "Default")
			If ($_t_ProjectName="Default")
				$_t_ProjectName:=""
			End if 
			$_bo_True:=False:C215
			ALL RECORDS:C47([ACCOUNTS:32])
			ALL RECORDS:C47([HEADINGS:84])
			
			$_ptr_Table:=->[ACCOUNTS:32]
			$DB_l_DisplayTable:=Table:C252(->[ACCOUNTS:32])
			
			$_t_TableName:=Table name:C256($DB_l_DisplayTable)
			$_t_DomXMLRef:=DOM Create XML Ref:C861("settings-import-export")
			DOM SET XML ATTRIBUTE:C866($_t_DomXMLRef; "table_no"; $DB_l_DisplayTable; "format"; "XML"; "all_records"; False:C215; "char_display_format"; "character"; "platform"; "automatic")  // Definition of fields to export
			$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "xml_settings"; "export_dtd_mode"; "generate-outside"; "export_xsl_mode"; "none")
			
			
			For ($_l_Index; 1; Get last field number:C255($DB_l_DisplayTable))
				If (Is field number valid:C1000($DB_l_DisplayTable; $_l_Index))
					$_ptr_Field:=Field:C253($DB_l_DisplayTable; $_l_Index)
					$_l_DataType:=Type:C295($_ptr_Field->)
					Case of 
						: ($_l_DataType=Is alpha field:K8:1)
							$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index; "kind"; "alpha")
						: ($_l_DataType=Is real:K8:4)
							$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index; "kind"; "real")
						: ($_l_DataType=Is text:K8:3)
							$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index; "kind"; "text")
							
						Else 
							
							$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index)
					End case 
				End if 
			End for 
			
			DOM EXPORT TO VAR:C863($_t_DomXMLRef; $domtext)
			DOM CLOSE XML:C722($_t_DomXMLRef)
			$_t_ExportPath:=Select folder:C670("Please select the export folder:")
			$_t_BaseExportPath:=$_t_ExportPath
			If (OK=1) & ($_t_ExportPath#"")
				$_t_ExportPath:=$_t_ExportPath+$_t_TableName+".xml"
				If ($_t_ProjectName="")
					//$_t_ExportPath:=$_t_ExportPath+$_t_TableName+".xml"
				Else 
					//$_t_ExportPath:=$_t_ExportPath+$_t_ProjectName+".xml"
				End if 
				EXPORT DATA:C666($_t_ExportPath; $domtext)  //Display of the export dialog box
				$_t_NewDocument:=Document
				
				//Now if the data file was blank there would no point in the above would there. or if we want export a custom setup
				//`so the point of the above is to create the DTD so here we are going to create a replacement document for the data using the array data rather than the data
				$_t_DocumentPath:=Document
				If ($_t_ProjectName#"")
					$_t_NewDocumentPath:=Replace string:C233($_t_DocumentPath; "Accounts.xml"; $_t_ProjectName+".xml")
					MOVE DOCUMENT:C540($_t_DocumentPath; $_t_NewDocumentPath)
					$_t_DocumentPath:=$_t_NewDocumentPath
				End if 
				
				$_t_ReplaceDataRef:=DOM Create XML Ref:C861("Root")
				$_l_RowNumber:=0
				For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
					$_t_TableName:=Table name:C256($DB_l_DisplayTable)
					If (DB_at_AccountCodes{$_l_Index}#"")
						
						$_l_RowNumber:=$_l_RowNumber+1
						$_t_DomRecord:=DOM Create XML element:C865($_t_ReplaceDataRef; $_t_TableName)
						//DOM SET XML ELEMENT VALUE($_t_DomRecord;"TEST")
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Report_Heading")
						// $_t_HeadingElementRef:=DOM insert XML element($_t_ReplaceDataRef;$_t_DomRecord)
						// DOM SET XML ELEMENT NAME($_t_HeadingElementRef;"Report_Heading")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_ReportHeadings{$_l_Index})
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Account_Code")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_AccountCodes{$_l_Index})
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Account_Name")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_AccountNames{$_l_Index})
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"PB")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_ProfitBalance{$_l_Index})
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"IO")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_AccountIO{$_l_Index})
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Group_Heading")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_AccountHeadings{$_l_Index})
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"xinternalAccountGroup")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_AccountPreferenceGroups{$_l_Index})
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"xDefaultAccountWithinGroup")
						If (DB_abo_AccountDefault{$_l_Index})
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; "true")
						Else 
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; "false")
						End if 
						
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"No_NL_Postings")
						If (DB_abo_NoNominalLedgerPostings{$_l_Index})
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; "true")
						Else 
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; "false")
						End if 
						
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Multicurrency_Valuation")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; String:C10(DB_al_MultiCurrencyValuation{$_l_Index}))
						//`````````
						
						SET BLOB SIZE:C606($_blb_LayerCodes; 0)
						ARRAY TEXT:C222($_at_ApplicableLayerCodes; 0)
						//
						$_t_LayerCodesText:=DB_at_LayerCodes{$_l_Index}
						Repeat 
							$_l_CharacterPosition:=Position:C15(","; $_t_LayerCodesText)
							If ($_l_CharacterPosition>0)
								APPEND TO ARRAY:C911($_at_ApplicableLayerCodes; Substring:C12($_t_LayerCodesText; 1; $_l_CharacterPosition-1))
								
								$_t_LayerCodesText:=Substring:C12($_t_LayerCodesText; $_l_CharacterPosition+1)
							Else 
								If ($_t_LayerCodesText#"")
									APPEND TO ARRAY:C911($_at_ApplicableLayerCodes; $_t_LayerCodesText)
								End if 
							End if 
						Until ($_l_CharacterPosition=0)
						VARIABLE TO BLOB:C532($_at_ApplicableLayerCodes; $_blb_LayerCodes; *)
						$_t_ArrayAsText:=""
						$_l_Result:=0
						BASE64 ENCODE:C895($_blb_LayerCodes; $_t_ArrayAsText)
						//$_t_ArrayAsText:=BLOB to text($_blb_AnalysisCodes;Mac text without length)
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"xLayerCodes")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; "data:;base64,"+$_t_ArrayAsText)
						
						
						SET BLOB SIZE:C606($_blb_AnalysisCodes; 0)
						ARRAY TEXT:C222($_at_ApplicableAnalysisCodes; 0)
						//
						$_t_AnalysisCodesText:=DB_at_AnalysisCodes{$_l_Index}
						If ($_t_AnalysisCodesText#"")
							//TRACE
						End if 
						
						Repeat 
							$_l_CharacterPosition:=Position:C15(","; $_t_AnalysisCodesText)
							If ($_l_CharacterPosition>0)
								APPEND TO ARRAY:C911($_at_ApplicableAnalysisCodes; Substring:C12($_t_AnalysisCodesText; 1; $_l_CharacterPosition-1))
								
								$_t_AnalysisCodesText:=Substring:C12($_t_AnalysisCodesText; $_l_CharacterPosition+1)
							Else 
								If ($_t_AnalysisCodesText#"")
									APPEND TO ARRAY:C911($_at_ApplicableAnalysisCodes; $_t_AnalysisCodesText)
								End if 
							End if 
						Until ($_l_CharacterPosition=0)
						VARIABLE TO BLOB:C532($_at_ApplicableAnalysisCodes; $_blb_AnalysisCodes; *)
						$_t_ArrayAsText:=""
						BASE64 ENCODE:C895($_blb_AnalysisCodes; $_t_ArrayAsText)
						$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"xAnalysisCodes")
						DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; "data:;base64,"+$_t_ArrayAsText)
						
						//Here we will put the data in in exactly the same way as the database
						
						
						
					End if 
				End for 
				
				$_t_Reference:=DOM Append XML child node:C1080($_t_ReplaceDataRef; XML DOCTYPE:K45:19; "Root SYSTEM \"Accounts.dtd\"")
				$_t_ExportPath:=Replace string:C233($_t_ExportPath; ".xml"; "")
				DOM EXPORT TO FILE:C862($_t_ReplaceDataRef; $_t_ExportPath+"2.xml")  //Note that once the import is tested the 2 will be removed from here
				
				//$_ti_DocumentRef:=Create document($_t_ExportPath+"2.txt")
				//SEND PACKET($_ti_DocumentRef;$DataFromArrays)
				//Close DocUMENT($_ti_DocumentRef)
				
				
				
				
				$_ptr_Table:=->[HEADINGS:84]
				$DB_l_DisplayTable:=Table:C252(->[HEADINGS:84])
				
				$_t_TableName:=Table name:C256($DB_l_DisplayTable)
				$_t_DomXMLRef:=DOM Create XML Ref:C861("settings-import-export")
				// Export the table "$1" in '4D' binary format, all the records or only the current selection
				//DOM SET XML ATTRIBUTE($_t_DomXMLRef;"table_no";DB_l_CURRENTDISPLAYEDFORM;"format";"4D";"all_records";False)
				DOM SET XML ATTRIBUTE:C866($_t_DomXMLRef; "table_no"; $DB_l_DisplayTable; "format"; "XML"; "all_records"; False:C215; "char_display_format"; "character"; "platform"; "automatic")  // Definition of fields to export
				//char_display_format="character" platform="automatic"For ($_l_Index;1;Get last field number(DB_l_CURRENTDISPLAYEDFORM))
				$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "xml_settings"; "export_dtd_mode"; "generate-outside"; "export_xsl_mode"; "none")
				
				//<xml_settings export_dtd_mode="generate-outside"export_xsl_mode="none"/>
				For ($_l_Index; 1; Get last field number:C255($DB_l_DisplayTable))
					If (Is field number valid:C1000($DB_l_DisplayTable; $_l_Index))
						$_ptr_Field:=Field:C253($DB_l_DisplayTable; $_l_Index)
						$_l_DataType:=Type:C295($_ptr_Field->)
						Case of 
							: ($_l_DataType=Is alpha field:K8:1)
								$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index; "kind"; "alpha")
							: ($_l_DataType=Is real:K8:4)
								$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index; "kind"; "real")
							: ($_l_DataType=Is text:K8:3)
								$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index; "kind"; "text")
								
							Else 
								
								$_t_DomElement:=DOM Create XML element:C865($_t_DomXMLRef; "field"; "table_no"; $DB_l_DisplayTable; "field_no"; $_l_Index)
						End case 
					End if 
				End for 
				
				DOM EXPORT TO VAR:C863($_t_DomXMLRef; $domtext)
				DOM CLOSE XML:C722($_t_DomXMLRef)
				//$_t_ExportPath:=Select folder("Please select the export folder:")
				If (OK=1) & ($_t_ExportPath#"")
					
					//If ($_t_ProjectName="")
					$_t_ExportPath:=$_t_BaseExportPath+$_t_TableName+".xml"
					//Else
					//$_t_ExportPath:=$_t_ExportPath+$_t_ProjectName+"_"+$_t_TableName+".xml"
					//End if
					EXPORT DATA:C666($_t_ExportPath; $domtext)  //Display of the export dialog box
					
					$_t_DocumentPath:=Document
					If ($_t_ProjectName#"")
						$_t_NewDocumentPath:=Replace string:C233($_t_DocumentPath; "Headings.xml"; "Headings_"+$_t_ProjectName+".xml")
						MOVE DOCUMENT:C540($_t_DocumentPath; $_t_NewDocumentPath)
						$_t_DocumentPath:=$_t_NewDocumentPath
					End if 
					
					$_t_ReplaceDataRef:=DOM Create XML Ref:C861("Root")
					$_l_RowNumber:=0
					For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
						$_t_TableName:=Table name:C256($DB_l_DisplayTable)
						If (DB_at_Headings{$_l_Index}#"")
							Case of 
								: (DB_at_ACCHHeadings1{$_l_Index}#"")
									$_l_LevelArrays:=1
								: (DB_at_ACCHHeadings2{$_l_Index}#"")
									$_l_LevelArrays:=2
								: (DB_at_ACCHHeadings3{$_l_Index}#"")
									$_l_LevelArrays:=3
								: (DB_at_ACCHHeadings4{$_l_Index}#"")
									$_l_LevelArrays:=4
								: (DB_at_ACCHHeadings5{$_l_Index}#"")
									$_l_LevelArrays:=5
							End case 
							$_l_RowNumber:=$_l_RowNumber+1
							$_t_DomRecord:=DOM Create XML element:C865($_t_ReplaceDataRef; $_t_TableName)
							//DOM SET XML ELEMENT VALUE($_t_DomRecord;"TEST")
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Heading_Code")
							
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; DB_at_Headings{$_l_Index})
							$_ptr_HeaderNames:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays))
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Heading_Name")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; $_ptr_HeaderNames->{$_l_Index})
							
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Heading_Level")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; String:C10(DB_ai_RowLevel{$_l_Index}))
							$_ptr_LevelUp:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_LevelArrays))
							$_ptr_GroupCode:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_LevelArrays))
							$_ptr_RangeCodeFrom:=Get pointer:C304("DB_at_HeadingAccCodeFrom"+String:C10($_l_LevelArrays))
							$_ptr_RangeCodeTo:=Get pointer:C304("DB_at_HeadingAccCodeTO"+String:C10($_l_LevelArrays))
							$_ptr_EnforceFlag:=Get pointer:C304("DB_al_HeadingEnforce"+String:C10($_l_LevelArrays))
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Level_Up_Code")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; $_ptr_LevelUp->{$_l_Index})
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"Group_Code")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; $_ptr_GroupCode->{$_l_Index})
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"AccCodeRangeFrom")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; $_ptr_RangeCodeFrom->{$_l_Index})
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"AccCodeRangeTo")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; $_ptr_RangeCodeTo->{$_l_Index})
							
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"EnforceRange")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; String:C10($_ptr_EnforceFlag->{$_l_Index}))
							
							
							
							$_t_HeadingElementRef:=DOM Create XML element:C865($_t_ReplaceDataRef; "/Root/"+$_t_TableName+"["+String:C10($_l_RowNumber)+"]/"+"xInternalAccountsGroup")
							DOM SET XML ELEMENT VALUE:C868($_t_HeadingElementRef; "")
							
							
							
						End if 
					End for 
					
					$_t_Reference:=DOM Append XML child node:C1080($_t_ReplaceDataRef; XML DOCTYPE:K45:19; "Root SYSTEM \"Headings.dtd\"")
					$_t_ExportPath:=Replace string:C233($_t_DocumentPath; ".xml"; "")
					DOM EXPORT TO FILE:C862($_t_ReplaceDataRef; $_t_ExportPath+"2.xml")  //Note that once the import is tested the 2 will be removed from here
					
					
				End if 
			End if 
			Gen_Alert("Export Completed")
		Else 
			//NG-note this is different to the non designer export in that it exports whats on screen without saving it
			////this means that as the designer i can use this screen to setup default templates.
			Gen_Alert("Note that neither of the following formats are used by the default setup for the 'internal' defaults available, this is for creating a specific setup for a client")
			
			Gen_Confirm("Export the Chart of accounts in Tab delimited format?"; "Yes"; "No")
			If (OK=1)
				Gen_Alert("This will export two documents for headers and two documents for accounts the first is a blank template of the column headers the second(Optional) is the current data in that format")
				$_t_ExportPath:=Select folder:C670("Please select the export folder:")
				If (OK=1) & ($_t_ExportPath#"")
					//$_t_ExportPath:=$_t_ExportPath+$_t_TableName+".txt"
					$_bo_IncludeLayers:=False:C215
					$_bo_IncludeAnalysis:=False:C215
					
					For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
						If (DB_at_LayerCodes{$_l_Index}#"")
							$_bo_IncludeLayers:=True:C214
							$_l_Index:=Size of array:C274(DB_At_SubHeadingLevel)
						End if 
					End for 
					//$_bo_IncludeLayers:=(Records in table([LAYERS])>0) & (Records in table([ACCOUNTS_LAYERS])>0)
					For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
						If (DB_at_AnalysisCodes{$_l_Index}#"")
							$_bo_IncludeAnalysis:=True:C214
							$_l_Index:=Size of array:C274(DB_At_SubHeadingLevel)
						End if 
					End for 
					
					//$_bo_IncludeAnalysis:=(Records in table([ANALYSES])>0) & (Records in table([ACCOUNTS_ANALYSES])>0)
					$_ti_DocumentRef:=Create document:C266($_t_ExportPath+"HeadingsTemplate"+".txt"; "TEXT")
					SEND PACKET:C103($_ti_DocumentRef; "Heading Code(Identifier)"+Char:C90(Tab:K15:37)+"Heading Name"+Char:C90(Tab:K15:37)+"Parent Heading Code(Blank for top level)"+Char:C90(Tab:K15:37)+"Parent Heading Name"+Char:C90(Tab:K15:37)+"Heading Level(Optional)"+Char:C90(Tab:K15:37)+"Report Group(Top level heading-Optional"+Char:C90(Tab:K15:37)+"Account Code Range From(optional)"+Char:C90(Tab:K15:37)+"Account Code Range to(optional)"+Char:C90(13))
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					$_ti_DocumentRef:=Create document:C266($_t_ExportPath+"AccountsTemplate"+".txt"; "TEXT")
					SEND PACKET:C103($_ti_DocumentRef; "Account Code(Identifier)"+Char:C90(Tab:K15:37)+"Account Name"+Char:C90(Tab:K15:37)+"Heading Code(Identifier)"+Char:C90(Tab:K15:37)+"Heading Name"+Char:C90(Tab:K15:37)+"Parent Heading Code(Blank for top level)"+Char:C90(Tab:K15:37)+"Parent Heading Name"+Char:C90(Tab:K15:37)+"Heading Level(Optional)"+Char:C90(Tab:K15:37)+"Report Group(Top level heading-Optional"+Char:C90(Tab:K15:37)+"input Output"+Char:C90(Tab:K15:37)+"Balance Sheet Account"+Char:C90(Tab:K15:37)+"Profit Sheet Account"+Char:C90(Tab:K15:37)+"Accounts Group")
					If ($_bo_IncludeLayers)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+"Layer Restrictions")
					End if 
					If ($_bo_IncludeAnalysis)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+"Analysis Code Restrictions")
					End if 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					
					//$_ti_DocumentRef:=Create document($_t_ExportPath+"Headings_Data"+".txt";"TEXT")
					//SEND PACKET($_ti_DocumentRef;"Heading Code(Identifier)"+Char(tab)+"Heading Name"+Char(tab)+"Parent Heading Code(Blank for top level)"+Char(tab)+"Parent Heading Name"+Char(tab)+"Heading Level(Optional)"+Char(tab)+"Report Group(Top level heading-Optional"+Char(tab)+"Account Code Range From(optional)"+Char(tab)+"Account Code Range to(optional)"+Char(13))
					$_ti_DocumentRef:=Create document:C266($_t_ExportPath+"Headings_Data"+".txt"; "TEXT")
					SEND PACKET:C103($_ti_DocumentRef; "Heading Code(Identifier)"+Char:C90(Tab:K15:37)+"Heading Name"+Char:C90(Tab:K15:37)+"Parent Heading Code(Blank for top level)"+Char:C90(Tab:K15:37)+"Parent Heading Name"+Char:C90(Tab:K15:37)+"Heading Level(Optional)"+Char:C90(Tab:K15:37)+"Report Group(Top level heading-Optional"+Char:C90(Tab:K15:37)+"Account Code Range From(optional)"+Char:C90(Tab:K15:37)+"Account Code Range to(optional)"+Char:C90(13))
					
					$_ti_DocRef2:=Create document:C266($_t_ExportPath+"Accounts_Data"+".txt"; "TEXT")
					SEND PACKET:C103($_ti_DocRef2; "Account Code(Identifier)"+Char:C90(Tab:K15:37)+"Account Name"+Char:C90(Tab:K15:37)+"Heading Code(Identifier)"+Char:C90(Tab:K15:37)+"Heading Name"+Char:C90(Tab:K15:37)+"Parent Heading Code(Blank for top level)"+Char:C90(Tab:K15:37)+"Parent Heading Name"+Char:C90(Tab:K15:37)+"Heading Level(Optional)"+Char:C90(Tab:K15:37)+"Report Group(Top level heading-Optional"+Char:C90(Tab:K15:37)+"input Output"+Char:C90(Tab:K15:37)+"Balance Sheet Account"+Char:C90(Tab:K15:37)+"Profit Sheet Account"+Char:C90(Tab:K15:37)+"Accounts Group")
					If ($_bo_IncludeLayers)
						SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+"Layer Restrictions")
					End if 
					If ($_bo_IncludeAnalysis)
						SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+"Analysis Code Restrictions")
					End if 
					SEND PACKET:C103($_ti_DocRef2; Char:C90(13))
					
					
					//QUERY([HEADINGS];[HEADINGS]Group_Code="")
					//ORDER BY([HEADINGS];[HEADINGS]Heading_Code;>)
					//COPY NAMED SELECTION([HEADINGS];"Level0Group")
					//$_l_GroupsCount:=Records in selection([HEADINGS])
					//$_l_GroupsCount:=Size of array(DB_at_SubHeadings)
					///LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";1;->DB_At_SubHeadingLevel;->DB_at_Headings;->DB_At_headingNames;->DB_at_HeadingACCRange;->DB_api_AddSubHeading;->DB_api_AddAccount;->DB_ai_RowLevel)
					//Because i want to keep this simple making a little change here
					
					//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings1;->DB_aI_HeadingLevel1;->DB_at_HeadingNames1;->DB_at_HeadingAccCodeFrom1;->DB_at_HeadingAccCodeTO1;->DB_al_HeadingEnforce1;->DB_at_HeadingGroup1;->DB_at_HeadingLevelup1)
					//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings2;->DB_aI_HeadingLevel2;->DB_at_HeadingNames2;->DB_at_HeadingAccCodeFrom2;->DB_at_HeadingAccCodeTO2;->DB_al_HeadingEnforce2;->DB_at_HeadingGroup2;->DB_at_HeadingLevelup2)
					//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings3;->DB_aI_HeadingLevel3;->DB_at_HeadingNames3;->DB_at_HeadingAccCodeFrom3;->DB_at_HeadingAccCodeTO3;->DB_al_HeadingEnforce3;->DB_at_HeadingGroup3;->DB_at_HeadingLevelup3)
					//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings4;->DB_aI_HeadingLevel4;->DB_at_HeadingNames4;->DB_at_HeadingAccCodeFrom4;->DB_at_HeadingAccCodeTO4;->DB_al_HeadingEnforce4;->DB_at_HeadingGroup4;->DB_at_HeadingLevelup4)
					//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_ACCHHeadings5;->DB_aI_HeadingLevel5;->DB_at_HeadingNames5;->DB_at_HeadingAccCodeFrom5;->DB_at_HeadingAccCodeTO5;->DB_al_HeadingEnforce5;->DB_at_HeadingGroup5;->DB_at_HeadingLevelup5)
					
					//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_AccountCodes;->DB_at_AccountNames;->DB_at_AccountPreferenceGroups;->DB_at_AccountIO;->DB_al_MultiCurrencyValuation;->DB_at_MultiCurrencyValuation;->DB_abo_NoNominalLedgerPostings;->DB_at_ProfitBalance;->DB_at_AnalysisCodes;->DB_at_LayerCodes;->DB_abo_AccountDefault;->DB_at_AccountHeadings;->DB_at_ReportHeadings)
					$_t_CurrentHeadingCode:=""
					$_t_CurrentHeadingName:=""
					$_t_CurrentLevelUpCode:=""
					$_t_CurrentGroupCode:=""
					$_l_CurrentLevel:=0
					$_t_ParentName0:=""
					For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
						If (DB_at_AccountNames{$_l_Index}#"")
							//QUERY([ACCOUNTS];[ACCOUNTS]Report_Heading=[HEADINGS]Heading_Code)
							//$_t_ParentName0:=""
							//ORDER BY([ACCOUNTS];[ACCOUNTS]Account_Code;>)
							//For ($_l_AccountsIndex;1;Records in selection([ACCOUNTS]))
							//````````
							$_t_AccountGroup:=DB_at_AccountPreferenceGroups{$_l_Index}
							If ($_t_AccountGroup="")
								
								If (DM_T_BankAccFrom#"")
									If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccFrom)
										If (DM_T_BankAccTo="")
											If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccFrom)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										Else 
											If (DB_at_AccountCodes{$_l_Index}<=DM_T_BankAccTo)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccTo#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									End if 
								End if 
								
								
								
								If (DM_T_BankAccCurrencyExchange#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyExchange)
										$_t_AccountGroup:="Currency Exchange Control"
									End if 
								End if 
								If (DM_T_BankAccCurrencyCharges#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyCharges)
										$_t_AccountGroup:="Currency Bank Charges"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitBFWD#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitBFWD)
										$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitYTD#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitYTD)
										$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceAdjustments#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:="Balance Sheet Adjusment Account"
									End if 
								End if 
								
								If (DM_T_nomVatInput#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:=$_t_VatReturn
									End if 
								End if 
								If (DM_T_nomVatOutput#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_nomVatOutput)
										$_t_AccountGroup:=$_t_VatPayment
									End if 
								End if 
								
								If (DM_T_BankAccCashFrom#"")
									If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccCashFrom)
										If (DM_T_BankAccCashTo#"")
											
											If (DM_T_BankAccCashTo>=DB_at_AccountCodes{$_l_Index})
												$_t_AccountGroup:="Cash Accounts"
											End if 
										Else 
											If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCashFrom)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccCashTo#"")
										If (DM_T_BankAccCashTo=DB_at_AccountCodes{$_l_Index})
											$_t_AccountGroup:="Cash Accounts"
										End if 
									End if 
								End if 
							End if 
							
							$_t_AccLayerRestrictions:=""
							$_t_AccAnalysisRestrictions:=""
							If ($_bo_IncludeLayers)
								$_t_AccLayerRestrictions:=DB_at_LayerCodes{$_l_Index}
							End if 
							If ($_bo_IncludeAnalysis)
								$_t_AccAnalysisRestrictions:=DB_at_AnalysisCodes{$_l_Index}
							End if 
							//```
							//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_AccountCodes;->DB_at_AccountNames;->DB_at_AccountPreferenceGroups;->DB_at_AccountIO;->DB_al_MultiCurrencyValuation;->DB_at_MultiCurrencyValuation;->DB_abo_NoNominalLedgerPostings;->DB_at_ProfitBalance;->DB_at_AnalysisCodes;->DB_at_LayerCodes;->DB_abo_AccountDefault;->DB_at_AccountHeadings;->DB_at_ReportHeadings)
							
							If (DB_at_ProfitBalance{$_l_Index}="B")
								SEND PACKET:C103($_ti_DocRef2; DB_at_AccountCodes{$_l_Index}+Char:C90(Tab:K15:37)+DB_at_AccountNames{$_l_Index}+Char:C90(Tab:K15:37)+$_t_CurrentHeadingCode+Char:C90(Tab:K15:37)+$_t_CurrentHeadingName+Char:C90(Tab:K15:37)+$_t_CurrentLevelUpCode+Char:C90(Tab:K15:37)+$_t_ParentName0+Char:C90(Tab:K15:37)+String:C10($_l_CurrentLevel)+Char:C90(Tab:K15:37)+$_t_CurrentGroupCode+Char:C90(Tab:K15:37)+DB_at_AccountIO{$_l_Index}+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup)
								If ($_bo_IncludeLayers)
									SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions)
								End if 
								If ($_bo_IncludeAnalysis)
									SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions)
								End if 
								SEND PACKET:C103($_ti_DocRef2; Char:C90(13))
								
							Else 
								SEND PACKET:C103($_ti_DocRef2; DB_at_AccountCodes{$_l_Index}+Char:C90(Tab:K15:37)+DB_at_AccountNames{$_l_Index}+Char:C90(Tab:K15:37)+$_t_CurrentHeadingCode+Char:C90(Tab:K15:37)+$_t_CurrentHeadingName+Char:C90(Tab:K15:37)+$_t_CurrentLevelUpCode+Char:C90(Tab:K15:37)+$_t_ParentName0+Char:C90(Tab:K15:37)+String:C10($_l_CurrentLevel)+Char:C90(Tab:K15:37)+$_t_CurrentGroupCode+Char:C90(Tab:K15:37)+DB_at_AccountIO{$_l_Index}+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup)
								If ($_bo_IncludeLayers)
									SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions)
								End if 
								If ($_bo_IncludeAnalysis)
									SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions)
								End if 
								SEND PACKET:C103($_ti_DocRef2; Char:C90(13))
							End if 
							
							//NEXT RECORD([ACCOUNTS])
							//End for
						End if 
						If (DB_at_Headings{$_l_Index}#"")  //its a heading
							Case of 
								: (DB_at_ACCHHeadings1{$_l_Index}#"")
									$_l_LevelArrays:=1
								: (DB_at_ACCHHeadings2{$_l_Index}#"")
									$_l_LevelArrays:=2
								: (DB_at_ACCHHeadings3{$_l_Index}#"")
									$_l_LevelArrays:=3
								: (DB_at_ACCHHeadings4{$_l_Index}#"")
									$_l_LevelArrays:=4
								: (DB_at_ACCHHeadings5{$_l_Index}#"")
									$_l_LevelArrays:=5
							End case 
							//$_t_CurrentHeadingCode:=""
							//$_t_CurrentHeadingName:=""
							//$_t_CurrentLevelUpCode:=""
							//$_t_CurrentGroupCode:=""
							//$_l_CurrentLevel:=0
							//TRACE
							$_ptr_HeadingsCodesArray:=Get pointer:C304("DB_at_ACCHHeadings"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsNamesArray:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsLevelUpArray:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsLevelArray:=Get pointer:C304("DB_aI_HeadingLevel"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsGroupCodeArray:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_LevelArrays))
							$_ptr_AccountCodeRangeFromArray:=Get pointer:C304("DB_at_HeadingAccCodeFrom"+String:C10($_l_LevelArrays))
							$_ptr_AccountCodeRangeToArray:=Get pointer:C304("DB_at_HeadingAccCodeTo"+String:C10($_l_LevelArrays))
							$_t_CodeUp:=""
							$_t_CodeUp:=($_ptr_HeadingsLevelUpArray->{$_l_Index})
							If ($_t_CodeUp#"")
								$_l_FindRow:=Find in array:C230(DB_at_Headings; $_t_CodeUp)
							Else 
								$_l_FindRow:=0
							End if 
							
							If ($_l_FindRow>0)
								Case of 
									: (DB_at_ACCHHeadings1{$_l_FindRow}#"")
										$_l_LevelArrays2:=1
									: (DB_at_ACCHHeadings2{$_l_FindRow}#"")
										$_l_LevelArrays2:=2
									: (DB_at_ACCHHeadings3{$_l_FindRow}#"")
										$_l_LevelArrays2:=3
									: (DB_at_ACCHHeadings4{$_l_FindRow}#"")
										$_l_LevelArrays2:=4
									: (DB_at_ACCHHeadings5{$_l_FindRow}#"")
										$_l_LevelArrays2:=5
								End case 
								$_ptr_HeadingsNames2Array:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays2))
								$_t_ParentName0:=$_ptr_HeadingsNames2Array->{$_l_FindRow}
								
							Else 
								$_t_ParentName0:=""
							End if 
							SEND PACKET:C103($_ti_DocumentRef; $_ptr_HeadingsCodesArray->{$_l_Index}+Char:C90(Tab:K15:37)+$_ptr_HeadingsNamesArray->{$_l_Index}+Char:C90(Tab:K15:37)+$_ptr_HeadingsLevelUpArray->{$_l_Index}+Char:C90(Tab:K15:37)+$_t_ParentName0+Char:C90(Tab:K15:37)+String:C10($_ptr_HeadingsLevelArray->{$_l_Index})+Char:C90(Tab:K15:37)+$_ptr_HeadingsGroupCodeArray->{$_l_Index}+Char:C90(Tab:K15:37)+$_ptr_AccountCodeRangeFromArray->{$_l_Index}+Char:C90(Tab:K15:37)+$_ptr_AccountCodeRangeToArray->{$_l_Index}+Char:C90(13))
							$_t_ParentName1:=$_ptr_HeadingsNamesArray->{$_l_Index}
							$_t_parentCode1:=$_ptr_HeadingsCodesArray->{$_l_Index}
							
							
							$_t_CurrentHeadingCode:=$_ptr_HeadingsCodesArray->{$_l_Index}
							$_t_CurrentHeadingName:=$_ptr_HeadingsNamesArray->{$_l_Index}
							$_t_CurrentLevelUpCode:=$_ptr_HeadingsLevelUpArray->{$_l_Index}
							$_t_CurrentGroupCode:=$_ptr_HeadingsGroupCodeArray->{$_l_Index}
							$_l_CurrentLevel:=$_ptr_HeadingsLevelArray->{$_l_Index}
							
							//`
							
						End if 
						//```
					End for 
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					CLOSE DOCUMENT:C267($_ti_DocRef2)
					Gen_Alert("Template Exported")
				End if 
			Else 
				Gen_Confirm("Export the Chart of accounts for excel")
				If (OK=1)
					Gen_Alert("This is similar to the Tab delimited format except the the document is converted into an excel worksheet")
					Gen_Alert("This will export two documents the first is a blank template of the column headers the second(Optional) is the current data in that format")
					
					$_t_ExportPath:=Select folder:C670("Please select the export folder:")
					$_bo_IncludeLayers:=False:C215
					$_bo_IncludeAnalysis:=False:C215
					
					For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
						If (DB_at_LayerCodes{$_l_Index}#"")
							$_bo_IncludeLayers:=True:C214
							$_l_Index:=Size of array:C274(DB_At_SubHeadingLevel)
						End if 
					End for 
					//$_bo_IncludeLayers:=(Records in table([LAYERS])>0) & (Records in table([ACCOUNTS_LAYERS])>0)
					For ($_l_index; 1; Size of array:C274(DB_At_SubHeadingLevel))
						If (DB_at_AnalysisCodes{$_l_index}#"")
							$_bo_IncludeAnalysis:=True:C214
							$_l_index:=Size of array:C274(DB_At_SubHeadingLevel)
						End if 
					End for 
					
					$_t_WorkbookReference:=SCPT_XL_workbook_create
					$_t_WorkbookReference:=SCPT_XL_workbook_save_as_xls($_t_WorkbookReference; $_t_ExportPath+"HeadingsTemplate.xls")
					SCPT_XL_APPLICATION("Show")
					$_t_FullName:=SCPT_XL_workbook_get_full_name($_t_WorkbookReference)
					$_l_SheetCount:=SCPT_XL_sheet_count($_t_WorkbookReference)  //this should be one
					SCPT_XL_sheet_set_name($_t_WorkbookReference; 1; "Headings")
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "A1"; "Heading Code(Identifier)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "A1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "A"; 22)
					
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "B1"; "Heading Name")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "B1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "B1"; 25)
					
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "C1"; "Parent Heading Code(Blank for top level)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "C1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "C1"; 36)
					
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "D1"; "Parent Heading Name")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "D1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "D1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "E1"; "Heading Level(Optional)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "E1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "E1"; 20)
					
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "F1"; "Report Group(Top level heading-Optional")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "F1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "F1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "G1"; "Account Code Range From(optional)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "G1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "G1"; 35)
					SCPT_XL_range_set_value($_t_WorkbookReference; "Headings"; "H1"; "Account Code Range to(optional)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference; "Headings"; "H1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference; "Headings"; "H1"; 35)
					SCPT_XL_workbook_save($_t_WorkbookReference)
					//````
					$_t_WorkbookReference3:=SCPT_XL_workbook_create
					$_t_WorkbookReference3:=SCPT_XL_workbook_save_as_xls($_t_WorkbookReference3; $_t_ExportPath+"Accounts.xls")
					SCPT_XL_APPLICATION("Show")
					$_t_FullName:=SCPT_XL_workbook_get_full_name($_t_WorkbookReference3)
					$_l_SheetCount3:=SCPT_XL_sheet_count($_t_WorkbookReference3)  //this should be one
					SCPT_XL_sheet_set_name($_t_WorkbookReference3; 1; "Accounts")
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "A1"; "Account Code(Identifier)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "A1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "A1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "B1"; "Account Name")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "B1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "B1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "C1"; "Heading Code(Identifier)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "C1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "C1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "D1"; "Heading Name")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "D1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "D1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "E1"; "Parent Heading Code(Blank for top level)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "E1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "E1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "F1"; "Parent Heading Name")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "F1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "F1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "G1"; "Heading Level(Optional)")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "G1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "G1"; 20)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "H1"; "Report Group(Top level heading-Optional")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "H1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "H1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "I1"; "input Output")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "I1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "I1"; 35)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "J1"; "Balance Sheet Account")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "J1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "J1"; 20)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "K1"; "Profit Sheet Account")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "K1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "K1"; 20)
					
					SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "L1"; "Accounts Group")
					SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "L1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "L1"; 25)
					
					If ($_bo_IncludeLayers)
						SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "M1"; "Layer Restrictions")
						SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "M1"; True:C214)
						SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "M1"; 35)
						
					End if 
					If ($_bo_IncludeAnalysis)
						SCPT_XL_range_set_value($_t_WorkbookReference3; "Accounts"; "N1"; "Analysis Code Restrictions")
						SCPT_XL_range_set_font_bold($_t_WorkbookReference3; "Accounts"; "N1"; True:C214)
						SCPT_XL_range_set_width($_t_WorkbookReference3; "Accounts"; "N1"; 35)
					End if 
					
					SCPT_XL_workbook_save($_t_WorkbookReference3)
					//```
					$_t_WorkbookReference2:=SCPT_XL_workbook_create
					$_t_WorkbookReference2:=SCPT_XL_workbook_save_as_xls($_t_WorkbookReference2; $_t_ExportPath+"HeadingsData.xls")
					SCPT_XL_APPLICATION("Show")
					$_t_full_name2:=SCPT_XL_workbook_get_full_name($_t_WorkbookReference2)
					$_l_SheetCount2:=SCPT_XL_sheet_count($_t_WorkbookReference2)  //this should be one
					SCPT_XL_sheet_set_name($_t_WorkbookReference2; 1; "Headings Data")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "A1"; "Heading Code(Identifier)")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "B1"; "Heading Name")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "C1"; "Parent Heading Code(Blank for top level)")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "D1"; "Parent Heading Name")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "E1"; "Heading Level(Optional)")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "F1"; "Report Group(Top level heading-Optional")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "G1"; "Account Code Range From(optional)")
					SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "H1"; "Account Code Range to(optional)")
					
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "A1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "A"; 22)
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "B1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "B1"; 25)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "C1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "C1"; 36)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "D1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "D1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "E1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "E1"; 20)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "F1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "F1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "G1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "G1"; 35)
					SCPT_XL_range_set_font_bold($_t_WorkbookReference2; "Headings Data"; "H1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference2; "Headings Data"; "H1"; 35)
					SCPT_XL_workbook_save($_t_WorkbookReference2)
					
					$_t_WorkbookReference4:=SCPT_XL_workbook_create
					$_t_WorkbookReference4:=SCPT_XL_workbook_save_as_xls($_t_WorkbookReference4; $_t_ExportPath+"AcoountsData.xls")
					SCPT_XL_APPLICATION("Show")
					$_t_FullName:=SCPT_XL_workbook_get_full_name($_t_WorkbookReference4)
					$_l_SheetCount3:=SCPT_XL_sheet_count($_t_WorkbookReference4)  //this should be one
					SCPT_XL_sheet_set_name($_t_WorkbookReference4; 1; "Accounts Data")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A1"; "Account Code(Identifier)")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B1"; "Account Name")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C1"; "Heading Code(Identifier)")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D1"; "Heading Name")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E1"; "Parent Heading Code(Blank for top level)")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F1"; "Parent Heading Name")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G1"; "Heading Level(Optional)")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H1"; "Report Group(Top level heading-Optional")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I1"; "input Output")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J1"; "Balance Sheet Account")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K1"; "Profit Sheet Account")
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L1"; "Accounts Group")
					If ($_bo_IncludeLayers)
						SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M1"; "Layer Restrictions")
					End if 
					If ($_bo_IncludeAnalysis)
						SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N1"; "Analysis Code Restrictions")
					End if 
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "A1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "A1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "B1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "B1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "C1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "C1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "D1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "D1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "E1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "E1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "F1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "F1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "G1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "G1"; 20)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "H1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "H1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "I1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "I1"; 35)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "J1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "J1"; 20)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "K1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "K1"; 20)
					
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "L1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "L1"; 25)
					
					If ($_bo_IncludeLayers)
						SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "M1"; True:C214)
						SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "M1"; 35)
						
					End if 
					If ($_bo_IncludeAnalysis)
						SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "N1"; True:C214)
						SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "N1"; 35)
						
						
					End if 
					SCPT_XL_workbook_save($_t_WorkbookReference4)
					//``````````````````````
					$_l_ExcelRowNumber:=2
					$_l_ExcelRowNumber2:=2
					//QUERY([HEADINGS];[HEADINGS]Group_Code="")
					//ORDER BY([HEADINGS];[HEADINGS]Heading_Code;>)
					//COPY NAMED SELECTION([HEADINGS];"Level0Group")
					//$_l_GroupsCount:=Records in selection([HEADINGS])
					$_l_GroupsCount:=Size of array:C274(DB_at_SubHeadings)
					//`````````
					For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
						If (DB_at_AccountNames{$_l_Index}#"")
							//QUERY([ACCOUNTS];[ACCOUNTS]Report_Heading=[HEADINGS]Heading_Code)
							//$_t_ParentName0:=""
							//ORDER BY([ACCOUNTS];[ACCOUNTS]Account_Code;>)
							//For ($_l_AccountsIndex;1;Records in selection([ACCOUNTS]))
							//````````
							$_t_AccountGroup:=DB_at_AccountPreferenceGroups{$_l_Index}
							If ($_t_AccountGroup="")
								
								If (DM_T_BankAccFrom#"")
									If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccFrom)
										If (DM_T_BankAccTo="")
											If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccFrom)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										Else 
											If (DB_at_AccountCodes{$_l_Index}<=DM_T_BankAccTo)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccTo#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									End if 
								End if 
								
								
								
								If (DM_T_BankAccCurrencyExchange#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyExchange)
										$_t_AccountGroup:="Currency Exchange Control"
									End if 
								End if 
								If (DM_T_BankAccCurrencyCharges#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyCharges)
										$_t_AccountGroup:="Currency Bank Charges"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitBFWD#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitBFWD)
										$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitYTD#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitYTD)
										$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceAdjustments#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:="Balance Sheet Adjusment Account"
									End if 
								End if 
								
								If (DM_T_nomVatInput#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:=$_t_VatReturn
									End if 
								End if 
								If (DM_T_nomVatOutput#"")
									If (DB_at_AccountCodes{$_l_Index}=DM_T_nomVatOutput)
										$_t_AccountGroup:=$_t_VatPayment
									End if 
								End if 
								
								If (DM_T_BankAccCashFrom#"")
									If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccCashFrom)
										If (DM_T_BankAccCashTo#"")
											
											If (DM_T_BankAccCashTo>=DB_at_AccountCodes{$_l_Index})
												$_t_AccountGroup:="Cash Accounts"
											End if 
										Else 
											If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCashFrom)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccCashTo#"")
										If (DM_T_BankAccCashTo=DB_at_AccountCodes{$_l_Index})
											$_t_AccountGroup:="Cash Accounts"
										End if 
									End if 
								End if 
							End if 
							
							$_t_AccLayerRestrictions:=""
							$_t_AccAnalysisRestrictions:=""
							If ($_bo_IncludeLayers)
								$_t_AccLayerRestrictions:=DB_at_LayerCodes{$_l_Index}
							End if 
							If ($_bo_IncludeAnalysis)
								$_t_AccAnalysisRestrictions:=DB_at_AnalysisCodes{$_l_Index}
							End if 
							//```
							//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_AccountCodes;->DB_at_AccountNames;->DB_at_AccountPreferenceGroups;->DB_at_AccountIO;->DB_al_MultiCurrencyValuation;->DB_at_MultiCurrencyValuation;->DB_abo_NoNominalLedgerPostings;->DB_at_ProfitBalance;->DB_at_AnalysisCodes;->DB_at_LayerCodes;->DB_abo_AccountDefault;->DB_at_AccountHeadings;->DB_at_ReportHeadings)
							
							If (DB_at_ProfitBalance{$_l_Index}="B")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); DB_at_AccountCodes{$_l_Index})
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); DB_at_AccountNames{$_l_Index})
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingCode)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingName)
								
								
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); $_t_CurrentLevelUpCode)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName0)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10($_l_CurrentLevel))
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); DB_at_AccountIO{$_l_Index})
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
								If ($_bo_IncludeLayers)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
								End if 
								If ($_bo_IncludeAnalysis)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
								End if 
								$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
							Else 
								
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); DB_at_AccountCodes{$_l_Index})
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); DB_at_AccountNames{$_l_Index})
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingCode)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingName)
								
								
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); $_t_CurrentLevelUpCode)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName0)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10($_l_CurrentLevel))
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); DB_at_AccountIO{$_l_Index})
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
								If ($_bo_IncludeLayers)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
								End if 
								If ($_bo_IncludeAnalysis)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
								End if 
								$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
							End if 
							
							//NEXT RECORD([ACCOUNTS])
							//End for
						End if 
						If (DB_at_Headings{$_l_Index}#"")  //its a heading
							Case of 
								: (DB_at_ACCHHeadings1{$_l_Index}#"")
									$_l_LevelArrays:=1
								: (DB_at_ACCHHeadings2{$_l_Index}#"")
									$_l_LevelArrays:=2
								: (DB_at_ACCHHeadings3{$_l_Index}#"")
									$_l_LevelArrays:=3
								: (DB_at_ACCHHeadings4{$_l_Index}#"")
									$_l_LevelArrays:=4
								: (DB_at_ACCHHeadings5{$_l_Index}#"")
									$_l_LevelArrays:=5
							End case 
							//$_t_CurrentHeadingCode:=""
							//$_t_CurrentHeadingName:=""
							//$_t_CurrentLevelUpCode:=""
							//$_t_CurrentGroupCode:=""
							//$_l_CurrentLevel:=0
							//TRACE
							$_ptr_HeadingsCodesArray:=Get pointer:C304("DB_at_ACCHHeadings"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsNamesArray:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsLevelUpArray:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsLevelArray:=Get pointer:C304("DB_aI_HeadingLevel"+String:C10($_l_LevelArrays))
							$_ptr_HeadingsGroupCodeArray:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_LevelArrays))
							$_ptr_AccountCodeRangeFromArray:=Get pointer:C304("DB_at_HeadingAccCodeFrom"+String:C10($_l_LevelArrays))
							$_ptr_AccountCodeRangeToArray:=Get pointer:C304("DB_at_HeadingAccCodeTo"+String:C10($_l_LevelArrays))
							$_t_CodeUp:=""
							$_t_CodeUp:=($_ptr_HeadingsLevelUpArray->{$_l_Index})
							If ($_t_CodeUp#"")
								$_l_FindRow:=Find in array:C230(DB_at_Headings; $_t_CodeUp)
							Else 
								$_l_FindRow:=0
							End if 
							
							If ($_l_FindRow>0)
								Case of 
									: (DB_at_ACCHHeadings1{$_l_FindRow}#"")
										$_l_LevelArrays2:=1
									: (DB_at_ACCHHeadings2{$_l_FindRow}#"")
										$_l_LevelArrays2:=2
									: (DB_at_ACCHHeadings3{$_l_FindRow}#"")
										$_l_LevelArrays2:=3
									: (DB_at_ACCHHeadings4{$_l_FindRow}#"")
										$_l_LevelArrays2:=4
									: (DB_at_ACCHHeadings5{$_l_FindRow}#"")
										$_l_LevelArrays2:=5
								End case 
								$_ptr_HeadingsNames2Array:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays2))
								$_t_ParentName0:=$_ptr_HeadingsNames2Array->{$_l_FindRow}
								
							Else 
								$_t_ParentName0:=""
							End if 
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "A"+String:C10($_l_ExcelRowNumber2); $_ptr_HeadingsCodesArray->{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "B"+String:C10($_l_ExcelRowNumber2); $_ptr_HeadingsNamesArray->{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "C"+String:C10($_l_ExcelRowNumber2); $_ptr_HeadingsLevelUpArray->{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "D"+String:C10($_l_ExcelRowNumber2); $_t_ParentName0)
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "E"+String:C10($_l_ExcelRowNumber2); String:C10($_ptr_HeadingsLevelArray->{$_l_Index}))
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "F"+String:C10($_l_ExcelRowNumber2); $_ptr_HeadingsGroupCodeArray->{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "G"+String:C10($_l_ExcelRowNumber2); $_ptr_AccountCodeRangeFromArray->{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference2; "Headings Data"; "H"+String:C10($_l_ExcelRowNumber2); $_ptr_AccountCodeRangeToArray->{$_l_Index})
							$_l_ExcelRowNumber2:=$_l_ExcelRowNumber2+1
							
							$_t_ParentName1:=$_ptr_HeadingsNamesArray->{$_l_Index}
							$_t_parentCode1:=$_ptr_HeadingsCodesArray->{$_l_Index}
							
							
							$_t_CurrentHeadingCode:=$_ptr_HeadingsCodesArray->{$_l_Index}
							$_t_CurrentHeadingName:=$_ptr_HeadingsNamesArray->{$_l_Index}
							$_t_CurrentLevelUpCode:=$_ptr_HeadingsLevelUpArray->{$_l_Index}
							$_t_CurrentGroupCode:=$_ptr_HeadingsGroupCodeArray->{$_l_Index}
							$_l_CurrentLevel:=$_ptr_HeadingsLevelArray->{$_l_Index}
							
							//`
							
						End if 
						//```
					End for 
					
					
					
					SCPT_XL_workbook_save($_t_WorkbookReference)
					SCPT_XL_workbook_save($_t_WorkbookReference2)
					SCPT_XL_workbook_save($_t_WorkbookReference3)
					SCPT_XL_workbook_save($_t_WorkbookReference4)
					
					
					
					
					//Close DocUMENT($_ti_DocumentRef)
					//Close DocUMENT($_ti_DocRef2)
					Gen_Alert("Template Exported")
					
				End if 
				
			End if 
		End if 
	Else 
		//The user export will be provided as a means of exporting the data for manual manipulation
		//the intention here is that this would be used during inital setup. it is not intended as a way to access the existing setup and edit
		//this screen is therefore restricted to being displayed when there is no data in the database
		//`This user export only exports one document which is the accounts based on the Headings order-this will either have been manually created on this screen or have been imported from one of the defaults
		//on exit this screen will save the data(uses a transaction to protect the datafile).
		//end if
		//so for user manipulation only the excel and tab delimited formats are offered.
		//note that the import routine will verify  imported data complies and if it does not will not allow import if the data does not comply
		
		Gen_Confirm("Export the Chart of accounts in Tab delimited format or direct to Excel. Note that Excel must be installed on this computer for the Excel option to work?"; "Tabbed"; "Excel")
		If (OK=1)
			$_t_ExportPath:=Select folder:C670("Please select the export folder:")
			If (OK=1) & ($_t_ExportPath#"")
				//$_t_ExportPath:=$_t_ExportPath+$_t_TableName+".txt"
				
				$_bo_IncludeLayers:=False:C215
				$_bo_IncludeAnalysis:=False:C215
				
				For ($_l_index; 1; Size of array:C274(DB_At_SubHeadingLevel))
					If (DB_at_LayerCodes{$_l_index}#"")
						$_bo_IncludeLayers:=True:C214
						$_l_index:=Size of array:C274(DB_At_SubHeadingLevel)
					End if 
				End for 
				//$_bo_IncludeLayers:=(Records in table([LAYERS])>0) & (Records in table([ACCOUNTS_LAYERS])>0)
				For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
					If (DB_at_AnalysisCodes{$_l_Index}#"")
						$_bo_IncludeAnalysis:=True:C214
						$_l_Index:=Size of array:C274(DB_At_SubHeadingLevel)
					End if 
				End for 
				
				
				$_ti_DocRef2:=Create document:C266($_t_ExportPath+"Accounts_Data"+".txt"; "TEXT")
				SEND PACKET:C103($_ti_DocRef2; "Account Code(Identifier)"+Char:C90(Tab:K15:37)+"Account Name"+Char:C90(Tab:K15:37)+"Heading Code(Identifier)"+Char:C90(Tab:K15:37)+"Heading Name"+Char:C90(Tab:K15:37)+"Parent Heading Code(Blank for top level)"+Char:C90(Tab:K15:37)+"Parent Heading Name"+Char:C90(Tab:K15:37)+"Heading Level(Optional)"+Char:C90(Tab:K15:37)+"Report Group(Top level heading-Optional"+Char:C90(Tab:K15:37)+"input Output"+Char:C90(Tab:K15:37)+"Balance Sheet Account"+Char:C90(Tab:K15:37)+"Profit Sheet Account"+Char:C90(Tab:K15:37)+"Accounts Group")
				If ($_bo_IncludeLayers)
					SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+"Layer Restrictions")
				End if 
				If ($_bo_IncludeAnalysis)
					SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+"Analysis Code Restrictions")
				End if 
				SEND PACKET:C103($_ti_DocRef2; Char:C90(13))
				If (False:C215)
					QUERY:C277([HEADINGS:84]; [HEADINGS:84]Group_Code:5="")
					ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
					COPY NAMED SELECTION:C331([HEADINGS:84]; "Level0Group")
					$_l_GroupsCount:=Records in selection:C76([HEADINGS:84])
					For ($_l_Index; 1; $_l_GroupsCount)
						USE NAMED SELECTION:C332("Level0Group")
						GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index)
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
						$_t_ParentName0:=""
						ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
						For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
							//````````
							$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
							If ($_t_AccountGroup="")
								
								If (DM_T_BankAccFrom#"")
									If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
										If (DM_T_BankAccTo="")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										Else 
											If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccTo#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									End if 
								End if 
								
								
								
								If (DM_T_BankAccCurrencyExchange#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
										$_t_AccountGroup:="Currency Exchange Control"
									End if 
								End if 
								If (DM_T_BankAccCurrencyCharges#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
										$_t_AccountGroup:="Currency Bank Charges"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitBFWD#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
										$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitYTD#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
										$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceAdjustments#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:="Balance Sheet Adjusment Account"
									End if 
								End if 
								
								If (DM_T_nomVatInput#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:=$_t_VatReturn
									End if 
								End if 
								If (DM_T_nomVatOutput#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
										$_t_AccountGroup:=$_t_VatPayment
									End if 
								End if 
								
								If (DM_T_BankAccCashFrom#"")
									If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
										If (DM_T_BankAccCashTo#"")
											
											If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										Else 
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccCashTo#"")
										If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
											$_t_AccountGroup:="Cash Accounts"
										End if 
									End if 
								End if 
							End if 
							
							$_t_AccLayerRestrictions:=""
							$_t_AccAnalysisRestrictions:=""
							If ($_bo_IncludeLayers)
								QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
								If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
									SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
									//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
									//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
									
									For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
										If ($_l_LayersIndex=1)
											$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
										Else 
											$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
										End if 
									End for 
									
								End if 
							End if 
							If ($_bo_IncludeAnalysis)
								QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
								If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
									SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
									//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
									//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
									
									For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
										If ($_l_AnalysisIndex=1)
											$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
										Else 
											$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
										End if 
									End for 
									
								End if 
							End if 
							//```
							If ([ACCOUNTS:32]PB:4="B")
								SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName0+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
							Else 
								SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName0+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
							End if 
							
							NEXT RECORD:C51([ACCOUNTS:32])
						End for 
						
						$_t_ParentName1:=[HEADINGS:84]Heading_Name:2
						$_t_parentCode1:=[HEADINGS:84]Heading_Code:1
						QUERY:C277([HEADINGS:84]; [HEADINGS:84]Group_Code:5=$_t_parentCode1; *)
						QUERY:C277([HEADINGS:84];  & ; [HEADINGS:84]Level_Up_Code:4="")  //``
						ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
						COPY NAMED SELECTION:C331([HEADINGS:84]; "Level1Group")
						$_l_GroupCount1:=Records in selection:C76([HEADINGS:84])
						For ($_l_Index5; 1; $_l_GroupCount1)
							USE NAMED SELECTION:C332("Level1Group")
							GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index5)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
							
							ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
							For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
								$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
								If ($_t_AccountGroup="")
									
									If (DM_T_BankAccFrom#"")
										If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
											If (DM_T_BankAccTo="")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
													$_t_AccountGroup:="Bank Accounts"
												End if 
											Else 
												If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
													$_t_AccountGroup:="Bank Accounts"
												End if 
											End if 
										End if 
									Else 
										If (DM_T_BankAccTo#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										End if 
									End if 
									
									
									
									If (DM_T_BankAccCurrencyExchange#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
											$_t_AccountGroup:="Currency Exchange Control"
										End if 
									End if 
									If (DM_T_BankAccCurrencyCharges#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
											$_t_AccountGroup:="Currency Bank Charges"
										End if 
									End if 
									If (DM_T_BankAccBalanceProfitBFWD#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
											$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
										End if 
									End if 
									If (DM_T_BankAccBalanceProfitYTD#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
											$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
										End if 
									End if 
									If (DM_T_BankAccBalanceAdjustments#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
											$_t_AccountGroup:="Balance Sheet Adjusment Account"
										End if 
									End if 
									
									If (DM_T_nomVatInput#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
											$_t_AccountGroup:=$_t_VatReturn
										End if 
									End if 
									If (DM_T_nomVatOutput#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
											$_t_AccountGroup:=$_t_VatPayment
										End if 
									End if 
									
									If (DM_T_BankAccCashFrom#"")
										If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
											If (DM_T_BankAccCashTo#"")
												
												If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
													$_t_AccountGroup:="Cash Accounts"
												End if 
											Else 
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
													$_t_AccountGroup:="Cash Accounts"
												End if 
											End if 
										End if 
									Else 
										If (DM_T_BankAccCashTo#"")
											If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										End if 
									End if 
								End if 
								
								$_t_AccLayerRestrictions:=""
								$_t_AccAnalysisRestrictions:=""
								If ($_bo_IncludeLayers)
									QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
									If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
										SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
										//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
										//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
										
										For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
											If ($_l_LayersIndex=1)
												$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
											Else 
												$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
											End if 
										End for 
										
									End if 
								End if 
								If ($_bo_IncludeAnalysis)
									QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
									If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
										SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
										//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
										//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
										
										For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
											If ($_l_AnalysisIndex=1)
												$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
											Else 
												$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
											End if 
										End for 
										
									End if 
								End if 
								//```
								If ([ACCOUNTS:32]PB:4="B")
									SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName1+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
								Else 
									SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName1+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
								End if 
								
								NEXT RECORD:C51([ACCOUNTS:32])
							End for 
							$_t_ParentName2:=[HEADINGS:84]Heading_Name:2
							$_t_ParentCode2:=[HEADINGS:84]Heading_Code:1
							QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode2)
							//``
							ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
							COPY NAMED SELECTION:C331([HEADINGS:84]; "Level2Group")
							$_l_GroupCount2:=Records in selection:C76([HEADINGS:84])
							For ($_l_Index2; 1; $_l_GroupCount2)
								USE NAMED SELECTION:C332("Level2Group")
								GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index2)
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
								
								ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
								For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
									$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
									If ($_t_AccountGroup="")
										
										If (DM_T_BankAccFrom#"")
											If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
												If (DM_T_BankAccTo="")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
														$_t_AccountGroup:="Bank Accounts"
													End if 
												Else 
													If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
														$_t_AccountGroup:="Bank Accounts"
													End if 
												End if 
											End if 
										Else 
											If (DM_T_BankAccTo#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
													$_t_AccountGroup:="Bank Accounts"
												End if 
											End if 
										End if 
										
										
										
										If (DM_T_BankAccCurrencyExchange#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
												$_t_AccountGroup:="Currency Exchange Control"
											End if 
										End if 
										If (DM_T_BankAccCurrencyCharges#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
												$_t_AccountGroup:="Currency Bank Charges"
											End if 
										End if 
										If (DM_T_BankAccBalanceProfitBFWD#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
												$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
											End if 
										End if 
										If (DM_T_BankAccBalanceProfitYTD#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
												$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
											End if 
										End if 
										If (DM_T_BankAccBalanceAdjustments#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
												$_t_AccountGroup:="Balance Sheet Adjusment Account"
											End if 
										End if 
										
										If (DM_T_nomVatInput#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
												$_t_AccountGroup:=$_t_VatReturn
											End if 
										End if 
										If (DM_T_nomVatOutput#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
												$_t_AccountGroup:=$_t_VatPayment
											End if 
										End if 
										
										If (DM_T_BankAccCashFrom#"")
											If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
												If (DM_T_BankAccCashTo#"")
													
													If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
														$_t_AccountGroup:="Cash Accounts"
													End if 
												Else 
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
														$_t_AccountGroup:="Cash Accounts"
													End if 
												End if 
											End if 
										Else 
											If (DM_T_BankAccCashTo#"")
												If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
													$_t_AccountGroup:="Cash Accounts"
												End if 
											End if 
										End if 
									End if 
									
									$_t_AccLayerRestrictions:=""
									$_t_AccAnalysisRestrictions:=""
									If ($_bo_IncludeLayers)
										QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
										If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
											SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
											//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
											//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
											
											For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
												If ($_l_LayersIndex=1)
													$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
												Else 
													$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
												End if 
											End for 
											
										End if 
									End if 
									If ($_bo_IncludeAnalysis)
										QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
										If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
											SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
											//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
											//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
											
											For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
												If ($_l_AnalysisIndex=1)
													$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
												Else 
													$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
												End if 
											End for 
											
										End if 
									End if 
									//```
									If ([ACCOUNTS:32]PB:4="B")
										SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName2+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
									Else 
										SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName2+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
									End if 
									NEXT RECORD:C51([ACCOUNTS:32])
								End for 
								$_t_ParentName3:=[HEADINGS:84]Heading_Name:2
								$_t_ParentCode3:=[HEADINGS:84]Heading_Code:1
								QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode3)
								//``
								ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
								COPY NAMED SELECTION:C331([HEADINGS:84]; "Level3Group")
								$_l_GroupCount3:=Records in selection:C76([HEADINGS:84])
								For ($_l_Index3; 1; $_l_GroupCount3)
									USE NAMED SELECTION:C332("Level3Group")
									GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index3)
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
									
									ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
									For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
										$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
										If ($_t_AccountGroup="")
											
											If (DM_T_BankAccFrom#"")
												If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
													If (DM_T_BankAccTo="")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
															$_t_AccountGroup:="Bank Accounts"
														End if 
													Else 
														If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
															$_t_AccountGroup:="Bank Accounts"
														End if 
													End if 
												End if 
											Else 
												If (DM_T_BankAccTo#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
														$_t_AccountGroup:="Bank Accounts"
													End if 
												End if 
											End if 
											
											
											
											If (DM_T_BankAccCurrencyExchange#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
													$_t_AccountGroup:="Currency Exchange Control"
												End if 
											End if 
											If (DM_T_BankAccCurrencyCharges#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
													$_t_AccountGroup:="Currency Bank Charges"
												End if 
											End if 
											If (DM_T_BankAccBalanceProfitBFWD#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
													$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
												End if 
											End if 
											If (DM_T_BankAccBalanceProfitYTD#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
													$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
												End if 
											End if 
											If (DM_T_BankAccBalanceAdjustments#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
													$_t_AccountGroup:="Balance Sheet Adjusment Account"
												End if 
											End if 
											
											If (DM_T_nomVatInput#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
													$_t_AccountGroup:=$_t_VatReturn
												End if 
											End if 
											If (DM_T_nomVatOutput#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
													$_t_AccountGroup:=$_t_VatPayment
												End if 
											End if 
											
											If (DM_T_BankAccCashFrom#"")
												If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
													If (DM_T_BankAccCashTo#"")
														
														If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
															$_t_AccountGroup:="Cash Accounts"
														End if 
													Else 
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
															$_t_AccountGroup:="Cash Accounts"
														End if 
													End if 
												End if 
											Else 
												If (DM_T_BankAccCashTo#"")
													If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
														$_t_AccountGroup:="Cash Accounts"
													End if 
												End if 
											End if 
										End if 
										
										$_t_AccLayerRestrictions:=""
										$_t_AccAnalysisRestrictions:=""
										If ($_bo_IncludeLayers)
											QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
											If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
												SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
												//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
												//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
												
												For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
													If ($_l_LayersIndex=1)
														$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
													Else 
														$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
													End if 
												End for 
												
											End if 
										End if 
										If ($_bo_IncludeAnalysis)
											QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
											If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
												SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
												//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
												//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
												
												For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
													If ($_l_AnalysisIndex=1)
														$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
													Else 
														$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
													End if 
												End for 
												
											End if 
										End if 
										//```
										If ([ACCOUNTS:32]PB:4="B")
											SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName3+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
										Else 
											SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName3+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
										End if 
										NEXT RECORD:C51([ACCOUNTS:32])
									End for 
									$_t_ParentName4:=[HEADINGS:84]Heading_Name:2
									$_t_ParentCode4:=[HEADINGS:84]Heading_Code:1
									QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode4)
									//``
									ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
									COPY NAMED SELECTION:C331([HEADINGS:84]; "Level4Group")
									$_l_GroupCount4:=Records in selection:C76([HEADINGS:84])
									For ($_l_Index4; 1; $_l_GroupCount4)
										USE NAMED SELECTION:C332("Level4Group")
										GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index4)
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
										
										ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
										For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
											$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
											If ($_t_AccountGroup="")
												
												If (DM_T_BankAccFrom#"")
													If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
														If (DM_T_BankAccTo="")
															If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
																$_t_AccountGroup:="Bank Accounts"
															End if 
														Else 
															If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
																$_t_AccountGroup:="Bank Accounts"
															End if 
														End if 
													End if 
												Else 
													If (DM_T_BankAccTo#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
															$_t_AccountGroup:="Bank Accounts"
														End if 
													End if 
												End if 
												
												
												
												If (DM_T_BankAccCurrencyExchange#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
														$_t_AccountGroup:="Currency Exchange Control"
													End if 
												End if 
												If (DM_T_BankAccCurrencyCharges#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
														$_t_AccountGroup:="Currency Bank Charges"
													End if 
												End if 
												If (DM_T_BankAccBalanceProfitBFWD#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
														$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
													End if 
												End if 
												If (DM_T_BankAccBalanceProfitYTD#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
														$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
													End if 
												End if 
												If (DM_T_BankAccBalanceAdjustments#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
														$_t_AccountGroup:="Balance Sheet Adjusment Account"
													End if 
												End if 
												
												If (DM_T_nomVatInput#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
														$_t_AccountGroup:=$_t_VatReturn
													End if 
												End if 
												If (DM_T_nomVatOutput#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
														$_t_AccountGroup:=$_t_VatPayment
													End if 
												End if 
												
												If (DM_T_BankAccCashFrom#"")
													If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
														If (DM_T_BankAccCashTo#"")
															
															If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
																$_t_AccountGroup:="Cash Accounts"
															End if 
														Else 
															If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
																$_t_AccountGroup:="Cash Accounts"
															End if 
														End if 
													End if 
												Else 
													If (DM_T_BankAccCashTo#"")
														If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
															$_t_AccountGroup:="Cash Accounts"
														End if 
													End if 
												End if 
											End if 
											
											$_t_AccLayerRestrictions:=""
											$_t_AccAnalysisRestrictions:=""
											If ($_bo_IncludeLayers)
												QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
												If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
													SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
													//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
													//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
													
													For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
														If ($_l_LayersIndex=1)
															$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
														Else 
															$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
														End if 
													End for 
													
												End if 
											End if 
											If ($_bo_IncludeAnalysis)
												QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
												If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
													SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
													//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
													//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
													
													For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
														If ($_l_AnalysisIndex=1)
															$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
														Else 
															$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
														End if 
													End for 
													
												End if 
											End if 
											//```
											If ([ACCOUNTS:32]PB:4="B")
												SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName4+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
											Else 
												SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName4+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
											End if 
											NEXT RECORD:C51([ACCOUNTS:32])
										End for 
										$_t_ParentName5:=[HEADINGS:84]Heading_Name:2
										$_t_ParentCode5:=[HEADINGS:84]Heading_Code:1
										QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode5)
										
										//``
										ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
										COPY NAMED SELECTION:C331([HEADINGS:84]; "Level5Group")
										$_l_Groups5:=Records in selection:C76([HEADINGS:84])
										For ($_l_GroupsIndex; 1; $_l_Groups5)
											USE NAMED SELECTION:C332("Level5Group")
											GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_GroupsIndex)
											QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
											
											ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
											For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
												$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
												If ($_t_AccountGroup="")
													
													If (DM_T_BankAccFrom#"")
														If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
															If (DM_T_BankAccTo="")
																If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
																	$_t_AccountGroup:="Bank Accounts"
																End if 
															Else 
																If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
																	$_t_AccountGroup:="Bank Accounts"
																End if 
															End if 
														End if 
													Else 
														If (DM_T_BankAccTo#"")
															If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
																$_t_AccountGroup:="Bank Accounts"
															End if 
														End if 
													End if 
													
													
													
													If (DM_T_BankAccCurrencyExchange#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
															$_t_AccountGroup:="Currency Exchange Control"
														End if 
													End if 
													If (DM_T_BankAccCurrencyCharges#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
															$_t_AccountGroup:="Currency Bank Charges"
														End if 
													End if 
													If (DM_T_BankAccBalanceProfitBFWD#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
															$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
														End if 
													End if 
													If (DM_T_BankAccBalanceProfitYTD#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
															$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
														End if 
													End if 
													If (DM_T_BankAccBalanceAdjustments#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
															$_t_AccountGroup:="Balance Sheet Adjusment Account"
														End if 
													End if 
													
													If (DM_T_nomVatInput#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
															$_t_AccountGroup:=$_t_VatReturn
														End if 
													End if 
													If (DM_T_nomVatOutput#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
															$_t_AccountGroup:=$_t_VatPayment
														End if 
													End if 
													
													If (DM_T_BankAccCashFrom#"")
														If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
															If (DM_T_BankAccCashTo#"")
																
																If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
																	$_t_AccountGroup:="Cash Accounts"
																End if 
															Else 
																If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
																	$_t_AccountGroup:="Cash Accounts"
																End if 
															End if 
														End if 
													Else 
														If (DM_T_BankAccCashTo#"")
															If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
																$_t_AccountGroup:="Cash Accounts"
															End if 
														End if 
													End if 
												End if 
												
												$_t_AccLayerRestrictions:=""
												$_t_AccAnalysisRestrictions:=""
												If ($_bo_IncludeLayers)
													QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
													If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
														SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
														//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
														//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
														
														For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
															If ($_l_LayersIndex=1)
																$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
															Else 
																$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
															End if 
														End for 
														
													End if 
												End if 
												If ($_bo_IncludeAnalysis)
													QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
													If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
														SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
														//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
														//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
														
														For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
															If ($_l_AnalysisIndex=1)
																$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
															Else 
																$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
															End if 
														End for 
														
													End if 
												End if 
												//```
												If ([ACCOUNTS:32]PB:4="B")
													SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName5+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
												Else 
													SEND PACKET:C103($_ti_DocRef2; [ACCOUNTS:32]Account_Code:2+Char:C90(Tab:K15:37)+[ACCOUNTS:32]Account_Name:3+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Code:1+Char:C90(Tab:K15:37)+[HEADINGS:84]Heading_Name:2+Char:C90(Tab:K15:37)+[HEADINGS:84]Level_Up_Code:4+Char:C90(Tab:K15:37)+$_t_ParentName5+Char:C90(Tab:K15:37)+String:C10([HEADINGS:84]Heading_Level:3)+Char:C90(Tab:K15:37)+[HEADINGS:84]Group_Code:5+Char:C90(Tab:K15:37)+[ACCOUNTS:32]IO:5+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup+Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions+Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions+Char:C90(13))
												End if 
												NEXT RECORD:C51([ACCOUNTS:32])
											End for 
											//$_t_ParentName5:=[HEADINGS]Heading_Name
											//$_t_ParentCode5:=[HEADINGS]Heading_Code
											//QUERY([HEADINGS];[HEADINGS]Level_Up_Code=$_t_ParentCode5)
											
										End for 
										//```
									End for 
									//```
								End for 
								//```
								
							End for 
							//```
						End for 
						//```
					End for 
				End if 
				$_t_CurrentHeadingCode:=""
				$_t_CurrentHeadingName:=""
				$_t_CurrentLevelUpCode:=""
				$_t_CurrentGroupCode:=""
				$_l_CurrentLevel:=0
				$_t_ParentName0:=""
				For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
					If (DB_at_AccountNames{$_l_Index}#"")
						//QUERY([ACCOUNTS];[ACCOUNTS]Report_Heading=[HEADINGS]Heading_Code)
						//$_t_ParentName0:=""
						//ORDER BY([ACCOUNTS];[ACCOUNTS]Account_Code;>)
						//For ($_l_AccountsIndex;1;Records in selection([ACCOUNTS]))
						//````````
						$_t_AccountGroup:=DB_at_AccountPreferenceGroups{$_l_Index}
						If ($_t_AccountGroup="")
							
							If (DM_T_BankAccFrom#"")
								If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccFrom)
									If (DM_T_BankAccTo="")
										If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccFrom)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									Else 
										If (DB_at_AccountCodes{$_l_Index}<=DM_T_BankAccTo)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									End if 
								End if 
							Else 
								If (DM_T_BankAccTo#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
										$_t_AccountGroup:="Bank Accounts"
									End if 
								End if 
							End if 
							
							
							
							If (DM_T_BankAccCurrencyExchange#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyExchange)
									$_t_AccountGroup:="Currency Exchange Control"
								End if 
							End if 
							If (DM_T_BankAccCurrencyCharges#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyCharges)
									$_t_AccountGroup:="Currency Bank Charges"
								End if 
							End if 
							If (DM_T_BankAccBalanceProfitBFWD#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitBFWD)
									$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
								End if 
							End if 
							If (DM_T_BankAccBalanceProfitYTD#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitYTD)
									$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
								End if 
							End if 
							If (DM_T_BankAccBalanceAdjustments#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
									$_t_AccountGroup:="Balance Sheet Adjusment Account"
								End if 
							End if 
							
							If (DM_T_nomVatInput#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
									$_t_AccountGroup:=$_t_VatReturn
								End if 
							End if 
							If (DM_T_nomVatOutput#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_nomVatOutput)
									$_t_AccountGroup:=$_t_VatPayment
								End if 
							End if 
							
							If (DM_T_BankAccCashFrom#"")
								If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccCashFrom)
									If (DM_T_BankAccCashTo#"")
										
										If (DM_T_BankAccCashTo>=DB_at_AccountCodes{$_l_Index})
											$_t_AccountGroup:="Cash Accounts"
										End if 
									Else 
										If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCashFrom)
											$_t_AccountGroup:="Cash Accounts"
										End if 
									End if 
								End if 
							Else 
								If (DM_T_BankAccCashTo#"")
									If (DM_T_BankAccCashTo=DB_at_AccountCodes{$_l_Index})
										$_t_AccountGroup:="Cash Accounts"
									End if 
								End if 
							End if 
						End if 
						
						$_t_AccLayerRestrictions:=""
						$_t_AccAnalysisRestrictions:=""
						If ($_bo_IncludeLayers)
							$_t_AccLayerRestrictions:=DB_at_LayerCodes{$_l_Index}
						End if 
						If ($_bo_IncludeAnalysis)
							$_t_AccAnalysisRestrictions:=DB_at_AnalysisCodes{$_l_Index}
						End if 
						//```
						//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_AccountCodes;->DB_at_AccountNames;->DB_at_AccountPreferenceGroups;->DB_at_AccountIO;->DB_al_MultiCurrencyValuation;->DB_at_MultiCurrencyValuation;->DB_abo_NoNominalLedgerPostings;->DB_at_ProfitBalance;->DB_at_AnalysisCodes;->DB_at_LayerCodes;->DB_abo_AccountDefault;->DB_at_AccountHeadings;->DB_at_ReportHeadings)
						
						If (DB_at_ProfitBalance{$_l_Index}="B")
							SEND PACKET:C103($_ti_DocRef2; DB_at_AccountCodes{$_l_Index}+Char:C90(Tab:K15:37)+DB_at_AccountNames{$_l_Index}+Char:C90(Tab:K15:37)+$_t_CurrentHeadingCode+Char:C90(Tab:K15:37)+$_t_CurrentHeadingName+Char:C90(Tab:K15:37)+$_t_CurrentLevelUpCode+Char:C90(Tab:K15:37)+$_t_ParentName0+Char:C90(Tab:K15:37)+String:C10($_l_CurrentLevel)+Char:C90(Tab:K15:37)+$_t_CurrentGroupCode+Char:C90(Tab:K15:37)+DB_at_AccountIO{$_l_Index}+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+$_t_AccountGroup)
							If ($_bo_IncludeLayers)
								SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions)
							End if 
							If ($_bo_IncludeAnalysis)
								SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions)
							End if 
							SEND PACKET:C103($_ti_DocRef2; Char:C90(13))
							
						Else 
							SEND PACKET:C103($_ti_DocRef2; DB_at_AccountCodes{$_l_Index}+Char:C90(Tab:K15:37)+DB_at_AccountNames{$_l_Index}+Char:C90(Tab:K15:37)+$_t_CurrentHeadingCode+Char:C90(Tab:K15:37)+$_t_CurrentHeadingName+Char:C90(Tab:K15:37)+$_t_CurrentLevelUpCode+Char:C90(Tab:K15:37)+$_t_ParentName0+Char:C90(Tab:K15:37)+String:C10($_l_CurrentLevel)+Char:C90(Tab:K15:37)+$_t_CurrentGroupCode+Char:C90(Tab:K15:37)+DB_at_AccountIO{$_l_Index}+Char:C90(Tab:K15:37)+""+Char:C90(Tab:K15:37)+"Yes"+Char:C90(Tab:K15:37)+$_t_AccountGroup)
							If ($_bo_IncludeLayers)
								SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccLayerRestrictions)
							End if 
							If ($_bo_IncludeAnalysis)
								SEND PACKET:C103($_ti_DocRef2; Char:C90(Tab:K15:37)+$_t_AccAnalysisRestrictions)
							End if 
							SEND PACKET:C103($_ti_DocRef2; Char:C90(13))
						End if 
						
						//NEXT RECORD([ACCOUNTS])
						//End for
					End if 
					If (DB_at_Headings{$_l_Index}#"")  //its a heading
						Case of 
							: (DB_at_ACCHHeadings1{$_l_Index}#"")
								$_l_LevelArrays:=1
							: (DB_at_ACCHHeadings2{$_l_Index}#"")
								$_l_LevelArrays:=2
							: (DB_at_ACCHHeadings3{$_l_Index}#"")
								$_l_LevelArrays:=3
							: (DB_at_ACCHHeadings4{$_l_Index}#"")
								$_l_LevelArrays:=4
							: (DB_at_ACCHHeadings5{$_l_Index}#"")
								$_l_LevelArrays:=5
						End case 
						//$_t_CurrentHeadingCode:=""
						//$_t_CurrentHeadingName:=""
						//$_t_CurrentLevelUpCode:=""
						//$_t_CurrentGroupCode:=""
						//$_l_CurrentLevel:=0
						//TRACE
						$_ptr_HeadingsCodesArray:=Get pointer:C304("DB_at_ACCHHeadings"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsNamesArray:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsLevelUpArray:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsLevelArray:=Get pointer:C304("DB_aI_HeadingLevel"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsGroupCodeArray:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_LevelArrays))
						$_ptr_AccountCodeRangeFromArray:=Get pointer:C304("DB_at_HeadingAccCodeFrom"+String:C10($_l_LevelArrays))
						$_ptr_AccountCodeRangeToArray:=Get pointer:C304("DB_at_HeadingAccCodeTo"+String:C10($_l_LevelArrays))
						$_t_CodeUp:=""
						$_t_CodeUp:=($_ptr_HeadingsLevelUpArray->{$_l_Index})
						If ($_t_CodeUp#"")
							$_l_FindRow:=Find in array:C230(DB_at_Headings; $_t_CodeUp)
						Else 
							$_l_FindRow:=0
						End if 
						
						If ($_l_FindRow>0)
							Case of 
								: (DB_at_ACCHHeadings1{$_l_FindRow}#"")
									$_l_LevelArrays2:=1
								: (DB_at_ACCHHeadings2{$_l_FindRow}#"")
									$_l_LevelArrays2:=2
								: (DB_at_ACCHHeadings3{$_l_FindRow}#"")
									$_l_LevelArrays2:=3
								: (DB_at_ACCHHeadings4{$_l_FindRow}#"")
									$_l_LevelArrays2:=4
								: (DB_at_ACCHHeadings5{$_l_FindRow}#"")
									$_l_LevelArrays2:=5
							End case 
							$_ptr_HeadingsNames2Array:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays2))
							$_t_ParentName0:=$_ptr_HeadingsNames2Array->{$_l_FindRow}
							
						Else 
							$_t_ParentName0:=""
						End if 
						$_t_ParentName1:=$_ptr_HeadingsNamesArray->{$_l_Index}
						$_t_parentCode1:=$_ptr_HeadingsCodesArray->{$_l_Index}
						$_t_CurrentHeadingCode:=$_ptr_HeadingsCodesArray->{$_l_Index}
						$_t_CurrentHeadingName:=$_ptr_HeadingsNamesArray->{$_l_Index}
						$_t_CurrentLevelUpCode:=$_ptr_HeadingsLevelUpArray->{$_l_Index}
						$_t_CurrentGroupCode:=$_ptr_HeadingsGroupCodeArray->{$_l_Index}
						$_l_CurrentLevel:=$_ptr_HeadingsLevelArray->{$_l_Index}
						
						//`
						
					End if 
					//```
				End for 
				
				CLOSE DOCUMENT:C267($_ti_DocRef2)
				Gen_Alert("Template Exported")
			End if 
		Else 
			
			$_t_ExportPath:=Select folder:C670("Please select the export folder:")
			If (OK=1) & ($_t_ExportPath#"")
				$_bo_IncludeLayers:=False:C215
				$_bo_IncludeAnalysis:=False:C215
				
				For ($_l_index; 1; Size of array:C274(DB_At_SubHeadingLevel))
					If (DB_at_LayerCodes{$_l_Index}#"")
						$_bo_IncludeLayers:=True:C214
						$_l_index:=Size of array:C274(DB_At_SubHeadingLevel)
					End if 
				End for 
				//$_bo_IncludeLayers:=(Records in table([LAYERS])>0) & (Records in table([ACCOUNTS_LAYERS])>0)
				For ($_l_index; 1; Size of array:C274(DB_At_SubHeadingLevel))
					If (DB_at_AnalysisCodes{$_l_Index}#"")
						$_bo_IncludeAnalysis:=True:C214
						$_l_index:=Size of array:C274(DB_At_SubHeadingLevel)
					End if 
				End for 
				
				
				
				
				
				$_t_WorkbookReference4:=SCPT_XL_workbook_create
				$_t_WorkbookReference4:=SCPT_XL_workbook_save_as_xls($_t_WorkbookReference4; $_t_ExportPath+"AcoountsData.xls")
				SCPT_XL_APPLICATION("Show")
				$_t_FullName:=SCPT_XL_workbook_get_full_name($_t_WorkbookReference4)
				$_l_SheetCount4:=SCPT_XL_sheet_count($_t_WorkbookReference4)  //this should be one
				SCPT_XL_sheet_set_name($_t_WorkbookReference4; 1; "Accounts Data")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A1"; "Account Code(Identifier)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B1"; "Account Name")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C1"; "Heading Code(Identifier)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D1"; "Heading Name")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E1"; "Parent Heading Code(Blank for top level)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F1"; "Parent Heading Name")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G1"; "Heading Level(Optional)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H1"; "Report Group(Top level heading-Optional")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I1"; "input Output")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J1"; "Balance Sheet Account")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K1"; "Profit Sheet Account")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L1"; "Accounts Group")
				If ($_bo_IncludeLayers)
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M1"; "Layer Restrictions")
				End if 
				If ($_bo_IncludeAnalysis)
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N1"; "Analysis Code Restrictions")
				End if 
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "A1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "A1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "B1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "B1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "C1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "C1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "D1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "D1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "E1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "E1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "F1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "F1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "G1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "G1"; 20)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "H1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "H1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "I1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "I1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "J1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "J1"; 20)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "K1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "K1"; 20)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "L1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "L1"; 25)
				
				If ($_bo_IncludeLayers)
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "M1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "M1"; 35)
					
				End if 
				If ($_bo_IncludeAnalysis)
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "N1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "N1"; 35)
					
					
				End if 
				SCPT_XL_workbook_save($_t_WorkbookReference4)
				//``````````````````````
				$_l_ExcelRowNumber:=2
				$_l_ExcelRowNumber2:=2
				//QUERY([HEADINGS];[HEADINGS]Group_Code="")
				//ORDER BY([HEADINGS];[HEADINGS]Heading_Code;>)
				//COPY NAMED SELECTION([HEADINGS];"Level0Group")
				//$_l_GroupsCount:=Records in selection([HEADINGS])
				$_l_GroupsCount:=Size of array:C274(DB_at_SubHeadings)
				//`````````
				For ($_l_Index; 1; Size of array:C274(DB_At_SubHeadingLevel))
					If (DB_at_AccountNames{$_l_Index}#"")
						//QUERY([ACCOUNTS];[ACCOUNTS]Report_Heading=[HEADINGS]Heading_Code)
						//$_t_ParentName0:=""
						//ORDER BY([ACCOUNTS];[ACCOUNTS]Account_Code;>)
						//For ($_l_AccountsIndex;1;Records in selection([ACCOUNTS]))
						//````````
						$_t_AccountGroup:=DB_at_AccountPreferenceGroups{$_l_Index}
						If ($_t_AccountGroup="")
							
							If (DM_T_BankAccFrom#"")
								If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccFrom)
									If (DM_T_BankAccTo="")
										If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccFrom)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									Else 
										If (DB_at_AccountCodes{$_l_Index}<=DM_T_BankAccTo)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									End if 
								End if 
							Else 
								If (DM_T_BankAccTo#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
										$_t_AccountGroup:="Bank Accounts"
									End if 
								End if 
							End if 
							
							
							
							If (DM_T_BankAccCurrencyExchange#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyExchange)
									$_t_AccountGroup:="Currency Exchange Control"
								End if 
							End if 
							If (DM_T_BankAccCurrencyCharges#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCurrencyCharges)
									$_t_AccountGroup:="Currency Bank Charges"
								End if 
							End if 
							If (DM_T_BankAccBalanceProfitBFWD#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitBFWD)
									$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
								End if 
							End if 
							If (DM_T_BankAccBalanceProfitYTD#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceProfitYTD)
									$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
								End if 
							End if 
							If (DM_T_BankAccBalanceAdjustments#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
									$_t_AccountGroup:="Balance Sheet Adjusment Account"
								End if 
							End if 
							
							If (DM_T_nomVatInput#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccBalanceAdjustments)
									$_t_AccountGroup:=$_t_VatReturn
								End if 
							End if 
							If (DM_T_nomVatOutput#"")
								If (DB_at_AccountCodes{$_l_Index}=DM_T_nomVatOutput)
									$_t_AccountGroup:=$_t_VatPayment
								End if 
							End if 
							
							If (DM_T_BankAccCashFrom#"")
								If (DB_at_AccountCodes{$_l_Index}>=DM_T_BankAccCashFrom)
									If (DM_T_BankAccCashTo#"")
										
										If (DM_T_BankAccCashTo>=DB_at_AccountCodes{$_l_Index})
											$_t_AccountGroup:="Cash Accounts"
										End if 
									Else 
										If (DB_at_AccountCodes{$_l_Index}=DM_T_BankAccCashFrom)
											$_t_AccountGroup:="Cash Accounts"
										End if 
									End if 
								End if 
							Else 
								If (DM_T_BankAccCashTo#"")
									If (DM_T_BankAccCashTo=DB_at_AccountCodes{$_l_Index})
										$_t_AccountGroup:="Cash Accounts"
									End if 
								End if 
							End if 
						End if 
						
						$_t_AccLayerRestrictions:=""
						$_t_AccAnalysisRestrictions:=""
						If ($_bo_IncludeLayers)
							$_t_AccLayerRestrictions:=DB_at_LayerCodes{$_l_Index}
						End if 
						If ($_bo_IncludeAnalysis)
							$_t_AccAnalysisRestrictions:=DB_at_AnalysisCodes{$_l_Index}
						End if 
						//```
						//LB_SetupListbox (->ACC_lb_Headings;"oACH";"ACH_L";-99;->DB_at_AccountCodes;->DB_at_AccountNames;->DB_at_AccountPreferenceGroups;->DB_at_AccountIO;->DB_al_MultiCurrencyValuation;->DB_at_MultiCurrencyValuation;->DB_abo_NoNominalLedgerPostings;->DB_at_ProfitBalance;->DB_at_AnalysisCodes;->DB_at_LayerCodes;->DB_abo_AccountDefault;->DB_at_AccountHeadings;->DB_at_ReportHeadings)
						
						If (DB_at_ProfitBalance{$_l_Index}="B")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); DB_at_AccountCodes{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); DB_at_AccountNames{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingCode)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingName)
							
							
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); $_t_CurrentLevelUpCode)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName0)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10($_l_CurrentLevel))
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); DB_at_AccountIO{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
							If ($_bo_IncludeLayers)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
							End if 
							If ($_bo_IncludeAnalysis)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
							End if 
							$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
						Else 
							
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); DB_at_AccountCodes{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); DB_at_AccountNames{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingCode)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); $_t_CurrentHeadingName)
							
							
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); $_t_CurrentLevelUpCode)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName0)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10($_l_CurrentLevel))
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); DB_at_AccountIO{$_l_Index})
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_CurrentGroupCode)
							If ($_bo_IncludeLayers)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
							End if 
							If ($_bo_IncludeAnalysis)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
							End if 
							$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
						End if 
						
						//NEXT RECORD([ACCOUNTS])
						//End for
					End if 
					If (DB_at_Headings{$_l_Index}#"")  //its a heading
						Case of 
							: (DB_at_ACCHHeadings1{$_l_Index}#"")
								$_l_LevelArrays:=1
							: (DB_at_ACCHHeadings2{$_l_Index}#"")
								$_l_LevelArrays:=2
							: (DB_at_ACCHHeadings3{$_l_Index}#"")
								$_l_LevelArrays:=3
							: (DB_at_ACCHHeadings4{$_l_Index}#"")
								$_l_LevelArrays:=4
							: (DB_at_ACCHHeadings5{$_l_Index}#"")
								$_l_LevelArrays:=5
						End case 
						//$_t_CurrentHeadingCode:=""
						//$_t_CurrentHeadingName:=""
						//$_t_CurrentLevelUpCode:=""
						//$_t_CurrentGroupCode:=""
						//$_l_CurrentLevel:=0
						//TRACE
						$_ptr_HeadingsCodesArray:=Get pointer:C304("DB_at_ACCHHeadings"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsNamesArray:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsLevelUpArray:=Get pointer:C304("DB_at_HeadingLevelup"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsLevelArray:=Get pointer:C304("DB_aI_HeadingLevel"+String:C10($_l_LevelArrays))
						$_ptr_HeadingsGroupCodeArray:=Get pointer:C304("DB_at_HeadingGroup"+String:C10($_l_LevelArrays))
						$_ptr_AccountCodeRangeFromArray:=Get pointer:C304("DB_at_HeadingAccCodeFrom"+String:C10($_l_LevelArrays))
						$_ptr_AccountCodeRangeToArray:=Get pointer:C304("DB_at_HeadingAccCodeTo"+String:C10($_l_LevelArrays))
						$_t_CodeUp:=""
						$_t_CodeUp:=($_ptr_HeadingsLevelUpArray->{$_l_Index})
						If ($_t_CodeUp#"")
							$_l_FindRow:=Find in array:C230(DB_at_Headings; $_t_CodeUp)
						Else 
							$_l_FindRow:=0
						End if 
						
						If ($_l_FindRow>0)
							Case of 
								: (DB_at_ACCHHeadings1{$_l_FindRow}#"")
									$_l_LevelArrays2:=1
								: (DB_at_ACCHHeadings2{$_l_FindRow}#"")
									$_l_LevelArrays2:=2
								: (DB_at_ACCHHeadings3{$_l_FindRow}#"")
									$_l_LevelArrays2:=3
								: (DB_at_ACCHHeadings4{$_l_FindRow}#"")
									$_l_LevelArrays2:=4
								: (DB_at_ACCHHeadings5{$_l_FindRow}#"")
									$_l_LevelArrays2:=5
							End case 
							$_ptr_HeadingsNames2Array:=Get pointer:C304("DB_at_HeadingNames"+String:C10($_l_LevelArrays2))
							$_t_ParentName0:=$_ptr_HeadingsNames2Array->{$_l_FindRow}
							
						Else 
							$_t_ParentName0:=""
						End if 
						
						$_t_ParentName1:=$_ptr_HeadingsNamesArray->{$_l_Index}
						$_t_parentCode1:=$_ptr_HeadingsCodesArray->{$_l_Index}
						
						
						$_t_CurrentHeadingCode:=$_ptr_HeadingsCodesArray->{$_l_Index}
						$_t_CurrentHeadingName:=$_ptr_HeadingsNamesArray->{$_l_Index}
						$_t_CurrentLevelUpCode:=$_ptr_HeadingsLevelUpArray->{$_l_Index}
						$_t_CurrentGroupCode:=$_ptr_HeadingsGroupCodeArray->{$_l_Index}
						$_l_CurrentLevel:=$_ptr_HeadingsLevelArray->{$_l_Index}
						
						//`
						
					End if 
					//```
				End for 
				
				
				
				
				SCPT_XL_workbook_save($_t_WorkbookReference4)
				
				
				
				$_t_DocumentNotes:="The Following information is intended to help you with setting up the chart of accounts correctly for Daybook"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+Char:C90(10)+Char:C90(13)
				$_t_VatReturn:="VAT Return"
				$_t_VatPayment:="VAT Payment"
				
				$_t_DocumentNotes:=$_t_DocumentNotes+"Daybook Accounts are seperated into headings for reporting purposes"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Headings can have subheadings. You can set up to 5 levels of Headings/Subheadings"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Although there is a headings level column on this spreadsheet, on re-import the heading level is calculated and may over ride the value on the spreadsheet"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Account Identifiers should be sequential numbers, such that the numbers are ascending through the accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"You should ensure you leave gaps in the numbers at the change of each subheading to allow for adding additional accounts within the heading/subheading"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"You should also leave gaps between the numbers so that adding new accounts to a subheading can allow insertion of additional accounts between the accounts you are setting up now."+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Normal Convention is to set the balance sheet account numbers in the lower range and the profit sheet account numbers in the higher range"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"By default Balance sheet account numbers run from 10000 to 29000 and Profit Sheet accounts from 30000 to 99000, the minimum account code is 10000 and the maximum account code is 99999"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Note that on re-import the sequence will be checked and if the numbers do not follow a sequence the import will not be allowed"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"The account groups are used to assist in the creation of various standard account postings. Only certain accounts need an account type grouping, setting them on the spreadsheet is beneficial but not essential"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"The account groups are as follows. Some groups are should be against a single accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Bank Accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Currency Exchange Control"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Currency Bank Charges"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Cash Accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+$_t_VatReturn+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+$_t_VatPayment+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"EC Creditors"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Balance Sheet Profit Brought Forward Account"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Balance Sheet Profit Year to Date Account"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Balance Sheet Adjusment Account"+Char:C90(10)+Char:C90(13)
				$_ti_DocumentRef:=Create document:C266($_t_ExportPath+"Daybook_Accounts_Setup_Notes.txt"; "TEXT")
				SEND PACKET:C103($_ti_DocumentRef; $_t_DocumentNotes)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				
				
				
				
				Gen_Alert("Settings Exported. Note that for re-import the header row with unaltered labelling must be included. See the Daybook_Accounts_Setup_Notes document beside the spreadsheet for important information")
				
			End if 
			
		End if 
		
		
	End if 
End if 
If (False:C215)
	If (Current user:C182="Designer") & (False:C215)  //For users only either Tab or Excel
		
	Else 
		//The user export will be provided as a means of exporting the data for manual manipulation
		//the intention here is that this would be used during inital setup. it is not intended as a way to access the existing setup and edit
		//this screen is therefore restricted to being displayed when there is no data in the database
		//`This user export only exports one document which is the accounts based on the Headings order-this will either have been manually created on this screen or have been imported from one of the defaults
		
		//on exit this screen will save the data(uses a transaction to protect the datafile).
		//end if
		//so for user manipulation only the excel and tab delimited formats are offered.
		//note that the import routine will verify and imported data complies and if it does not will not allow import if the data does not comply
		
		Gen_Confirm("Export the Chart of accounts in Tab delimited format or direct to Excel. Note that Excel must be installed on this computer for the Excel option to work?"; "Tabbed"; "Excel")
		If (OK=1)
			
		Else 
			
			$_t_ExportPath:=Select folder:C670("Please select the export folder:")
			If (OK=1) & ($_t_ExportPath#"")
				$_bo_IncludeLayers:=(Records in table:C83([LAYERS:76])>0) & (Records in table:C83([ACCOUNTS_LAYERS:156])>0)
				
				$_bo_IncludeAnalysis:=(Records in table:C83([ANALYSES:36])>0) & (Records in table:C83([ACCOUNTS_ANALYSES:157])>0)
				
				
				//If (False)
				
				$_t_WorkbookReference4:=SCPT_XL_workbook_create
				$_t_WorkbookReference4:=SCPT_XL_workbook_save_as_xls($_t_WorkbookReference4; $_t_ExportPath+"AcoountsData.xls")
				SCPT_XL_APPLICATION("Show")
				$_t_FullName4:=SCPT_XL_workbook_get_full_name($_t_WorkbookReference4)
				$_l_SheetCount4:=SCPT_XL_sheet_count($_t_WorkbookReference4)  //this should be one
				SCPT_XL_sheet_set_name($_t_WorkbookReference4; 1; "Accounts Data")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A1"; "Account Code(Identifier)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B1"; "Account Name")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C1"; "Heading Code(Identifier)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D1"; "Heading Name")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E1"; "Parent Heading Code(Blank for top level)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F1"; "Parent Heading Name")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G1"; "Heading Level(Optional)")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H1"; "Report Group(Top level heading-Optional")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I1"; "input Output")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J1"; "Balance Sheet Account")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K1"; "Profit Sheet Account")
				SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L1"; "Accounts Group")
				If ($_bo_IncludeLayers)
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M1"; "Layer Restrictions")
				End if 
				If ($_bo_IncludeAnalysis)
					SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N1"; "Analysis Code Restrictions")
				End if 
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "A1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "A1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "B1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "B1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "C1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "C1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "D1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "D1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "E1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "E1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "F1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "F1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "G1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "G1"; 20)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "H1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "H1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "I1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "I1"; 35)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "J1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "J1"; 20)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "K1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "K1"; 20)
				
				SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "L1"; True:C214)
				SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "L1"; 25)
				
				If ($_bo_IncludeLayers)
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "M1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "M1"; 35)
					
				End if 
				If ($_bo_IncludeAnalysis)
					SCPT_XL_range_set_font_bold($_t_WorkbookReference4; "Accounts Data"; "N1"; True:C214)
					SCPT_XL_range_set_width($_t_WorkbookReference4; "Accounts Data"; "N1"; 35)
					
					
				End if 
				SCPT_XL_workbook_save($_t_WorkbookReference4)
				//``````````````````````
				$_l_ExcelRowNumber:=2
				$_l_ExcelRowNumber2:=2
				QUERY:C277([HEADINGS:84]; [HEADINGS:84]Group_Code:5="")
				ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
				COPY NAMED SELECTION:C331([HEADINGS:84]; "Level0Group")
				$_l_GroupsCount:=Records in selection:C76([HEADINGS:84])
				For ($_l_Index; 1; $_l_GroupsCount)
					USE NAMED SELECTION:C332("Level0Group")
					GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
					$_t_ParentName0:=""
					ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
					For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
						//````````
						$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
						If ($_t_AccountGroup="")
							
							If (DM_T_BankAccFrom#"")
								If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
									If (DM_T_BankAccTo="")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									Else 
										If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									End if 
								End if 
							Else 
								If (DM_T_BankAccTo#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
										$_t_AccountGroup:="Bank Accounts"
									End if 
								End if 
							End if 
							
							
							
							If (DM_T_BankAccCurrencyExchange#"")
								If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
									$_t_AccountGroup:="Currency Exchange Control"
								End if 
							End if 
							If (DM_T_BankAccCurrencyCharges#"")
								If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
									$_t_AccountGroup:="Currency Bank Charges"
								End if 
							End if 
							If (DM_T_BankAccBalanceProfitBFWD#"")
								If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
									$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
								End if 
							End if 
							If (DM_T_BankAccBalanceProfitYTD#"")
								If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
									$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
								End if 
							End if 
							If (DM_T_BankAccBalanceAdjustments#"")
								If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
									$_t_AccountGroup:="Balance Sheet Adjusment Account"
								End if 
							End if 
							
							If (DM_T_nomVatInput#"")
								If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
									$_t_AccountGroup:=$_t_VatReturn
								End if 
							End if 
							If (DM_T_nomVatOutput#"")
								If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
									$_t_AccountGroup:=$_t_VatPayment
								End if 
							End if 
							
							If (DM_T_BankAccCashFrom#"")
								If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
									If (DM_T_BankAccCashTo#"")
										
										If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
											$_t_AccountGroup:="Cash Accounts"
										End if 
									Else 
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
											$_t_AccountGroup:="Cash Accounts"
										End if 
									End if 
								End if 
							Else 
								If (DM_T_BankAccCashTo#"")
									If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
										$_t_AccountGroup:="Cash Accounts"
									End if 
								End if 
							End if 
						End if 
						
						$_t_AccLayerRestrictions:=""
						$_t_AccAnalysisRestrictions:=""
						If ($_bo_IncludeLayers)
							QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
							If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
								SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
								//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
								//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
								
								For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
									If ($_l_LayersIndex=1)
										$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
									Else 
										$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
									End if 
								End for 
								
							End if 
						End if 
						If ($_bo_IncludeAnalysis)
							QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
							If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
								SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
								//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
								//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
								
								For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
									If ($_l_AnalysisIndex=1)
										$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
									Else 
										$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
									End if 
								End for 
								
							End if 
						End if 
						//```
						If ([ACCOUNTS:32]PB:4="B")
							
							//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+"Yes"+Char(Tab)+""+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName0)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
							If ($_bo_IncludeLayers)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
							End if 
							If ($_bo_IncludeAnalysis)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
							End if 
							$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
						Else 
							//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+""+Char(Tab)+"Yes"+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName0)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
							SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
							If ($_bo_IncludeLayers)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
							End if 
							If ($_bo_IncludeAnalysis)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
							End if 
							$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
						End if 
						
						NEXT RECORD:C51([ACCOUNTS:32])
					End for 
					
					
					
					
					$_t_ParentName1:=[HEADINGS:84]Heading_Name:2
					$_t_parentCode1:=[HEADINGS:84]Heading_Code:1
					QUERY:C277([HEADINGS:84]; [HEADINGS:84]Group_Code:5=$_t_parentCode1; *)
					QUERY:C277([HEADINGS:84];  & ; [HEADINGS:84]Level_Up_Code:4="")  //``
					ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
					COPY NAMED SELECTION:C331([HEADINGS:84]; "Level1Group")
					$_l_GroupCount1:=Records in selection:C76([HEADINGS:84])
					For ($_l_Index5; 1; $_l_GroupCount1)
						USE NAMED SELECTION:C332("Level1Group")
						GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index5)
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
						
						ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
						For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
							$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
							If ($_t_AccountGroup="")
								
								If (DM_T_BankAccFrom#"")
									If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
										If (DM_T_BankAccTo="")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										Else 
											If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccTo#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
											$_t_AccountGroup:="Bank Accounts"
										End if 
									End if 
								End if 
								
								
								
								If (DM_T_BankAccCurrencyExchange#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
										$_t_AccountGroup:="Currency Exchange Control"
									End if 
								End if 
								If (DM_T_BankAccCurrencyCharges#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
										$_t_AccountGroup:="Currency Bank Charges"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitBFWD#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
										$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceProfitYTD#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
										$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
									End if 
								End if 
								If (DM_T_BankAccBalanceAdjustments#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:="Balance Sheet Adjusment Account"
									End if 
								End if 
								
								If (DM_T_nomVatInput#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
										$_t_AccountGroup:=$_t_VatReturn
									End if 
								End if 
								If (DM_T_nomVatOutput#"")
									If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
										$_t_AccountGroup:=$_t_VatPayment
									End if 
								End if 
								
								If (DM_T_BankAccCashFrom#"")
									If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
										If (DM_T_BankAccCashTo#"")
											
											If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										Else 
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										End if 
									End if 
								Else 
									If (DM_T_BankAccCashTo#"")
										If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
											$_t_AccountGroup:="Cash Accounts"
										End if 
									End if 
								End if 
							End if 
							
							$_t_AccLayerRestrictions:=""
							$_t_AccAnalysisRestrictions:=""
							If ($_bo_IncludeLayers)
								QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
								If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
									SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
									//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
									//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
									
									For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
										If ($_l_LayersIndex=1)
											$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
										Else 
											$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
										End if 
									End for 
									
								End if 
							End if 
							If ($_bo_IncludeAnalysis)
								QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
								If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
									SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
									//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
									//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
									
									For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
										If ($_l_AnalysisIndex=1)
											$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
										Else 
											$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
										End if 
									End for 
									
								End if 
							End if 
							//```
							If ([ACCOUNTS:32]PB:4="B")
								//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+"Yes"+Char(Tab)+""+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName1)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
								If ($_bo_IncludeLayers)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
								End if 
								If ($_bo_IncludeAnalysis)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
								End if 
								$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
							Else 
								//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+""+Char(Tab)+"Yes"+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName1)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
								SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
								If ($_bo_IncludeLayers)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
								End if 
								If ($_bo_IncludeAnalysis)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
								End if 
								$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
							End if 
							
							NEXT RECORD:C51([ACCOUNTS:32])
						End for 
						
						
						$_t_ParentName2:=[HEADINGS:84]Heading_Name:2
						$_t_ParentCode2:=[HEADINGS:84]Heading_Code:1
						QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode2)
						//``
						ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
						COPY NAMED SELECTION:C331([HEADINGS:84]; "Level2Group")
						$_l_GroupCount2:=Records in selection:C76([HEADINGS:84])
						For ($_l_Index2; 1; $_l_GroupCount2)
							USE NAMED SELECTION:C332("Level2Group")
							GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index2)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
							
							ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
							For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
								$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
								If ($_t_AccountGroup="")
									
									If (DM_T_BankAccFrom#"")
										If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
											If (DM_T_BankAccTo="")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
													$_t_AccountGroup:="Bank Accounts"
												End if 
											Else 
												If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
													$_t_AccountGroup:="Bank Accounts"
												End if 
											End if 
										End if 
									Else 
										If (DM_T_BankAccTo#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
												$_t_AccountGroup:="Bank Accounts"
											End if 
										End if 
									End if 
									
									
									
									If (DM_T_BankAccCurrencyExchange#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
											$_t_AccountGroup:="Currency Exchange Control"
										End if 
									End if 
									If (DM_T_BankAccCurrencyCharges#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
											$_t_AccountGroup:="Currency Bank Charges"
										End if 
									End if 
									If (DM_T_BankAccBalanceProfitBFWD#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
											$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
										End if 
									End if 
									If (DM_T_BankAccBalanceProfitYTD#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
											$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
										End if 
									End if 
									If (DM_T_BankAccBalanceAdjustments#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
											$_t_AccountGroup:="Balance Sheet Adjusment Account"
										End if 
									End if 
									
									If (DM_T_nomVatInput#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
											$_t_AccountGroup:=$_t_VatReturn
										End if 
									End if 
									If (DM_T_nomVatOutput#"")
										If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
											$_t_AccountGroup:=$_t_VatPayment
										End if 
									End if 
									
									If (DM_T_BankAccCashFrom#"")
										If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
											If (DM_T_BankAccCashTo#"")
												
												If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
													$_t_AccountGroup:="Cash Accounts"
												End if 
											Else 
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
													$_t_AccountGroup:="Cash Accounts"
												End if 
											End if 
										End if 
									Else 
										If (DM_T_BankAccCashTo#"")
											If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
												$_t_AccountGroup:="Cash Accounts"
											End if 
										End if 
									End if 
								End if 
								
								$_t_AccLayerRestrictions:=""
								$_t_AccAnalysisRestrictions:=""
								If ($_bo_IncludeLayers)
									QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
									If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
										SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
										//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
										//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
										
										For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
											If ($_l_LayersIndex=1)
												$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
											Else 
												$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
											End if 
										End for 
										
									End if 
								End if 
								If ($_bo_IncludeAnalysis)
									QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
									If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
										SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
										//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
										//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
										
										For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
											If ($_l_AnalysisIndex=1)
												$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
											Else 
												$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
											End if 
										End for 
										
									End if 
								End if 
								//```
								If ([ACCOUNTS:32]PB:4="B")
									//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+"Yes"+Char(Tab)+""+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName2)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
									If ($_bo_IncludeLayers)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
									End if 
									If ($_bo_IncludeAnalysis)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
									End if 
									$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
								Else 
									//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+""+Char(Tab)+"Yes"+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName2)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
									SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
									If ($_bo_IncludeLayers)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
									End if 
									If ($_bo_IncludeAnalysis)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
									End if 
									$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
								End if 
								NEXT RECORD:C51([ACCOUNTS:32])
							End for 
							
							
							$_t_ParentName3:=[HEADINGS:84]Heading_Name:2
							$_t_ParentCode3:=[HEADINGS:84]Heading_Code:1
							QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode3)
							//``
							ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
							COPY NAMED SELECTION:C331([HEADINGS:84]; "Level3Group")
							$_l_GroupCount3:=Records in selection:C76([HEADINGS:84])
							For ($_l_Index3; 1; $_l_GroupCount3)
								USE NAMED SELECTION:C332("Level3Group")
								GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index3)
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
								
								ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
								For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
									$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
									If ($_t_AccountGroup="")
										
										If (DM_T_BankAccFrom#"")
											If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
												If (DM_T_BankAccTo="")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
														$_t_AccountGroup:="Bank Accounts"
													End if 
												Else 
													If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
														$_t_AccountGroup:="Bank Accounts"
													End if 
												End if 
											End if 
										Else 
											If (DM_T_BankAccTo#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
													$_t_AccountGroup:="Bank Accounts"
												End if 
											End if 
										End if 
										
										
										
										If (DM_T_BankAccCurrencyExchange#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
												$_t_AccountGroup:="Currency Exchange Control"
											End if 
										End if 
										If (DM_T_BankAccCurrencyCharges#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
												$_t_AccountGroup:="Currency Bank Charges"
											End if 
										End if 
										If (DM_T_BankAccBalanceProfitBFWD#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
												$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
											End if 
										End if 
										If (DM_T_BankAccBalanceProfitYTD#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
												$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
											End if 
										End if 
										If (DM_T_BankAccBalanceAdjustments#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
												$_t_AccountGroup:="Balance Sheet Adjusment Account"
											End if 
										End if 
										
										If (DM_T_nomVatInput#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
												$_t_AccountGroup:=$_t_VatReturn
											End if 
										End if 
										If (DM_T_nomVatOutput#"")
											If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
												$_t_AccountGroup:=$_t_VatPayment
											End if 
										End if 
										
										If (DM_T_BankAccCashFrom#"")
											If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
												If (DM_T_BankAccCashTo#"")
													
													If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
														$_t_AccountGroup:="Cash Accounts"
													End if 
												Else 
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
														$_t_AccountGroup:="Cash Accounts"
													End if 
												End if 
											End if 
										Else 
											If (DM_T_BankAccCashTo#"")
												If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
													$_t_AccountGroup:="Cash Accounts"
												End if 
											End if 
										End if 
									End if 
									
									$_t_AccLayerRestrictions:=""
									$_t_AccAnalysisRestrictions:=""
									If ($_bo_IncludeLayers)
										QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
										If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
											SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
											//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
											//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
											
											For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
												If ($_l_LayersIndex=1)
													$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
												Else 
													$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
												End if 
											End for 
											
										End if 
									End if 
									If ($_bo_IncludeAnalysis)
										QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
										If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
											SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
											//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
											//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
											
											For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
												If ($_l_AnalysisIndex=1)
													$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
												Else 
													$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
												End if 
											End for 
											
										End if 
									End if 
									//```
									If ([ACCOUNTS:32]PB:4="B")
										//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+"Yes"+Char(Tab)+""+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName3)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
										If ($_bo_IncludeLayers)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
										End if 
										If ($_bo_IncludeAnalysis)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
										End if 
										$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
									Else 
										//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+""+Char(Tab)+"Yes"+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName3)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
										SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
										If ($_bo_IncludeLayers)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
										End if 
										If ($_bo_IncludeAnalysis)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
										End if 
										$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
									End if 
									NEXT RECORD:C51([ACCOUNTS:32])
								End for 
								
								
								$_t_ParentName4:=[HEADINGS:84]Heading_Name:2
								$_t_ParentCode4:=[HEADINGS:84]Heading_Code:1
								QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode4)
								//``
								ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
								COPY NAMED SELECTION:C331([HEADINGS:84]; "Level4Group")
								$_l_GroupCount4:=Records in selection:C76([HEADINGS:84])
								For ($_l_Index4; 1; $_l_GroupCount4)
									USE NAMED SELECTION:C332("Level4Group")
									GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_Index4)
									QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
									
									ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
									For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
										$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
										If ($_t_AccountGroup="")
											
											If (DM_T_BankAccFrom#"")
												If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
													If (DM_T_BankAccTo="")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
															$_t_AccountGroup:="Bank Accounts"
														End if 
													Else 
														If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
															$_t_AccountGroup:="Bank Accounts"
														End if 
													End if 
												End if 
											Else 
												If (DM_T_BankAccTo#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
														$_t_AccountGroup:="Bank Accounts"
													End if 
												End if 
											End if 
											
											
											
											If (DM_T_BankAccCurrencyExchange#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
													$_t_AccountGroup:="Currency Exchange Control"
												End if 
											End if 
											If (DM_T_BankAccCurrencyCharges#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
													$_t_AccountGroup:="Currency Bank Charges"
												End if 
											End if 
											If (DM_T_BankAccBalanceProfitBFWD#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
													$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
												End if 
											End if 
											If (DM_T_BankAccBalanceProfitYTD#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
													$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
												End if 
											End if 
											If (DM_T_BankAccBalanceAdjustments#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
													$_t_AccountGroup:="Balance Sheet Adjusment Account"
												End if 
											End if 
											
											If (DM_T_nomVatInput#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
													$_t_AccountGroup:=$_t_VatReturn
												End if 
											End if 
											If (DM_T_nomVatOutput#"")
												If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
													$_t_AccountGroup:=$_t_VatPayment
												End if 
											End if 
											
											If (DM_T_BankAccCashFrom#"")
												If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
													If (DM_T_BankAccCashTo#"")
														
														If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
															$_t_AccountGroup:="Cash Accounts"
														End if 
													Else 
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
															$_t_AccountGroup:="Cash Accounts"
														End if 
													End if 
												End if 
											Else 
												If (DM_T_BankAccCashTo#"")
													If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
														$_t_AccountGroup:="Cash Accounts"
													End if 
												End if 
											End if 
										End if 
										
										$_t_AccLayerRestrictions:=""
										$_t_AccAnalysisRestrictions:=""
										If ($_bo_IncludeLayers)
											QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
											If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
												SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
												//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
												//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
												
												For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
													If ($_l_LayersIndex=1)
														$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
													Else 
														$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
													End if 
												End for 
												
											End if 
										End if 
										If ($_bo_IncludeAnalysis)
											QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
											If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
												SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
												//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
												//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
												
												For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
													If ($_l_AnalysisIndex=1)
														$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
													Else 
														$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
													End if 
												End for 
												
											End if 
										End if 
										//```
										If ([ACCOUNTS:32]PB:4="B")
											//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+"Yes"+Char(Tab)+""+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName4)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
											If ($_bo_IncludeLayers)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
											End if 
											If ($_bo_IncludeAnalysis)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
											End if 
											$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
											
										Else 
											//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+""+Char(Tab)+"Yes"+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName4)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
											SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
											If ($_bo_IncludeLayers)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
											End if 
											If ($_bo_IncludeAnalysis)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
											End if 
											$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
										End if 
										NEXT RECORD:C51([ACCOUNTS:32])
									End for 
									
									
									$_t_ParentName5:=[HEADINGS:84]Heading_Name:2
									$_t_ParentCode5:=[HEADINGS:84]Heading_Code:1
									QUERY:C277([HEADINGS:84]; [HEADINGS:84]Level_Up_Code:4=$_t_ParentCode5)
									
									//``
									ORDER BY:C49([HEADINGS:84]; [HEADINGS:84]Heading_Code:1; >)
									COPY NAMED SELECTION:C331([HEADINGS:84]; "Level5Group")
									$_l_Groups5:=Records in selection:C76([HEADINGS:84])
									For ($_l_GroupsIndex; 1; $_l_Groups5)
										USE NAMED SELECTION:C332("Level5Group")
										GOTO SELECTED RECORD:C245([HEADINGS:84]; $_l_GroupsIndex)
										QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Report_Heading:1=[HEADINGS:84]Heading_Code:1)
										
										ORDER BY:C49([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2; >)
										For ($_l_AccountsIndex; 1; Records in selection:C76([ACCOUNTS:32]))
											$_t_AccountGroup:=[ACCOUNTS:32]xinternalAccountGroup:7
											If ($_t_AccountGroup="")
												
												If (DM_T_BankAccFrom#"")
													If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccFrom)
														If (DM_T_BankAccTo="")
															If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccFrom)
																$_t_AccountGroup:="Bank Accounts"
															End if 
														Else 
															If ([ACCOUNTS:32]Account_Code:2<=DM_T_BankAccTo)
																$_t_AccountGroup:="Bank Accounts"
															End if 
														End if 
													End if 
												Else 
													If (DM_T_BankAccTo#"")
														If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccTo)
															$_t_AccountGroup:="Bank Accounts"
														End if 
													End if 
												End if 
												
												
												
												If (DM_T_BankAccCurrencyExchange#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyExchange)
														$_t_AccountGroup:="Currency Exchange Control"
													End if 
												End if 
												If (DM_T_BankAccCurrencyCharges#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCurrencyCharges)
														$_t_AccountGroup:="Currency Bank Charges"
													End if 
												End if 
												If (DM_T_BankAccBalanceProfitBFWD#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitBFWD)
														$_t_AccountGroup:="Balance Sheet Profit Brought Forward Account"
													End if 
												End if 
												If (DM_T_BankAccBalanceProfitYTD#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceProfitYTD)
														$_t_AccountGroup:="Balance Sheet Profit Year to Date Account"
													End if 
												End if 
												If (DM_T_BankAccBalanceAdjustments#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
														$_t_AccountGroup:="Balance Sheet Adjusment Account"
													End if 
												End if 
												
												If (DM_T_nomVatInput#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccBalanceAdjustments)
														$_t_AccountGroup:=$_t_VatReturn
													End if 
												End if 
												If (DM_T_nomVatOutput#"")
													If ([ACCOUNTS:32]Account_Code:2=DM_T_nomVatOutput)
														$_t_AccountGroup:=$_t_VatPayment
													End if 
												End if 
												
												If (DM_T_BankAccCashFrom#"")
													If ([ACCOUNTS:32]Account_Code:2>=DM_T_BankAccCashFrom)
														If (DM_T_BankAccCashTo#"")
															
															If (DM_T_BankAccCashTo>=[ACCOUNTS:32]Account_Code:2)
																$_t_AccountGroup:="Cash Accounts"
															End if 
														Else 
															If ([ACCOUNTS:32]Account_Code:2=DM_T_BankAccCashFrom)
																$_t_AccountGroup:="Cash Accounts"
															End if 
														End if 
													End if 
												Else 
													If (DM_T_BankAccCashTo#"")
														If (DM_T_BankAccCashTo=[ACCOUNTS:32]Account_Code:2)
															$_t_AccountGroup:="Cash Accounts"
														End if 
													End if 
												End if 
											End if 
											
											$_t_AccLayerRestrictions:=""
											$_t_AccAnalysisRestrictions:=""
											If ($_bo_IncludeLayers)
												QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
												If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
													SELECTION TO ARRAY:C260([ACCOUNTS_LAYERS:156]Layer_Code:1; $_at_LayerCodes)
													//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
													//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
													
													For ($_l_LayersIndex; 1; Size of array:C274($_at_LayerCodes))
														If ($_l_LayersIndex=1)
															$_t_AccLayerRestrictions:=$_at_LayerCodes{$_l_LayersIndex}
														Else 
															$_t_AccLayerRestrictions:=$_t_AccLayerRestrictions+", "+$_at_LayerCodes{$_l_LayersIndex}
														End if 
													End for 
													
												End if 
											End if 
											If ($_bo_IncludeAnalysis)
												QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
												If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
													SELECTION TO ARRAY:C260([ACCOUNTS_ANALYSES:157]Analysis_Code:1; $_at_AnalysesCodes)
													//ARRAY TEXT(DB_at_AnalysisCodes;Size of array(DB_at_AccountCodes))
													//ARRAY TEXT(DB_at_LayerCodes;Size of array(DB_at_AccountCodes))
													
													For ($_l_AnalysisIndex; 1; Size of array:C274($_at_AnalysesCodes))
														If ($_l_AnalysisIndex=1)
															$_t_AccAnalysisRestrictions:=$_at_AnalysesCodes{$_l_AnalysisIndex}
														Else 
															$_t_AccAnalysisRestrictions:=$_t_AccAnalysisRestrictions+", "+$_at_AnalysesCodes{$_l_AnalysisIndex}
														End if 
													End for 
													
												End if 
											End if 
											//```
											If ([ACCOUNTS:32]PB:4="B")
												//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+"Yes"+Char(Tab)+""+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName5)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "TRUE")
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "")
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
												If ($_bo_IncludeLayers)
													SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
												End if 
												If ($_bo_IncludeAnalysis)
													SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
												End if 
												$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
											Else 
												//SEND PACKET($_ti_DocRef2;[ACCOUNTS]Account_Code+Char(Tab)+[ACCOUNTS]Account_Name+Char(Tab)+[HEADINGS]Heading_Code+Char(Tab)+[HEADINGS]Heading_Name+Char(Tab)+[HEADINGS]Level_Up_Code+Char(Tab)+$_t_ParentName0+Char(Tab)+String([HEADINGS]Heading_Level)+Char(Tab)+[HEADINGS]Group_Code+Char(Tab)+[ACCOUNTS]IO+Char(Tab)+""+Char(Tab)+"Yes"+Char(Tab)+$_t_AccountGroup+Char(Tab)+$_t_AccLayerRestrictions+Char(Tab)+$_t_AccAnalysisRestrictions+Char(13))
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "A"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Code:2)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "B"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]Account_Name:3)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "C"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Code:1)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "D"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Heading_Name:2)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "E"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Level_Up_Code:4)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "F"+String:C10($_l_ExcelRowNumber); $_t_ParentName5)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "G"+String:C10($_l_ExcelRowNumber); String:C10([HEADINGS:84]Heading_Level:3))
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "H"+String:C10($_l_ExcelRowNumber); [HEADINGS:84]Group_Code:5)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "I"+String:C10($_l_ExcelRowNumber); [ACCOUNTS:32]IO:5)
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "J"+String:C10($_l_ExcelRowNumber); "")
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "K"+String:C10($_l_ExcelRowNumber); "TRUE")
												SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "L"+String:C10($_l_ExcelRowNumber); $_t_AccountGroup)
												If ($_bo_IncludeLayers)
													SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "M"+String:C10($_l_ExcelRowNumber); $_t_AccLayerRestrictions)
												End if 
												If ($_bo_IncludeAnalysis)
													SCPT_XL_range_set_value($_t_WorkbookReference4; "Accounts Data"; "N"+String:C10($_l_ExcelRowNumber); $_t_AccAnalysisRestrictions)
												End if 
												$_l_ExcelRowNumber:=$_l_ExcelRowNumber+1
											End if 
											
											NEXT RECORD:C51([ACCOUNTS:32])
										End for 
										//$_t_ParentName5:=[HEADINGS]Heading_Name
										//$_t_ParentCode5:=[HEADINGS]Heading_Code
										//QUERY([HEADINGS];[HEADINGS]Level_Up_Code=$_t_ParentCode5)
										
									End for 
									//```
								End for 
								//```
							End for 
							//```
							
						End for 
						//```
					End for 
					//```
				End for 
				
				SCPT_XL_workbook_save($_t_WorkbookReference4)
				//End if
				$_t_DocumentNotes:="The Following information is intended to help you with setting up the chart of accounts correctly for Daybook"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+Char:C90(10)+Char:C90(13)
				$_t_VatReturn:="VAT Return"
				$_t_VatPayment:="VAT Payment"
				
				$_t_DocumentNotes:=$_t_DocumentNotes+"Daybook Accounts are seperated into headings for reporting purposes"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Headings can have subheadings. You can set up to 5 levels of Headings/Subheadings"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Although there is a headings level column on this spreadsheet, on re-import the heading level is calculated and may over ride the value on the spreadsheet"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Account Identifiers should be sequential numbers, such that the numbers are ascending through the accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"You should ensure you leave gaps in the numbers at the change of each subheading to allow for adding additional accounts within the heading/subheading"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"You should also leave gaps between the numbers so that adding new accounts to a subheading can allow insertion of additional accounts between the accounts you are setting up now."+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Normal Convention is to set the balance sheet account numbers in the lower range and the profit sheet account numbers in the higher range"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"By default Balance sheet account numbers run from 10000 to 29000 and Profit Sheet accounts from 30000 to 99000, the minimum account code is 10000 and the maximum account code is 99999"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Note that on re-import the sequence will be checked and if the numbers do not follow a sequence the import will not be allowed"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"The account groups are used to assist in the creation of various standard account postings. Only certain accounts need an account type grouping, setting them on the spreadsheet is beneficial but not essential"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"The account groups are as follows. Some groups (indicated) should be against a single accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Bank Accounts-Multiple Allowed"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Currency Exchange Control-Single Account"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Currency Bank Charges-Single Account"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Cash Accounts-Multiple Accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+$_t_VatReturn+"-Single Account+Char(10)+Char(13)"
				$_t_DocumentNotes:=$_t_DocumentNotes+$_t_VatPayment+"-Single Account"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"EC Creditors-Single Account"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Balance Sheet Profit Brought Forward Account-Single Account"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Balance Sheet Profit Year to Date Account-Single Accounts"+Char:C90(10)+Char:C90(13)
				$_t_DocumentNotes:=$_t_DocumentNotes+"Balance Sheet Adjustment Account-Single Account"+Char:C90(10)+Char:C90(13)
				$_ti_DocumentRef:=Create document:C266($_t_ExportPath+"Daybook_Accounts_Setup_Notes.txt"; "TEXT")
				SEND PACKET:C103($_ti_DocumentRef; $_t_DocumentNotes)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				
				
				
				
				Gen_Alert("Settings Exported. Note that for re-import the header row with unaltered labelling must be included. See the Daybook_Accounts_Setup_Notes document beside the spreadsheet for important information")
				
			End if 
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oImport1"; $_t_oldMethodName)
