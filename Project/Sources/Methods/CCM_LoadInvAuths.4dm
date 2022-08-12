//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_LoadInvAuths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/02/2010 23:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_lb_LBAuths;0)
	//ARRAY DATE(INV_ad_CCAuthDate;0)
	//ARRAY LONGINT(INV_al_AuthRecord;0)
	//ARRAY LONGINT(INV_al_AuthStatus;0)
	//ARRAY LONGINT(INV_al_CCID;0)
	//ARRAY LONGINT(INV_al_StatusIDs;0)
	ARRAY REAL:C219($_ar_InvRefundAmounts; 0)
	//ARRAY REAL(INV_ar_CCAmount;0)
	//ARRAY TEXT(INV_at_AuthStatus;0)
	//ARRAY TEXT(INV_at_CCAuth;0)
	//ARRAY TEXT(INV_at_CCCardNumber;0)
	//ARRAY TEXT(INV_at_InvoiceCode;0)
	//ARRAY TEXT(INV_at_StatusNames;0)
	C_BOOLEAN:C305($_bo_ShowListbox; $2)
	C_LONGINT:C283($_l_AuthsIndex; INV_l_OrderID; INVa_l_BUT1; INVa_l_BUT10; INVa_l_BUT2; INVa_l_BUT3; INVa_l_BUT4; INVa_l_BUT5; INVa_l_BUT6; INVa_l_BUT7; INVa_l_BUT8)
	C_LONGINT:C283(INVa_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; $1; INV_t_OrderCode; oAuths_COL1; oAuths_COL10; oAuths_COL2; oAuths_COL3; oAuths_COL4; oAuths_COL5; oAuths_COL6; oAuths_COL7)
	C_TEXT:C284(oAuths_COL8; oAuths_COL9; oAuths_HED1; oAuths_HED10; oAuths_HED2; oAuths_HED3; oAuths_HED4; oAuths_HED5; oAuths_HED6; oAuths_HED7; oAuths_HED8)
	C_TEXT:C284(oAuths_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_LoadInvAuths")
If (Count parameters:C259>=2)
	$_bo_ShowListbox:=$2
Else 
	$_bo_ShowListbox:=False:C215
End if 
//INV_t_OrderCode if that is populate we are coming from an order
//CCM_LoadOrderAuths
//This method will load authorizations relating to  an order
ARRAY TEXT:C222(INV_at_CCCardNumber; 0)
ARRAY TEXT:C222(INV_at_CCAuth; 0)
ARRAY DATE:C224(INV_ad_CCAuthDate; 0)
ARRAY REAL:C219(INV_ar_CCAmount; 0)
ARRAY LONGINT:C221(INV_al_CCID; 0)
ARRAY LONGINT:C221(INV_al_AuthStatus; 0)
ARRAY TEXT:C222(INV_at_AuthStatus; 0)
ARRAY TEXT:C222(INV_at_InvoiceCode; 0)
ARRAY LONGINT:C221(INV_al_AuthRecord; 0)
ARRAY LONGINT:C221(INV_al_StatusIDs; 7)
ARRAY TEXT:C222(INV_at_StatusNames; 7)
INV_al_StatusIDs{1}:=1
INV_al_StatusIDs{2}:=2
INV_al_StatusIDs{3}:=3
INV_al_StatusIDs{4}:=4
INV_al_StatusIDs{5}:=5
INV_al_StatusIDs{6}:=6
INV_al_StatusIDs{7}:=7
INV_at_StatusNames{1}:="Awaiting Charging"  // actually in here this would not be!
INV_at_StatusNames{2}:="Cancelled"
If ([INVOICES:39]Total_Invoiced:5>=0)
	INV_at_StatusNames{3}:="Money Received"
Else 
	INV_at_StatusNames{3}:="Money Paid"  // a credit note
End if 
INV_at_StatusNames{4}:="Refunded"
INV_at_StatusNames{5}:="AVS Failure"
INV_at_StatusNames{6}:="CVV2 Failure"
INV_at_StatusNames{7}:="Card Declined"
//add more to this!
If (Count parameters:C259>=1)
	If ($1#"")
		If (INV_l_OrderID>0)
			QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]xinvoiceCode:9=$1; *)
			QUERY:C277([CC_OrderAuths:133];  | ; [CC_OrderAuths:133]xDepositCode:8=$1; *)
			
			QUERY:C277([CC_OrderAuths:133];  | ; [CC_OrderAuths:133]Order_ID:2=INV_l_OrderID)
			
		Else 
			QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]xinvoiceCode:9=$1; *)
			QUERY:C277([CC_OrderAuths:133];  | ; [CC_OrderAuths:133]xDepositCode:8=$1)
			
		End if 
		ARRAY REAL:C219($_ar_InvRefundAmounts; 0)
		SELECTION TO ARRAY:C260([CC_OrderAuths:133]AuthorizationCode:6; INV_at_CCAuth; [CC_OrderAuths:133]AuthorizationDate:4; INV_ad_CCAuthDate; [CC_OrderAuths:133]AuthorizationAmount:5; INV_ar_CCAmount; [CC_OrderAuths:133]CC_RecordID:3; INV_al_CCID; [CC_OrderAuths:133]xAuthStatus:7; INV_al_AuthStatus; [CC_OrderAuths:133]xinvoiceCode:9; INV_at_InvoiceCode; [CC_OrderAuths:133]x_ID:1; INV_al_AuthRecord; [CC_OrderAuths:133]RefundedAmount:11; $_ar_InvRefundAmounts)
		ARRAY TEXT:C222(INV_at_AuthStatus; Size of array:C274(INV_at_CCAuth))
		ARRAY TEXT:C222(INV_at_CCCardNumber; Size of array:C274(INV_at_CCAuth))
		INV_at_CCAuth:=0
		For ($_l_AuthsIndex; 1; Size of array:C274(INV_at_AuthStatus))
			If (INV_al_CCID{$_l_AuthsIndex}>0)
				QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=INV_al_CCID{$_l_AuthsIndex})
				INV_at_CCCardNumber{$_l_AuthsIndex}:=""
				INV_at_CCCardNumber{$_l_AuthsIndex}:=CCM_LoadCardNumber
			End if 
			If (INV_al_AuthStatus{$_l_AuthsIndex}>0)
				INV_at_AuthStatus{$_l_AuthsIndex}:=INV_at_StatusNames{Find in array:C230(INV_al_StatusIDs; INV_al_AuthStatus{$_l_AuthsIndex})}
				If (INV_al_AuthStatus{$_l_AuthsIndex}=4)
					If ($_ar_InvRefundAmounts{$_l_AuthsIndex}>0)
						INV_at_AuthStatus{$_l_AuthsIndex}:="Partial Refund"+String:C10($_ar_InvRefundAmounts{$_l_AuthsIndex})
					End if 
				End if 
			Else 
				Case of 
					: (INV_at_InvoiceCode{$_l_AuthsIndex}="")
						//Assigned to an invoice
						INV_at_AuthStatus{$_l_AuthsIndex}:="Authorised awaiting payment"  //has to be assigned to this invoice!
					: (INV_ad_CCAuthDate{$_l_AuthsIndex}<=(Current date:C33-30))
						INV_at_AuthStatus{$_l_AuthsIndex}:="Out of Date"
				End case 
			End if 
			
		End for 
		
	End if 
	
	If ($_bo_ShowListbox)
		
		LB_SetupListbox(->INV_lb_LBAuths; "oAuths"; "INVa_L"; 1; ->INV_at_CCAuth; ->INV_at_CCCardNumber; ->INV_ad_CCAuthDate; ->INV_ar_CCAmount; ->INV_at_AuthStatus; ->INV_al_AuthStatus; ->INV_al_CCID; ->INV_at_InvoiceCode; ->INV_al_AuthRecord)
		OBJECT SET ENTERABLE:C238(INV_at_CCAuth; False:C215)
		OBJECT SET ENTERABLE:C238(INV_at_CCCardNumber; False:C215)
		OBJECT SET ENTERABLE:C238(INV_ad_CCAuthDate; False:C215)
		OBJECT SET ENTERABLE:C238(INV_ar_CCAmount; False:C215)
		OBJECT SET ENTERABLE:C238(INV_al_AuthStatus; False:C215)
		LB_SetColumnHeaders(->INV_lb_LBAuths; "INVa_L"; 1; "Auth Code"; "Card"; "Date"; "Amount"; "Status"; "Status Number"; ""; ""; "")
		//LB_SetColumnWidths (->INV_lb_LBAuths;"INV_l_HED";1;101;80;80)
		LB_SetColumnWidths(->INV_lb_LBAuths; "oAuths"; 1; 66; 135; 73; 66; 176; 0; 0; 0; 0)
		LB_SetScroll(->INV_lb_LBAuths; -3; -2)
		LB_SetFormat(->INV_lb_LBAuths; 4; "|accounts"; 2)
		LB_StyleSettings(->INV_lb_LBAuths; "Black"; 9; "oAuths"; ->[INVOICES:39])
	End if 
End if 
ERR_MethodTrackerReturn("CCM_LoadInvAuths"; $_t_oldMethodName)