//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Layouts InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 20:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>LB_al_FormTables;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY LONGINT(LL_al_FieldAccess;0)
	//ARRAY LONGINT(LL_al_FieldNos;0)
	//ARRAY LONGINT(LL_al_FieldNums;0)
	//ARRAY LONGINT(LL_al_FIeldNums2;0)
	//ARRAY LONGINT(LL_al_TableAccess;0)
	//ARRAY LONGINT(LL_al_TableIDs;0)
	//ARRAY TEXT(<>DB_at_LBViews;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>DB_at_TableNames2;0)
	//ARRAY TEXT(<>LL_at_FieldNames;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames2;0)
	//ARRAY TEXT(AL_at_FormulaType;0)
	//ARRAY TEXT(AL_at_SubFieldNames;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	//ARRAY TEXT(LL_at_FieldNames;0)
	//ARRAY TEXT(LL_at_TableName2;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(LL_at_TableNames2;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305($_bo_IsFIeld; AL_bo_TableIsSubtable)
	C_LONGINT:C283($_l_Clash; $_l_CurrentDefsFormID; $_l_FieldNumberPosition; $_l_FormTableNumber; $_l_Index; $_l_SequenceNumber; $_l_TableNumberPosition; AL_l_Subfield; vAdd)
	C_TEXT:C284($_t_DefinitionsReference; $_t_FormName; $_t_oldMethodName; AL_S255_SUBTABLE; AL_T_Formula; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; LL_t_FieldName; LL_t_FieldName2; LL_t_TableName)
	C_TEXT:C284(LL_t_TableName2; vButtDisTxt; vTitle10; vTitle11; vTitle12; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Layouts InLPB")

If (vAdd=1) & ([LIST_LAYOUTS:96]Layout_Reference:1="")
	[LIST_LAYOUTS:96]Layout_Reference:1:=DB_t_CurrentFormUsage2+DB_t_CurrentFormUsage3
	[LIST_LAYOUTS:96]Table_Number:2:=Num:C11(Substring:C12(DB_t_CurrentFormUsage2; 1; 3))
	If (AL_l_Subfield=0)
		[LIST_LAYOUTS:96]Field_Number:3:=1
	Else 
		[LIST_LAYOUTS:96]Field_Number:3:=AL_l_Subfield
	End if 
	
	[LIST_LAYOUTS:96]Enterable:8:=True:C214
	If (SVS_at_PreviewNote=1)
		[LIST_LAYOUTS:96]Font_Size:11:=9
	Else 
		[LIST_LAYOUTS:96]Font_Size:11:=10
	End if 
	[LIST_LAYOUTS:96]Width:5:=70
End if 
$_l_SequenceNumber:=1
$_t_DefinitionsReference:=[LIST_LAYOUTS:96]Layout_Reference:1
If ([LIST_LAYOUTS:96]Order:7=0)
	Repeat 
		SET QUERY DESTINATION:C396(3; $_l_Clash)
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_DefinitionsReference; *)
		QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Order:7=$_l_SequenceNumber)
		If ($_l_Clash>0)
			$_l_SequenceNumber:=$_l_SequenceNumber+1
		End if 
		
		SET QUERY DESTINATION:C396(0)
	Until ($_l_Clash=0)
	[LIST_LAYOUTS:96]Order:7:=$_l_SequenceNumber
End if 

If ([LIST_LAYOUTS:96]Table_Number:2#0)
	LL_LoadFieldNamePrefs
	$_l_TableNumberPosition:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]Table_Number:2)
	
	ARRAY TEXT:C222(LL_at_TableNames2; 0)
	LL_t_TableName2:=""
	LL_t_FieldName2:=""
	For ($_l_Index; 1; Size of array:C274(LL_al_TableIDs))
		If (User in group:C338(Current user:C182; "Designer"))
			APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_Index})
			
		Else 
			If (LL_al_TableAccess{$_l_Index}>0)
				APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_Index})
				
			End if 
		End if 
	End for 
	LL_t_TableName:=LL_at_TableNames{$_l_TableNumberPosition}
Else 
	$_l_TableNumberPosition:=0
	LL_t_TableName:=""
End if 

If ($_l_TableNumberPosition>0)
	ARRAY LONGINT:C221(LL_al_FieldNums; 0)
	ARRAY LONGINT:C221(LL_al_FIeldNums2; 0)
	ARRAY TEXT:C222(LL_at_FieldName; 0)
	ARRAY TEXT:C222(LL_at_FieldName2; 0)
	For ($_l_Index; 1; Size of array:C274(LL_al_FieldNos{$_l_TableNumberPosition}))
		If (User in group:C338(Current user:C182; "Designer"))
			APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberPosition}{$_l_Index})
			APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberPosition}{$_l_Index})
			APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberPosition}{$_l_Index})
			APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberPosition}{$_l_Index})
			
		Else 
			If (LL_al_FieldAccess{$_l_TableNumberPosition}{$_l_Index}>0)
				APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberPosition}{$_l_Index})
				APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberPosition}{$_l_Index})
				APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberPosition}{$_l_Index})
				APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberPosition}{$_l_Index})
				
			End if 
		End if 
		
	End for 
	$_l_FieldNumberPosition:=Find in array:C230(LL_al_FieldNos{$_l_TableNumberPosition}; [LIST_LAYOUTS:96]Field_Number:3)
	If ($_l_FieldNumberPosition>0)
		LL_t_FieldName:=LL_at_FieldNames{$_l_TableNumberPosition}{$_l_FieldNumberPosition}
	Else 
		LL_t_FieldName:="???"
	End if 
End if 


If (False:C215)
	$_l_TableNumberPosition:=Find in array:C230(<>DB_al_TableNums; [LIST_LAYOUTS:96]Table_Number:2)
	
	<>DB_at_TableNames:=$_l_TableNumberPosition
	ARRAY TEXT:C222(LL_at_FieldName; 0)
	ARRAY TEXT:C222(LL_at_FieldName2; 0)
	ARRAY TEXT:C222(LL_at_TableName2; 0)
	COPY ARRAY:C226(<>SYS_at_2DFieldNames{$_l_TableNumberPosition}; <>SYS_at_CurrentTableFieldNames)
	//COPY ARRAY(◊Fields{$_l_TableNumberPosition};LL_at_FieldNames)
	COPY ARRAY:C226(<>SYS_at_2DFieldNames{$_l_TableNumberPosition}; <>SYS_at_CurrentTableFieldNames2)
	COPY ARRAY:C226(<>LL_at_FieldNames; LL_at_FieldName2)
	COPY ARRAY:C226(<>DB_at_TableNames; <>DB_at_TableNames2)
	//COPY ARRAY(◊Files;LL_at_TableNames2)
	<>DB_at_TableNames2:=0
	$_l_FieldNumberPosition:=Find in array:C230(<>SYS_al_2DFieldNumbers{$_l_TableNumberPosition}; [LIST_LAYOUTS:96]Field_Number:3)
	If ($_l_FieldNumberPosition>0)
		<>SYS_at_CurrentTableFieldNames:=$_l_FieldNumberPosition
	Else 
		
		<>SYS_at_CurrentTableFieldNames:=0
	End if 
End if 
vTitle10:=Substring:C12([LIST_LAYOUTS:96]Layout_Reference:1; 1; 5)
$_l_FormTableNumber:=Num:C11(Substring:C12(vTitle10; 1; 3))
$_l_CurrentDefsFormID:=Num:C11(Substring:C12(vTitle10; 4; 2))
$_t_FormName:=LBI_GetLayoutName([LIST_LAYOUTS:96]Layout_Reference:1)
If ($_t_FormName="")
	LB_CheckLayouts($_l_FormTableNumber)
	$_l_TableNumberPosition:=Find in array:C230(<>LB_al_FormTables; $_l_FormTableNumber)
	If ($_l_TableNumberPosition>0)
		If ($_l_CurrentDefsFormID<=Size of array:C274(<>DB_at_LBViews{$_l_TableNumberPosition}))
			vTitle11:=<>DB_at_LBViews{$_l_TableNumberPosition}{$_l_CurrentDefsFormID}
		Else 
			vTitle11:=""
		End if 
	Else 
		vTitle11:=""
	End if 
Else 
	VTitle11:=$_t_FormName
End if 
AL_bo_TableIsSubtable:=False:C215
vTitle13:=Layouts_Type(->AL_bo_TableIsSubtable)
ARRAY TEXT:C222(AL_at_FormulaType; 0)
OBJECT SET VISIBLE:C603(AL_at_FormulaType; False:C215)
OBJECT SET VISIBLE:C603(AL_S255_SUBTABLE; False:C215)
OBJECT SET VISIBLE:C603(*; "osubfieldLabel"; False:C215)
OBJECT SET VISIBLE:C603(*; "osuboptionLabel"; False:C215)
ARRAY TEXT:C222(AL_at_SubFieldNames; 0)
OBJECT SET VISIBLE:C603(AL_at_SubFIeldNames; False:C215)
OBJECT SET VISIBLE:C603(AL_T_Formula; True:C214)
AL_T_Formula:=[LIST_LAYOUTS:96]Formula:9
OBJECT SET ENTERABLE:C238(AL_T_Formula; True:C214)
OBJECT SET VISIBLE:C603(LL_t_TableName2; False:C215)
OBJECT SET VISIBLE:C603(LL_t_FieldName2; False:C215)
OBJECT SET VISIBLE:C603(LL_at_TableNames2; False:C215)
OBJECT SET VISIBLE:C603(LL_at_FieldName2; False:C215)
//SET VISIBLE(◊Files2;False)
//SET VISIBLE(◊FieldL2;False)
OBJECT SET VISIBLE:C603(*; "orelfieldLabel"; False:C215)
OBJECT SET VISIBLE:C603(*; "oReltableLabel"; False:C215)
OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Field:16; False:C215)
OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Table:15; False:C215)
If (AL_bo_TableIsSubtable) & (False:C215)
	ARRAY TEXT:C222(AL_at_FormulaType; 2)
	OBJECT SET VISIBLE:C603(AL_at_FormulaType; True:C214)
	//SET VISIBLE(◊Files;False)
	OBJECT SET VISIBLE:C603(LL_t_TableName; False:C215)
	OBJECT SET VISIBLE:C603(LL_at_TableNames; False:C215)
	
	//SET VISIBLE(◊FieldL;False)
	OBJECT SET VISIBLE:C603(LL_t_FieldName; False:C215)
	OBJECT SET VISIBLE:C603(LL_at_FieldName; False:C215)
	
	
	OBJECT SET VISIBLE:C603(*; "oTableLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oFieldLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "osubfieldLabel"; True:C214)
	OBJECT SET VISIBLE:C603(*; "osuboptionLabel"; True:C214)
	OBJECT SET VISIBLE:C603(AL_S255_SUBTABLE; True:C214)
	OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]Table_Number:2; False:C215)
	OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]Field_Number:3; False:C215)
	
	AL_S255_SUBTABLE:=Table name:C256([LIST_LAYOUTS:96]Table_Number:2)+" "+Field name:C257([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)
	AL_at_FormulaType{1}:="Field"
	AL_at_FormulaType{2}:="Formula"
	
	//this is a subtable
	If (Length:C16([LIST_LAYOUTS:96]Formula:9)>1)
		$_bo_IsFIeld:=Not:C34([LIST_LAYOUTS:96]Formula:9[[1]]="•")
	Else 
		$_bo_IsFIeld:=True:C214
	End if 
	If ($_bo_IsFIeld)
		//formula contains a field
		Case of 
			: ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_ORDERS:57]))
				AL_at_FormulaType:=1
				ARRAY TEXT:C222(AL_at_SubFieldNames; 15)
				OBJECT SET VISIBLE:C603(AL_at_SubFieldNames; True:C214)
				OBJECT SET ENTERABLE:C238(AL_T_Formula; False:C215)
				AL_at_SubFieldNames{1}:="Cost Amount"
				AL_at_SubFieldNames{2}:="Cost Price"
				AL_at_SubFieldNames{3}:="Description"
				AL_at_SubFieldNames{4}:="Discount"
				AL_at_SubFieldNames{5}:="Item Number"
				AL_at_SubFieldNames{6}:="Original Cost"
				AL_at_SubFieldNames{7}:="Price Code"
				AL_at_SubFieldNames{8}:="Price Per"
				AL_at_SubFieldNames{9}:="Print Desc"
				AL_at_SubFieldNames{10}:="Product Code"
				AL_at_SubFieldNames{11}:="Product Name"
				AL_at_SubFieldNames{12}:="Purch Inv_No"
				AL_at_SubFieldNames{13}:="Quantity"
				AL_at_SubFieldNames{14}:="Tax Code"
				AL_at_SubFieldNames{15}:="InternalComments"
			: ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PURCHASE_INVOICES:37]))
				//AL_at_FormulaType:=1
				//ARRAY STRING(55;AL_at_SubFieldNames;15)
				//SET VISIBLE(AL_at_SubFieldNames;True)
				//SET ENTERABLE(AL_T_Formula;False)
				//AL_at_SubFieldNames{1}:="Product Code"
				//AL_at_SubFieldNames{2}:="Quantity"
				//AL_at_SubFieldNames{3}:="Cost Price"
				//AL_at_SubFieldNames{4}:="Cost Amount"
				//AL_at_SubFieldNames{5}:="Tax Code"
				//AL_at_SubFieldNames{6}:="Tax Amount"
				//AL_at_SubFieldNames{7}:="Total Amount"
				//AL_at_SubFieldNames{8}:="Purchase Acc"
				//AL_at_SubFieldNames{9}:="Analysis Code"
				//AL_at_SubFieldNames{10}:="Price Per"
				//AL_at_SubFieldNames{11}:="Our Order No"
				//AL_at_SubFieldNames{12}:="Item Number"
				//AL_at_SubFieldNames{13}:="Description"
				//AL_at_SubFieldNames{14}:="Stock Code"
				//AL_at_SubFieldNames{15}:="Sales Price"
			: ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[PRODUCTS:9]))
				//AL_at_FormulaType:=1
				//ARRAY STRING(55;AL_at_SubFieldNames;6)
				//SET VISIBLE(AL_at_SubFieldNames;True)
				//SET ENTERABLE(AL_T_Formula;False)
				//AL_at_SubFieldNames{1}:="Company Code"
				//AL_at_SubFieldNames{2}:="Cost Price"
				//AL_at_SubFieldNames{3}:="Margin"
				//AL_at_SubFieldNames{4}:="SuppProdCode"
				//AL_at_SubFieldNames{5}:="Standard Cost"
				//AL_at_SubFieldNames{6}:="Lead Days"
				
			: ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[SERVICE_CALLS:20])) & (False:C215)
				//AL_at_FormulaType:=1
				//ARRAY STRING(55;AL_at_SubFieldNames;5)
				//SET VISIBLE(AL_at_SubFieldNames;True)
				//SET ENTERABLE(AL_T_Formula;False)
				//AL_at_SubFieldNames{1}:="Product Code"
				//AL_at_SubFieldNames{2}:="Serial No"
				//AL_at_SubFieldNames{3}:="Contract Code"
				//AL_at_SubFieldNames{4}:="System"
				//AL_at_SubFieldNames{5}:="Product Name"
			: ([LIST_LAYOUTS:96]Table_Number:2=Table:C252(->[INVOICES:39])) & (False:C215)
				//AL_at_FormulaType:=1
				//ARRAY STRING(55;AL_at_SubFieldNames;16)
				//SET VISIBLE(AL_at_SubFieldNames;True)
				//SET ENTERABLE(AL_T_Formula;False)
				//AL_at_SubFieldNames{1}:="Product Code"
				//AL_at_SubFieldNames{2}:="Product Name"
				//AL_at_SubFieldNames{3}:="Quantity"
				//AL_at_SubFieldNames{4}:="Sales Price"
				//AL_at_SubFieldNames{5}:="Amount"
				//AL_at_SubFieldNames{6}:="Tax Code"
				//AL_at_SubFieldNames{7}:="Tax Amount"
				//AL_at_SubFieldNames{8}:="Total Amount"
				//AL_at_SubFieldNames{9}:="Sales Acc"
				//AL_at_SubFieldNames{0}:="Analysis Code"
				//AL_at_SubFieldNames{11}:="Order Code"
				//AL_at_SubFieldNames{12}:="Item Number"
				//AL_at_SubFieldNames{13}:="Description"
				//AL_at_SubFieldNames{14}:="Print Desc"
				//AL_at_SubFieldNames{15}:="Cost Amount"
				//AL_at_SubFieldNames{16}:="Price Per"
				
				
		End case 
	Else 
		//formula is not a field
		//strip the " " off
		AL_T_Formula:=Substring:C12(AL_T_Formula; 2; Length:C16(AL_T_Formula))
		AL_at_FormulaType:=2
		OBJECT SET ENTERABLE:C238(AL_T_Formula; True:C214)
		vTitle13:="Subtable Formula "+"Enter formula in formula field"
		$_l_TableNumberPosition:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]X_Related_Table:15)
		If ($_l_TableNumberPosition>0)
			LL_t_TableName2:=LL_at_TableNames{$_l_TableNumberPosition}
			$_l_FieldNumberPosition:=Find in array:C230(LL_al_FieldNos{$_l_TableNumberPosition}; [LIST_LAYOUTS:96]X_Related_Field:16)
			If ($_l_FieldNumberPosition>0)
				LL_t_FieldName2:=LL_at_FieldNames{$_l_TableNumberPosition}{$_l_FieldNumberPosition}
			Else 
				LL_t_FieldName2:="???"
			End if 
			
		Else 
			LL_t_TableName2:="???"
			LL_t_FieldName2:="???"
		End if 
		If (False:C215)
			$_l_FieldNumberPosition:=Find in array:C230(<>SYS_al_2DFieldNumbers{$_l_TableNumberPosition}; [LIST_LAYOUTS:96]X_Related_Field:16)
			If ($_l_FieldNumberPosition>0)
				<>SYS_at_CurrentTableFieldNames2:=$_l_FieldNumberPosition
			Else 
				<>SYS_at_CurrentTableFieldNames2:=0
			End if 
		End if 
		OBJECT SET VISIBLE:C603(LL_t_TableName2; True:C214)
		OBJECT SET VISIBLE:C603(LL_t_FieldName2; True:C214)
		OBJECT SET VISIBLE:C603(LL_at_TableNames2; True:C214)
		OBJECT SET VISIBLE:C603(LL_at_FieldName2; True:C214)
		
		//SET VISIBLE(◊Files2;True)
		//SET VISIBLE(◊FieldL2;True)
		OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Field:16; True:C214)
		OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Table:15; True:C214)
		OBJECT SET VISIBLE:C603(*; "orelfieldLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oReltableLabel"; True:C214)
	End if 
	
	
End if 
If ([LIST_LAYOUTS:96]X_associatedArrayName:17#"")
	
	If (Current user:C182#"Designer")
		OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]X_associatedArrayName:17; False:C215)
		
	End if 
	FORM GOTO PAGE:C247(2)
End if 

vTitle12:=Substring:C12([LIST_LAYOUTS:96]Layout_Reference:1; 6; 5)

If ([LIST_LAYOUTS:96]Font_Size:11=9)
	SVS_at_PreviewNote:=1
Else 
	SVS_at_PreviewNote:=2
End if 

SVS_at_PreviewTypeN:=Find in array:C230(SVS_at_PreviewTypeN; [LIST_LAYOUTS:96]Colour:12)
If (SVS_at_PreviewTypeN<1)
	SVS_at_PreviewTypeN:=1
	[LIST_LAYOUTS:96]Colour:12:=SVS_at_PreviewTypeN{SVS_at_PreviewTypeN}
End if 

If (([LIST_LAYOUTS:96]Footer:14=0) | ([LIST_LAYOUTS:96]Footer:14>6))
	[LIST_LAYOUTS:96]Footer:14:=1
End if 
SVS_at_PreviewDateString:=[LIST_LAYOUTS:96]Footer:14

vButtDisTxt:="IMDPMO  FSSSRCADT"
Input_Buttons(->[LIST_LAYOUTS:96]; ->vButtDisTxt)
Macro_AccType("Load "+String:C10(Table:C252(->[LIST_LAYOUTS:96])))
ERR_MethodTrackerReturn("Layouts InLPB"; $_t_oldMethodName)