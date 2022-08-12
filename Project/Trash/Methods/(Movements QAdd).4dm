//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements QAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/05/2012 09:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; STK_bo_LineTrackerActive)
	C_LONGINT:C283($_l_Index; $_l_ModifiedLinePosition; $_l_SIzeofArray; STOCK_l_Context)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements QAdd")
If (STOCK_l_Context>=0)  // added NG may 2004 to
	//prevent copying if this is an stock movement being copyied from
	//Movements QuickAdd
	//NG April 2004 removed reference to ◊screen
	
	QuickAdd_Start
	
	If (OK=1)
		$_l_SIzeofArray:=Size of array:C274(ORD_AT_QuickAddProdCode)
		For ($_l_Index; 1; $_l_SIzeofArray)
			If (((ORD_AT_QuickAddProdCode{$_l_Index}#"") | (ORD_AT_QuickAddProdName{$_l_Index}#"")) & (ORD_ar_QuickAddQuantity{$_l_Index}#0))
				CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
				StockI_SubLPB
				[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=ORD_ar_QuickAddQuantity{$_l_Index}
				[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=ORD_AT_QuickAddProdCode{$_l_Index}
				RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
				StockI_SubLPPC
				[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=ORD_AT_QuickAddSerialNo{$_l_Index}
				StockI_SubLPSN(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; ->[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
				[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
				If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				End if 
				If (STK_bo_LineTrackerActive)
					$_l_ModifiedLinePosition:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					If ($_l_ModifiedLinePosition<0)
						APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					End if 
				End if 
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			End if 
		End for 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		DB_bo_RecordModified:=True:C214
	End if 
	QuickAdd_Arr(0)
End if 
ERR_MethodTrackerReturn("Movements QAdd"; $_t_oldMethodName)