If (False:C215)
	//Table Form Method Name: Object Name:      [DIARY].Diary_SubsEditor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2012 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_OrderItems;0)
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	ARRAY LONGINT:C221($_al_OrderNumbers; 0)
	ARRAY LONGINT:C221($_al_RelatedRecordIDs; 0)
	ARRAY LONGINT:C221($_al_RelatedTableNumbers; 0)
	ARRAY LONGINT:C221($_al_SubsOrderItemNumbers; 0)
	ARRAY LONGINT:C221($_al_SubsRecordIDs; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(PDT_al_EditMode;0)
	//ARRAY LONGINT(SD2_al_Levels;0)
	//ARRAY LONGINT(SD2_al_OpenChoice;0)
	//ARRAY LONGINT(SD2_Al_OrderItemNumbers;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedTableNum;0)
	//ARRAY POINTER(SD2_aptr_LBOrderItemsSetup;0)
	//ARRAY REAL(SD2_ar_OrderItemQuantity;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	ARRAY TEXT:C222($_at_RelatedRecordCodes; 0)
	//ARRAY TEXT(DIA_at_SubsProductCodes;0)
	//ARRAY TEXT(PDT_at_editMode;0)
	//ARRAY TEXT(SD2_at_OpenChoice;0)
	//ARRAY TEXT(SD2_At_OrderItemCompanies;0)
	//ARRAY TEXT(SD2_AT_OrderITemMacContent;0)
	//ARRAY TEXT(SD2_at_OrderItemOrderCodes;0)
	//ARRAY TEXT(SD2_at_OrderItemProductName;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	//ARRAY TEXT(SUBS_at_FIlterByProductCode;0)
	//ARRAY TEXT(SUBS_at_FIlterByProductName;0)
	C_BOOLEAN:C305($_bo_NewLevel; $_bo_OptionKey; DB_bo_NoLoad; DIA_bo_ProductsLoaded; PAL_bo_ButtonSubFunction)
	C_DATE:C307($_d_FirstIssueDate)
	C_LONGINT:C283(<>l_FS_FieldSortChangedAlert; $_l_ButtonNumber; $_l_event; $_l_FormReferenceRow; $_l_GetProductCodeProcess; $_l_Index; $_l_ModuleRow; $_l_OrderItemNumber; $_l_ProductRecordNumber; $_l_ReUseLevel; $_l_ScreenWidth)
	C_LONGINT:C283($_l_SortChangeAlert; $_l_SortDirection; $_l_SortFieldNumber; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord; PDT_l_BookingsCount; vALLevels)
	C_PICTURE:C286(PDT_Pi_EditMode)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayReferences)
	C_TEXT:C284($_t_AreaOptions; $_t_CurrentDefinitionsName; $_t_oldMethodName; $_t_PalletButtonName; $_t_ProductCode; $Title; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_SUBSEditor"; Form event code:C388)

$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Resize:K2:27)
		LBI_Scrollonresize(->SD2_lb_OrderItems)
		
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (False:C215)
			DB_SetnewToolBar
			
			//TRACE
			READ WRITE:C146([ORDER_ITEMS:25])
			
			
			ARRAY TEXT:C222(PDT_at_editMode; 0)
			ARRAY LONGINT:C221(PDT_al_EditMode; 0)
			
			LBi_SetListBoxOptions(->PDT_at_editMode; ->PDT_al_EditMode; ->PDT_Pi_EditMode)
			//GET PICTURE FROM LIBRARY(22542; PDT_Pi_EditMode)
			PDT_Pi_EditMode:=Get_Picture(22542)
			ARRAY TEXT:C222(SD2_at_OpenChoice; 0)
			ARRAY LONGINT:C221(SD2_al_OpenChoice; 0)
			APPEND TO ARRAY:C911(SD2_at_OpenChoice; "Orders")
			APPEND TO ARRAY:C911(SD2_at_OpenChoice; "Invoices")
			APPEND TO ARRAY:C911(SD2_al_OpenChoice; Table:C252(->[ORDERS:24]))
			APPEND TO ARRAY:C911(SD2_al_OpenChoice; Table:C252(->[INVOICES:39]))
			SD2_at_OpenChoice:=1
			
			If ([DIARY:12]Diary_Code:3="")
				DiarySetCode
			End if 
			If ([DIARY:12]x_ID:50>0)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
				QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[SUBSCRIPTIONS:93]))
			Else 
				REDUCE SELECTION:C351([xDiaryRelations:137]; 0)
			End if 
			ARRAY LONGINT:C221(SD2_al_RelatedTableNum; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedRecordID; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordName; 0)
			ARRAY LONGINT:C221(SD2_Al_OrderItemNumbers; 0)
			ARRAY TEXT:C222(SD2_at_OrderItemOrderCodes; 0)
			ARRAY TEXT:C222(SD2_At_OrderItemCompanies; 0)
			ARRAY REAL:C219(SD2_ar_OrderItemQuantity; 0)
			ARRAY TEXT:C222(SD2_at_OrderItemProductName; 0)
			ARRAY TEXT:C222(SD2_AT_OrderITemMacContent; 0)  //macro controlled content!
			If (Records in selection:C76([xDiaryRelations:137])>0)
				CREATE SET:C116([xDiaryRelations:137]; "ALL")
				QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[SUBSCRIPTIONS:93]))
				If (Records in selection:C76([xDiaryRelations:137])>0)
					CREATE SET:C116([xDiaryRelations:137]; "ORDERS")
				Else 
					CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
				End if 
			Else 
				//Gen_Confirm ("This Subscription issue does not appear to have the Puclication dates linked to the orders. This may need data updated or this may be a publication with no existing subscriptions for this issue";"Update";"New")
				
				
				REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
				
				CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
				CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "BOOKING")
				
			End if 
			
			USE SET:C118("ORDERS")
			SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; $_al_RelatedTableNumbers; [xDiaryRelations:137]XRecord_Code:5; $_at_RelatedRecordCodes; [xDiaryRelations:137]xRecordID:4; $_al_RelatedRecordIDs)
			
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3=[DIARY:12]Date_Do_From:4)
			
			QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
			QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4#0)
			
			ARRAY TEXT:C222(DIA_at_SubsProductCodes; 0)
			DIA_bo_ProductsLoaded:=False:C215
			$_l_GetProductCodeProcess:=New process:C317("SUBS_GetDiaryProductCodes"; 128000; "Get Related Product Codes"; [DIARY:12]Product_Code:13; Current process:C322)
			
			Repeat 
				DelayTicks(2)
			Until (DIA_bo_ProductsLoaded)
			//And check that these subs are for the correct publications
			QUERY SELECTION WITH ARRAY:C1050([SUBSCRIPTIONS:93]Product_Code:1; DIA_at_SubsProductCodes)
			
			If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; $_al_SubsRecordIDs; [SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_SubsOrderItemNumbers)
				
				
				For ($_l_Index; 1; Size of array:C274($_al_SubsRecordIDs))
					If (Find in array:C230($_al_RelatedRecordIDs; $_al_SubsRecordIDs{$_l_Index})<0)
						
						QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]x_ID:11=$_al_SubsRecordIDs{$_l_Index})
						
						
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[SUBSCRIPTIONS:93])
						[xDiaryRelations:137]xRecordID:4:=$_al_SubsRecordIDs{$_l_Index}
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_SubsOrderItemNumbers{$_l_Index})
						[xDiaryRelations:137]XRecord_Code:5:=[ORDER_ITEMS:25]Order_Code:1
						
						
						APPEND TO ARRAY:C911($_al_RelatedRecordIDs; $_al_SubsRecordIDs{$_l_Index})
						APPEND TO ARRAY:C911($_at_RelatedRecordCodes; [ORDER_ITEMS:25]Order_Code:1)
						
						APPEND TO ARRAY:C911($_al_RelatedTableNumbers; Table:C252(->[SUBSCRIPTIONS:93]))
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						SAVE RECORD:C53([xDiaryRelations:137])
						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
						QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[SUBSCRIPTIONS:93]))
						If (Records in selection:C76([xDiaryRelations:137])>0)
							CREATE SET:C116([xDiaryRelations:137]; "ORDERS")
						Else 
							CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
						End if 
						
					End if 
				End for 
			End if 
			//we may also have subscriptions with no issue records at the moment.
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=[DIARY:12]Date_Do_From:4; *)
			
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="REN")
			QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4#0)
			
			//if there is a  renewal due or in the future AND the Order item invoice number=SUBS then this is an active Subscription
			$_l_GetProductCodeProcess:=New process:C317("SUBS_GetDiaryProductCodes"; 128000; "Get Related Product Codes"; [DIARY:12]Product_Code:13; Current process:C322)
			
			Repeat 
				DelayTicks(2)
			Until (DIA_bo_ProductsLoaded)
			QUERY SELECTION WITH ARRAY:C1050([SUBSCRIPTIONS:93]Product_Code:1; DIA_at_SubsProductCodes)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_OrderNumbers)
			
			
			CREATE SET:C116([SUBSCRIPTIONS:93]; "ORDER")
			QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderNumbers)
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="SUBS")
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supply_by_Date:31<=[DIARY:12]Date_Do_From:4)
			
			
			
			//The above does not give an 'historical' perspective .ie if the subs is cancelled NOW it may have been active THEN but it still wont show up in this case
			//this does not affect things going forward because the diary link record will include it for this issue even if it has been subsequently cancelled.
			SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OrderNumbers)
			QUERY WITH ARRAY:C644([SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_OrderNumbers)
			
			
			CREATE SET:C116([SUBSCRIPTIONS:93]; "ORDER2")
			INTERSECTION:C121("ORDER2"; "ORDER"; "ORDER")
			USE SET:C118("ORDER")
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; $_al_SubsRecordIDs; [SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_SubsOrderItemNumbers)
			
			$_l_ProductRecordNumber:=Record number:C243([PRODUCTS:9])
			COPY NAMED SELECTION:C331([PRODUCTS:9]; "$TempProducts")
			For ($_l_Index; 1; Size of array:C274($_al_SubsRecordIDs))
				//This bit has to handle things differently- we need to check there is not an ISS record already and if not create it.
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]x_ID:11=$_al_SubsRecordIDs{$_l_Index})
				$_l_OrderItemNumber:=[SUBSCRIPTIONS:93]Order_Item_Number:4
				$_t_ProductCode:=[SUBSCRIPTIONS:93]Product_Code:1
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_OrderItemNumber)
				$_d_FirstIssueDate:=[ORDER_ITEMS:25]Required_Date:10
				
				
				
				
				
				//when calculation the issue number remember thata we need to create an issue record for EACH publicaton in the component
				//so when getting an issue number
				If ([ORDER_ITEMS:25]Required_Date:10<=[DIARY:12]Date_Do_From:4)
					
					
					QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=$_t_ProductCode; *)
					QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_l_OrderItemNumber; *)
					
					
					QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="ISS"; *)
					QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Subscription_Date:3=[DIARY:12]Date_Do_From:4)
					
					If (Records in selection:C76([SUBSCRIPTIONS:93])=0)
						If ([PRODUCTS:9]Product_Code:1#$_t_ProductCode)
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
							
							
						End if 
						CREATE RECORD:C68([SUBSCRIPTIONS:93])
						[SUBSCRIPTIONS:93]Order_Item_Number:4:=$_l_OrderItemNumber
						[SUBSCRIPTIONS:93]Product_Code:1:=$_t_ProductCode
						If ([PRODUCTS:9]Append_Month:34)
							//$SDate:=
							[SUBSCRIPTIONS:93]Product_Name:2:="+ "+MonthName([DIARY:12]Date_Do_From:4)
							
							
							
							
						End if 
						If ([PRODUCTS:9]Append_Issue:35)
							If ([PRODUCTS:9]Append_Month:34)
								[SUBSCRIPTIONS:93]Product_Name:2:=[SUBSCRIPTIONS:93]Product_Name:2+", Issue No "+String:C10($_l_Index)
								
								
								
							Else 
								[SUBSCRIPTIONS:93]Product_Name:2:="+ Issue No "+String:C10($_l_Index)
								
							End if 
						End if 
						[SUBSCRIPTIONS:93]Type:7:="ISS"
						[SUBSCRIPTIONS:93]Subscription_Date:3:=[DIARY:12]Date_Do_From:4
						
						
						[SUBSCRIPTIONS:93]After_Number:5:=$_l_Index
						$_l_Index:=$_l_Index+[PRODUCTS:9]Every_Number:28
						[SUBSCRIPTIONS:93]Unit_Number:6:=[PRODUCTS:9]Unit_Number:29
						
						
						
						//$SDate:=Subscript_SDate ($SDate)
						DB_SaveRecord(->[SUBSCRIPTIONS:93])
						AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
						
					End if 
					If (Find in array:C230($_al_RelatedRecordIDs; $_al_SubsRecordIDs{$_l_Index})<0)
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[SUBSCRIPTIONS:93])
						[xDiaryRelations:137]xRecordID:4:=$_al_SubsRecordIDs{$_l_Index}
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_SubsOrderItemNumbers{$_l_Index})
						[xDiaryRelations:137]XRecord_Code:5:=[ORDER_ITEMS:25]Order_Code:1
						
						
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						SAVE RECORD:C53([xDiaryRelations:137])
						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
						QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[SUBSCRIPTIONS:93]))
						If (Records in selection:C76([xDiaryRelations:137])>0)
							CREATE SET:C116([xDiaryRelations:137]; "ORDERS")
						Else 
							CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
						End if 
						
					End if 
				End if 
			End for 
			
			
			If ([DIARY:12]x_ID:50>0)
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
			Else 
				REDUCE SELECTION:C351([xDiaryRelations:137]; 0)
			End if 
			ARRAY LONGINT:C221(SD2_al_RelatedTableNum; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedRecordID; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordName; 0)
			ARRAY LONGINT:C221(SD2_Al_OrderItemNumbers; 0)
			ARRAY TEXT:C222(SD2_at_OrderItemOrderCodes; 0)
			ARRAY TEXT:C222(SD2_At_OrderItemCompanies; 0)
			ARRAY REAL:C219(SD2_ar_OrderItemQuantity; 0)
			ARRAY TEXT:C222(SD2_at_OrderItemProductName; 0)
			ARRAY TEXT:C222(SD2_AT_OrderITemMacContent; 0)  //macro controlled content!
			If (Records in selection:C76([xDiaryRelations:137])>0)
				CREATE SET:C116([xDiaryRelations:137]; "ALL")
				QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[SUBSCRIPTIONS:93]))
				If (Records in selection:C76([xDiaryRelations:137])>0)
					CREATE SET:C116([xDiaryRelations:137]; "ORDERS")
				Else 
					CREATE EMPTY SET:C140([xDiaryRelations:137]; "ORDERS")
				End if 
				USE SET:C118("ORDERS")
				SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; $_al_RelatedTableNumbers; [xDiaryRelations:137]XRecord_Code:5; $_at_RelatedRecordCodes; [xDiaryRelations:137]xRecordID:4; $_al_RelatedRecordIDs)
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3=[DIARY:12]Date_Do_From:4)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; $_al_SubsRecordIDs; [SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_SubsOrderItemNumbers)
				
				
				
			End if 
			
			
			QUERY WITH ARRAY:C644([SUBSCRIPTIONS:93]x_ID:11; $_al_RelatedRecordIDs)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_OrderItemNumbers)
			QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
			CREATE SET:C116([ORDER_ITEMS:25]; "BOOKING")
			DISTINCT VALUES:C339([ORDER_ITEMS:25]Product_Code:2; SUBS_at_FIlterByProductCode)
			QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; SUBS_at_FIlterByProductCode)
			SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; SUBS_at_FIlterByProductCode; [PRODUCTS:9]Product_Name:2; SUBS_at_FIlterByProductName)
			
			
			
			
			
			
			
			SORT ARRAY:C229(SUBS_at_FIlterByProductName; SUBS_at_FIlterByProductCode)
			If (Size of array:C274(SUBS_at_FIlterByProductName)<=1)
				OBJECT SET VISIBLE:C603(*; "oFilterBySubs"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oFilterBySubs"; True:C214)
				INSERT IN ARRAY:C227(SUBS_at_FIlterByProductName; 1; 1)
				SUBS_at_FIlterByProductName{1}:="ALL"
				INSERT IN ARRAY:C227(SUBS_at_FIlterByProductCode; 1; 1)
				
			End if 
			
			
			
			
			
			//ORDER BY([ORDER_ITEMS];[ORDER_ITEMS]Product_Code;>(
			
			ARRAY LONGINT:C221(SD2_al_Levels; 1)
			ARRAY POINTER:C280(SD2_aptr_LBOrderItemsSetup; 0)
			$_l_ReUseLevel:=0
			If (Size of array:C274(SD2_aptr_LBOrderItemsSetup)=0) & (vALLevels>0)
				If (SD2_al_Levels{1}=0)
					$_bo_NewLevel:=True:C214
					
				Else 
					$_bo_NewLevel:=False:C215
					$_l_ReUseLevel:=SD2_al_Levels{1}
				End if 
			Else 
				$_bo_NewLevel:=False:C215
			End if 
			
			If (Size of array:C274(SD2_aptr_LBOrderItemsSetup)=0)
				$_t_AreaOptions:="411111000"
				LBi_ArrDefFill(->SD2_aptr_LBOrderItemsSetup; ->SD2_lb_OrderItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[DIARY:12]Order_Code:26; $_t_AreaOptions; "Items_in"; 23; "Order Items"; "Order Item"; ""; $_bo_NewLevel; $_l_ReUseLevel)
				
				//OK--so March 2007-I added a way last month to auto include a column if it is not in the definitions
				//here i am not only going to add the column SORT ORDER in I am also going to set this to ignore the users sort preference and sort by that column
				$_ptr_ArrayReferences:=SD2_aptr_LBOrderItemsSetup{9}
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
				$_ptr_ArrayFieldPointers:=SD2_aptr_LBOrderItemsSetup{2}
				$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
				<>l_FS_FieldSortChangedAlert:=1
				$_l_FormReferenceRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
				$_l_SortFieldNumber:=<>FS_al_FormSortFieldNum{$_l_FormReferenceRow}
				If ($_l_FormReferenceRow>0)
					$_l_SortFieldNumber:=<>FS_al_FormSortFieldNum{$_l_FormReferenceRow}
					$_l_SortDirection:=<>FS_al_FormSortDirection{$_l_FormReferenceRow}  //added 29/08/06 - kmw (not initialised which was causing error when toggling)
				Else 
					$_l_SortDirection:=1
				End if 
				FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; Field:C253(->[ORDER_ITEMS:25]Product_Code:2); Table:C252(->[ORDER_ITEMS:25]); ""; "")
				<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
				
			Else 
				
				OK:=1
				
				
				LBi_Prefs11(->SD2_aptr_LBOrderItemsSetup)
				$_ptr_ArrayReferences:=SD2_aptr_LBOrderItemsSetup{9}
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
				$_ptr_ArrayFieldPointers:=SD2_aptr_LBOrderItemsSetup{2}
				
				
				$_l_SortChangeAlert:=<>l_FS_FieldSortChangedAlert
				<>l_FS_FieldSortChangedAlert:=1
				$_l_FormReferenceRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
				$_l_SortFieldNumber:=<>FS_al_FormSortFieldNum{$_l_FormReferenceRow}
				If ($_l_FormReferenceRow>0)
					$_l_SortFieldNumber:=<>FS_al_FormSortFieldNum{$_l_FormReferenceRow}
					$_l_SortDirection:=<>FS_al_FormSortDirection{$_l_FormReferenceRow}  //added 29/08/06 - kmw (not initialised which was causing error when toggling)
				Else 
					$_l_SortDirection:=1
				End if 
				FSetting_UpdateArray($_t_CurrentDefinitionsName; $_l_SortDirection; Field:C253(->[ORDER_ITEMS:25]Product_Code:2); Table:C252(->[ORDER_ITEMS:25]); ""; "")
				
				<>l_FS_FieldSortChangedAlert:=$_l_SortChangeAlert
				
			End if 
			
			PDT_l_BookingsCount:=Records in selection:C76([ORDER_ITEMS:25])
			
			
			LBi_LoadSetup(->SD2_aptr_LBOrderItemsSetup; "B")
			//Find column with [products]size
			
			
			
			INT_SetInput(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
			$_l_ScreenWidth:=Screen width:C187-60
			WS_AutoscreenSize(1; 1200; $_l_ScreenWidth; Table name:C256(->[DIARY:12])+"_"+"Diary_SUBSEditor")
			DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
			If (Records in selection:C76([ORDERS:24])<=1)
				OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
			//NEEDS BUTTONS SET
		Else 
			Gen_Alert("This is not in use yet")
			CANCEL:C270
		End if 
	: ($_l_event=On Data Change:K2:15) | ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
				
				
		End case 
		
		
	: ($_l_event=On Outside Call:K2:11)
		
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				//InButtSubHandle (Current form page;->[ORDERS])
				
				
			: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1))
				For ($_l_Index; 1; Size of array:C274(SD2_al_RelatedRecordID))
					
					If (SD2_al_RelatedRecordID{$_l_Index}<0)  //new link needs to be created
						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=SD2_al_RelatedTableNum{$_l_Index}; *)
						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=Abs:C99(SD2_al_RelatedRecordID{$_l_Index}))
						If (Records in selection:C76([xDiaryRelations:137])=0)
							CREATE RECORD:C68([xDiaryRelations:137])
							[xDiaryRelations:137]xTableNUM:3:=SD2_al_RelatedTableNum{$_l_Index}
							[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
							[xDiaryRelations:137]xRecordID:4:=Abs:C99(SD2_al_RelatedRecordID{$_l_Index})
							[xDiaryRelations:137]XRecord_Code:5:=SD2_at_RelatedRecordCode{$_l_Index}
							DB_SaveRecord(->[xDiaryRelations:137])
						End if 
					End if 
				End for 
				
				ACCEPT:C269
			: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel")) | (iCancel=1))
				CANCEL:C270
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Report"))
				$_bo_OptionKey:=Gen_Option
				Gen_ListReport(->[ORDER_ITEMS:25]; ""; "SelectedBookings"; $_bo_OptionKey; True:C214; [DIARY:12]Action_Code:9)
				
				
				
				
				
				
		End case 
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
		If (Records in selection:C76([ORDERS:24])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_PDTEditor")
		If (Records in selection:C76([ORDERS:24])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [DIARY].Diary_SUBSEditor"; $_t_oldMethodName)
