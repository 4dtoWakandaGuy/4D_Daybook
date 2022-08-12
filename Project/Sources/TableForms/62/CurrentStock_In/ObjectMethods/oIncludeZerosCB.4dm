If (False:C215)
	//object Name: [CURRENT_STOCK]CurrentStock_In.oIncludeZeros
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/12/2012 23:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(STK_ad_MovementDate;0)
	//ARRAY LONGINT(STK_al_SIUIDS;0)
	//ARRAY LONGINT(STK_ar_SIOrderITem;0)
	//ARRAY REAL(STK_ar_SICostPrice;0)
	//ARRAY REAL(STK_ar_SIQuantiy;0)
	//ARRAY REAL(STK_ar_SIRemaining;0)
	//ARRAY TEXT(STK_at_SIMovement;0)
	//ARRAY TEXT(STK_at_SITypes;0)
	C_BOOLEAN:C305(STK_bo_ShowAll)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].CurrentStock_In.oIncludeZeros"; Form event code:C388)

If ([CURRENT_STOCK:62]X_ID:13>0)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=[CURRENT_STOCK:62]X_ID:13)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ignore_for_Current_Stock:38=False:C215)
	MESSAGES OFF:C175
	APPLY TO SELECTION:C70([STOCK_MOVEMENT_ITEMS:27]; STK_UpdateCalledOffQuantity)
	MESSAGES ON:C181
	
	If (Not:C34(STK_bo_ShowAll))
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#0)
	End if 
Else 
	REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
End if 
ARRAY LONGINT:C221(STK_al_SIUIDS; 0)
ARRAY TEXT:C222(STK_at_SIMovement; 0)
ARRAY TEXT:C222(STK_at_SITypes; 0)
ARRAY REAL:C219(STK_ar_SIRemaining; 0)
ARRAY REAL:C219(STK_ar_SIQuantiy; 0)
ARRAY REAL:C219(STK_ar_SICostPrice; 0)
ARRAY LONGINT:C221(STK_ar_SIOrderITem; 0)
ARRAY DATE:C224(STK_ad_MovementDate; 0)
SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_SIUIDS; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; STK_at_SIMovement; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_SITypes; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37; STK_ar_SIRemaining; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; STK_ar_SICostPrice; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_ar_SIOrderITem; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; STK_ar_SIQuantiy; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; STK_ad_MovementDate)
SORT ARRAY:C229(STK_ar_SIRemaining; STK_ar_SIQuantiy; STK_ar_SIOrderITem; STK_ar_SICostPrice; STK_at_SITypes; STK_al_SIUIDS; STK_ad_MovementDate; STK_at_SIMovement)
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].CurrentStock_In.oIncludeZeros"; $_t_oldMethodName)
