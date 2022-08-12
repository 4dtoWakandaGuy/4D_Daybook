If (False:C215)
	//object Name: [USER]STK_ShowCurrentStock.oExit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2011 19:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_CurrentStock;0)
	ARRAY LONGINT:C221($_al_LBDraggedRows; 0)
	ARRAY REAL:C219($_ar_CopyQuantities; 0)
	//ARRAY REAL(STK_ar_CopiedProductQuantites;0)
	ARRAY TEXT:C222($_at_CopyProductCodes; 0)
	//ARRAY TEXT(STK_at_CopiedProductCodes;0)
	//ARRAY TEXT(STK_at_ProductCodes;0)
	C_BOOLEAN:C305(STK_bo_LineSelected)
	C_LONGINT:C283($_l_LineIndex; $_l_LineRow; DB_l_ButtonClickedFunction)
	C_REAL:C285(STK_l_CallBackProcessID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_ShowCurrentStock.oExit"; Form event code:C388)
If (STK_bo_LineSelected)
	
	ARRAY LONGINT:C221($_al_LBDraggedRows; 0)
	ARRAY TEXT:C222($_at_CopyProductCodes; 0)
	ARRAY REAL:C219($_ar_CopyQuantities; 0)
	LB_GetSelect(->STK_lb_CurrentStock; ->$_al_LBDraggedRows)
	If (Size of array:C274($_al_LBDraggedRows)>0)
		Gen_Confirm("Do you wish to copy the highlighted lines to the purchase order first?"; "No"; "Yes")
		If (OK=0)
			For ($_l_LineIndex; 1; Size of array:C274(STK_at_ProductCodes))
				$_l_LineRow:=Find in array:C230($_al_LBDraggedRows; $_l_LineIndex)
				If ($_l_LineRow>0)
					APPEND TO ARRAY:C911($_at_CopyProductCodes; STK_at_ProductCodes{$_l_LineIndex})
					APPEND TO ARRAY:C911($_ar_CopyQuantities; 0)  // so we  can put quantities
					
					
				End if 
				
			End for 
			If (Size of array:C274($_at_CopyProductCodes)>0)
				VARIABLE TO VARIABLE:C635(STK_l_CallBackProcessID; STK_at_CopiedProductCodes; $_at_CopyProductCodes; STK_ar_CopiedProductQuantites; $_ar_CopyQuantities)
				SET PROCESS VARIABLE:C370(STK_l_CallBackProcessID; DB_l_ButtonClickedFunction; DB_GetButtonFunction("CopyProduct"))
				POST OUTSIDE CALL:C329(STK_l_CallBackProcessID)
				
			End if 
		End if 
		OK:=1
	End if 
	STK_bo_LineSelected:=False:C215
	
End if 
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].STK_ShowCurrentStock.oExit"; $_t_oldMethodName)
