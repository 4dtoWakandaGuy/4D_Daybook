If (False:C215)
	//Table Form Method Name: [USER]BK_DataModel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DisableFIeldNos; 0)
	//ARRAY LONGINT(BK_al_ADBFIELDNUM;0)
	//ARRAY LONGINT(BK_al_aDBTableNum;0)
	//ARRAY LONGINT(BK_al_CustDataModelID;0)
	//ARRAY LONGINT(BK_al_DayBookContext;0)
	//ARRAY LONGINT(BK_al_DestinationField;0)
	//ARRAY LONGINT(BK_al_DestinationTable;0)
	//ARRAY LONGINT(BK_al_ItemDataModelID;0)
	//ARRAY LONGINT(BK_al_MapRecID;0)
	//ARRAY LONGINT(BK_al_PsuedoNumber;0)
	//ARRAY LONGINT(BK_al_SortNumber;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(DM_al_DataDefaults;0)
	//ARRAY TEXT(BK_at_BKContext;0)
	//ARRAY TEXT(BK_at_BKFieldName;0)
	//ARRAY TEXT(BK_at_BKTABLE;0)
	//ARRAY TEXT(BK_at_CustDataModelName;0)
	//ARRAY TEXT(BK_at_DayBookContext;0)
	//ARRAY TEXT(BK_at_DBFieldName;0)
	//ARRAY TEXT(BK_at_DestinationFieldName;0)
	//ARRAY TEXT(BK_at_ItemDataModelName;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(DM_at_DataDefaults;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; DB_bo_NoLoad; DM_Bo_BKedit)
	C_LONGINT:C283($_l_CusElement; $_l_DefaultsPosition; $_l_Element; $_l_event; $_l_FieldCount; $_l_FieldLength; $_l_FieldNumberIndex; $_l_FieldType; $_l_ItemElement; $_l_ItemID; $_l_ModelsArraySize)
	C_LONGINT:C283($_l_Offset; $_l_Retries; $_l_TableNumber; $BK_l_ConnectionContext; BK_l_CustDataModelID; BK_l_DataModelID; BK_l_DayBookContext; BK_l_itemDataModelID; BK_l_OrdDataModelID; DM_l_BKDataDefaults)
	C_TEXT:C284($_t_DataOptionsName; $_t_oldMethodName; BK_t_BKCONTEXT; BK_t_CustDataModelName; BK_t_DataModelName; BK_t_DayBookContext; BK_t_ItemDataModelName; BK_t_OrdDataModelName; DM_t_DataDefaults)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].BK_DataModel"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "BK_DataModel")
		ARRAY TEXT:C222(DM_at_DataDefaults; 0)
		
		ARRAY LONGINT:C221(DM_al_DataDefaults; 0)
		DM_Bo_BKedit:=False:C215
		
		WS_AutoscreenSize(3; 474; 538)
		ARRAY TEXT:C222(BK_at_DayBookContext; 3)
		ARRAY LONGINT:C221(BK_al_DayBookContext; 3)
		BK_t_CustDataModelName:=""
		//BK_l_CustDataModelID:=0
		BK_t_OrdDataModelName:=""
		BK_l_OrdDataModelID:=0
		BK_at_DayBookContext{1}:="Orders"
		BK_al_DayBookContext{1}:=25
		BK_at_DayBookContext{2}:="Contacts"
		BK_al_DayBookContext{2}:=2
		BK_at_DayBookContext{3}:="Products"
		BK_al_DayBookContext{3}:=Table:C252(->[PRODUCTS:9])
		BK_at_DayBookContext:=0
		ARRAY TEXT:C222(BK_at_CustDataModelName; 0)
		ARRAY LONGINT:C221(BK_al_CustDataModelID; 0)
		
		ARRAY TEXT:C222(BK_at_ItemDataModelName; 0)
		ARRAY LONGINT:C221(BK_al_ItemDataModelID; 0)
		OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; False:C215)
		OBJECT SET VISIBLE:C603(BK_t_CustDataModelName; False:C215)
		OBJECT SET VISIBLE:C603(BK_at_CustDataModelName; False:C215)
		OBJECT SET VISIBLE:C603(BK_t_ItemDataModelName; False:C215)
		OBJECT SET VISIBLE:C603(BK_at_ItemDataModelName; False:C215)
		
		ARRAY TEXT:C222(BK_at_BKContext; 3)
		ARRAY TEXT:C222(BK_at_BKTABLE; 3)
		BK_at_BKContext{1}:="Orders"
		BK_at_BKContext{2}:="Customers"
		BK_at_BKContext{3}:="Items"
		//check the following
		BK_at_BKTABLE{1}:="ODR"
		BK_at_BKTABLE{2}:="CUS"
		BK_at_BKTABLE{3}:="ITM"
		BK_t_DayBookContext:=""
		BK_t_BKCONTEXT:=""
		BK_l_DayBookContext:=0
		BK_t_BKCONTEXT:=""
		ARRAY TEXT:C222(BK_at_BKFieldName; 0)
		ARRAY LONGINT:C221(BK_al_aDBTableNum; 0)
		ARRAY LONGINT:C221(BK_al_PsuedoNumber; 0)
		ARRAY LONGINT:C221(BK_al_SortNumber; 0)
		ARRAY LONGINT:C221(BK_al_ADBFIELDNUM; 0)
		ARRAY TEXT:C222(BK_at_DBFieldName; 0)
		ARRAY LONGINT:C221(BK_al_MapRecID; 0)
		
		If (BK_l_DataModelID>0)
			QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=BK_l_DataModelID)
			BK_t_DayBookContext:=BK_at_DayBookContext{Find in array:C230(BK_al_DayBookContext; [EW_BK_FieldMap:121]x_DestinationContext:8)}
			BK_l_DayBookContext:=[EW_BK_FieldMap:121]x_DestinationContext:8
			BK_t_BKCONTEXT:=[EW_BK_FieldMap:121]BKTableName:6
			If (BK_t_BKCONTEXT#"")
				$_l_DefaultsPosition:=Find in array:C230(BK_at_BKTABLE; BK_t_BKCONTEXT)
				If ($_l_DefaultsPosition>0)
					BK_t_BKCONTEXT:=BK_at_BKContext{$_l_DefaultsPosition}
					OBJECT SET VISIBLE:C603(BK_at_BKContext; False:C215)
				Else 
					BK_t_BKCONTEXT:=""
				End if 
				
			End if 
			
			SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]x_RecID:9; BK_al_MapRecID; [EW_BK_FieldMap:121]BKFieldName:3; BK_at_BKFieldName; [EW_BK_FieldMap:121]DayBookTableNumber:1; BK_al_aDBTableNum; [EW_BK_FieldMap:121]DayBookFieldNumber:2; BK_al_ADBFIELDNUM; [EW_BK_FieldMap:121]DaybookFieldName:5; BK_at_DBFieldName)
			ARRAY LONGINT:C221(BK_al_PsuedoNumber; Size of array:C274(BK_at_BKFieldName))
			ARRAY LONGINT:C221(BK_al_SortNumber; Size of array:C274(BK_at_BKFieldName))
			For ($_l_FieldNumberIndex; 1; Size of array:C274(BK_al_PsuedoNumber))
				BK_al_PsuedoNumber{$_l_FieldNumberIndex}:=$_l_FieldNumberIndex  // if fields added they will have negative numbers
				//if modified they will be plus 1000
				BK_al_SortNumber{$_l_FieldNumberIndex}:=$_l_FieldNumberIndex
			End for 
			If (BK_l_DayBookContext>0)
				OBJECT SET VISIBLE:C603(BK_at_DayBookContext; False:C215)
				BK_t_DayBookContext:=BK_at_DayBookContext{Find in array:C230(BK_al_DayBookContext; BK_l_DayBookContext)}
				
			End if 
			ARRAY LONGINT:C221(BK_al_DestinationTable; 0)
			ARRAY LONGINT:C221(BK_al_DestinationField; 0)
			ARRAY TEXT:C222(BK_at_DestinationFieldName; 0)
			Case of 
				: (BK_l_DayBookContext=25)  //orders
					ARRAY LONGINT:C221($_al_DisableFIeldNos; 15)
					$_al_DisableFIeldNos{1}:=Field:C253(->[ORDERS:24]Export:24)
					$_al_DisableFIeldNos{2}:=Field:C253(->[ORDERS:24]Print_Comments:44)
					$_al_DisableFIeldNos{3}:=Field:C253(->[ORDERS:24]SORT_Date:57)
					$_al_DisableFIeldNos{4}:=Field:C253(->[ORDERS:24]x_ID:58)
					$_al_DisableFIeldNos{5}:=Field:C253(->[ORDERS:24]Total_Amount:6)
					$_al_DisableFIeldNos{6}:=Field:C253(->[ORDERS:24]Total_TAX:7)
					$_al_DisableFIeldNos{7}:=Field:C253(->[ORDERS:24]Total_Total:8)
					$_al_DisableFIeldNos{8}:=Field:C253(->[ORDERS:24]Total_Cost:11)
					$_al_DisableFIeldNos{9}:=Field:C253(->[ORDERS:24]Total_Margin:12)
					$_al_DisableFIeldNos{10}:=Field:C253(->[ORDERS:24]Total_Margin_PC:13)
					$_al_DisableFIeldNos{11}:=Field:C253(->[ORDERS:24]Forecast_PC:22)
					$_al_DisableFIeldNos{12}:=Field:C253(->[ORDERS:24]Total_StandM:36)
					$_al_DisableFIeldNos{13}:=Field:C253(->[ORDERS:24]Total_StandMPC:37)
					$_al_DisableFIeldNos{14}:=Field:C253(->[ORDERS:24]Total_StandA:38)
					$_al_DisableFIeldNos{15}:=Field:C253(->[ORDERS:24]Total_StandC:39)
					
					$_l_FieldCount:=Get last field number:C255(Table:C252(->[ORDERS:24]))+(Get last field number:C255(Table:C252(->[ORDER_ITEMS:25])))
					ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_FieldCount)
					ARRAY LONGINT:C221(BK_al_DestinationField; $_l_FieldCount)
					ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_FieldCount)
					$_l_Element:=0
					
					For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[ORDERS:24])))
						$_l_TableNumber:=Table:C252(->[ORDERS:24])
						GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						If (Not:C34($_bo_FieldInvisible))
							$_l_DefaultsPosition:=Find in array:C230($_al_DisableFIeldNos; $_l_FieldNumberIndex)
							If ($_l_DefaultsPosition<0)
								$_l_Element:=$_l_Element+1
								BK_al_DestinationTable{$_l_Element}:=Table:C252(->[ORDERS:24])
								BK_al_DestinationField{$_l_Element}:=$_l_FieldNumberIndex
								BK_at_DestinationFieldName{$_l_Element}:=Field name:C257(BK_al_DestinationTable{$_l_Element}; BK_al_DestinationField{$_l_Element})
							End if 
						End if 
					End for 
					ARRAY LONGINT:C221($_al_DisableFIeldNos; 6)
					$_al_DisableFIeldNos{1}:=Field:C253(->[ORDER_ITEMS:25]Order_Code:1)
					$_al_DisableFIeldNos{2}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag1:54)
					$_al_DisableFIeldNos{3}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag2:55)
					$_al_DisableFIeldNos{4}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag3:56)
					$_al_DisableFIeldNos{5}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag4:57)
					$_al_DisableFIeldNos{6}:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
					For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[ORDER_ITEMS:25])))
						$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
						GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						If (Not:C34($_bo_FieldInvisible))
							$_l_DefaultsPosition:=Find in array:C230($_al_DisableFIeldNos; $_l_FieldNumberIndex)
							If ($_l_DefaultsPosition<0)
								$_l_Element:=$_l_Element+1
								BK_al_DestinationTable{$_l_Element}:=Table:C252(->[ORDER_ITEMS:25])
								BK_al_DestinationField{$_l_Element}:=$_l_FieldNumberIndex
								BK_at_DestinationFieldName{$_l_Element}:=Field name:C257(BK_al_DestinationTable{$_l_Element}; BK_al_DestinationField{$_l_Element})
							End if 
						End if 
					End for 
					ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_Element)
					ARRAY LONGINT:C221(BK_al_DestinationField; $_l_Element)
					ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_Element)
				: (BK_l_DayBookContext=2)  //Contacts/Companies
					ARRAY LONGINT:C221($_al_DisableFIeldNos; 4)
					$_al_DisableFIeldNos{1}:=Field:C253(->[COMPANIES:2]CUS_LabelPrint:67)
					$_al_DisableFIeldNos{2}:=Field:C253(->[COMPANIES:2]x_ID:63)
					$_al_DisableFIeldNos{3}:=Field:C253(->[COMPANIES:2]Deleted:61)
					$_al_DisableFIeldNos{4}:=Field:C253(->[COMPANIES:2]ADDRESS:60)
					
					
					$_l_FieldCount:=Get last field number:C255(Table:C252(->[COMPANIES:2]))+(Get last field number:C255(Table:C252(->[CONTACTS:1])))
					ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_FieldCount)
					ARRAY LONGINT:C221(BK_al_DestinationField; $_l_FieldCount)
					ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_FieldCount)
					$_l_Element:=0
					
					For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[COMPANIES:2])))
						
						$_l_TableNumber:=Table:C252(->[COMPANIES:2])
						GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						If (Not:C34($_bo_FieldInvisible)) & ($_l_FieldType#7) & ($_l_FieldType#3) & ($_l_FieldType#30)
							$_l_DefaultsPosition:=Find in array:C230($_al_DisableFIeldNos; $_l_FieldNumberIndex)
							If ($_l_DefaultsPosition<0)
								$_l_Element:=$_l_Element+1
								BK_al_DestinationTable{$_l_Element}:=Table:C252(->[COMPANIES:2])
								BK_al_DestinationField{$_l_Element}:=$_l_FieldNumberIndex
								BK_at_DestinationFieldName{$_l_Element}:=Field name:C257(BK_al_DestinationTable{$_l_Element}; BK_al_DestinationField{$_l_Element})
							End if 
						End if 
					End for 
					ARRAY LONGINT:C221($_al_DisableFIeldNos; 4)
					$_al_DisableFIeldNos{1}:=Field:C253(->[CONTACTS:1]Company_Code:1)
					$_al_DisableFIeldNos{2}:=Field:C253(->[CONTACTS:1]Exported:23)
					$_al_DisableFIeldNos{3}:=Field:C253(->[CONTACTS:1]x_ID:33)
					$_al_DisableFIeldNos{4}:=Field:C253(->[CONTACTS:1]CUS_LabelPrint:34)
					For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[CONTACTS:1])))
						$_l_TableNumber:=Table:C252(->[CONTACTS:1])
						GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						If (Not:C34($_bo_FieldInvisible)) & ($_l_FieldType#7) & ($_l_FieldType#3) & ($_l_FieldType#30)
							$_l_DefaultsPosition:=Find in array:C230($_al_DisableFIeldNos; $_l_FieldNumberIndex)
							If ($_l_DefaultsPosition<0)
								$_l_Element:=$_l_Element+1
								BK_al_DestinationTable{$_l_Element}:=Table:C252(->[CONTACTS:1])
								BK_al_DestinationField{$_l_Element}:=$_l_FieldNumberIndex
								BK_at_DestinationFieldName{$_l_Element}:=Field name:C257(BK_al_DestinationTable{$_l_Element}; BK_al_DestinationField{$_l_Element})
							End if 
						End if 
					End for 
					ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_Element)
					ARRAY LONGINT:C221(BK_al_DestinationField; $_l_Element)
					ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_Element)
				: (BK_l_DayBookContext=Table:C252(->[PRODUCTS:9]))  //products
					ARRAY LONGINT:C221($_al_DisableFIeldNos; 4)
					$_al_DisableFIeldNos{1}:=Field:C253(->[PRODUCTS:9]Exported:24)
					$_al_DisableFIeldNos{2}:=Field:C253(->[PRODUCTS:9]X_ID:43)
					$_al_DisableFIeldNos{3}:=Field:C253(->[PRODUCTS:9]Default_Price_Currency_ID:45)
					
					
					$_l_FieldCount:=Get last field number:C255(Table:C252(->[PRODUCTS:9]))+(Get last field number:C255(Table:C252(->[CONTACTS:1])))
					ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_FieldCount)
					ARRAY LONGINT:C221(BK_al_DestinationField; $_l_FieldCount)
					ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_FieldCount)
					$_l_Element:=0
					
					For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[PRODUCTS:9])))
						
						$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
						GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						If (Not:C34($_bo_FieldInvisible)) & ($_l_FieldType#7) & ($_l_FieldType#3) & ($_l_FieldType#30)
							$_l_DefaultsPosition:=Find in array:C230($_al_DisableFIeldNos; $_l_FieldNumberIndex)
							If ($_l_DefaultsPosition<0)
								$_l_Element:=$_l_Element+1
								BK_al_DestinationTable{$_l_Element}:=Table:C252(->[PRODUCTS:9])
								BK_al_DestinationField{$_l_Element}:=$_l_FieldNumberIndex
								BK_at_DestinationFieldName{$_l_Element}:=Field name:C257(BK_al_DestinationTable{$_l_Element}; BK_al_DestinationField{$_l_Element})
							End if 
						End if 
					End for 
					ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_Element)
					ARRAY LONGINT:C221(BK_al_DestinationField; $_l_Element)
					ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_Element)
					
			End case 
			
			
		End if 
		If (BK_t_BKCONTEXT="ODR")
			//````
			$_l_Retries:=0
			While (Semaphore:C143("LoadingDataModelPrefs"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
			End while 
			$_l_ItemID:=PREF_GetPreferenceID("Data Model Names")
			If ($_l_ItemID>0)
				
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
				//here use a Check_Locked
				
				If (Records in selection:C76([PREFERENCES:116])=0)
					//add the the preferences list here
					READ WRITE:C146([PREFERENCES:116])
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_ItemID
					[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
					[PREFERENCES:116]Pref_OwnerID:4:=-2
					DB_SaveRecord(->[PREFERENCES:116])
				Else 
					
				End if   //this will be ONE record
				
				$_l_Offset:=0
				DM_BKDataModelBlobtoVariables
				$_l_ModelsArraySize:=Size of array:C274(DM_at_BKModelNames)
				ARRAY TEXT:C222(BK_at_CustDataModelName; $_l_ModelsArraySize)
				ARRAY LONGINT:C221(BK_al_CustDataModelID; $_l_ModelsArraySize)
				ARRAY TEXT:C222(BK_at_ItemDataModelName; $_l_ModelsArraySize)
				ARRAY LONGINT:C221(BK_al_ItemDataModelID; $_l_ModelsArraySize)
				$_l_CusElement:=0
				$_l_ItemElement:=0
				For ($_l_FieldNumberIndex; 1; $_l_ModelsArraySize)
					$BK_l_ConnectionContext:=DM_GetModelContext(DM_al_BKModelIDS{$_l_FieldNumberIndex})
					Case of 
						: ($BK_l_ConnectionContext=2)  //contacts
							$_l_CusElement:=$_l_CusElement+1
							BK_at_CustDataModelName{$_l_CusElement}:=DM_at_BKModelNames{$_l_FieldNumberIndex}
							BK_al_CustDataModelID{$_l_CusElement}:=DM_al_BKModelIDS{$_l_FieldNumberIndex}
						: ($BK_l_ConnectionContext=Table:C252(->[PRODUCTS:9]))  //products
							$_l_ItemElement:=$_l_ItemElement+1
							BK_at_ItemDataModelName{$_l_ItemElement}:=DM_at_BKModelNames{$_l_FieldNumberIndex}
							BK_al_ItemDataModelID{$_l_ItemElement}:=DM_al_BKModelIDS{$_l_FieldNumberIndex}
					End case 
				End for 
				ARRAY TEXT:C222(BK_at_CustDataModelName; $_l_CusElement)
				ARRAY LONGINT:C221(BK_al_CustDataModelID; $_l_CusElement)
				ARRAY TEXT:C222(BK_at_ItemDataModelName; $_l_ItemElement)
				ARRAY LONGINT:C221(BK_al_ItemDataModelID; $_l_ItemElement)
				
				If (BK_l_CustDataModelID>0)
					$_l_DefaultsPosition:=Find in array:C230(BK_al_CustDataModelID; BK_l_CustDataModelID)
					If ($_l_DefaultsPosition>0)
						BK_t_CustDataModelName:=BK_at_CustDataModelName{$_l_DefaultsPosition}
					Else 
						BK_t_CustDataModelName:=""
						BK_l_CustDataModelID:=0
					End if 
				End if 
				If (BK_l_itemDataModelID>0)
					$_l_DefaultsPosition:=Find in array:C230(BK_al_ItemDataModelID; BK_l_itemDataModelID)
					If ($_l_DefaultsPosition>0)
						BK_t_ItemDataModelName:=BK_at_ItemDataModelName{$_l_DefaultsPosition}
					Else 
						BK_t_ItemDataModelName:=""
						BK_l_itemDataModelID:=0
					End if 
				End if 
				CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
				//````
				//this will need an associated model for importing Customers
				//and an associated model for product(items)
				OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop2"; True:C214)
				OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop"; True:C214)
				OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; True:C214)
				OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel3"; True:C214)
				OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel4"; False:C215)
				OBJECT SET VISIBLE:C603(BK_t_CustDataModelName; True:C214)
				OBJECT SET VISIBLE:C603(BK_at_CustDataModelName; True:C214)
				OBJECT SET VISIBLE:C603(BK_t_ItemDataModelName; True:C214)
				OBJECT SET VISIBLE:C603(BK_at_ItemDataModelName; True:C214)
				//BK_at_CustDataModelName
				OBJECT SET VISIBLE:C603(DM_at_DataDefaults; False:C215)
				OBJECT SET VISIBLE:C603(DM_t_DataDefaults; False:C215)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop"; True:C214)
			OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop2"; False:C215)
			OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; False:C215)
			OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel3"; False:C215)
			OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel4"; True:C214)
			OBJECT SET VISIBLE:C603(BK_t_CustDataModelName; False:C215)
			OBJECT SET VISIBLE:C603(BK_at_CustDataModelName; False:C215)
			OBJECT SET VISIBLE:C603(BK_t_ItemDataModelName; False:C215)
			OBJECT SET VISIBLE:C603(BK_at_ItemDataModelName; False:C215)
			OBJECT SET VISIBLE:C603(DM_at_DataDefaults; True:C214)
			OBJECT SET VISIBLE:C603(DM_t_DataDefaults; True:C214)
			OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop"; True:C214)
			// ARRAY LONGINT(DM_al_DataDefaults;0)
			//C_STRING(55;DM_at_DataDefaults)
			//```
			$_l_Retries:=0
			While (Semaphore:C143("LoadingDataModelPrefs"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
			End while 
			
			If (BK_l_DayBookContext>0)
				$_l_Retries:=0
				While (Semaphore:C143("LoadingDataModelPrefs"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*$_l_Retries)
				End while 
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
				QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=(BK_l_DayBookContext))
				ARRAY LONGINT:C221(DM_al_DataDefaults; Records in selection:C76([PREFERENCES:116]))
				ARRAY TEXT:C222(DM_at_DataDefaults; Records in selection:C76([PREFERENCES:116]))
				FIRST RECORD:C50([PREFERENCES:116])
				$_t_DataOptionsName:=""
				
				For ($_l_FieldNumberIndex; 1; Records in selection:C76([PREFERENCES:116]))
					$_l_Offset:=0
					DM_al_DataDefaults{$_l_FieldNumberIndex}:=[PREFERENCES:116]IDNumber:1
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_DataOptionsName; $_l_Offset)
						DM_at_DataDefaults{$_l_FieldNumberIndex}:=$_t_DataOptionsName
						NEXT RECORD:C51([PREFERENCES:116])
					End if 
				End for 
				CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
				
				If (DM_l_BKDataDefaults>0)
					// DM_t_BKOptionsName
					$_l_DefaultsPosition:=Find in array:C230(DM_al_DataDefaults; DM_l_BKDataDefaults)
					If ($_l_DefaultsPosition>0)
						//DM_t_BKOPTIONS
						DM_t_DataDefaults:=DM_at_DataDefaults{$_l_DefaultsPosition}
					End if 
					
				Else 
					DM_t_DataDefaults:=""
				End if 
				
			Else 
				DM_t_DataDefaults:=""
				DM_l_BKDataDefaults:=0
				
			End if 
			
			//``````
		End if 
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:BK_DataModel"; $_t_oldMethodName)
