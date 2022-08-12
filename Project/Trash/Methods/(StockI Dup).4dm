//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI Dup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	C_BOOLEAN:C305($_bo_Allocate; STK_bo_LineTrackerActive)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_ModifiedLineRow; $_l_NumberofDuplicates; $_l_ScreenCentreVertical; $_l_SerialOffset; $WIN_l_CurrentWinRef; rOrd; STOCK_l_Context; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; $_t_SerialNumber; vConfirm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI Dup")
//StockI Dup
If (STOCK_l_Context>=0)  // added NG may 2004 to
	//prevent copying if this is an stock movement being copyied from
	
	Menu_Record("StockI Dup"; "Duplicate Item")
	If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	End if 
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
		If ([PRODUCTS:9]Product_Code:1#[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		End if 
		$_l_NumberofDuplicates:=1
		$_l_SerialOffset:=1
		rOrd:=0
		If (([PRODUCTS:9]Serial_Numbered:17) & (DB_GetModuleSettingByNUM(Module_SerialNos)>1))
			vConfirm:="("+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+")"
			$_l_ScreenCentreVertical:=Screen width:C187/2
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-161; 110; $_l_ScreenCentreVertical+161; 214)
			DIALOG:C40([STOCK_MOVEMENTS:40]; "dDuplicate")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$WIN_l_CurrentWinRef
		Else 
			$_l_NumberofDuplicates:=Num:C11(Gen_Request("Duplicate "+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+" x times:"; "1"))
		End if 
		If ((OK=1) & ($_l_NumberofDuplicates>0))
			If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8>0)
				Gen_Confirm("Do you want the duplicates to be pre-allocated?"; "Allocated"; "Unalloc")
				If (OK=1)
					$_bo_Allocate:=True:C214
				Else 
					$_bo_Allocate:=False:C215
				End if 
			Else 
				$_bo_Allocate:=False:C215
			End if 
			If ($_l_NumberofDuplicates>10)
				Are_You_Sure
			End if 
			If (OK=1)
				ONE RECORD SELECT:C189([STOCK_MOVEMENT_ITEMS:27])
				$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
				If (rOrd=1)
					[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_t_SerialNumber+String:C10($_l_SerialOffset)
					$_l_SerialOffset:=$_l_SerialOffset+1
					StockI_SubLPSN(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; ->[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
						[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					End if 
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
				End if 
				$_l_Index:=1
				ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
				
				While (($_l_Index<=$_l_NumberofDuplicates) & (([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4#"") | (rOrd=0)))
					STK_ItemDuplicate
					//APPEND TO ARRAY($_al_ForceRecalculation;[STOCK_MOVEMENT_ITEMS]x_ID)
					
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					
					If (rOrd=1)
						[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_t_SerialNumber+String:C10($_l_SerialOffset)
						$_l_SerialOffset:=$_l_SerialOffset+1
					End if 
					If ($_bo_Allocate=False:C215)
						[STOCK_MOVEMENT_ITEMS:27]Order_Code:3:=""
						[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
						[STOCK_MOVEMENT_ITEMS:27]Company_To:2:=""
					End if 
					StockI_SubLPSN(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; ->[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					If (STK_bo_LineTrackerActive)
						$_l_ModifiedLineRow:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						If ($_l_ModifiedLineRow<0)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						End if 
					End if 
					
					AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					$_l_Index:=$_l_Index+1
				End while 
				If (False:C215)
					If (Size of array:C274($_al_ForceRecalculation)>0)
						For ($_l_Index; 1; Size of array:C274($_al_ForceRecalculation))
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ForceRecalculation{$_l_Index})
							STK_UpdateCalledOffQuantity
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						End for 
					End if 
				End if 
				
			End if 
		End if 
		RELATE MANY:C262([STOCK_MOVEMENTS:40]Movement_Code:1)
		REDRAW:C174([STOCK_MOVEMENTS:40])
		vTot:=1
	Else 
		Gen_Alert("Please select an Item with a Product Code"; "Try again")
	End if 
End if 
ERR_MethodTrackerReturn("StockI Dup"; $_t_oldMethodName)