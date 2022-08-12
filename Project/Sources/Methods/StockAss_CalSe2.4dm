//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_CalSe2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(aApptO;0)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($_l_SelectedRow; $_l_Spaces; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_CalSe2")

If (SRRate{$1}>0)
	$_t_ProductCode:=RemoveLead(SRSerial{$1})
	$_l_Spaces:=Length:C16(SRSerial{$1})-Length:C16($_t_ProductCode)
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=[MOVEMENT_TYPES:60]Stock_Minus:4; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
	StockCurr_ACLSr
	If (Records in selection:C76([CURRENT_STOCK:62])>0)  //see also StockAss_Calc2
		$_l_SelectedRow:=$1
		While (Not:C34(End selection:C36([CURRENT_STOCK:62])))
			$_l_SelectedRow:=$_l_SelectedRow+1
			INSERT IN ARRAY:C227(SRSerial; $_l_SelectedRow; 1)
			INSERT IN ARRAY:C227(SRDesc; $_l_SelectedRow; 1)
			INSERT IN ARRAY:C227(SRQtyT; $_l_SelectedRow; 1)
			INSERT IN ARRAY:C227(SRPrice; $_l_SelectedRow; 1)
			INSERT IN ARRAY:C227(SRRate; $_l_SelectedRow; 1)
			INSERT IN ARRAY:C227(SRAmount; $_l_SelectedRow; 1)
			INSERT IN ARRAY:C227(aApptO; $_l_SelectedRow; 1)
			SRSerial{$_l_SelectedRow}:=Substring:C12(((" "*$_l_Spaces)+"   Qty "+String:C10([CURRENT_STOCK:62]Quantity:4)+" Cost "+String:C10([CURRENT_STOCK:62]Cost_Price:6; "|Accounts")); 1; 41)
			SRDesc{$_l_SelectedRow}:=Substring:C12("   "+[CURRENT_STOCK:62]Serial_Number:2; 1; 65)
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End while 
	End if 
End if 
ERR_MethodTrackerReturn("StockAss_CalSe2"; $_t_oldMethodName)
