If (False:C215)
	//object Name: [USER]BK_DataModel.Variable2
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
	ARRAY LONGINT:C221($_al_DisableFieldNos; 0)
	//ARRAY LONGINT(BK_al_DayBookContext;0)
	//ARRAY LONGINT(BK_al_DestinationField;0)
	//ARRAY LONGINT(BK_al_DestinationTable;0)
	//ARRAY TEXT(BK_at_DayBookContext;0)
	//ARRAY TEXT(BK_at_DestinationFieldName;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; DM_Bo_BKedit)
	C_LONGINT:C283($_l_Element; $_l_FieldCount; $_l_FieldLength; $_l_FieldNumberIndex; $_l_FieldPosition; $_l_FieldType; $_l_TableNumber; BK_l_DayBookContext)
	C_TEXT:C284($_t_oldMethodName; BK_t_DayBookContext)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Variable2"; Form event code:C388)

If (BK_at_DayBookContext>0)
	BK_t_DayBookContext:=BK_at_DayBookContext{BK_at_DayBookContext}
	BK_l_DayBookContext:=BK_al_DayBookContext{BK_at_DayBookContext}
	DM_Bo_BKedit:=True:C214
	ARRAY LONGINT:C221(BK_al_DestinationTable; 0)
	ARRAY LONGINT:C221(BK_al_DestinationField; 0)
	ARRAY TEXT:C222(BK_at_DestinationFieldName; 0)
	Case of 
		: (BK_l_DayBookContext=25)  //orders
			ARRAY LONGINT:C221($_al_DisableFieldNos; 15)
			$_al_DisableFieldNos{1}:=Field:C253(->[ORDERS:24]Export:24)
			$_al_DisableFieldNos{2}:=Field:C253(->[ORDERS:24]Print_Comments:44)
			$_al_DisableFieldNos{3}:=Field:C253(->[ORDERS:24]SORT_Date:57)
			$_al_DisableFieldNos{4}:=Field:C253(->[ORDERS:24]x_ID:58)
			$_al_DisableFieldNos{5}:=Field:C253(->[ORDERS:24]Total_Amount:6)
			$_al_DisableFieldNos{6}:=Field:C253(->[ORDERS:24]Total_TAX:7)
			$_al_DisableFieldNos{7}:=Field:C253(->[ORDERS:24]Total_Total:8)
			$_al_DisableFieldNos{8}:=Field:C253(->[ORDERS:24]Total_Cost:11)
			$_al_DisableFieldNos{9}:=Field:C253(->[ORDERS:24]Total_Margin:12)
			$_al_DisableFieldNos{10}:=Field:C253(->[ORDERS:24]Total_Margin_PC:13)
			$_al_DisableFieldNos{11}:=Field:C253(->[ORDERS:24]Forecast_PC:22)
			$_al_DisableFieldNos{12}:=Field:C253(->[ORDERS:24]Total_StandM:36)
			$_al_DisableFieldNos{13}:=Field:C253(->[ORDERS:24]Total_StandMPC:37)
			$_al_DisableFieldNos{14}:=Field:C253(->[ORDERS:24]Total_StandA:38)
			$_al_DisableFieldNos{15}:=Field:C253(->[ORDERS:24]Total_StandC:39)
			
			
			$_l_FieldCount:=Get last field number:C255(Table:C252(->[ORDERS:24]))+(Get last field number:C255(Table:C252(->[ORDER_ITEMS:25])))
			
			ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_FieldCount)
			ARRAY LONGINT:C221(BK_al_DestinationField; $_l_FieldCount)
			ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_FieldCount)
			$_l_Element:=0
			
			For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[ORDERS:24])))
				$_l_TableNumber:=Table:C252(->[ORDERS:24])
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				If (Not:C34($_bo_FieldInvisible))
					$_l_FieldPosition:=Find in array:C230($_al_DisableFieldNos; $_l_FieldNumberIndex)
					If ($_l_FieldPosition<0)
						$_l_Element:=$_l_Element+1
						BK_al_DestinationTable{$_l_Element}:=Table:C252(->[ORDERS:24])
						BK_al_DestinationField{$_l_Element}:=$_l_FieldNumberIndex
						BK_at_DestinationFieldName{$_l_Element}:=Field name:C257(BK_al_DestinationTable{$_l_Element}; BK_al_DestinationField{$_l_Element})
						
					End if 
				End if 
			End for 
			ARRAY LONGINT:C221($_al_DisableFieldNos; 6)
			$_al_DisableFieldNos{1}:=Field:C253(->[ORDER_ITEMS:25]Order_Code:1)
			$_al_DisableFieldNos{2}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag1:54)
			$_al_DisableFieldNos{3}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag2:55)
			$_al_DisableFieldNos{4}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag3:56)
			$_al_DisableFieldNos{5}:=Field:C253(->[ORDER_ITEMS:25]WT_Tag4:57)
			$_al_DisableFieldNos{6}:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
			For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[ORDER_ITEMS:25])))
				$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				If (Not:C34($_bo_FieldInvisible))
					$_l_FieldPosition:=Find in array:C230($_al_DisableFieldNos; $_l_FieldNumberIndex)
					If ($_l_FieldPosition<0)
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
			
			DM_Bo_BKedit:=True:C214
		: (BK_l_DayBookContext=2)  //Contacts/Companies
			ARRAY LONGINT:C221($_al_DisableFieldNos; 4)
			$_al_DisableFieldNos{1}:=Field:C253(->[COMPANIES:2]CUS_LabelPrint:67)
			$_al_DisableFieldNos{2}:=Field:C253(->[COMPANIES:2]x_ID:63)
			$_al_DisableFieldNos{3}:=Field:C253(->[COMPANIES:2]Deleted:61)
			$_al_DisableFieldNos{4}:=Field:C253(->[COMPANIES:2]ADDRESS:60)
			
			
			$_l_FieldCount:=Get last field number:C255(Table:C252(->[COMPANIES:2]))+(Get last field number:C255(Table:C252(->[CONTACTS:1])))
			ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_FieldCount)
			ARRAY LONGINT:C221(BK_al_DestinationField; $_l_FieldCount)
			ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_FieldCount)
			$_l_Element:=0
			
			For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[COMPANIES:2])))
				$_l_TableNumber:=Table:C252(->[COMPANIES:2])
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				If (Not:C34($_bo_FieldInvisible)) & ($_l_FieldType#7) & ($_l_FieldType#3) & ($_l_FieldType#30)
					$_l_FieldPosition:=Find in array:C230($_al_DisableFieldNos; $_l_FieldNumberIndex)
					If ($_l_FieldPosition<0)
						$_l_Element:=$_l_Element+1
						BK_al_DestinationTable{$_l_Element}:=Table:C252(->[COMPANIES:2])
						BK_al_DestinationField{$_l_Element}:=$_l_FieldNumberIndex
						BK_at_DestinationFieldName{$_l_Element}:=Field name:C257(BK_al_DestinationTable{$_l_Element}; BK_al_DestinationField{$_l_Element})
					End if 
				End if 
			End for 
			ARRAY LONGINT:C221($_al_DisableFieldNos; 4)
			$_al_DisableFieldNos{1}:=Field:C253(->[CONTACTS:1]Company_Code:1)
			$_al_DisableFieldNos{2}:=Field:C253(->[CONTACTS:1]Exported:23)
			$_al_DisableFieldNos{3}:=Field:C253(->[CONTACTS:1]x_ID:33)
			$_al_DisableFieldNos{4}:=Field:C253(->[CONTACTS:1]CUS_LabelPrint:34)
			For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[CONTACTS:1])))
				$_l_TableNumber:=Table:C252(->[CONTACTS:1])
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				If (Not:C34($_bo_FieldInvisible)) & ($_l_FieldType#7) & ($_l_FieldType#3) & ($_l_FieldType#30)
					$_l_FieldPosition:=Find in array:C230($_al_DisableFieldNos; $_l_FieldNumberIndex)
					If ($_l_FieldPosition<0)
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
			ARRAY LONGINT:C221($_al_DisableFieldNos; 4)
			$_al_DisableFieldNos{1}:=Field:C253(->[PRODUCTS:9]Exported:24)
			$_al_DisableFieldNos{2}:=Field:C253(->[PRODUCTS:9]X_ID:43)
			$_al_DisableFieldNos{3}:=Field:C253(->[PRODUCTS:9]Default_Price_Currency_ID:45)
			
			
			$_l_FieldCount:=Get last field number:C255(Table:C252(->[PRODUCTS:9]))+(Get last field number:C255(Table:C252(->[CONTACTS:1])))
			ARRAY LONGINT:C221(BK_al_DestinationTable; $_l_FieldCount)
			ARRAY LONGINT:C221(BK_al_DestinationField; $_l_FieldCount)
			ARRAY TEXT:C222(BK_at_DestinationFieldName; $_l_FieldCount)
			$_l_Element:=0
			
			For ($_l_FieldNumberIndex; 1; Get last field number:C255(Table:C252(->[PRODUCTS:9])))
				$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				If (Not:C34($_bo_FieldInvisible)) & ($_l_FieldType#7) & ($_l_FieldType#3) & ($_l_FieldType#30)
					$_l_FieldPosition:=Find in array:C230($_al_DisableFieldNos; $_l_FieldNumberIndex)
					If ($_l_FieldPosition<0)
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
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Variable2"; $_t_oldMethodName)
