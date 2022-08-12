If (False:C215)
	//object Name: [DIARY]Diary_SubsEditor.oFilterBySubs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/05/2011 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	//ARRAY TEXT(SUBS_at_FIlterByProductCode;0)
	//ARRAY TEXT(SUBS_at_FIlterByProductName;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_SUBSEditor.oFilterBySubs"; Form event code:C388)
If (SUBS_at_FIlterByProductName>0)
	USE SET:C118("BOOKING")
	QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=SUBS_at_FIlterByProductCode{SUBS_at_FIlterByProductName})
	SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_OrderItemNumbers)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
	
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_SUBSEditor.oFilterBySubs"; $_t_oldMethodName)
