//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 19:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_OISubsRenewalStartDate; 0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_AskOrderLines; 0)
	ARRAY LONGINT:C221($_al_OIItemNumbers; 0)
	ARRAY LONGINT:C221($_al_OISubsRequired; 0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_OIProductCodes; 0)
	ARRAY TEXT:C222($_at_OISubsTypeRequired; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_ProductCodesRange; 0)
	ARRAY TEXT:C222($_at_PublicationCodes; 0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_Accept; $_bo_Added; $_bo_Continue; $_bo_Modified; $_bo_UseOldStyleCalc; $_bo_UseOldWay; $1; LBI_bo_RowDragged; ORD_bo_FurtherFieldsLoaded; ORD_bo_IsRevision)
	C_BOOLEAN:C305(ORD_bo_ItemsModified; ORD_bo_OrderModified; STK_bo_ALLOCATIONASKED; STK_bo_SHOWSTOCKALLOCATION)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_CurrentDate; $_d_CurrentDateWAS; $_d_StartDate; $_d_SubsDateWas; $_d_SubsEndDate; $_d_SubsRenewalDate; $_d_SubsStartDate)
	C_LONGINT:C283($_l_AllocateIndex; $_l_Column; $_l_Dayof; $_l_FieldNumber; $_l_Index; $_l_KeyPosition; $_l_MonthOf; $_l_MonthsCalculated; $_l_NumberOfIssues; $_l_NumberofOrderItems; $_l_offset)
	C_LONGINT:C283($_l_RequiredSubRow; $_l_SortColumn; $_l_SortFieldNumber; $_l_SubsAfterNumber; $_l_SubsCreateIndex; $_l_SUBSmonthofStart; $_l_SubsUnitNumber; $_l_SubsYearStart; $_l_TableNumber; $_l_Year; $_l_YearsCounted)
	C_LONGINT:C283($_l_YearWas; LB_l_CurrentSortColumn; ORD_l_FurtherFieldsMod; vAB; VAdd; vOR; WS_l_OrderSort; Xcancel; Xnext)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_Field; $_Ptr_KeyField; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray)
	C_TEXT:C284(<>ClientStat; <>ContClStat; <>ContEnqStat; <>EnqStat; $_t_AllocateResult; $_t_CurrentDefinitionsName; $_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPA")
//Orders_InLPA

vOR:=0
If (Count parameters:C259>=1)
	$_bo_Accept:=$1  //allow accept or cancel in this method
Else 
	$_bo_Accept:=True:C214  // dont aLLOW Accept-use this to run method without closing record
End if 
If (ORD_bo_IsRevision)
	//no point in any code running then
	
	ORD_bo_OrderModified:=False:C215
	ORD_bo_ItemsModified:=False:C215
	If ($_bo_Accept)
		CANCEL:C270
	End if 
Else 
	
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	If (ORD_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
		If (ORD_l_FurtherFieldsMod>0)
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
			READ WRITE:C146([CUSTOM_FIELDS:98])
			If (Records in set:C195("ORD_FFSelection")>0)
				USE SET:C118("ORD_FFSelection")
				DELETE SELECTION:C66([CUSTOM_FIELDS:98])
			End if 
			//CLEAR SET("ORD_FFSelection")
			FUR_UpdateFurtherFields(->[ORDERS:24])
			
			
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
			READ ONLY:C145([CUSTOM_FIELDS:98])
			//at least one further field has been modified
			
			
		End if 
		$_l_TableNumber:=Table:C252(->[ORDERS:24])
		$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
		$_t_TableNumAsString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
		$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
		CLEAR SEMAPHORE:C144($_t_SemaphoreName)
		//CLEAR SET("ORD_FFSelection")
		
	End if 
	
	If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(ORD_al_SubAreaTables)))
		$_l_RequiredSubRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
		If ($_l_RequiredSubRow>0)
			$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_RequiredSubRow}
			
			If (Size of array:C274($_ptr_ListBoxSetup->)>0)
				If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
					$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
					$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
					$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
					//FieldsRef=Point to fields columns
					//This gets the column with the sort field in
					$_l_SortColumn:=0
					//TRACE
					$_l_RequiredSubRow:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[ORDER_ITEMS:25]Sort_Order:26)
					If ($_l_RequiredSubRow<0)
						For ($_l_Column; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
							$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Column})
							If ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Sort_Order:26))
								$_l_SortColumn:=$_l_Column
								$_l_Column:=Size of array:C274($_ptr_ArrayFieldPointers->)
							End if 
						End for 
					Else 
						$_l_SortColumn:=$_l_RequiredSubRow
					End if 
					
					
					
					$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
					$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
					$_l_SortFieldNumber:=LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListBoxSetup; False:C215)
					If ($_l_SortFieldNumber=0) | ($_l_SortFieldNumber=Field:C253(->[ORDER_ITEMS:25]Sort_Order:26)) | (LBI_bo_RowDragged)
						If (Abs:C99(LB_l_CurrentSortColumn)#$_l_SortColumn)
							//although the default sort IS the sort field the columns are sorted by something else
							//so the sort order gets messed up..therefore before we go anyfurther re-sort by the correct column
							//note we do not do this is the sort column is correct because the user MAy had re-ordered things manually)
							$_l_SortFieldNumber:=LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListBoxSetup; True:C214)
						End if 
						FIRST RECORD:C50([ORDER_ITEMS:25])
						$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
						$_Ptr_KeyField:=$_ptr_ListBoxSetup->{8}
						$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
						$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
						For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
							$_l_RequiredSubRow:=Find in array:C230($_Ptr_ThisColumnArray->; [ORDER_ITEMS:25]Item_Number:27)
							$_bo_Modified:=False:C215
							If ($_l_RequiredSubRow>0)
								If ([ORDER_ITEMS:25]Sort_Order:26#$_l_RequiredSubRow)
									[ORDER_ITEMS:25]Sort_Order:26:=$_l_RequiredSubRow
									$_bo_Modified:=True:C214
								End if 
							Else 
								If ([ORDER_ITEMS:25]Sort_Order:26#$_l_Index)
									[ORDER_ITEMS:25]Sort_Order:26:=$_l_Index
								End if 
							End if 
							If ($_bo_Modified)
								DB_SaveRecord(->[ORDER_ITEMS:25])
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						End for 
					Else 
						FIRST RECORD:C50([ORDER_ITEMS:25])
						For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
							If ([ORDER_ITEMS:25]Sort_Order:26=0)
								$_l_offset:=0
								Repeat 
									SET QUERY DESTINATION:C396(3; WS_l_OrderSort)
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26=$_l_Index+$_l_offset; *)
									QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
									SET QUERY DESTINATION:C396(0)
									If (WS_l_OrderSort=0)
										[ORDER_ITEMS:25]Sort_Order:26:=$_l_Index+$_l_offset
									Else 
										$_l_offset:=$_l_offset+1
									End if 
									DB_SaveRecord(->[ORDER_ITEMS:25])
								Until (WS_l_OrderSort=0)
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						End for 
						
					End if 
				End if 
			End if 
		End if 
	End if 
	LBI_bo_RowDragged:=False:C215
	
	If (OK=1)
		ORD_CommentstoCOM
		If (Not:C34(<>StatesLoaded))
			States_Load
		End if 
		ORD_SaveDeliveryAddress
		DB_SaveRecord(->[ORDERS:24])
		AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
		If (OK=1)
			If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4; False:C215))
				If ((DB_t_CurrentFormUsage#"NA@") & ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4)))
					
					
					If (Not:C34(STK_bo_SHOWSTOCKALLOCATION))
						//User chose to hold allocation till saving the record
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
						QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; ([ORDER_ITEMS:25]Allocated:28<[ORDER_ITEMS:25]Quantity:3))
						If (Records in selection:C76([ORDER_ITEMS:25])>0)
							DISTINCT VALUES:C339([ORDER_ITEMS:25]Product_Code:2; $_at_OIProductCodes)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_OIProductCodes)
							QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Maintain_Stock:14=True:C214)
							DISTINCT VALUES:C339([PRODUCTS:9]Product_Code:1; $_at_ProductCodesRange)
							QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodesRange)
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								//there are items with no stock allocation AND they require allocation
								Gen_Confirm3("There is stock to be allocated on some order lines, do you want to allocate stock now?"; "Auto"; "Manual"; "No")
								Case of 
									: (Xnext=1)
										//No
									: (Xcancel=1)
										//Manual
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
										For ($_l_AllocateIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
											OrderI_AllocCu2
											NEXT RECORD:C51([ORDER_ITEMS:25])
										End for 
										
									Else 
										//Auto
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
										$_t_AllocateResult:=OrderI_AllocAu2
										If ($_t_AllocateResult="None")
											Gen_Alert("No Allocations have been made"; "OK")
										End if 
								End case 
							End if 
						End if 
						
					End if 
				End if 
				
			End if 
			
			If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
				If ((<>ClientStat#"") | (<>EnqStat#""))
					If ([ORDERS:24]State:15><>SYS_at_RecStateCodes{24}{2})
						If ([COMPANIES:2]Company_Code:1#[ORDERS:24]Company_Code:1)
							RELATE ONE:C42([ORDERS:24]Company_Code:1)
						End if 
						If ([COMPANIES:2]Company_Code:1#"")
							If (([COMPANIES:2]Status:12#(<>ClientStat+"@")) & (Substring:C12([COMPANIES:2]Status:12; 1; 1)#Substring:C12(<>ClientStat; 1; 1)))
								RELATE ONE:C42([COMPANIES:2]Status:12)
								If ([STATUS:4]No_Change:4=False:C215)
									READ WRITE:C146([COMPANIES:2])
									LOAD RECORD:C52([COMPANIES:2])
									If (Not:C34(Locked:C147([COMPANIES:2])))
										[COMPANIES:2]Status:12:=<>ClientStat
										DB_SaveRecord(->[COMPANIES:2])
										AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
										UNLOAD RECORD:C212([COMPANIES:2])
									Else 
										Gen_Alert("The Company Status cannot be updated to "+<>ClientStat+" - record in use"; "")
									End if 
								End if 
							End if 
						End if 
					Else 
						If ([ORDERS:24]State:15<=<>SYS_at_RecStateCodes{24}{3})
							If ([COMPANIES:2]Company_Code:1#[ORDERS:24]Company_Code:1)
								RELATE ONE:C42([ORDERS:24]Company_Code:1)
							End if 
							If ([COMPANIES:2]Company_Code:1#"")
								If (([COMPANIES:2]Status:12#(<>ClientStat+"@")) & ([COMPANIES:2]Status:12#(<>EnqStat+"@")) & (Substring:C12([COMPANIES:2]Status:12; 1; 1)#Substring:C12(<>EnqStat; 1; 1)))
									RELATE ONE:C42([COMPANIES:2]Status:12)
									If ([STATUS:4]No_Change:4=False:C215)
										READ WRITE:C146([COMPANIES:2])
										LOAD RECORD:C52([COMPANIES:2])
										If (Not:C34(Locked:C147([COMPANIES:2])))
											[COMPANIES:2]Status:12:=<>EnqStat
											DB_SaveRecord(->[COMPANIES:2])
											AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
											UNLOAD RECORD:C212([COMPANIES:2])
										Else 
											Gen_Alert("The Company Status cannot be updated to "+<>EnqStat+" - record in use"; "")
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				If ((<>ContClStat#"") | (<>ContEnqStat#""))
					If ([ORDERS:24]State:15><>SYS_at_RecStateCodes{24}{2})
						If ([CONTACTS:1]Contact_Code:2#[ORDERS:24]Contact_Code:2)
							RELATE ONE:C42([ORDERS:24]Contact_Code:2)
						End if 
						If ([CONTACTS:1]Contact_Code:2#"")
							If (([CONTACTS:1]Status:14#(<>ContClStat+"@")) & (Substring:C12([CONTACTS:1]Status:14; 1; 1)#Substring:C12(<>ContClStat; 1; 1)))
								RELATE ONE:C42([CONTACTS:1]Status:14)
								If ([STATUS:4]No_Change:4=False:C215)
									READ WRITE:C146([CONTACTS:1])
									LOAD RECORD:C52([CONTACTS:1])
									If (Not:C34(Locked:C147([CONTACTS:1])))
										[CONTACTS:1]Status:14:=<>ContClStat
										DB_SaveRecord(->[CONTACTS:1])
										AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
										UNLOAD RECORD:C212([CONTACTS:1])
									Else 
										Gen_Alert("The Contact Status cannot be updated to "+<>ContClStat+" - record in use"; "")
									End if 
								End if 
							End if 
						End if 
					Else 
						If ([ORDERS:24]State:15<=<>SYS_at_RecStateCodes{24}{3})
							If ([CONTACTS:1]Contact_Code:2#[ORDERS:24]Contact_Code:2)
								RELATE ONE:C42([ORDERS:24]Contact_Code:2)
							End if 
							If ([CONTACTS:1]Contact_Code:2#"")
								If (([CONTACTS:1]Status:14#(<>ContClStat+"@")) & ([CONTACTS:1]Status:14#(<>ContEnqStat+"@")) & (Substring:C12([CONTACTS:1]Status:14; 1; 1)#Substring:C12(<>ContClStat; 1; 1)) & (Substring:C12([CONTACTS:1]Status:14; 1; 1)#Substring:C12(<>ContEnqStat; 1; 1)))
									RELATE ONE:C42([CONTACTS:1]Status:14)
									If ([STATUS:4]No_Change:4=False:C215)
										READ WRITE:C146([CONTACTS:1])
										LOAD RECORD:C52([CONTACTS:1])
										If (Not:C34(Locked:C147([CONTACTS:1])))
											[CONTACTS:1]Status:14:=<>ContEnqStat
											DB_SaveRecord(->[CONTACTS:1])
											AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
											UNLOAD RECORD:C212([CONTACTS:1])
										Else 
											Gen_Alert("The Contact Status cannot be updated to "+<>ContEnqStat+" - record in use"; "")
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			Gen_AutoProc
			If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
				If (Gen_PPChkStSing(->[ORDERS:24]State:15; 6; False:C215))
					OK:=0
					//COPY NAMED SELECTION([ORDER ITEMS];"$Sel")
					
					
					Orders_InLPOI
					//NG-April 2011 formerly the system only knew that subs order item was such because it had subs in the invoice number
					//this in my opinion is daft because
					//1)  ` how can you properly invoice it-you cant put the invoice number on the order item
					//2)  ` a user could easily have cleared data from this field during data entry
					//3)  ` a user could type this into the field during entry for any product.
					
					// so from now on the system will use the product class to determine that it is a sub-it will still search for SUBS* in the invoice field at the moment to cater for the legacy.
					//a further change is made on an order item to prevent you clearing the value if it subs or manually setting it to subs-NOT DONE YET
					
					//Note that the SUBS DATE is the billing date on a billing the issue date on a iSS and the renewals acton date on the renewals. None of the subs records tell us(if there are not ISS to work off) when the Subscrption ends
					//by which i mean that date is not STORED on the order item and it is only the ORDER DATE(see ORDI SubSubs) which is used to calculate start of the subsription.
					If (False:C215)
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$temp")
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2#"")
						SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
						QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_Entry_Class:55=4; *)
						QUERY SELECTION:C341([PRODUCTS:9];  | ; [PRODUCTS:9]x_Product_Entry_Class:55=5)
						If (Records in selection:C76([PRODUCTS:9])>0)
							SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
							QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="SUBS*")
							CREATE SET:C116([ORDER_ITEMS:25]; "$OIset1")
							USE NAMED SELECTION:C332("$temp")
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="SUBS*")
							//Note that its only if the order item invoice number has the * that we are going into this bit, which means there should be a renewal of some kind
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								CREATE SET:C116([ORDER_ITEMS:25]; "$OIset2")
								UNION:C120("$OIset1"; "$OIset2"; "$OIset1")
								USE SET:C118("$OIset1")
							Else 
								USE SET:C118("$OIset1")
							End if 
						Else 
							USE NAMED SELECTION:C332("$temp")
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="SUBS*")
						End if 
						$_l_NumberofOrderItems:=Records in selection:C76([ORDER_ITEMS:25])
						If ($_l_NumberofOrderItems>0)
							//This should only ask this question if the subs details are not created already..so first test the subs are not already there
							ARRAY LONGINT:C221($_al_OISubsRequired; 0)
							ARRAY TEXT:C222($_at_OISubsTypeRequired; 0)
							ARRAY DATE:C224($_ad_OISubsRenewalStartDate; 0)
							
							FIRST RECORD:C50([ORDER_ITEMS:25])
							If (False:C215)
								For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
									QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
									
									
									$_d_StartDate:=[ORDERS:24]Order_Date:4
									If ($_d_StartDate=!00-00-00!)
										$_d_StartDate:=[ORDERS:24]Quotation_Date:26
									End if 
									If ($_d_StartDate=!00-00-00!)
										$_d_StartDate:=[ORDERS:24]Enquiry_Date:25
									End if 
									If ($_d_StartDate=!00-00-00!)
										$_d_StartDate:=<>DB_d_CurrentDate
									End if 
									$_bo_Added:=False:C215
									If ($_d_StartDate>[ORDER_ITEMS:25]Required_Date:10)  //The data needs to be dealt with before this can
										If ([ORDER_ITEMS:25]Required_Date:10>!00-00-00!)
											If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
											End if 
											//Then this looks like a renewal?-note that the required date CURRENTLY corresponds to the order date so this is a valid thing
											$_d_SubsDateWas:=[ORDER_ITEMS:25]Required_Date:10
											APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
											APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
											APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_SubsDateWas+[PRODUCTS:9]Start_Days:31)
											
											$_bo_Added:=True:C214
										Else 
											[ORDER_ITEMS:25]Required_Date:10:=$_d_StartDate
										End if 
									End if 
									$_d_SubsEndDate:=!00-00-00!
									If (Not:C34($_bo_Added))
										QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
										If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
											QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=$_d_StartDate)
											If (Records in selection:C76([SUBSCRIPTIONS:93])=0)
												QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
												ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; <)
												
											End if 
										End if 
										
										
										If (Records in selection:C76([SUBSCRIPTIONS:93])=0)
											If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
											End if 
											
											//if there are no subscriptions then this is new one
											APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
											APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "New Subscriptions")
											APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
											
										Else 
											
											
											//here we are going to find out from the subs when it started and compare that to the required date. it fhe required date is afer the subs start date then this is a renewal
											//we can also work out when the subs ends and if does not correspond to the issue before the new date can ask if the date is correct
											COPY NAMED SELECTION:C331([SUBSCRIPTIONS:93]; "$SubsTemp")
											
											//Calculate when the subscription ends
											//NOTE if the SUBS started BEFORE the [ORDER ITEMS]Required Date  then this is a renwals
											//NOTE also that with the way the system currently works they delete the subs records when they renew
											//with the revisions a new order tiem will be created with a new date
											QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
											$_d_SubsStartDate:=!00-00-00!
											$_d_SubsEndDate:=!00-00-00!
											If (Records in selection:C76([SUBSCRIPTIONS:93])>0) & (False:C215)  //This is where we should be after the update
												ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; <)
												FIRST RECORD:C50([SUBSCRIPTIONS:93])
												$_d_SubsStartDate:=[SUBSCRIPTIONS:93]Subscription_Date:3
												ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; >)
												FIRST RECORD:C50([SUBSCRIPTIONS:93])
												$_d_SubsEndDate:=[SUBSCRIPTIONS:93]Subscription_Date:3
											Else 
												USE NAMED SELECTION:C332("$SubsTemp")
												//There are no subs issues records so are there RENewals. if so we can calculate from there
												QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="REN")
												$_bo_UseOldStyleCalc:=False:C215
												If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
													$_l_SubsUnitNumber:=[SUBSCRIPTIONS:93]Unit_Number:6
													$_l_SubsAfterNumber:=[SUBSCRIPTIONS:93]After_Number:5
													$_d_SubsRenewalDate:=[SUBSCRIPTIONS:93]Subscription_Date:3
													If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
														QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
													End if 
													$_bo_UseOldStyleCalc:=False:C215
													Case of 
														: ([PRODUCTS:9]x_Product_Entry_Class:55=4)
															QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
															If (Records in selection:C76([COMPONENTS:86])>=1)
																//if there are multiple publications subscribed in this package one will need to set as the 'master' from which the subscription is calculated
																SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_PublicationCodes)
																If ([PRODUCTS:9]x_Subscription_Master_Product:58="")
																	QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$_at_PublicationCodes{1}; *)
																	QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																Else 
																	QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; [PRODUCTS:9]x_Subscription_Master_Product:58; *)
																	QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																End if 
																QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																If (Records in selection:C76([DIARY:12])>=$_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																	//the  newest ones first-be careful...we may had
																	REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																	$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																Else 
																	//there are not enough recorded iterations to work this out
																	$_bo_UseOldStyleCalc:=True:C214
																End if 
															Else 
																$_bo_UseOldStyleCalc:=True:C214
																//`even though this product has been set as this class it has not been linked to publications
															End if 
															
														: ([PRODUCTS:9]x_Product_Entry_Class:55=5)
															QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
															QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
															If (Records in selection:C76([DIARY:12])>0)
																QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																If (Records in selection:C76([DIARY:12])>=$_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																	//the  newest ones first
																	REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																	$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																Else 
																	//there are not enough recorded iterations to work this out
																	$_bo_UseOldStyleCalc:=True:C214
																End if 
																
															Else 
																$_bo_UseOldStyleCalc:=True:C214
															End if 
															
														Else 
															$_bo_UseOldStyleCalc:=True:C214
													End case 
													If ($_bo_UseOldStyleCalc)
														
														
														Case of 
															: ($_l_SubsUnitNumber=31)
																$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																$_l_SUBSmonthofStart:=Month of:C24($_d_SubsRenewalDate)
																$_l_MonthsCalculated:=0
																$_d_CurrentDate:=$_d_SubsRenewalDate
																Repeat 
																	$_d_CurrentDate:=$_d_CurrentDate-1
																Until (Day of:C23($_d_CurrentDate)=1)
																Repeat 
																	$_d_CurrentDateWAS:=$_d_CurrentDate
																	$_d_CurrentDate:=$_d_CurrentDate-1
																	If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																		$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																		
																		$_d_CurrentDate:=$_d_CurrentDate-28
																		
																	End if 
																Until ($_l_MonthsCalculated>=($_l_SubsAfterNumber-1))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																Repeat 
																	$_d_CurrentDate:=$_d_CurrentDate+1
																Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																$_d_SubsStartDate:=$_d_CurrentDate
															: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																$_l_SubsYearStart:=Year of:C25($_d_SubsRenewalDate)
																$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																$_l_MonthOf:=Month of:C24($_d_SubsRenewalDate)
																$_l_Year:=Year of:C25($_d_SubsRenewalDate)
																$_d_CurrentDate:=$_d_SubsRenewalDate
																$_l_YearsCounted:=0
																Repeat 
																	$_l_YearWas:=Year of:C25($_d_CurrentDate)
																	$_d_CurrentDate:=$_d_CurrentDate-365
																	If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate-1
																		Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																	End if 
																	$_l_YearsCounted:=$_l_YearsCounted+1
																Until ($_l_YearsCounted=$_l_SubsAfterNumber)
																If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																$_d_SubsStartDate:=$_d_CurrentDate
															Else 
																If ($_l_SubsAfterNumber>1)
																	$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber-1))
																Else 
																	$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber))
																End if 
														End case 
													End if 
													
													//we can now look at the product. if this is linked product we can work out when the subs started by the diary records
													//if there are no diary records then
												Else 
													USE NAMED SELECTION:C332("$SubsTemp")
													//There are no subs issues records or renewals so are there Billings?. if so we can calculate from there
													QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="B@")
													If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
														$_l_SubsAfterNumber:=[SUBSCRIPTIONS:93]After_Number:5
														$_d_SubsRenewalDate:=[SUBSCRIPTIONS:93]Subscription_Date:3  //its not really the subs renewal date
														//note that here the after number might be minus in which case the subs started AFTER the billing
														If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
															QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
														End if 
														$_bo_UseOldStyleCalc:=False:C215
														Case of 
															: ([PRODUCTS:9]x_Product_Entry_Class:55=4)
																QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
																If (Records in selection:C76([COMPONENTS:86])>=1)
																	//if there are multiple publications subscribed in this package one will need to set as the 'master' from which the subscription is calculated
																	SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_PublicationCodes)
																	If ([PRODUCTS:9]x_Subscription_Master_Product:58="")
																		QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; $_at_PublicationCodes{1}; *)
																		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																	Else 
																		QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; [PRODUCTS:9]x_Subscription_Master_Product:58; *)
																		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																	End if 
																	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																	If (Records in selection:C76([DIARY:12])>=Abs:C99($_l_SubsAfterNumber))
																		If ($_l_SubsAfterNumber<0)
																			
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			//the  newest ones last
																			REDUCE SELECTION:C351([DIARY:12]; Abs:C99($_l_SubsAfterNumber))
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		Else 
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			//the  newest ones first
																			REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		End if 
																	Else 
																		//there are not enough recorded iterations to work this out
																		$_bo_UseOldStyleCalc:=True:C214
																	End if 
																Else 
																	$_bo_UseOldStyleCalc:=True:C214
																	//`even though this product has been set as this class it has not been linked to publications
																End if 
																
															: ([PRODUCTS:9]x_Product_Entry_Class:55=5)
																QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
																QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																If (Records in selection:C76([DIARY:12])>0)
																	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																	If (Records in selection:C76([DIARY:12])>=Abs:C99($_l_SubsAfterNumber))
																		If ($_l_SubsAfterNumber<0)
																			
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			//the  newest ones last
																			REDUCE SELECTION:C351([DIARY:12]; Abs:C99($_l_SubsAfterNumber))
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		Else 
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			//the  newest ones first
																			REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		End if 
																		
																	Else 
																		//there are not enough recorded iterations to work this out
																		$_bo_UseOldStyleCalc:=True:C214
																	End if 
																	
																Else 
																	$_bo_UseOldStyleCalc:=True:C214
																End if 
															Else 
																$_bo_UseOldStyleCalc:=True:C214
														End case 
														If ($_bo_UseOldStyleCalc)
															$_bo_UseOldStyleCalc:=False:C215
															If ($_l_SubsAfterNumber>0)
																Case of 
																	: ($_l_SubsUnitNumber=31)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_SUBSmonthofStart:=Month of:C24($_d_SubsRenewalDate)
																		$_l_MonthsCalculated:=0
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate-1
																		Until (Day of:C23($_d_CurrentDate)=1)
																		Repeat 
																			$_d_CurrentDateWAS:=$_d_CurrentDate
																			$_d_CurrentDate:=$_d_CurrentDate-1
																			If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																				$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																				
																				$_d_CurrentDate:=$_d_CurrentDate-28
																				
																			End if 
																		Until ($_l_MonthsCalculated>=($_l_SubsAfterNumber-1))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate+1
																		Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		$_d_SubsStartDate:=$_d_CurrentDate
																	: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																		$_l_SubsYearStart:=Year of:C25($_d_SubsRenewalDate)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_MonthOf:=Month of:C24($_d_SubsRenewalDate)
																		$_l_Year:=Year of:C25($_d_SubsRenewalDate)
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		$_l_YearsCounted:=0
																		Repeat 
																			$_l_YearWas:=Year of:C25($_d_CurrentDate)
																			$_d_CurrentDate:=$_d_CurrentDate-365
																			If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																				Repeat 
																					$_d_CurrentDate:=$_d_CurrentDate-1
																				Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																			End if 
																			$_l_YearsCounted:=$_l_YearsCounted+1
																		Until ($_l_YearsCounted=$_l_SubsAfterNumber)
																		If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		$_d_SubsStartDate:=$_d_CurrentDate
																	Else 
																		If ($_l_SubsAfterNumber>1)
																			$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber-1))
																		Else 
																			$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber))
																		End if 
																End case 
															Else 
																Case of 
																	: ($_l_SubsUnitNumber=31)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_SUBSmonthofStart:=Month of:C24($_d_SubsRenewalDate)
																		$_l_MonthsCalculated:=0
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate+1
																		Until (Day of:C23($_d_CurrentDate)=1)
																		$_d_CurrentDate:=$_d_CurrentDate-1
																		Repeat 
																			$_d_CurrentDateWAS:=$_d_CurrentDate
																			$_d_CurrentDate:=$_d_CurrentDate+1
																			If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																				$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																				
																				$_d_CurrentDate:=$_d_CurrentDate+28
																				
																			End if 
																		Until ($_l_MonthsCalculated>=(Abs:C99($_l_SubsAfterNumber)-1))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate-1
																		Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		$_d_SubsStartDate:=$_d_CurrentDate
																	: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																		$_l_SubsYearStart:=Year of:C25($_d_SubsRenewalDate)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_MonthOf:=Month of:C24($_d_SubsRenewalDate)
																		$_l_Year:=Year of:C25($_d_SubsRenewalDate)
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		$_l_YearsCounted:=0
																		Repeat 
																			$_l_YearWas:=Year of:C25($_d_CurrentDate)
																			$_d_CurrentDate:=$_d_CurrentDate+365
																			If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																				Repeat 
																					$_d_CurrentDate:=$_d_CurrentDate+1
																				Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																			End if 
																			$_l_YearsCounted:=$_l_YearsCounted+1
																		Until ($_l_YearsCounted=Abs:C99($_l_SubsAfterNumber))
																		If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		$_d_SubsStartDate:=$_d_CurrentDate
																	Else 
																		If ($_l_SubsAfterNumber>1)
																			$_d_SubsStartDate:=$_d_SubsRenewalDate+($_l_SubsUnitNumber*($_l_SubsAfterNumber-1))
																		Else 
																			$_d_SubsStartDate:=$_d_SubsRenewalDate+($_l_SubsUnitNumber*($_l_SubsAfterNumber))
																		End if 
																End case 
															End if 
														End if 
														
														
													Else 
														//then whatever we have is buggy so its a new sub
														
														APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
														APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "New Subscriptions")
														APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_SubsStartDate+[PRODUCTS:9]Start_Days:31)
													End if 
												End if 
											End if 
											
										End if 
										If ($_d_SubsStartDate#!00-00-00!)
											If ($_d_SubsEndDate=!00-00-00!)
												If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
												End if 
												$_l_NumberOfIssues:=[PRODUCTS:9]Issues_Number:27
												$_l_SubsUnitNumber:=[SUBSCRIPTIONS:93]Unit_Number:6
												$_bo_UseOldWay:=False:C215
												
												Case of 
													: ([PRODUCTS:9]x_Product_Entry_Class:55=4)
														QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
														If (Records in selection:C76([COMPONENTS:86])>=1)
															//if there are multiple publications subscribed in this package one will need to set as the 'master' from which the subscription is calculated
															SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_PublicationCodes)
															If ([PRODUCTS:9]x_Subscription_Master_Product:58="")
																QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$_at_PublicationCodes{1}; *)
																QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
															Else 
																QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; [PRODUCTS:9]x_Subscription_Master_Product:58; *)
																QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
															End if 
															QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_SubsStartDate)
															If (Records in selection:C76([DIARY:12])>=$_l_NumberOfIssues)
																ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																//the  newest ones first-be careful...we may had
																REDUCE SELECTION:C351([DIARY:12]; $_l_NumberOfIssues)
																LAST RECORD:C200([DIARY:12])
																$_d_SubsEndDate:=[DIARY:12]Date_Do_From:4
															Else 
																//there are not enough recorded iterations to work this out
																$_bo_UseOldWay:=True:C214
															End if 
														Else 
															$_bo_UseOldWay:=True:C214
															//`even though this product has been set as this class it has not been linked to publications
														End if 
														
													: ([PRODUCTS:9]x_Product_Entry_Class:55=5)
														QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
														QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
														If (Records in selection:C76([DIARY:12])>0)
															QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_l_NumberOfIssues)
															If (Records in selection:C76([DIARY:12])>=$_l_NumberOfIssues)
																ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																
																REDUCE SELECTION:C351([DIARY:12]; $_l_NumberOfIssues)
																ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																LAST RECORD:C200([DIARY:12])
																$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																
															Else 
																//there are not enough recorded iterations to work this out
																$_bo_UseOldWay:=True:C214
															End if 
															
														Else 
															$_bo_UseOldWay:=True:C214
														End if 
														
													Else 
														$_bo_UseOldWay:=True:C214
														
												End case 
												If ($_bo_UseOldWay)
													
													If ($_l_NumberOfIssues>0)
														Case of 
															: ($_l_SubsUnitNumber=31)
																$_l_Dayof:=Day of:C23($_d_SubsStartDate)
																$_l_SUBSmonthofStart:=Month of:C24($_d_SubsStartDate)
																$_l_MonthsCalculated:=0
																$_d_CurrentDate:=$_d_SubsStartDate
																Repeat 
																	$_d_CurrentDate:=$_d_CurrentDate+1
																Until (Month of:C24($_d_CurrentDate)#$_l_SUBSmonthofStart)
																$_d_CurrentDate:=$_d_CurrentDate-1  //The last day of the month of the start of the subs
																$_l_MonthsCalculated:=1
																Repeat 
																	$_d_CurrentDateWAS:=$_d_CurrentDate
																	$_d_CurrentDate:=$_d_CurrentDate+1
																	If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																		$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																		$_d_CurrentDate:=$_d_CurrentDate+28
																	End if 
																Until ($_l_MonthsCalculated>=($_l_NumberOfIssues))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																Repeat   //move back to the day of the subs start
																	$_d_CurrentDate:=$_d_CurrentDate-1
																Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																$_d_SubsEndDate:=$_d_CurrentDate
															: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																$_l_SubsYearStart:=Year of:C25($_d_SubsStartDate)
																$_l_Dayof:=Day of:C23($_d_SubsStartDate)
																$_l_MonthOf:=Month of:C24($_d_SubsStartDate)
																$_l_Year:=Year of:C25($_d_SubsStartDate)
																$_d_CurrentDate:=$_d_SubsStartDate
																$_l_YearsCounted:=1
																Repeat 
																	$_l_YearWas:=Year of:C25($_d_CurrentDate)
																	$_d_CurrentDate:=$_d_CurrentDate+365
																	If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate+1
																		Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																	End if 
																	$_l_YearsCounted:=$_l_YearsCounted+1
																Until ($_l_YearsCounted=$_l_NumberOfIssues)
																If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																$_d_SubsEndDate:=$_d_CurrentDate
															Else 
																If ($_l_NumberOfIssues>1)
																	$_d_SubsEndDate:=$_d_SubsStartDate+($_l_SubsUnitNumber*($_l_NumberOfIssues-1))
																Else 
																	$_d_SubsEndDate:=$_d_SubsStartDate
																End if 
														End case 
													End if 
												End if 
											End if 
											
										End if 
										If ($_d_SubsStartDate#!00-00-00!) & ($_d_SubsEndDate#!00-00-00!)
											If ($_d_SubsStartDate<$_d_StartDate)
												If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
												End if 
												//This subscription started before the order date
												If ($_d_SubsEndDate<($_d_StartDate+[PRODUCTS:9]Start_Days:31))
													Gen_Confirm("The current subsctiption will end on "+String:C10($_d_SubsEndDate)+"Which is after the date you have prescribed the new subscription to start ("+String:C10($_d_StartDate+[PRODUCTS:9]Start_Days:31)+")."+Char:C90(13)+"Do you wish to start the new subscription before the old one ends or change the start date?"; "Change"; "Overlap")
													If (OK=0)
														[ORDER_ITEMS:25]Required_Date:10:=$_d_SubsEndDate--[PRODUCTS:9]Start_Days:31
														SAVE RECORD:C53([ORDER_ITEMS:25])
														$_d_StartDate:=$_d_SubsEndDate-[PRODUCTS:9]Start_Days:31
													End if 
													OK:=1
													//This 'renewal' will start before the old one finishes-query it
													APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
													APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
													APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
													
												Else 
													If ($_d_SubsEndDate<($_d_StartDate+[PRODUCTS:9]Start_Days:31))
														Gen_Confirm("The current subsctiption will end on "+String:C10($_d_SubsEndDate)+"Which is before the date you have prescribed the new subscription to start ("+String:C10($_d_StartDate+[PRODUCTS:9]Start_Days:31)+")."+Char:C90(13)+"Do you wish to start the new subscription immediatly as one ends or have a gap ?"; "Immediate"; "Gap")
														If (OK=1)
															[ORDER_ITEMS:25]Required_Date:10:=$_d_SubsEndDate--[PRODUCTS:9]Start_Days:31
															SAVE RECORD:C53([ORDER_ITEMS:25])
															$_d_StartDate:=$_d_SubsEndDate-[PRODUCTS:9]Start_Days:31
														End if 
														OK:=1
														APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
														APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
														APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
													Else 
														APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
														APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
														APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
														
													End if 
												End if 
											End if 
										Else 
											//somehing missing so have to go old way..
											$_l_RequiredSubRow:=Find in array:C230($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
											If ($_l_RequiredSubRow<0)
												APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
												APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Ask Subscriptions")
												APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
											End if 
										End if 
										
									End if 
									
									NEXT RECORD:C51([ORDER_ITEMS:25])
									
								End for 
								
								//End if
							End if 
							If (Size of array:C274($_al_OISubsRequired)>0) | (False:C215)
								$_bo_Continue:=False:C215
								$_l_RequiredSubRow:=Find in array:C230($_at_OISubsTypeRequired; "Ask Subscriptions")
								If ($_l_RequiredSubRow>0)
									//Some of the lines-usually just one line anyway hey!
									//could not have the start/end date of the subscription determined
									//so we just need to drop into the old routine for them/it
									ARRAY LONGINT:C221($_al_AskOrderLines; 0)
									For ($_l_Index; 1; Size of array:C274($_al_OISubsRequired))
										If ($_at_OISubsTypeRequired{$_l_Index}="Ask Subscriptions")
											APPEND TO ARRAY:C911($_al_AskOrderLines; $_al_OISubsRequired{$_l_Index})
										End if 
									End for 
									USE NAMED SELECTION:C332("$temp")
									QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_AskOrderLines)
									Gen_Confirm3("There "+("are "*Num:C11($_l_NumberofOrderItems>1))+("is "*Num:C11($_l_NumberofOrderItems=1))+String:C10($_l_NumberofOrderItems)+" Item"+("s"*Num:C11($_l_NumberofOrderItems>1))+" for which Subscription Details need to be created"+" (with SUBS* in the Invoice No field)."+"  Do you want to Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1))+", Continue anyway or Try again?"; "Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1)); "Try again"; "Continue")
									If (OK=1) | (xNext=1)
										If (xNext=0)
											FIRST RECORD:C50([ORDER_ITEMS:25])
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
											For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
												//While (Not(End selection([ORDER ITEMS])))
												OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
												
											End for 
										End if 
										$_bo_Continue:=True:C214
										
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
								If ($_bo_Continue)
									$_l_RequiredSubRow:=Find in array:C230($_at_OISubsTypeRequired; "Renewal")
									If ($_l_RequiredSubRow>0)
										//The difference here is the we will not ask
										ARRAY LONGINT:C221($_al_AskOrderLines; 0)
										For ($_l_Index; 1; Size of array:C274($_al_OISubsRequired))
											If ($_at_OISubsTypeRequired{$_l_Index}="Renewal")
												APPEND TO ARRAY:C911($_al_AskOrderLines; $_al_OISubsRequired{$_l_Index})
											End if 
										End for 
										USE NAMED SELECTION:C332("$temp")
										QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_AskOrderLines)
										If (OK=1)
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
											For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
												//While (Not(End selection([ORDER ITEMS])))
												OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
											End for 
											$_bo_Continue:=True:C214
											
										End if 
										
									End if 
								End if 
								If ($_bo_Continue)
									$_l_RequiredSubRow:=Find in array:C230($_at_OISubsTypeRequired; "New Subscriptions")
									If ($_l_RequiredSubRow>0)
										//The difference here is the we will not ask
										ARRAY LONGINT:C221($_al_AskOrderLines; 0)
										For ($_l_Index; 1; Size of array:C274($_al_OISubsRequired))
											If ($_at_OISubsTypeRequired{$_l_Index}="New Subscriptions")
												APPEND TO ARRAY:C911($_al_AskOrderLines; $_al_OISubsRequired{$_l_Index})
											End if 
										End for 
										USE NAMED SELECTION:C332("$temp")
										QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_AskOrderLines)
										If (OK=1)
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
											For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
												//While (Not(End selection([ORDER ITEMS])))
												OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
											End for 
											$_bo_Continue:=True:C214
										End if 
										
									End if 
								End if 
								If ($_bo_Continue)
									If ($_bo_Accept)
										ACCEPT:C269
										CLEAR SET:C117("ORD_FFSelection")
										
										If (ORD_bo_OrderModified) | (ORD_bo_ItemsModified)
											ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Create Revision")
										End if 
									End if 
									OK:=1
									vAB:=0
								End if 
							Else 
								Gen_Confirm3("There "+("are "*Num:C11($_l_NumberofOrderItems>1))+("is "*Num:C11($_l_NumberofOrderItems=1))+String:C10($_l_NumberofOrderItems)+" Item"+("s"*Num:C11($_l_NumberofOrderItems>1))+" for which Subscription Details need to be created"+" (with SUBS* in the Invoice No field)."+"  Do you want to Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1))+", Continue anyway or Try again?"; "Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1)); "Try again"; "Continue")
								If (OK=1) | (xNext=1)
									If (xNext=0)
										SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
										For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
											//While (Not(End selection([ORDER ITEMS])))
											OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
										End for 
									End if 
									If ($_bo_Accept)
										ACCEPT:C269
										CLEAR SET:C117("ORD_FFSelection")
										If (ORD_bo_OrderModified) | (ORD_bo_ItemsModified)
											ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Create Revision")
										End if 
									End if 
									
									OK:=1
									vAB:=0
								End if 
							End if 
						End if 
					Else 
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="SUBS*")
						$_l_NumberofOrderItems:=Records in selection:C76([ORDER_ITEMS:25])
						If ($_l_NumberofOrderItems>0)
							//This should only ask this question if the subs details are not created already..so first test the subs are not already there
							ARRAY LONGINT:C221($_al_OISubsRequired; 0)
							ARRAY TEXT:C222($_at_OISubsTypeRequired; 0)
							ARRAY DATE:C224($_ad_OISubsRenewalStartDate; 0)
							
							FIRST RECORD:C50([ORDER_ITEMS:25])
							If (False:C215)
								For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
									QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
									
									
									$_d_StartDate:=[ORDERS:24]Order_Date:4
									If ($_d_StartDate=!00-00-00!)
										$_d_StartDate:=[ORDERS:24]Quotation_Date:26
									End if 
									If ($_d_StartDate=!00-00-00!)
										$_d_StartDate:=[ORDERS:24]Enquiry_Date:25
									End if 
									If ($_d_StartDate=!00-00-00!)
										$_d_StartDate:=<>DB_d_CurrentDate
									End if 
									$_bo_Added:=False:C215
									If ($_d_StartDate>[ORDER_ITEMS:25]Required_Date:10)  //The data needs to be dealt with before this can
										If ([ORDER_ITEMS:25]Required_Date:10>!00-00-00!)
											If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
											End if 
											//Then this looks like a renewal?-note that the required date CURRENTLY corresponds to the order date so this is a valid thing
											$_d_SubsDateWas:=[ORDER_ITEMS:25]Required_Date:10
											APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
											APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
											APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
											
											$_bo_Added:=True:C214
										Else 
											[ORDER_ITEMS:25]Required_Date:10:=$_d_StartDate
										End if 
									End if 
									$_d_SubsEndDate:=!00-00-00!
									If (Not:C34($_bo_Added))
										QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
										If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
											QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=$_d_StartDate)
											If (Records in selection:C76([SUBSCRIPTIONS:93])=0)
												QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
												ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; <)
												
											End if 
										End if 
										
										
										If (Records in selection:C76([SUBSCRIPTIONS:93])=0)
											If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
											End if 
											
											//if there are no subscriptions then this is new one
											APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
											APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "New Subscriptions")
											APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
											
										Else 
											
											
											//here we are going to find out from the subs when it started and compare that to the required date. it fhe required date is afer the subs start date then this is a renewal
											//we can also work out when the subs ends and if does not correspond to the issue before the new date can ask if the date is correct
											COPY NAMED SELECTION:C331([SUBSCRIPTIONS:93]; "$SubsTemp")
											
											//Calculate when the subscription ends
											//NOTE if the SUBS started BEFORE the [ORDER ITEMS]Required Date  then this is a renwals
											//NOTE also that with the way the system currently works they delete the subs records when they renew
											//with the revisions a new order tiem will be created with a new date
											QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
											$_d_SubsStartDate:=!00-00-00!
											$_d_SubsEndDate:=!00-00-00!
											If (Records in selection:C76([SUBSCRIPTIONS:93])>0) & (False:C215)  //This is where we should be after the update
												ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; <)
												FIRST RECORD:C50([SUBSCRIPTIONS:93])
												$_d_SubsStartDate:=[SUBSCRIPTIONS:93]Subscription_Date:3
												ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; >)
												FIRST RECORD:C50([SUBSCRIPTIONS:93])
												$_d_SubsEndDate:=[SUBSCRIPTIONS:93]Subscription_Date:3
											Else 
												USE NAMED SELECTION:C332("$SubsTemp")
												//There are no subs issues records so are there RENewals. if so we can calculate from there
												QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="REN")
												$_bo_UseOldStyleCalc:=False:C215
												If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
													$_l_SubsUnitNumber:=[SUBSCRIPTIONS:93]Unit_Number:6
													$_l_SubsAfterNumber:=[SUBSCRIPTIONS:93]After_Number:5
													$_d_SubsRenewalDate:=[SUBSCRIPTIONS:93]Subscription_Date:3
													If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
														QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
													End if 
													$_bo_UseOldStyleCalc:=False:C215
													Case of 
														: ([PRODUCTS:9]x_Product_Entry_Class:55=4)
															QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
															If (Records in selection:C76([COMPONENTS:86])>=1)
																//if there are multiple publications subscribed in this package one will need to set as the 'master' from which the subscription is calculated
																SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_PublicationCodes)
																If ([PRODUCTS:9]x_Subscription_Master_Product:58="")
																	QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$_at_PublicationCodes{1}; *)
																	QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																Else 
																	QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; [PRODUCTS:9]x_Subscription_Master_Product:58; *)
																	QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																End if 
																QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																If (Records in selection:C76([DIARY:12])>=$_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																	//the  newest ones first-be careful...we may had
																	REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																	$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																Else 
																	//there are not enough recorded iterations to work this out
																	$_bo_UseOldStyleCalc:=True:C214
																End if 
															Else 
																$_bo_UseOldStyleCalc:=True:C214
																//`even though this product has been set as this class it has not been linked to publications
															End if 
															
														: ([PRODUCTS:9]x_Product_Entry_Class:55=5)
															QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
															QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
															If (Records in selection:C76([DIARY:12])>0)
																QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																If (Records in selection:C76([DIARY:12])>=$_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																	//the  newest ones first
																	REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																	$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																Else 
																	//there are not enough recorded iterations to work this out
																	$_bo_UseOldStyleCalc:=True:C214
																End if 
																
															Else 
																$_bo_UseOldStyleCalc:=True:C214
															End if 
															
														Else 
															$_bo_UseOldStyleCalc:=True:C214
													End case 
													If ($_bo_UseOldStyleCalc)
														
														
														Case of 
															: ($_l_SubsUnitNumber=31)
																$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																$_l_SUBSmonthofStart:=Month of:C24($_d_SubsRenewalDate)
																$_l_MonthsCalculated:=0
																$_d_CurrentDate:=$_d_SubsRenewalDate
																Repeat 
																	$_d_CurrentDate:=$_d_CurrentDate-1
																Until (Day of:C23($_d_CurrentDate)=1)
																Repeat 
																	$_d_CurrentDateWAS:=$_d_CurrentDate
																	$_d_CurrentDate:=$_d_CurrentDate-1
																	If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																		$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																		
																		$_d_CurrentDate:=$_d_CurrentDate-28
																		
																	End if 
																Until ($_l_MonthsCalculated>=($_l_SubsAfterNumber-1))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																Repeat 
																	$_d_CurrentDate:=$_d_CurrentDate+1
																Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																$_d_SubsStartDate:=$_d_CurrentDate
															: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																$_l_SubsYearStart:=Year of:C25($_d_SubsRenewalDate)
																$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																$_l_MonthOf:=Month of:C24($_d_SubsRenewalDate)
																$_l_Year:=Year of:C25($_d_SubsRenewalDate)
																$_d_CurrentDate:=$_d_SubsRenewalDate
																$_l_YearsCounted:=0
																Repeat 
																	$_l_YearWas:=Year of:C25($_d_CurrentDate)
																	$_d_CurrentDate:=$_d_CurrentDate-365
																	If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate-1
																		Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																	End if 
																	$_l_YearsCounted:=$_l_YearsCounted+1
																Until ($_l_YearsCounted=$_l_SubsAfterNumber)
																If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																$_d_SubsStartDate:=$_d_CurrentDate
															Else 
																If ($_l_SubsAfterNumber>1)
																	$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber-1))
																Else 
																	$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber))
																End if 
														End case 
													End if 
													
													//we can now look at the product. if this is linked product we can work out when the subs started by the diary records
													//if there are no diary records then
												Else 
													USE NAMED SELECTION:C332("$SubsTemp")
													//There are no subs issues records or renewals so are there Billings?. if so we can calculate from there
													QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="B@")
													If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
														$_l_SubsAfterNumber:=[SUBSCRIPTIONS:93]After_Number:5
														$_d_SubsRenewalDate:=[SUBSCRIPTIONS:93]Subscription_Date:3  //its not really the subs renewal date
														//note that here the after number might be minus in which case the subs started AFTER the billing
														If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
															QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
														End if 
														$_bo_UseOldStyleCalc:=False:C215
														Case of 
															: ([PRODUCTS:9]x_Product_Entry_Class:55=4)
																QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
																If (Records in selection:C76([COMPONENTS:86])>=1)
																	//if there are multiple publications subscribed in this package one will need to set as the 'master' from which the subscription is calculated
																	SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_PublicationCodes)
																	If ([PRODUCTS:9]x_Subscription_Master_Product:58="")
																		QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; $_at_PublicationCodes{1}; *)
																		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																	Else 
																		QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; [PRODUCTS:9]x_Subscription_Master_Product:58; *)
																		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																	End if 
																	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																	If (Records in selection:C76([DIARY:12])>=Abs:C99($_l_SubsAfterNumber))
																		If ($_l_SubsAfterNumber<0)
																			
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			//the  newest ones last
																			REDUCE SELECTION:C351([DIARY:12]; Abs:C99($_l_SubsAfterNumber))
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		Else 
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			//the  newest ones first
																			REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		End if 
																	Else 
																		//there are not enough recorded iterations to work this out
																		$_bo_UseOldStyleCalc:=True:C214
																	End if 
																Else 
																	$_bo_UseOldStyleCalc:=True:C214
																	//`even though this product has been set as this class it has not been linked to publications
																End if 
																
															: ([PRODUCTS:9]x_Product_Entry_Class:55=5)
																QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
																QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
																If (Records in selection:C76([DIARY:12])>0)
																	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=$_d_SubsRenewalDate)
																	If (Records in selection:C76([DIARY:12])>=Abs:C99($_l_SubsAfterNumber))
																		If ($_l_SubsAfterNumber<0)
																			
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			//the  newest ones last
																			REDUCE SELECTION:C351([DIARY:12]; Abs:C99($_l_SubsAfterNumber))
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		Else 
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
																			//the  newest ones first
																			REDUCE SELECTION:C351([DIARY:12]; $_l_SubsAfterNumber)
																			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																			$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																		End if 
																		
																	Else 
																		//there are not enough recorded iterations to work this out
																		$_bo_UseOldStyleCalc:=True:C214
																	End if 
																	
																Else 
																	$_bo_UseOldStyleCalc:=True:C214
																End if 
															Else 
																$_bo_UseOldStyleCalc:=True:C214
														End case 
														If ($_bo_UseOldStyleCalc)
															$_bo_UseOldStyleCalc:=False:C215
															If ($_l_SubsAfterNumber>0)
																Case of 
																	: ($_l_SubsUnitNumber=31)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_SUBSmonthofStart:=Month of:C24($_d_SubsRenewalDate)
																		$_l_MonthsCalculated:=0
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate-1
																		Until (Day of:C23($_d_CurrentDate)=1)
																		Repeat 
																			$_d_CurrentDateWAS:=$_d_CurrentDate
																			$_d_CurrentDate:=$_d_CurrentDate-1
																			If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																				$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																				
																				$_d_CurrentDate:=$_d_CurrentDate-28
																				
																			End if 
																		Until ($_l_MonthsCalculated>=($_l_SubsAfterNumber-1))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate+1
																		Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		$_d_SubsStartDate:=$_d_CurrentDate
																	: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																		$_l_SubsYearStart:=Year of:C25($_d_SubsRenewalDate)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_MonthOf:=Month of:C24($_d_SubsRenewalDate)
																		$_l_Year:=Year of:C25($_d_SubsRenewalDate)
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		$_l_YearsCounted:=0
																		Repeat 
																			$_l_YearWas:=Year of:C25($_d_CurrentDate)
																			$_d_CurrentDate:=$_d_CurrentDate-365
																			If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																				Repeat 
																					$_d_CurrentDate:=$_d_CurrentDate-1
																				Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																			End if 
																			$_l_YearsCounted:=$_l_YearsCounted+1
																		Until ($_l_YearsCounted=$_l_SubsAfterNumber)
																		If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		$_d_SubsStartDate:=$_d_CurrentDate
																	Else 
																		If ($_l_SubsAfterNumber>1)
																			$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber-1))
																		Else 
																			$_d_SubsStartDate:=$_d_SubsRenewalDate-($_l_SubsUnitNumber*($_l_SubsAfterNumber))
																		End if 
																End case 
															Else 
																Case of 
																	: ($_l_SubsUnitNumber=31)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_SUBSmonthofStart:=Month of:C24($_d_SubsRenewalDate)
																		$_l_MonthsCalculated:=0
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate+1
																		Until (Day of:C23($_d_CurrentDate)=1)
																		$_d_CurrentDate:=$_d_CurrentDate-1
																		Repeat 
																			$_d_CurrentDateWAS:=$_d_CurrentDate
																			$_d_CurrentDate:=$_d_CurrentDate+1
																			If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																				$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																				
																				$_d_CurrentDate:=$_d_CurrentDate+28
																				
																			End if 
																		Until ($_l_MonthsCalculated>=(Abs:C99($_l_SubsAfterNumber)-1))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate-1
																		Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		$_d_SubsStartDate:=$_d_CurrentDate
																	: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																		$_l_SubsYearStart:=Year of:C25($_d_SubsRenewalDate)
																		$_l_Dayof:=Day of:C23($_d_SubsRenewalDate)
																		$_l_MonthOf:=Month of:C24($_d_SubsRenewalDate)
																		$_l_Year:=Year of:C25($_d_SubsRenewalDate)
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		$_d_CurrentDate:=$_d_SubsRenewalDate
																		$_l_YearsCounted:=0
																		Repeat 
																			$_l_YearWas:=Year of:C25($_d_CurrentDate)
																			$_d_CurrentDate:=$_d_CurrentDate+365
																			If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																				Repeat 
																					$_d_CurrentDate:=$_d_CurrentDate+1
																				Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																			End if 
																			$_l_YearsCounted:=$_l_YearsCounted+1
																		Until ($_l_YearsCounted=Abs:C99($_l_SubsAfterNumber))
																		If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																		End if 
																		If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate-1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																			Repeat 
																				$_d_CurrentDate:=$_d_CurrentDate+1
																			Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																		End if 
																		$_d_SubsStartDate:=$_d_CurrentDate
																	Else 
																		If ($_l_SubsAfterNumber>1)
																			$_d_SubsStartDate:=$_d_SubsRenewalDate+($_l_SubsUnitNumber*($_l_SubsAfterNumber-1))
																		Else 
																			$_d_SubsStartDate:=$_d_SubsRenewalDate+($_l_SubsUnitNumber*($_l_SubsAfterNumber))
																		End if 
																End case 
															End if 
														End if 
														
														
													Else 
														//then whatever we have is buggy so its a new sub
														
														APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
														APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "New Subscriptions")
														APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
													End if 
												End if 
											End if 
											
										End if 
										If ($_d_SubsStartDate#!00-00-00!)
											If ($_d_SubsEndDate=!00-00-00!)
												If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
												End if 
												$_l_NumberOfIssues:=[PRODUCTS:9]Issues_Number:27
												$_l_SubsUnitNumber:=[SUBSCRIPTIONS:93]Unit_Number:6
												$_bo_UseOldWay:=False:C215
												
												Case of 
													: ([PRODUCTS:9]x_Product_Entry_Class:55=4)
														QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
														If (Records in selection:C76([COMPONENTS:86])>=1)
															//if there are multiple publications subscribed in this package one will need to set as the 'master' from which the subscription is calculated
															SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_PublicationCodes)
															If ([PRODUCTS:9]x_Subscription_Master_Product:58="")
																QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$_at_PublicationCodes{1}; *)
																QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
															Else 
																QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13; [PRODUCTS:9]x_Subscription_Master_Product:58; *)
																QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
															End if 
															QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_SubsStartDate)
															If (Records in selection:C76([DIARY:12])>=$_l_NumberOfIssues)
																ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																//the  newest ones first-be careful...we may had
																REDUCE SELECTION:C351([DIARY:12]; $_l_NumberOfIssues)
																LAST RECORD:C200([DIARY:12])
																$_d_SubsEndDate:=[DIARY:12]Date_Do_From:4
															Else 
																//there are not enough recorded iterations to work this out
																$_bo_UseOldWay:=True:C214
															End if 
														Else 
															$_bo_UseOldWay:=True:C214
															//`even though this product has been set as this class it has not been linked to publications
														End if 
														
													: ([PRODUCTS:9]x_Product_Entry_Class:55=5)
														QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
														QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
														If (Records in selection:C76([DIARY:12])>0)
															QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_l_NumberOfIssues)
															If (Records in selection:C76([DIARY:12])>=$_l_NumberOfIssues)
																ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																
																REDUCE SELECTION:C351([DIARY:12]; $_l_NumberOfIssues)
																ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
																LAST RECORD:C200([DIARY:12])
																$_d_SubsStartDate:=[DIARY:12]Date_Do_From:4
																
															Else 
																//there are not enough recorded iterations to work this out
																$_bo_UseOldWay:=True:C214
															End if 
															
														Else 
															$_bo_UseOldWay:=True:C214
														End if 
														
													Else 
														$_bo_UseOldWay:=True:C214
														
												End case 
												If ($_bo_UseOldWay)
													
													If ($_l_NumberOfIssues>0)
														Case of 
															: ($_l_SubsUnitNumber=31)
																$_l_Dayof:=Day of:C23($_d_SubsStartDate)
																$_l_SUBSmonthofStart:=Month of:C24($_d_SubsStartDate)
																$_l_MonthsCalculated:=0
																$_d_CurrentDate:=$_d_SubsStartDate
																Repeat 
																	$_d_CurrentDate:=$_d_CurrentDate+1
																Until (Month of:C24($_d_CurrentDate)#$_l_SUBSmonthofStart)
																$_d_CurrentDate:=$_d_CurrentDate-1  //The last day of the month of the start of the subs
																$_l_MonthsCalculated:=1
																Repeat 
																	$_d_CurrentDateWAS:=$_d_CurrentDate
																	$_d_CurrentDate:=$_d_CurrentDate+1
																	If (Month of:C24($_d_CurrentDate)#Month of:C24($_d_CurrentDateWAS))
																		$_l_MonthsCalculated:=$_l_MonthsCalculated+1
																		$_d_CurrentDate:=$_d_CurrentDate+28
																	End if 
																Until ($_l_MonthsCalculated>=($_l_NumberOfIssues))  //this is correct because you get the renewal after the nth issue- not on the date of the nth issue
																Repeat   //move back to the day of the subs start
																	$_d_CurrentDate:=$_d_CurrentDate-1
																Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																$_d_SubsEndDate:=$_d_CurrentDate
															: ($_l_SubsUnitNumber=365)  //cant think of reason why you would have a renewal AFTER one year for a one year subs
																$_l_SubsYearStart:=Year of:C25($_d_SubsStartDate)
																$_l_Dayof:=Day of:C23($_d_SubsStartDate)
																$_l_MonthOf:=Month of:C24($_d_SubsStartDate)
																$_l_Year:=Year of:C25($_d_SubsStartDate)
																$_d_CurrentDate:=$_d_SubsStartDate
																$_l_YearsCounted:=1
																Repeat 
																	$_l_YearWas:=Year of:C25($_d_CurrentDate)
																	$_d_CurrentDate:=$_d_CurrentDate+365
																	If (Year of:C25($_d_CurrentDate)=$_l_YearWas)
																		Repeat 
																			$_d_CurrentDate:=$_d_CurrentDate+1
																		Until (Year of:C25($_d_CurrentDate)#$_l_YearWas)
																	End if 
																	$_l_YearsCounted:=$_l_YearsCounted+1
																Until ($_l_YearsCounted=$_l_NumberOfIssues)
																If (Month of:C24($_d_CurrentDate)>$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Month of:C24($_d_CurrentDate)<$_l_MonthOf)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Month of:C24($_d_CurrentDate)=$_l_MonthOf)
																End if 
																If (Day of:C23($_d_CurrentDate)>$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate-1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																If (Day of:C23($_d_CurrentDate)<$_l_Dayof)
																	Repeat 
																		$_d_CurrentDate:=$_d_CurrentDate+1
																	Until (Day of:C23($_d_CurrentDate)=$_l_Dayof)
																End if 
																$_d_SubsEndDate:=$_d_CurrentDate
															Else 
																If ($_l_NumberOfIssues>1)
																	$_d_SubsEndDate:=$_d_SubsStartDate+($_l_SubsUnitNumber*($_l_NumberOfIssues-1))
																Else 
																	$_d_SubsEndDate:=$_d_SubsStartDate
																End if 
														End case 
													End if 
												End if 
											End if 
											
										End if 
										If ($_d_SubsStartDate#!00-00-00!) & ($_d_SubsEndDate#!00-00-00!)
											If ($_d_SubsStartDate<$_d_StartDate)
												If ([PRODUCTS:9]Product_Code:1#[ORDER_ITEMS:25]Product_Code:2)
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
												End if 
												//This subscription started before the order date
												If ($_d_SubsEndDate<($_d_StartDate+[PRODUCTS:9]Start_Days:31))
													Gen_Confirm("The current subsctiption will end on "+String:C10($_d_SubsEndDate)+"Which is after the date you have prescribed the new subscription to start ("+String:C10($_d_StartDate+[PRODUCTS:9]Start_Days:31)+")."+Char:C90(13)+"Do you wish to start the new subscription before the old one ends or change the start date?"; "Change"; "Overlap")
													If (OK=0)
														[ORDER_ITEMS:25]Required_Date:10:=$_d_SubsEndDate--[PRODUCTS:9]Start_Days:31
														SAVE RECORD:C53([ORDER_ITEMS:25])
														$_d_StartDate:=$_d_SubsEndDate-[PRODUCTS:9]Start_Days:31
													End if 
													OK:=1
													//This 'renewal' will start before the old one finishes-query it
													APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
													APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
													APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
													
												Else 
													If ($_d_SubsEndDate<($_d_StartDate+[PRODUCTS:9]Start_Days:31))
														Gen_Confirm("The current subsctiption will end on "+String:C10($_d_SubsEndDate)+"Which is before the date you have prescribed the new subscription to start ("+String:C10($_d_StartDate+[PRODUCTS:9]Start_Days:31)+")."+Char:C90(13)+"Do you wish to start the new subscription immediatly as one ends or have a gap ?"; "Immediate"; "Gap")
														If (OK=1)
															[ORDER_ITEMS:25]Required_Date:10:=$_d_SubsEndDate--[PRODUCTS:9]Start_Days:31
															SAVE RECORD:C53([ORDER_ITEMS:25])
															$_d_StartDate:=$_d_SubsEndDate-[PRODUCTS:9]Start_Days:31
														End if 
														OK:=1
														APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
														APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
														APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
													Else 
														APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
														APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Renewal")
														APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
														
													End if 
												End if 
											End if 
										Else 
											//somehing missing so have to go old way..
											$_l_RequiredSubRow:=Find in array:C230($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
											If ($_l_RequiredSubRow<0)
												APPEND TO ARRAY:C911($_al_OISubsRequired; [ORDER_ITEMS:25]Item_Number:27)
												APPEND TO ARRAY:C911($_at_OISubsTypeRequired; "Ask Subscriptions")
												APPEND TO ARRAY:C911($_ad_OISubsRenewalStartDate; $_d_StartDate+[PRODUCTS:9]Start_Days:31)
											End if 
										End if 
										
									End if 
									
									NEXT RECORD:C51([ORDER_ITEMS:25])
									
								End for 
								
								//End if
							End if 
							If (Size of array:C274($_al_OISubsRequired)>0) | (False:C215)
								$_bo_Continue:=False:C215
								$_l_RequiredSubRow:=Find in array:C230($_at_OISubsTypeRequired; "Ask Subscriptions")
								If ($_l_RequiredSubRow>0)
									//Some of the lines-usually just one line anyway hey!
									//could not have the start/end date of the subscription determined
									//so we just need to drop into the old routine for them/it
									ARRAY LONGINT:C221($_al_AskOrderLines; 0)
									For ($_l_Index; 1; Size of array:C274($_al_OISubsRequired))
										If ($_at_OISubsTypeRequired{$_l_Index}="Ask Subscriptions")
											APPEND TO ARRAY:C911($_al_AskOrderLines; $_al_OISubsRequired{$_l_Index})
										End if 
									End for 
									USE NAMED SELECTION:C332("$temp")
									QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_AskOrderLines)
									Gen_Confirm3("There "+("are "*Num:C11($_l_NumberofOrderItems>1))+("is "*Num:C11($_l_NumberofOrderItems=1))+String:C10($_l_NumberofOrderItems)+" Item"+("s"*Num:C11($_l_NumberofOrderItems>1))+" for which Subscription Details need to be created"+" (with SUBS* in the Invoice No field)."+"  Do you want to Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1))+", Continue anyway or Try again?"; "Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1)); "Try again"; "Continue")
									If (OK=1) | (xNext=1)
										If (xNext=0)
											FIRST RECORD:C50([ORDER_ITEMS:25])
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
											For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
												//While (Not(End selection([ORDER ITEMS])))
												OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
												
											End for 
										End if 
										$_bo_Continue:=True:C214
										
									End if 
								Else 
									$_bo_Continue:=True:C214
								End if 
								If ($_bo_Continue)
									$_l_RequiredSubRow:=Find in array:C230($_at_OISubsTypeRequired; "Renewal")
									If ($_l_RequiredSubRow>0)
										//The difference here is the we will not ask
										ARRAY LONGINT:C221($_al_AskOrderLines; 0)
										For ($_l_Index; 1; Size of array:C274($_al_OISubsRequired))
											If ($_at_OISubsTypeRequired{$_l_Index}="Renewal")
												APPEND TO ARRAY:C911($_al_AskOrderLines; $_al_OISubsRequired{$_l_Index})
											End if 
										End for 
										USE NAMED SELECTION:C332("$temp")
										QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_AskOrderLines)
										If (OK=1)
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
											For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
												//While (Not(End selection([ORDER ITEMS])))
												OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
											End for 
											$_bo_Continue:=True:C214
											
										End if 
										
									End if 
								End if 
								If ($_bo_Continue)
									$_l_RequiredSubRow:=Find in array:C230($_at_OISubsTypeRequired; "New Subscriptions")
									If ($_l_RequiredSubRow>0)
										//The difference here is the we will not ask
										ARRAY LONGINT:C221($_al_AskOrderLines; 0)
										For ($_l_Index; 1; Size of array:C274($_al_OISubsRequired))
											If ($_at_OISubsTypeRequired{$_l_Index}="New Subscriptions")
												APPEND TO ARRAY:C911($_al_AskOrderLines; $_al_OISubsRequired{$_l_Index})
											End if 
										End for 
										USE NAMED SELECTION:C332("$temp")
										QUERY SELECTION WITH ARRAY:C1050([ORDER_ITEMS:25]Item_Number:27; $_al_AskOrderLines)
										If (OK=1)
											SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
											For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
												//While (Not(End selection([ORDER ITEMS])))
												OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
											End for 
											$_bo_Continue:=True:C214
										End if 
										
									End if 
								End if 
								If ($_bo_Continue)
									If ($_bo_Accept)
										ACCEPT:C269
										CLEAR SET:C117("ORD_FFSelection")
										If (ORD_bo_OrderModified) | (ORD_bo_ItemsModified)
											ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Create Revision")
										End if 
									End if 
									OK:=1
									vAB:=0
								End if 
							Else 
								Gen_Confirm3("There "+("are "*Num:C11($_l_NumberofOrderItems>1))+("is "*Num:C11($_l_NumberofOrderItems=1))+String:C10($_l_NumberofOrderItems)+" Item"+("s"*Num:C11($_l_NumberofOrderItems>1))+" for which Subscription Details need to be created"+" (with SUBS* in the Invoice No field)."+"  Do you want to Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1))+", Continue anyway or Try again?"; "Create "+("them"*Num:C11($_l_NumberofOrderItems>1))+("it"*Num:C11($_l_NumberofOrderItems=1)); "Try again"; "Continue")
								If (OK=1) | (xNext=1)
									If (xNext=0)
										SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OIItemNumbers)
										For ($_l_SubsCreateIndex; 1; Size of array:C274($_al_OIItemNumbers))
											//While (Not(End selection([ORDER ITEMS])))
											OI_UpdateSubscriptions($_al_OIItemNumbers{$_l_SubsCreateIndex})
										End for 
									End if 
									If ($_bo_Accept)
										ACCEPT:C269
										CLEAR SET:C117("ORD_FFSelection")
										If (ORD_bo_OrderModified) | (ORD_bo_ItemsModified)
											ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Create Revision")
										End if 
									End if 
									
									OK:=1
									vAB:=0
								End if 
							End if 
						Else 
							If ($_bo_Accept)
								ACCEPT:C269
								CLEAR SET:C117("ORD_FFSelection")
								If (ORD_bo_OrderModified) | (ORD_bo_ItemsModified)
									ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Create Revision")
								End if 
							End if 
							
							OK:=1
							vAB:=0
						End if 
					End if 
				Else 
					If ($_bo_Accept)
						ACCEPT:C269
						CLEAR SET:C117("ORD_FFSelection")
						If (ORD_bo_OrderModified) | (ORD_bo_ItemsModified)
							ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Create Revision")
						End if 
					End if 
					
					OK:=1
					vAB:=0
				End if 
				// USE NAMED SELECTION("$Sel")
				// CLEAR NAMED SELECTION("$Sel")
			Else 
				If ($_bo_Accept)
					ACCEPT:C269
					CLEAR SET:C117("ORD_FFSelection")
					If (ORD_bo_OrderModified) | (ORD_bo_ItemsModified)
						ProcessServices_CreateRecord(->[ORDERS:24]; ->[ORDERS:24]x_ID:58; "Create Revision")
					End if 
				End if 
				
				OK:=1
				vAB:=0
				vAB:=0
			End if 
		End if 
	End if 
	VAdd:=0  //NG
	// we are no longer adding this record...
End if 
ERR_MethodTrackerReturn("Orders_InLPA"; $_t_oldMethodName)
