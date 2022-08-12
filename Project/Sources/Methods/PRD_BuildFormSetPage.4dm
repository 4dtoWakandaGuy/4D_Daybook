//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_BuildFormSetPage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/07/2010 13:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OL_lb_DateIterations;0)
	//ARRAY BOOLEAN(OI_abo_ComponentAdditional;0)
	//ARRAY BOOLEAN(OI_abo_IncludeInProduct;0)
	//ARRAY BOOLEAN(OI_abo_OptionalComponent;0)
	//ARRAY BOOLEAN(OI_abo_UserSetInclude;0)
	//ARRAY BOOLEAN(OI_lb_SelectProduct;0)
	//ARRAY BOOLEAN(PRD_abo_BLBInclude;0)
	//ARRAY BOOLEAN(PRD_aB_IssueInsert;0)
	ARRAY DATE:C224($_ad_IssueDates; 0)
	//ARRAY DATE(PRD_ad_IssueDate;0)
	ARRAY LONGINT:C221($_al_SupplierPreffered; 0)
	ARRAY LONGINT:C221($_al_RestrictSections; 0)
	//ARRAY LONGINT(OI_al_BuildPriceClass;0)
	//ARRAY LONGINT(OI_al_ChargingPriceClass;0)
	//ARRAY LONGINT(OI_al_ComponentID;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_ComponentType;0)
	//ARRAY LONGINT(OI_al_MultiplesIndex;0)
	//ARRAY LONGINT(OI_al_SectionIDS;0)
	//ARRAY LONGINT(OI_al_SectionLength;0)
	//ARRAY LONGINT(PRD_al_BLDPrdIDs;0)
	ARRAY REAL:C219($_ar_SupplierCosts; 0)
	ARRAY REAL:C219($_ar_SupplierStdCosts; 0)
	//ARRAY REAL(OI_ar_AdditionalItemQTY;0)
	//ARRAY REAL(OI_ar_BuildCodeBASEPrice;0)
	//ARRAY REAL(OI_ar_BuildCodeCOSTPrice;0)
	//ARRAY REAL(OI_ar_BuildCodeCostStd;0)
	//ARRAY REAL(OI_ar_BuildCodeSALESPrice;0)
	//ARRAY REAL(OI_ar_BuildProductComponentsQTY;0)
	//ARRAY REAL(OI_ar_AdditionalItemPriceBase;0)
	//ARRAY REAL(OK_ar_AdditionalItemPrice;0)
	//ARRAY REAL(PRD_ar_BLDPrice;0)
	ARRAY TEXT:C222($_at_SupplierCompanyCodes; 0)
	ARRAY TEXT:C222($_at_SupplierCostCurrencies; 0)
	ARRAY TEXT:C222($_At_FilterNames; 0)
	//ARRAY TEXT(OI_at_AdditionOrderItems;0)
	//ARRAY TEXT(OI_at_BuildCodeMatrix;0)
	//ARRAY TEXT(OI_at_BuildCodeSupplier;0)
	//ARRAY TEXT(OI_at_BuildProductComponents;0)
	//ARRAY TEXT(OI_at_FillChar;0)
	//ARRAY TEXT(OI_at_FillStyle;0)
	//ARRAY TEXT(OI_at_MultipleCodes;0)
	//ARRAY TEXT(OI_at_ProductSections;0)
	//ARRAY TEXT(PRD_at_BLDDescription;0)
	//ARRAY TEXT(PRD_at_BLDprdCodes;0)
	//ARRAY TEXT(PRD_at_BLDprdNames;0)
	//ARRAY TEXT(PRD_at_BLDprdShrtCodes;0)
	//ARRAY TEXT(PRD_at_FillPattern;0)
	//ARRAY TEXT(PRD_at_IssueCode;0)
	//ARRAY TEXT(PRD_AT_issueDetails;0)
	//ARRAY TEXT(PRD_at_IssueName;0)
	//ARRAY TEXT(PRD_at_Outputcode;0)
	C_BOOLEAN:C305($_bo_AllSectionsSet; $_bo_Continue; $_bo_Exit; $_bo_MoreThanOnePerMonth; $_bo_MoreThanOnePerWeek; $_bo_MoreThanOnePerYear; $_bo_ShowNulDates; OI_bo_AlloptionsSelected; OI_bo_CustomerPriceSet; OI_bo_IncludeProduct; OI_bo_UseDiscount)
	C_BOOLEAN:C305(PRD_bo_OneLinePerDate; PRD_bo_SelectMultiple)
	C_DATE:C307($_d_Date2; $_d_FirstDate; $_d_FIrstIssueDate; $_d_LastDate; PRD_d_FIrstDate; PRD_d_LastDate)
	C_LONGINT:C283($_l_BuildCodePosition; $_l_BuildIndexPosition; $_l_ComponentSectionRow; $_l_DatesSet; $_l_Dayof; $_l_Dayof2; $_l_Difference; $_l_FilterIndex; $_l_FutureUnits; $_l_Index; $_l_IssueNumber)
	C_LONGINT:C283($_l_issuesIndex; $_l_MonthOf; $_l_Monthof2; $_l_offset; $_l_RecordsinSelectionProdSuppli; $_l_ResetIndex; $_l_RestrictionsSet; $_l_SupplierIndex; $_l_ThisComponentID; $_l_UnitCount; $_l_Year)
	C_LONGINT:C283($_l_Year2; PID_l_BUT1; PID_l_BUT10; PID_l_BUT11; PID_l_BUT12; PID_l_BUT13; PID_l_BUT14; PID_l_BUT15; PID_l_BUT16; PID_l_BUT17; PID_l_BUT18)
	C_LONGINT:C283(PID_l_BUT19; PID_l_BUT2; PID_l_BUT20; PID_l_BUT21; PID_l_BUT22; PID_l_BUT23; PID_l_BUT24; PID_l_BUT25; PID_l_BUT26; PID_l_BUT27; PID_l_BUT3)
	C_LONGINT:C283(PID_l_BUT4; PID_l_BUT5; PID_l_BUT6; PID_l_BUT7; PID_l_BUT8; PID_l_BUT9)
	C_REAL:C285($_r_Discount; $_r_Price; $_r_TotalPrice; $_r_TotalPriceOLD; $_r_UseStandardCost; $_r_UseSupplierCost; OI_R_BuiltPrice; OI_R_SalesPrice; PRD_R_Quantity)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_Char; $_t_Code; $_t_ComponentOutputCode; $_t_Fill; $_t_oldMethodName; $_t_Section; $_t_UseSupplierCode; $_t_UseSupplierCurrency; OI_t_BuiltCode; OI_T_CurrencyCode)
	C_TEXT:C284(OI_t_LookupValue; OI_t_ProductBuiltCode; OI_t_ProductCode; OI_t_ProductName; oPID_COL1; oPID_COL10; oPID_COL11; oPID_COL12; oPID_COL13; oPID_COL14; oPID_COL15)
	C_TEXT:C284(oPID_COL16; oPID_COL17; oPID_COL18; oPID_COL19; oPID_COL2; oPID_COL20; oPID_COL21; oPID_COL22; oPID_COL23; oPID_COL24; oPID_COL25)
	C_TEXT:C284(oPID_COL26; oPID_COL27; oPID_COL3; oPID_COL4; oPID_COL5; oPID_COL6; oPID_COL7; oPID_COL8; oPID_COL9; oPID_HED1; oPID_HED10)
	C_TEXT:C284(oPID_HED11; oPID_HED12; oPID_HED13; oPID_HED14; oPID_HED15; oPID_HED16; oPID_HED17; oPID_HED18; oPID_HED19; oPID_HED2; oPID_HED20)
	C_TEXT:C284(oPID_HED21; oPID_HED22; oPID_HED23; oPID_HED24; oPID_HED25; oPID_HED26; oPID_HED27; oPID_HED3; oPID_HED4; oPID_HED5; oPID_HED6)
	C_TEXT:C284(oPID_HED7; oPID_HED8; oPID_HED9; PRD_t_BuildBrandCode; PRD_t_BuildGroupCode; PRD_t_productCurrency)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_BuildFormSetPage")
If (OI_at_ProductSections>0)
	$_l_ThisComponentID:=OI_al_ComponentID{OI_at_ProductSections}
	USE SET:C118("OIComponents")
	QUERY SELECTION:C341([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=$_l_ThisComponentID)
	ARRAY LONGINT:C221($_al_RestrictSections; 0)
	ARRAY TEXT:C222($_At_FilterNames; 0)
	$_bo_Continue:=False:C215
	If (BLOB size:C605([COMPONENTS:86]X_RestrictionPreferences:20)>0)  //This is a precaution..if the section is restricted til another section is set then we must set that section first..as this bit is on load the section CANT be set unless its just one record..
		$_l_offset:=0
		BLOB TO VARIABLE:C533([COMPONENTS:86]X_RestrictionPreferences:20; $_al_RestrictSections; $_l_offset)
		BLOB TO VARIABLE:C533([COMPONENTS:86]X_RestrictionPreferences:20; $_At_FilterNames; $_l_offset)
		$_l_RestrictionsSet:=0
		If (Size of array:C274($_al_RestrictSections)>0)
			
			For ($_l_Index; 1; Size of array:C274($_al_RestrictSections))
				$_l_ComponentSectionRow:=Find in array:C230(OI_al_SectionIDS; $_al_RestrictSections{$_l_Index})
				If (OI_at_AdditionOrderItems{$_l_ComponentSectionRow}#"") | (OI_at_BuildProductComponents{$_l_ComponentSectionRow}#"") | (OI_at_BuildCodeMatrix{$_l_ComponentSectionRow}#"")
					
					$_l_RestrictionsSet:=$_l_RestrictionsSet+1
				Else 
					//here need to validate it if is an additional item that has multiple values that a value is set in the multiples array
					
				End if 
			End for 
		End if 
		If ($_l_RestrictionsSet=Size of array:C274($_al_RestrictSections))
			$_bo_Continue:=True:C214
		End if 
		If ($_bo_Continue=False:C215)
			//Goto the 1St restriction and start there
			$_l_ComponentSectionRow:=Find in array:C230(OI_al_ComponentSectionID; $_al_RestrictSections{1})
			If ($_l_ComponentSectionRow>0)
				OI_at_ProductSections:=$_l_ComponentSectionRow
			Else 
				$_bo_Continue:=True:C214
			End if 
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	If ($_bo_Continue)
		Case of 
			: ([COMPONENTS:86]Component_Code:2#"")  //it has a product code
				OBJECT SET VISIBLE:C603(OI_t_LookupValue; False:C215)
				OBJECT SET VISIBLE:C603(*; "oLabelLookup"; False:C215)
				$_l_ComponentSectionRow:=Find in array:C230(OI_al_SectionIDS; [COMPONENTS:86]X_Build_Code_Section_ID:18)
				If (Not:C34(OI_abo_UserSetInclude{$_l_ComponentSectionRow}))
					If ([COMPONENTS:86]Optional_Component:11)
						OBJECT SET VISIBLE:C603(OI_bo_IncludeProduct; True:C214)
						OBJECT SET TITLE:C194(OI_bo_IncludeProduct; "include "+[COMPONENTS:86]Component_Name:17)
						If ([COMPONENTS:86]IncludeOptionalByDefault:22)
							OI_bo_IncludeProduct:=True:C214
						Else 
							OI_bo_IncludeProduct:=False:C215
						End if 
						
					Else 
						OI_bo_IncludeProduct:=True:C214
						OBJECT SET VISIBLE:C603(OI_bo_IncludeProduct; False:C215)
					End if 
				Else 
					If ([COMPONENTS:86]Optional_Component:11)
						OBJECT SET VISIBLE:C603(OI_bo_IncludeProduct; True:C214)
						OBJECT SET TITLE:C194(OI_bo_IncludeProduct; "include "+[COMPONENTS:86]Component_Name:17)
					End if 
					OI_bo_IncludeProduct:=OI_abo_IncludeInProduct{$_l_ComponentSectionRow}
				End if 
				//put the output code into the section builder
				OBJECT SET VISIBLE:C603(*; "oSelectionListBox"; False:C215)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[COMPONENTS:86]Component_Code:2)
				Case of 
					: ([PRODUCTS:9]x_Product_Entry_Class:55=2)
						//This productt is a componentized product..we will go to anothe window to create it
						//When we return we will store the translated product code in an array-this is in case we return to the page. On screen the 'new' sub product code will be displayed
						//Remember when returning that if this is an additional order item the data is stored in the correct array. Note also that we create the component product at this point.
						
					: ([PRODUCTS:9]x_Product_Entry_Class:55=1)  //Because this is a single product we can swith to the dates page set up for that product and store the dates in the main array
						//note that were multiple products are involved..either select one or many the product selector screen will open an new window so as to retain integrity and return the user back to the same page. that will store the dates of the sub component in a differnt array
						//(there could be several arrays relating to the one section if the user can select multiple products!)
						If ([COMPONENTS:86]X_AllowNulDates:23)
							$_bo_ShowNulDates:=True:C214
						Else 
							$_bo_ShowNulDates:=True:C214
						End if 
						If ([PRODUCTS:9]Every_Number:28#0) & ([PRODUCTS:9]Unit_Number:29#0)
							$_l_IssueNumber:=[PRODUCTS:9]Issues_Number:27
							SD2_CheckDefaultAction("PDT")
							While (Semaphore:C143("DIARYPROTECT"))  //This is so we never create the records on two machines
								DelayTicks(2)
							End while 
							QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
							QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
							QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4>=Current date:C33(*))
							If (Records in selection:C76([DIARY:12])<$_l_IssueNumber)
								If ([PRODUCTS:9]Every_Number:28#0) & ([PRODUCTS:9]Unit_Number:29#0)
									ARRAY DATE:C224($_ad_IssueDates; 0)
									//first calc the NEXT  issue date
									$_d_FIrstIssueDate:=[PRODUCTS:9]First_Issue_Date:32  // That was the first date
									
									$_l_FutureUnits:=[PRODUCTS:9]Issues_Number:27
									Case of 
										: ([PRODUCTS:9]Unit_Number:29=7)
											$_d_LastDate:=Current date:C33(*)-7
											If ($_d_FIrstIssueDate<$_d_LastDate)
												Repeat 
													$_d_FIrstIssueDate:=$_d_FIrstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
												Until ($_d_FIrstIssueDate>=$_d_LastDate)
											End if 
											
										: ([PRODUCTS:9]Unit_Number:29=1)
											$_d_LastDate:=Current date:C33(*)-1
											If ($_d_FIrstIssueDate<$_d_LastDate)
												Repeat 
													$_d_FIrstIssueDate:=$_d_FIrstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
												Until ($_d_FIrstIssueDate>=$_d_LastDate)
											End if 
										: ([PRODUCTS:9]Unit_Number:29=31)
											$_d_LastDate:=Current date:C33(*)-31
											If ($_d_FIrstIssueDate<$_d_LastDate)
												Repeat 
													$_d_FIrstIssueDate:=$_d_FIrstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
												Until ($_d_FIrstIssueDate>=$_d_LastDate)
											End if 
										: ([PRODUCTS:9]Unit_Number:29=365)
											$_d_LastDate:=Current date:C33(*)-365
											If ($_d_FIrstIssueDate<$_d_LastDate)
												Repeat 
													$_d_FIrstIssueDate:=$_d_FIrstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
												Until ($_d_FIrstIssueDate>=$_d_LastDate)
											End if 
									End case 
									//we are not going to check or create the existence of past issues
									SD2_CheckDefaultAction("PDT")
									QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
									QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
									QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_FIrstIssueDate)
									If (Records in selection:C76([DIARY:12])=0)
										APPEND TO ARRAY:C911($_ad_IssueDates; $_d_FIrstIssueDate)
									End if 
									$_bo_Exit:=False:C215
									$_l_UnitCount:=0
									Repeat 
										Case of 
											: ([PRODUCTS:9]Unit_Number:29=31)  //month
												If ($_d_FIrstIssueDate>!00-00-00!)
													$_l_Dayof:=Day of:C23($_d_FIrstIssueDate)
												Else 
													$_l_Dayof:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
												End if 
												$_d_Date2:=$_d_FIrstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
												$_l_Dayof2:=Day of:C23($_d_Date2)
												If ($_l_Dayof2>$_l_Dayof)
													For ($_l_Index; $_l_Dayof2; 1; -1)
														$_d_Date2:=$_d_Date2-1
														If (Day of:C23($_d_Date2)=$_l_Dayof)
															$_l_Index:=1
														End if 
													End for 
												Else 
													For ($_l_Index; $_l_Dayof2; 31)
														$_d_Date2:=$_d_Date2+1
														If (Day of:C23($_d_Date2)=$_l_Dayof)
															$_l_Index:=32
														End if 
													End for 
												End if 
												$_d_FIrstIssueDate:=$_d_Date2
												
											Else 
												$_d_FIrstIssueDate:=$_d_FIrstIssueDate+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
										End case 
										$_l_UnitCount:=$_l_UnitCount+1
										QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
										QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
										QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_FIrstIssueDate)
										If (Records in selection:C76([DIARY:12])=0)
											APPEND TO ARRAY:C911($_ad_IssueDates; $_d_FIrstIssueDate)
										End if 
									Until ($_l_UnitCount>=$_l_FutureUnits)
									If (Size of array:C274($_ad_IssueDates)>0)
										//there are some issue records to be created
										For ($_l_Index; 1; Size of array:C274($_ad_IssueDates))
											QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
											QUERY:C277([DIARY:12];  & ; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
											QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_ad_IssueDates{$_l_Index})
											If (Records in selection:C76([DIARY:12])=0)
												
												CREATE RECORD:C68([DIARY:12])
												DiarySetCode
												[DIARY:12]Action_Code:9:="PDT"
												[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
												[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
												[DIARY:12]Time_Do_From:6:=?00:00:01?
												[DIARY:12]Time_Do_To:35:=?23:59:59?
												[DIARY:12]Product_Code:13:=[PRODUCTS:9]Product_Code:1
												[DIARY:12]Action_Details:10:=[PRODUCTS:9]Product_Name:2+" Publication Date"
												DB_SaveRecord(->[DIARY:12])
											End if 
										End for 
									End if 
									
									QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
									QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4>=Current date:C33(*))
									
								End if 
							End if 
							CLEAR SEMAPHORE:C144("DIARYPROTECT")
							
							ARRAY BOOLEAN:C223(PRD_abo_IssueInsert; 0)
							SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; PRD_ad_IssueDate; [DIARY:12]Subject:63; PRD_at_IssueName; [DIARY:12]Action_Details:10; PRD_AT_issueDetails; [DIARY:12]Diary_Code:3; PRD_at_IssueCode)
							ARRAY BOOLEAN:C223(PRD_abo_IssueInsert; Size of array:C274(PRD_ad_IssueDate))
							SORT ARRAY:C229(PRD_ad_IssueDate; PRD_abo_IssueInsert; PRD_at_IssueName; PRD_AT_issueDetails; PRD_at_IssueCode)
							PRD_R_Quantity:=[COMPONENTS:86]Quantity:3
							For ($_l_Index; 1; PRD_R_Quantity; 1)
								If (Size of array:C274(PRD_abo_IssueInsert)>=$_l_Index)
									PRD_abo_IssueInsert{$_l_Index}:=True:C214
									If ($_l_Index=1)
										PRD_d_FIrstDate:=PRD_ad_IssueDate{$_l_Index}
										If ($_l_Index=PRD_R_Quantity)
											PRD_d_LastDate:=PRD_ad_IssueDate{$_l_Index}
										End if 
									Else 
										PRD_d_LastDate:=PRD_ad_IssueDate{$_l_Index}
									End if 
								End if 
							End for 
							
							ARRAY TEXT:C222(PRD_at_FillPattern; 0)
							APPEND TO ARRAY:C911(PRD_at_FillPattern; "Consecutive Dates")
							APPEND TO ARRAY:C911(PRD_at_FillPattern; "Alternating Dates")
							APPEND TO ARRAY:C911(PRD_at_FillPattern; "Every 3rd Date")
							APPEND TO ARRAY:C911(PRD_at_FillPattern; "Every 4th Date")
							$_bo_MoreThanOnePerWeek:=False:C215
							$_bo_MoreThanOnePerMonth:=False:C215
							$_bo_MoreThanOnePerYear:=False:C215
							For ($_l_Index; 1; Size of array:C274(PRD_ad_IssueDate))
								If ($_l_Index=1)
									$_l_Dayof:=Day of:C23(PRD_ad_IssueDate{$_l_Index})
									$_l_MonthOf:=Month of:C24(PRD_ad_IssueDate{$_l_Index})
									$_l_Year:=Year of:C25(PRD_ad_IssueDate{$_l_Index})
								Else 
									$_l_Dayof2:=Day of:C23(PRD_ad_IssueDate{$_l_Index})
									$_l_Monthof2:=Month of:C24(PRD_ad_IssueDate{$_l_Index})
									$_l_Year2:=Year of:C25(PRD_ad_IssueDate{$_l_Index})
									If ($_l_Year2=$_l_Year)
										$_bo_MoreThanOnePerYear:=True:C214
									End if 
									If ($_l_Monthof2=$_l_MonthOf) & ($_l_Year2=$_l_Year)
										$_bo_MoreThanOnePerMonth:=True:C214
									End if 
									If ($_l_Dayof2<($_l_Dayof+7)) & ($_l_Monthof2=$_l_MonthOf) & ($_l_Year2=$_l_Year)
										$_bo_MoreThanOnePerWeek:=True:C214
									End if 
									$_l_Dayof:=Day of:C23(PRD_ad_IssueDate{$_l_Index})
									$_l_MonthOf:=Month of:C24(PRD_ad_IssueDate{$_l_Index})
									$_l_Year:=Year of:C25(PRD_ad_IssueDate{$_l_Index})
								End if 
							End for 
							If ($_bo_MoreThanOnePerWeek)
								APPEND TO ARRAY:C911(PRD_at_FillPattern; "1st Date in Week")
							End if 
							If ($_bo_MoreThanOnePerMonth)
								APPEND TO ARRAY:C911(PRD_at_FillPattern; "1st Date in Month")
							End if 
							If ($_bo_MoreThanOnePerYear)
								APPEND TO ARRAY:C911(PRD_at_FillPattern; "1st Date in Year")
							End if 
							PRD_at_FillPattern:=1
							//PRD_al_RestrictSections;[BUILT_CODE_FORMAT_SECTION]SECTION_NAME;PRD_at_RestrictSectionNames
							//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
							//SORT ARRAY(PRD_ad_IssueDate;PRD_aB_IssueInsert;PRD_at_IssueName;PRD_AT_issueDetails;PRD_at_IssueCode
							LB_SetupListbox(->OL_lb_DateIterations; "oPID"; "PID_L"; 1; ->PRD_abo_IssueInsert; ->PRD_ad_IssueDate; ->PRD_at_IssueName; ->PRD_AT_issueDetails; ->PRD_at_IssueCode)
							LB_SetColumnHeaders(->OL_lb_DateIterations; "PID_L"; 1; "Insert"; "Date"; "Name"; "Detail"; "Code")
							LB_SetColumnWidths(->OL_lb_DateIterations; "oPID"; 1; 35; 65; 120; 250; 0)
							LB_SetScroll(->OL_lb_DateIterations; -2; -2)
							LB_SetEnterable(->OL_lb_DateIterations; False:C215; 0; "")
							LB_SetEnterable(->OL_lb_DateIterations; True:C214; 1; "")
							
							LBi_InclSetupJustStyle(->OL_lb_DateIterations)
							$_t_ComponentOutputCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
							$_l_ComponentSectionRow:=Find in array:C230(OI_al_SectionIDS; [COMPONENTS:86]X_Build_Code_Section_ID:18)
							
							If ([COMPONENTS:86]Build_Code_Macro:14#"")
								Macro([COMPONENTS:86]Build_Code_Macro:14)
								$_t_ComponentOutputCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
							End if 
							Case of 
								: (Length:C16($_t_ComponentOutputCode)>OI_al_SectionLength{$_l_ComponentSectionRow})  //This SHOULD never be happening if it is the setup is wrong
									//Truncate it
									//$_t_ComponentOutputCode:=Substring($_t_ComponentOutputCode;1;OI_al_SectionLength{$_l_ComponentSectionRow})
								: (Length:C16($_t_ComponentOutputCode)<OI_al_SectionLength{$_l_ComponentSectionRow})
									If (False:C215)
										$_l_Difference:=OI_al_SectionLength{$_l_ComponentSectionRow}-(Length:C16($_t_ComponentOutputCode))
										
										If (OI_at_FillChar{$_l_ComponentSectionRow}#"")
											$_t_Char:=OI_at_FillChar{$_l_ComponentSectionRow}
										Else 
											$_t_Char:=" "
										End if 
										$_t_Fill:=$_t_Char*$_l_Difference
										If (OI_at_FillStyle{$_l_ComponentSectionRow}="Left")
											$_t_ComponentOutputCode:=$_t_Fill+$_t_ComponentOutputCode
										Else 
											$_t_ComponentOutputCode:=$_t_ComponentOutputCode+$_t_Fill
										End if 
										//pad it
									End if 
							End case 
							If ([COMPONENTS:86]Additional_Order_Item:12=False:C215)
								OI_at_BuildCodeMatrix{$_l_ComponentSectionRow}:=$_t_ComponentOutputCode
								OI_ar_BuildProductComponentsQTY{$_l_ComponentSectionRow}:=[COMPONENTS:86]Quantity:3
								If (Not:C34(OI_abo_UserSetInclude{$_l_ComponentSectionRow}))
									
									If (Not:C34([COMPONENTS:86]Optional_Component:11))
										$_l_BuildIndexPosition:=Find in array:C230(PRD_abo_IssueInsert; True:C214)
										If ($_l_BuildIndexPosition>0)
											OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=True:C214
											OI_bo_IncludeProduct:=True:C214
										Else 
											OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=False:C215
											OI_bo_IncludeProduct:=True:C214
										End if 
									Else 
										OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=OI_bo_IncludeProduct
									End if 
								Else 
									OI_bo_IncludeProduct:=OI_abo_IncludeInProduct{$_l_ComponentSectionRow}
								End if 
								//OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=OI_bo_IncludeProduct
								
								OBJECT SET TITLE:C194(OI_bo_IncludeProduct; "include "+[COMPONENTS:86]Component_Name:17)
								$_l_BuildIndexPosition:=Find in array:C230(OI_al_MultiplesIndex; [COMPONENTS:86]X_Build_Code_Section_ID:18)
								If ($_l_BuildIndexPosition<0)
									PRD_bo_OneLinePerDate:=True:C214
									APPEND TO ARRAY:C911(OI_al_MultiplesIndex; [COMPONENTS:86]X_Build_Code_Section_ID:18)
									INSERT IN ARRAY:C227(OI_at_MultipleCodes; Size of array:C274(OI_at_MultipleCodes)+1; 1)
									//This array will store the selected dates
									For ($_l_issuesIndex; 1; Size of array:C274(PRD_abo_IssueInsert))
										If (PRD_abo_IssueInsert{$_l_issuesIndex})
											APPEND TO ARRAY:C911(OI_at_MultipleCodes{Size of array:C274(OI_at_MultipleCodes)}; PRD_at_IssueCode{$_l_issuesIndex})
											
										End if 
									End for 
								Else 
									//we may be returning to this page so need to reload the set dates. its not the size of the array-there may be blanks
									$_l_DatesSet:=0
									$_d_FirstDate:=!00-00-00!
									$_d_LastDate:=!00-00-00!
									If (Size of array:C274(OI_at_MultipleCodes{$_l_BuildIndexPosition})>0)
										For ($_l_ResetIndex; 1; Size of array:C274(PRD_abo_IssueInsert))
											PRD_abo_IssueInsert{$_l_ResetIndex}:=False:C215
										End for 
										For ($_l_ResetIndex; 1; Size of array:C274(OI_at_MultipleCodes{$_l_BuildIndexPosition}))
											$_t_Code:=OI_at_MultipleCodes{$_l_BuildIndexPosition}{$_l_ResetIndex}
											If ($_t_Code#"")
												$_l_BuildCodePosition:=Find in array:C230(PRD_at_IssueCode; $_t_Code)
												If ($_l_BuildCodePosition>0)
													$_l_DatesSet:=$_l_DatesSet+1
													If ($_d_FirstDate=!00-00-00!) | ($_d_FirstDate>(PRD_ad_IssueDate{$_l_BuildCodePosition}))
														$_d_FirstDate:=PRD_ad_IssueDate{$_l_BuildCodePosition}
														
													End if 
													If ($_d_LastDate<PRD_ad_IssueDate{$_l_BuildCodePosition})
														$_d_LastDate:=PRD_ad_IssueDate{$_l_BuildCodePosition}
													End if 
													PRD_abo_IssueInsert{$_l_BuildCodePosition}:=True:C214
												End if 
											End if 
										End for 
									End if 
									If ($_l_DatesSet>0)
										OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=True:C214
										PRD_R_Quantity:=$_l_DatesSet
										PRD_d_FIrstDate:=$_d_FirstDate
										PRD_d_LastDate:=$_d_LastDate
									End if 
								End if 
								OI_bo_UseDiscount:=False:C215
								//calculate the product price
								PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; PRD_t_productCurrency; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeBASEPrice{$_l_ComponentSectionRow})
								If (OI_bo_UseDiscount)
									OI_al_BuildPriceClass{$_l_ComponentSectionRow}:=2
								End if 
								OI_bo_UseDiscount:=False:C215
								//calculate the SALES price
								PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; OI_T_CurrencyCode; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeSALESPrice{$_l_ComponentSectionRow})
								If (OI_bo_UseDiscount)
									OI_al_ChargingPriceClass{$_l_ComponentSectionRow}:=2
								End if 
								//```
								ARRAY TEXT:C222($_at_SupplierCostCurrencies; 0)
								ARRAY REAL:C219($_ar_SupplierStdCosts; 0)
								ARRAY REAL:C219($_ar_SupplierCosts; 0)
								ARRAY LONGINT:C221($_al_SupplierPreffered; 0)
								ARRAY TEXT:C222($_at_SupplierCompanyCodes; 0)
								$_t_UseSupplierCode:=""
								If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
									$_l_RecordsinSelectionProdSuppli:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
									SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Company_Code:1; $_at_SupplierCompanyCodes; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; $_ar_SupplierCosts; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5; $_ar_SupplierStdCosts; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; $_at_SupplierCostCurrencies; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; $_al_SupplierPreffered)
									For ($_l_SupplierIndex; 1; Size of array:C274($_at_SupplierCompanyCodes))
										If ($_at_SupplierCostCurrencies{$_l_SupplierIndex}="")
											$_at_SupplierCostCurrencies{$_l_SupplierIndex}:=<>SYS_t_BaseCurrency
										End if 
										If ($_al_SupplierPreffered{$_l_SupplierIndex}=0)
											$_al_SupplierPreffered{$_l_SupplierIndex}:=$_l_RecordsinSelectionProdSuppli
										End if 
									End for 
									SORT ARRAY:C229($_al_SupplierPreffered; $_at_SupplierCompanyCodes; $_at_SupplierCostCurrencies; $_ar_SupplierCosts)
									$_t_UseSupplierCode:=$_at_SupplierCompanyCodes{1}
									$_t_UseSupplierCurrency:=$_at_SupplierCostCurrencies{1}
									$_r_UseStandardCost:=$_ar_SupplierStdCosts{1}
									$_r_UseSupplierCost:=$_ar_SupplierCosts{1}
								End if 
								If ($_t_UseSupplierCode#"")
									PRD_BuildGetComponentCost($_t_UseSupplierCode; $_t_UseSupplierCurrency; $_r_UseStandardCost; PRD_t_productCurrency; [PRODUCTS:9]Product_Code:1; ->OI_ar_BuildCodeCOSTPrice{$_l_ComponentSectionRow})
									OI_ar_BuildCodeCostStd{$_l_ComponentSectionRow}:=OI_ar_BuildCodeCOSTPrice{$_l_ComponentSectionRow}
									OI_at_BuildCodeSupplier{$_l_ComponentSectionRow}:=$_t_UseSupplierCode
								End if 
								
							Else 
								//This is a date related as an additional order item.
								$_l_BuildIndexPosition:=Find in array:C230(OI_al_MultiplesIndex; [COMPONENTS:86]X_Build_Code_Section_ID:18)
								If ($_l_BuildIndexPosition<0)
									PRD_bo_OneLinePerDate:=True:C214
									APPEND TO ARRAY:C911(OI_al_MultiplesIndex; [COMPONENTS:86]X_Build_Code_Section_ID:18)
									INSERT IN ARRAY:C227(OI_at_MultipleCodes; Size of array:C274(OI_at_MultipleCodes)+1; 1)
									For ($_l_issuesIndex; 1; Size of array:C274(PRD_abo_IssueInsert))
										If (PRD_abo_IssueInsert{$_l_issuesIndex})
											APPEND TO ARRAY:C911(OI_at_MultipleCodes{Size of array:C274(OI_at_MultipleCodes)}; PRD_at_IssueCode{$_l_issuesIndex})
											
										End if 
									End for 
									//This array will store the selected dates
								Else 
									//we may be returning to this page so need to reload the set dates. its not the size of the array-there may be blanks
									$_l_DatesSet:=0
									$_d_FirstDate:=!00-00-00!
									$_d_LastDate:=!00-00-00!
									If (Size of array:C274(OI_at_MultipleCodes{$_l_BuildIndexPosition})>0)
										For ($_l_ResetIndex; 1; Size of array:C274(OI_at_MultipleCodes{$_l_BuildIndexPosition}))
											$_t_Code:=OI_at_MultipleCodes{$_l_BuildIndexPosition}{$_l_ResetIndex}
											If ($_t_Code#"")
												$_l_BuildCodePosition:=Find in array:C230(PRD_at_IssueCode; $_t_Code)
												If ($_l_BuildCodePosition>0)
													$_l_DatesSet:=$_l_DatesSet+1
													If ($_d_FirstDate=!00-00-00!)
														$_d_FirstDate:=PRD_ad_IssueDate{$_l_BuildCodePosition}
														
													End if 
													$_d_LastDate:=PRD_ad_IssueDate{$_l_BuildCodePosition}
													PRD_abo_IssueInsert{$_l_BuildCodePosition}:=True:C214
												End if 
											End if 
										End for 
									End if 
									If ($_l_DatesSet>0)
										PRD_R_Quantity:=$_l_DatesSet
										PRD_d_FIrstDate:=$_d_FirstDate
										PRD_d_LastDate:=$_d_LastDate
									End if 
								End if 
								//TRACE
								OI_at_AdditionOrderItems{$_l_Index}:=[PRODUCTS:9]Product_Code:1
								OI_ar_AdditionalItemQTY{$_l_Index}:=[COMPONENTS:86]Quantity:3
								If (PRD_t_productCurrency=OI_T_CurrencyCode)
									OK_ar_AdditionalItemPrice{$_l_Index}:=[PRODUCTS:9]Sales_Price:9
								Else 
									OK_ar_AdditionalItemPrice{$_l_Index}:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; PRD_t_productCurrency; OI_T_CurrencyCode; Current date:C33(*))
								End if 
								OI_ar_AdditionalItemPriceBase:=[PRODUCTS:9]Sales_Price:9
							End if 
							//````
							FORM GOTO PAGE:C247(2)
							
						Else 
							Gen_Alert("The product referred to in this compoment "+[PRODUCTS:9]Product_Code:1+" is not set up correctly")
						End if 
						
					Else 
						OBJECT SET VISIBLE:C603(OI_t_ProductName; True:C214)
						OBJECT SET VISIBLE:C603(OI_t_ProductBuiltCode; True:C214)
						OBJECT SET VISIBLE:C603(OI_t_ProductCode; True:C214)
						OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
						OI_t_ProductBuiltCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
						OI_t_ProductName:=[PRODUCTS:9]Product_Name:2
						$_t_ComponentOutputCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
						$_l_ComponentSectionRow:=Find in array:C230(OI_al_SectionIDS; [COMPONENTS:86]X_Build_Code_Section_ID:18)
						If (Not:C34(OI_abo_UserSetInclude{$_l_ComponentSectionRow}))
							If (Not:C34([COMPONENTS:86]Optional_Component:11))
								
								OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=True:C214
								OI_bo_IncludeProduct:=True:C214
							Else 
								OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=OI_bo_IncludeProduct
							End if 
						Else 
							OI_bo_IncludeProduct:=OI_abo_IncludeInProduct{$_l_ComponentSectionRow}
						End if 
						
						OBJECT SET TITLE:C194(OI_bo_IncludeProduct; "include "+[COMPONENTS:86]Component_Name:17)
						If ([COMPONENTS:86]Build_Code_Macro:14#"")
							Macro([COMPONENTS:86]Build_Code_Macro:14)
							$_t_ComponentOutputCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
						End if 
						Case of 
							: (Length:C16($_t_ComponentOutputCode)>OI_al_SectionLength{$_l_ComponentSectionRow})  //This SHOULD never be happening if it is the setup is wrong
								//Truncate it
								//$_t_ComponentOutputCode:=Substring($_t_ComponentOutputCode;1;OI_al_SectionLength{$_l_ComponentSectionRow})
							: (Length:C16($_t_ComponentOutputCode)<OI_al_SectionLength{$_l_ComponentSectionRow})
								If (False:C215)
									$_l_Difference:=OI_al_SectionLength{$_l_ComponentSectionRow}-(Length:C16($_t_ComponentOutputCode))
									
									If (OI_at_FillChar{$_l_ComponentSectionRow}#"")
										$_t_Char:=OI_at_FillChar{$_l_ComponentSectionRow}
									Else 
										$_t_Char:=" "
									End if 
									$_t_Fill:=$_t_Char*$_l_Difference
									If (OI_at_FillStyle{$_l_ComponentSectionRow}="Left")
										$_t_ComponentOutputCode:=$_t_Fill+$_t_ComponentOutputCode
									Else 
										$_t_ComponentOutputCode:=$_t_ComponentOutputCode+$_t_Fill
									End if 
									//pad it
								End if 
						End case 
						If ([COMPONENTS:86]Additional_Order_Item:12=False:C215)
							OI_at_BuildCodeMatrix{$_l_ComponentSectionRow}:=$_t_ComponentOutputCode
							OI_ar_BuildProductComponentsQTY{$_l_ComponentSectionRow}:=[COMPONENTS:86]Quantity:3
							OI_t_ProductCode:=[PRODUCTS:9]Product_Code:1
							OI_at_BuildProductComponents{$_l_ComponentSectionRow}:=OI_t_ProductCode
							OI_bo_UseDiscount:=False:C215
							//calculate the product price
							PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; PRD_t_productCurrency; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeBASEPrice{$_l_ComponentSectionRow})
							If (OI_bo_UseDiscount)
								OI_al_BuildPriceClass{$_l_ComponentSectionRow}:=2
							End if 
							OI_bo_UseDiscount:=False:C215
							//calculate the SALES price
							PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; OI_T_CurrencyCode; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeSALESPrice{$_l_ComponentSectionRow})
							If (OI_bo_UseDiscount)
								OI_al_ChargingPriceClass{$_l_ComponentSectionRow}:=2
							End if 
							ARRAY TEXT:C222($_at_SupplierCostCurrencies; 0)
							ARRAY REAL:C219($_ar_SupplierStdCosts; 0)
							ARRAY REAL:C219($_ar_SupplierCosts; 0)
							ARRAY LONGINT:C221($_al_SupplierPreffered; 0)
							ARRAY TEXT:C222($_at_SupplierCompanyCodes; 0)
							$_t_UseSupplierCode:=""
							If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
								$_l_RecordsinSelectionProdSuppli:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
								SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Company_Code:1; $_at_SupplierCompanyCodes; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; $_ar_SupplierCosts; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5; $_ar_SupplierStdCosts; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; $_at_SupplierCostCurrencies; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; $_al_SupplierPreffered)
								For ($_l_SupplierIndex; 1; Size of array:C274($_at_SupplierCompanyCodes))
									If ($_at_SupplierCostCurrencies{$_l_SupplierIndex}="")
										$_at_SupplierCostCurrencies{$_l_SupplierIndex}:=<>SYS_t_BaseCurrency
									End if 
									If ($_al_SupplierPreffered{$_l_SupplierIndex}=0)
										$_al_SupplierPreffered{$_l_SupplierIndex}:=$_l_RecordsinSelectionProdSuppli
									End if 
								End for 
								SORT ARRAY:C229($_al_SupplierPreffered; $_at_SupplierCompanyCodes; $_at_SupplierCostCurrencies; $_ar_SupplierCosts)
								$_t_UseSupplierCode:=$_at_SupplierCompanyCodes{1}
								$_t_UseSupplierCurrency:=$_at_SupplierCostCurrencies{1}
								$_r_UseStandardCost:=$_ar_SupplierStdCosts{1}
								$_r_UseSupplierCost:=$_ar_SupplierCosts{1}
							End if 
							If ($_t_UseSupplierCode#"")
								PRD_BuildGetComponentCost($_t_UseSupplierCode; $_t_UseSupplierCurrency; $_r_UseStandardCost; PRD_t_productCurrency; [PRODUCTS:9]Product_Code:1; ->OI_ar_BuildCodeCOSTPrice{$_l_ComponentSectionRow})
								OI_ar_BuildCodeCostStd{$_l_ComponentSectionRow}:=OI_ar_BuildCodeCOSTPrice{$_l_ComponentSectionRow}
								OI_at_BuildCodeSupplier{$_l_ComponentSectionRow}:=$_t_UseSupplierCode
							End if 
						Else 
							
							//ARRAY REAL(OK_ar_AdditionalItemCOSTPrice;0)
							OI_t_ProductCode:=[PRODUCTS:9]Product_Code:1
							OI_at_AdditionOrderItems{$_l_ComponentSectionRow}:=[PRODUCTS:9]Product_Code:1
							OI_ar_AdditionalItemQTY{$_l_ComponentSectionRow}:=[COMPONENTS:86]Quantity:3
							If (PRD_t_productCurrency=OI_T_CurrencyCode)
								OK_ar_AdditionalItemPrice{$_l_ComponentSectionRow}:=[PRODUCTS:9]Sales_Price:9
							Else 
								OK_ar_AdditionalItemPrice{$_l_ComponentSectionRow}:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; PRD_t_productCurrency; OI_T_CurrencyCode; Current date:C33(*))
							End if 
							OI_ar_AdditionalItemPriceBase{$_l_ComponentSectionRow}:=[PRODUCTS:9]Sales_Price:9
							//Should add the cost price in here but really only need it if the additional product is constructed
							
						End if 
						FORM GOTO PAGE:C247(1)
						
						
				End case 
				//One product..this MAY take us to
				
				
			: ([COMPONENTS:86]Catalogue_ID:7#0)
				OBJECT SET VISIBLE:C603(OI_t_ProductName; False:C215)
				OBJECT SET VISIBLE:C603(OI_t_ProductBuiltCode; False:C215)
				
				OBJECT SET VISIBLE:C603(OI_t_ProductCode; False:C215)
				OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oSelectionListBox"; True:C214)
				$_l_ComponentSectionRow:=Find in array:C230(OI_al_SectionIDS; [COMPONENTS:86]X_Build_Code_Section_ID:18)
				If (Not:C34(OI_abo_UserSetInclude{$_l_ComponentSectionRow}))
					If (Not:C34([COMPONENTS:86]Optional_Component:11))
						
						OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=True:C214
						OI_bo_IncludeProduct:=True:C214
						
					Else 
						If ([COMPONENTS:86]IncludeOptionalByDefault:22)
							OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=True:C214
							OI_bo_IncludeProduct:=True:C214
						Else 
							OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=False:C215
							OI_bo_IncludeProduct:=False:C215
						End if 
					End if 
				Else 
					OI_bo_IncludeProduct:=OI_abo_IncludeInProduct{$_l_ComponentSectionRow}
				End if 
				
				
				If ([COMPONENTS:86]Optional_Component:11)
					OBJECT SET VISIBLE:C603(OI_bo_IncludeProduct; True:C214)
					OBJECT SET TITLE:C194(OI_bo_IncludeProduct; "include "+[COMPONENTS:86]Component_Name:17)
					//OI_bo_IncludeProduct:=True
				Else 
					OI_bo_IncludeProduct:=True:C214
					OBJECT SET VISIBLE:C603(OI_bo_IncludeProduct; False:C215)
				End if 
				If ([COMPONENTS:86]Component_Type:6=0)
					PRD_bo_SelectMultiple:=False:C215
				Else 
					PRD_bo_SelectMultiple:=True:C214
				End if 
				
				QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=[COMPONENTS:86]Catalogue_ID:7)
				CAT_LoadPrefs
				CAT_LoadProducts([CATALOGUE:108]x_ID:1; OI_T_CurrencyCode; False:C215; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
				//here if the restictions on this component had macros use them to filter the selection
				If (Size of array:C274($_At_FilterNames)>0)
					For ($_l_FilterIndex; 1; Size of array:C274($_At_FilterNames))
						If ($_At_FilterNames{$_l_FilterIndex}#"")
							Macro($_At_FilterNames{$_l_FilterIndex})  //its up to the macro writer to make sure this filter correclty!!
						End if 
					End for 
				End if 
				If (Records in selection:C76([PRODUCTS:9])>1)
					//I will switch this to use a table based form at some point but riight now it going to use an array
					ARRAY LONGINT:C221(PRD_al_BLDPrdIDs; 0)
					ARRAY TEXT:C222(PRD_at_BLDprdCodes; 0)
					ARRAY TEXT:C222(PRD_at_BLDprdShrtCodes; 0)
					ARRAY TEXT:C222(PRD_at_BLDprdNames; 0)
					ARRAY TEXT:C222(PRD_at_BLDDescription; 0)
					ARRAY BOOLEAN:C223(PRD_abo_BLBInclude; 0)
					ARRAY REAL:C219(PRD_ar_BLDPrice; 0)
					SELECTION TO ARRAY:C260([PRODUCTS:9]X_ID:43; PRD_al_BLDPrdIDs; [PRODUCTS:9]x_Product_Build_Section_Code:56; PRD_at_Outputcode; [PRODUCTS:9]Product_Code:1; PRD_at_BLDprdCodes; [PRODUCTS:9]Short_Code:19; PRD_at_BLDprdShrtCodes; [PRODUCTS:9]Product_Name:2; PRD_at_BLDprdNames; [PRODUCTS:9]Description:6; PRD_at_BLDDescription; [PRODUCTS:9]Sales_Price:9; PRD_ar_BLDPrice)
					
					ARRAY BOOLEAN:C223(PRD_abo_BLBInclude; Size of array:C274(PRD_al_BLDPrdIDs))
					SORT ARRAY:C229(PRD_at_Outputcode; PRD_at_BLDprdCodes; PRD_at_BLDprdShrtCodes; PRD_at_BLDprdNames; PRD_at_BLDDescription; PRD_abo_BLBInclude)
					If (PRD_bo_SelectMultiple)
						$_l_BuildIndexPosition:=Find in array:C230(OI_al_MultiplesIndex; [COMPONENTS:86]X_Build_Code_Section_ID:18)
						If ($_l_BuildIndexPosition<0)
							APPEND TO ARRAY:C911(OI_al_MultiplesIndex; [COMPONENTS:86]X_Build_Code_Section_ID:18)
							INSERT IN ARRAY:C227(OI_at_MultipleCodes; Size of array:C274(OI_at_MultipleCodes)+1; 1)
							//This array will store the selected dates
						Else 
							//we may be returning to this page so need to reload the set products. its not the size of the array-there may be blanks
							If (Size of array:C274(OI_at_MultipleCodes{$_l_BuildIndexPosition})>0)
								For ($_l_ResetIndex; 1; Size of array:C274(OI_at_MultipleCodes{$_l_BuildIndexPosition}))
									$_t_Code:=OI_at_MultipleCodes{$_l_BuildIndexPosition}{$_l_ResetIndex}
									If ($_t_Code#"")
										$_l_BuildCodePosition:=Find in array:C230(PRD_at_BLDprdCodes; $_t_Code)
										If ($_l_BuildCodePosition>0)
											PRD_abo_BLBInclude{$_l_BuildCodePosition}:=True:C214
											
										End if 
									End if 
								End for 
							End if 
							
						End if 
						
					Else 
						OI_t_ProductCode:=OI_at_BuildProductComponents{$_l_ComponentSectionRow}  //This is the selected product
						$_l_BuildIndexPosition:=Find in array:C230(PRD_at_BLDprdCodes; OI_t_ProductCode)
						If ($_l_BuildIndexPosition>0)  //it should be!!!
							PRD_abo_BLBInclude{$_l_BuildIndexPosition}:=True:C214
						End if 
						
					End if 
					
					
					//selection to choose from
					SORT ARRAY:C229(PRD_at_Outputcode; PRD_at_BLDprdCodes; PRD_at_BLDprdShrtCodes; PRD_at_BLDprdNames; PRD_at_BLDDescription; PRD_abo_BLBInclude)
					LB_SetupListbox(->OI_lb_SelectProduct; "oPID"; "PID_L"; 1; ->PRD_abo_BLBInclude; ->PRD_at_Outputcode; ->PRD_at_BLDprdNames; ->PRD_at_BLDDescription; ->PRD_at_BLDprdShrtCodes; ->PRD_at_BLDprdCodes)
					
					LB_SetColumnHeaders(->OI_lb_SelectProduct; "PID_L"; 1; "Select"; "Code"; "Name"; "Detail"; "Short Group"; "Product Code")
					LB_SetColumnWidths(->OI_lb_SelectProduct; "oPID"; 1; 35; 65; 120; 250; 0; 0)
					LB_SetScroll(->OI_lb_SelectProduct; -2; -2)
					LB_SetEnterable(->OI_lb_SelectProduct; False:C215; 0; "")
					LB_SetEnterable(->OI_lb_SelectProduct; True:C214; 1; "")
					
					LBi_InclSetupJustStyle(->OI_lb_SelectProduct)
					OBJECT SET VISIBLE:C603(OI_t_LookupValue; True:C214)
					OI_t_LookupValue:=""
					OBJECT SET VISIBLE:C603(*; "oLabelLookup"; True:C214)
					GOTO OBJECT:C206(OI_t_LookupValue)
				Else 
					FIRST RECORD:C50([PRODUCTS:9])
					
					//ok so only one product so make it look like the one product choice
					
					OBJECT SET VISIBLE:C603(OI_t_LookupValue; False:C215)
					OBJECT SET VISIBLE:C603(*; "oLabelLookup"; False:C215)
					OBJECT SET VISIBLE:C603(OI_lb_SelectProduct; False:C215)
					
					OBJECT SET VISIBLE:C603(OI_t_ProductName; True:C214)
					OBJECT SET VISIBLE:C603(OI_t_ProductBuiltCode; True:C214)
					OBJECT SET VISIBLE:C603(OI_t_ProductCode; True:C214)
					OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
					OI_t_ProductBuiltCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
					OI_t_ProductName:=[PRODUCTS:9]Product_Name:2
					$_t_ComponentOutputCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
					$_l_ComponentSectionRow:=Find in array:C230(OI_al_SectionIDS; [COMPONENTS:86]X_Build_Code_Section_ID:18)
					If (Not:C34(OI_abo_UserSetInclude{$_l_ComponentSectionRow}))
						If (Not:C34([COMPONENTS:86]Optional_Component:11))
							OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=True:C214
							OI_bo_IncludeProduct:=True:C214
						Else 
							OI_abo_IncludeInProduct{$_l_ComponentSectionRow}:=OI_bo_IncludeProduct
						End if 
					Else 
						OI_bo_IncludeProduct:=OI_abo_IncludeInProduct{$_l_ComponentSectionRow}
					End if 
					OBJECT SET TITLE:C194(OI_bo_IncludeProduct; "include "+[COMPONENTS:86]Component_Name:17)
					If ([COMPONENTS:86]Build_Code_Macro:14#"")
						Macro([COMPONENTS:86]Build_Code_Macro:14)
						$_t_ComponentOutputCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
					End if 
					Case of 
						: (Length:C16($_t_ComponentOutputCode)>OI_al_SectionLength{$_l_ComponentSectionRow})  //This SHOULD never be happening if it is the setup is wrong
							//Truncate it
							//$_t_ComponentOutputCode:=Substring($_t_ComponentOutputCode;1;OI_al_SectionLength{$_l_ComponentSectionRow})
						: (Length:C16($_t_ComponentOutputCode)<OI_al_SectionLength{$_l_ComponentSectionRow})
							If (False:C215)
								$_l_Difference:=OI_al_SectionLength{$_l_ComponentSectionRow}-(Length:C16($_t_ComponentOutputCode))
								
								If (OI_at_FillChar{$_l_ComponentSectionRow}#"")
									$_t_Char:=OI_at_FillChar{$_l_ComponentSectionRow}
								Else 
									$_t_Char:=" "
								End if 
								$_t_Fill:=$_t_Char*$_l_Difference
								If (OI_at_FillStyle{$_l_ComponentSectionRow}="Left")
									$_t_ComponentOutputCode:=$_t_Fill+$_t_ComponentOutputCode
								Else 
									$_t_ComponentOutputCode:=$_t_ComponentOutputCode+$_t_Fill
								End if 
								//pad it
							End if 
					End case 
					If ([COMPONENTS:86]Additional_Order_Item:12=False:C215)
						OI_at_BuildCodeMatrix{$_l_ComponentSectionRow}:=$_t_ComponentOutputCode
						OI_ar_BuildProductComponentsQTY{$_l_ComponentSectionRow}:=[COMPONENTS:86]Quantity:3
						OI_t_ProductCode:=[PRODUCTS:9]Product_Code:1
						OI_at_BuildProductComponents{$_l_ComponentSectionRow}:=OI_t_ProductCode
						OI_bo_UseDiscount:=False:C215
						//calculate the product price
						PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; PRD_t_productCurrency; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeBASEPrice{$_l_ComponentSectionRow})
						If (OI_bo_UseDiscount)
							OI_al_BuildPriceClass{$_l_ComponentSectionRow}:=2
						End if 
						OI_bo_UseDiscount:=False:C215
						//calculate the SALES price
						PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; OI_T_CurrencyCode; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeSALESPrice{$_l_ComponentSectionRow})
						If (OI_bo_UseDiscount)
							OI_al_ChargingPriceClass{$_l_ComponentSectionRow}:=2
						End if 
						ARRAY TEXT:C222($_at_SupplierCostCurrencies; 0)
						ARRAY REAL:C219($_ar_SupplierStdCosts; 0)
						ARRAY REAL:C219($_ar_SupplierCosts; 0)
						ARRAY LONGINT:C221($_al_SupplierPreffered; 0)
						ARRAY TEXT:C222($_at_SupplierCompanyCodes; 0)
						$_t_UseSupplierCode:=""
						If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
							$_l_RecordsinSelectionProdSuppli:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
							SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Company_Code:1; $_at_SupplierCompanyCodes; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; $_ar_SupplierCosts; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5; $_ar_SupplierStdCosts; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; $_at_SupplierCostCurrencies; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; $_al_SupplierPreffered)
							For ($_l_SupplierIndex; 1; Size of array:C274($_at_SupplierCompanyCodes))
								If ($_at_SupplierCostCurrencies{$_l_SupplierIndex}="")
									$_at_SupplierCostCurrencies{$_l_SupplierIndex}:=<>SYS_t_BaseCurrency
								End if 
								If ($_al_SupplierPreffered{$_l_SupplierIndex}=0)
									$_al_SupplierPreffered{$_l_SupplierIndex}:=$_l_RecordsinSelectionProdSuppli
								End if 
							End for 
							SORT ARRAY:C229($_al_SupplierPreffered; $_at_SupplierCompanyCodes; $_at_SupplierCostCurrencies; $_ar_SupplierCosts)
							$_t_UseSupplierCode:=$_at_SupplierCompanyCodes{1}
							$_t_UseSupplierCurrency:=$_at_SupplierCostCurrencies{1}
							$_r_UseStandardCost:=$_ar_SupplierStdCosts{1}
							$_r_UseSupplierCost:=$_ar_SupplierCosts{1}
						End if 
						If ($_t_UseSupplierCode#"")
							PRD_BuildGetComponentCost($_t_UseSupplierCode; $_t_UseSupplierCurrency; $_r_UseStandardCost; PRD_t_productCurrency; [PRODUCTS:9]Product_Code:1; ->OI_ar_BuildCodeCOSTPrice{$_l_ComponentSectionRow})
							OI_ar_BuildCodeCostStd{$_l_ComponentSectionRow}:=OI_ar_BuildCodeCOSTPrice{$_l_ComponentSectionRow}
							OI_at_BuildCodeSupplier{$_l_ComponentSectionRow}:=$_t_UseSupplierCode
						End if 
						
					Else 
						//ARRAY TEXT(OI_at_AdditionOrderItems;0)  `The product code
						//ARRAY REAL(OI_ar_AdditionalItemQTY;0)  `The Quantity
						//ARRAY REAL(OK_ar_AdditionalItemPrice;0)  `the price in sales currency
						//ARRAY REAL(OI_ar_AdditionalItemPriceBase;0)  `The price in base currency
						//ARRAY REAL(OK_ar_AdditionalItemCOSTPrice;0)
						//TRACE
						OI_at_AdditionOrderItems{$_l_ComponentSectionRow}:=[PRODUCTS:9]Product_Code:1
						OI_ar_AdditionalItemQTY{$_l_ComponentSectionRow}:=[COMPONENTS:86]Quantity:3
						If (PRD_t_productCurrency=OI_T_CurrencyCode)
							OK_ar_AdditionalItemPrice{$_l_ComponentSectionRow}:=[PRODUCTS:9]Sales_Price:9
						Else 
							OK_ar_AdditionalItemPrice{$_l_ComponentSectionRow}:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; PRD_t_productCurrency; OI_T_CurrencyCode; Current date:C33(*))
						End if 
						OI_ar_AdditionalItemPriceBase:=[PRODUCTS:9]Sales_Price:9
						FORM GOTO PAGE:C247(1)
						
						
					End if 
				End if 
				
				FORM GOTO PAGE:C247(1)
				
				
				//Note that pricing is set when the user selects products
				
				
			: ([COMPONENTS:86]Macro_Rule:9#"")
				
			: ([COMPONENTS:86]Group_Code:8#"")
				
			: ([COMPONENTS:86]Component_is_Product_Brand:16)
				
			: ([COMPONENTS:86]Component_is_Product_Group:15)
				
		End case 
		OI_t_BuiltCode:=""
		$_r_TotalPriceOLD:=$_r_TotalPrice
		$_r_TotalPrice:=0
		$_bo_AllSectionsSet:=True:C214
		For ($_l_Index; 1; Size of array:C274(OI_al_SectionIDS))
			$_t_Section:=""
			$_r_Price:=0
			$_r_Discount:=0
			If (OI_at_BuildCodeMatrix{$_l_Index}#"")
				If (OI_abo_IncludeInProduct{$_l_Index})
					$_t_Section:=OI_at_BuildCodeMatrix{$_l_Index}  //even in a multiple this is one value
					If (OI_al_ChargingPriceClass{$_l_Index}=0)
						$_r_Price:=OI_ar_BuildCodeSALESPrice{$_l_Index}
					Else 
						$_r_Discount:=OI_ar_BuildCodeSALESPrice{$_l_Index}
					End if 
				Else 
					$_t_Section:=" "*OI_al_SectionLength{$_l_Index}
					$_l_ComponentSectionRow:=Find in array:C230(OI_al_ComponentSectionID; OI_al_SectionIDS{$_l_Index})
					If ($_l_ComponentSectionRow>0)
						If (OI_abo_OptionalComponent{$_l_ComponentSectionRow}=False:C215)
							$_bo_AllSectionsSet:=False:C215
						End if 
					End if 
				End if 
			Else 
				//Build code matrix is not set this may be an additional product
				$_t_Section:=" "*OI_al_SectionLength{$_l_Index}
				$_l_ComponentSectionRow:=Find in array:C230(OI_al_ComponentSectionID; OI_al_SectionIDS{$_l_Index})
				
				//``
				If ($_l_ComponentSectionRow>0)
					If (OI_abo_OptionalComponent{$_l_ComponentSectionRow}=False:C215)  //its not optional
						If (OI_abo_ComponentAdditional{$_l_ComponentSectionRow}=True:C214)
							Case of 
								: (OI_at_AdditionOrderItems{$_l_Index}="") | (Not:C34(OI_abo_IncludeInProduct{$_l_Index}))
									If (OI_al_ComponentType{$_l_ComponentSectionRow}=0)
										$_bo_AllSectionsSet:=False:C215
									Else 
										//this is a non optional additional order item where you can select more than one so there must be at least one instance in the
										//mutliples array
										$_l_BuildIndexPosition:=Find in array:C230(OI_al_MultiplesIndex; OI_al_SectionIDS{$_l_Index})
										If ($_l_BuildIndexPosition<0)
											If (OI_al_SectionLength{$_l_Index}>0)
												$_bo_AllSectionsSet:=False:C215
											End if 
											
										End if 
									End if 
								Else 
									
							End case 
						Else 
							$_l_BuildIndexPosition:=Find in array:C230(OI_al_MultiplesIndex; OI_al_SectionIDS{$_l_Index})
							If ($_l_BuildIndexPosition<0)
								If (OI_al_SectionLength{$_l_Index}>0)
									$_bo_AllSectionsSet:=False:C215
								End if 
							End if 
							
						End if 
						//``
						//$_bo_AllSectionsSet:=False
					End if 
				End if 
			End if 
			If ($_r_Price#0)
				$_r_TotalPrice:=$_r_TotalPrice+$_r_Price
			Else 
				If ($_r_Discount#0)
					If ($_r_TotalPrice#0)
						$_r_TotalPrice:=Gen_Round(($_r_TotalPrice*((100-($_r_Discount))/100)); 2; 1)
					End if 
				End if 
			End if 
			OI_t_BuiltCode:=OI_t_BuiltCode+$_t_Section
		End for 
		OI_t_BuiltCode:=PRD_t_BuildGroupCode+PRD_t_BuildBrandCode+OI_t_BuiltCode
		OI_R_BuiltPrice:=$_r_TotalPrice
		
		If ($_bo_AllSectionsSet)
			OBJECT SET VISIBLE:C603(*; "oCustomerPrice@"; True:C214)  //This will be set to visible and enterable on completion of all the items.
			OBJECT SET ENTERABLE:C238(OI_R_SalesPrice; True:C214)
			If (OI_R_SalesPrice=0)
				
				OI_R_SalesPrice:=OI_R_BuiltPrice
			End if 
			OI_bo_AlloptionsSelected:=True:C214
			If ($_r_TotalPriceOLD#$_r_TotalPrice)  //product price has changed user will have to confirm selling price
				OI_bo_CustomerPriceSet:=False:C215
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*; "oCustomerPrice@"; False:C215)  //This will be set to visible and enterable on completion of all the items.
			//Note that if if the customer price has not been set when you save the record the price confirm window will be displayed so you can set the price..it will be calculated.
			//and by set i mean edited by the user..and it can be edited till the options are selected.
			OI_bo_AlloptionsSelected:=False:C215
			OI_bo_CustomerPriceSet:=False:C215
			
		End if 
		
		
	End if 
	
End if 
ERR_MethodTrackerReturn("PRD_BuildFormSetPage"; $_t_oldMethodName)