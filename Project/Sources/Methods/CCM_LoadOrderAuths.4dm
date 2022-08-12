//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_LoadOrderAuths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_lb_LBAuths;0)
	//ARRAY DATE(ORD_ad_CCAuthDate;0)
	ARRAY LONGINT:C221($_al_TransactionIDS; 0)
	//ARRAY LONGINT(ORD_al_AuthRecord;0)
	//ARRAY LONGINT(ORD_al_AuthStatus;0)
	//ARRAY LONGINT(ORD_al_CCID;0)
	//ARRAY LONGINT(ORD_al_StatusIDs;0)
	ARRAY REAL:C219($_ar_INVRefundAmount; 0)
	//ARRAY REAL(ORD_ar_CCActAmount;0)
	//ARRAY REAL(ORD_ar_CCAmount;0)
	//ARRAY TEXT(ORD_at_AuthStatus;0)
	//ARRAY TEXT(ORD_at_CCAUTH;0)
	//ARRAY TEXT(ORD_at_CCCardNumbers;0)
	//ARRAY TEXT(ORD_at_InvoiceCode;0)
	//ARRAY TEXT(ORD_at_StatusNames;0)
	//ARRAY TEXT(ORD_at_TransactionID;0)
	C_BOOLEAN:C305($_bo_ShowListbox; $2)
	C_LONGINT:C283($_l_AuthsIndex; ORDa_l_BUT1; ORDa_l_BUT2; ORDa_l_BUT3; ORDa_l_BUT4; ORDa_l_BUT5; ORDa_l_BUT6; ORDa_l_BUT7; ORDa_l_BUT8; ORDa_l_BUT9)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; oAuths_COL1; oAuths_COL2; oAuths_COL3; oAuths_COL4; oAuths_COL5; oAuths_COL6; oAuths_COL7; oAuths_COL8; oAuths_COL9; oAuths_HED1)
	C_TEXT:C284(oAuths_HED2; oAuths_HED3; oAuths_HED4; oAuths_HED5; oAuths_HED6; oAuths_HED7; oAuths_HED8; oAuths_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_LoadOrderAuths")
//CCM_LoadOrderAuths
//TRACE
ARRAY TEXT:C222(ORD_at_CCCardNumbers; 0)
//This method will load authorizations relating to  an order
ARRAY TEXT:C222(ORD_at_TransactionID; 0)
ARRAY TEXT:C222(ORD_at_CCAUTH; 0)
ARRAY DATE:C224(ORD_ad_CCAuthDate; 0)
ARRAY REAL:C219(ORD_ar_CCAmount; 0)
ARRAY REAL:C219(ORD_ar_CCActAmount; 0)
ARRAY LONGINT:C221(ORD_al_CCID; 0)
ARRAY LONGINT:C221(ORD_al_AuthStatus; 0)
ARRAY TEXT:C222(ORD_at_AuthStatus; 0)
ARRAY TEXT:C222(ORD_at_InvoiceCode; 0)
ARRAY LONGINT:C221(ORD_al_AuthRecord; 0)
ARRAY LONGINT:C221(ORD_al_StatusIDs; 7)
ARRAY TEXT:C222(ORD_at_StatusNames; 7)
ORD_al_StatusIDs{1}:=1
ORD_al_StatusIDs{2}:=2
ORD_al_StatusIDs{3}:=3
ORD_al_StatusIDs{4}:=4
ORD_al_StatusIDs{5}:=5
ORD_al_StatusIDs{6}:=6
ORD_al_StatusIDs{7}:=7
ORD_at_StatusNames{1}:="Awaiting Invoicing"
ORD_at_StatusNames{2}:="Cancelled"
ORD_at_StatusNames{3}:="Money Received"
ORD_at_StatusNames{4}:="Money Refunded"
ORD_at_StatusNames{5}:="AVS Failure"
ORD_at_StatusNames{6}:="CV2 Failure"
ORD_at_StatusNames{7}:="Card Declined"
//add more to this!
If (Count parameters:C259>=1)
	If ($1>0)
		QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]Order_ID:2=$1)
		SELECTION TO ARRAY:C260([CC_OrderAuths:133]AuthorizationCode:6; ORD_at_CCAUTH; [CC_OrderAuths:133]AuthorizationDate:4; ORD_ad_CCAuthDate; [CC_OrderAuths:133]AuthorizationAmount:5; ORD_ar_CCAmount; [CC_OrderAuths:133]CC_RecordID:3; ORD_al_CCID; [CC_OrderAuths:133]xAuthStatus:7; ORD_al_AuthStatus; [CC_OrderAuths:133]xinvoiceCode:9; ORD_at_InvoiceCode; [CC_OrderAuths:133]x_ID:1; ORD_al_AuthRecord; [CC_OrderAuths:133]RefundedAmount:11; $_ar_INVRefundAmount; [CC_OrderAuths:133]TransactionID:10; $_al_TransactionIDS)
		ARRAY TEXT:C222(ORD_at_TransactionID; Size of array:C274(ORD_at_CCAUTH))
		ARRAY TEXT:C222(ORD_at_AuthStatus; Size of array:C274(ORD_at_CCAUTH))
		ARRAY TEXT:C222(ORD_at_CCCardNumbers; Size of array:C274(ORD_at_CCAUTH))
		ARRAY REAL:C219(ORD_ar_CCActAmount; Size of array:C274(ORD_at_CCAUTH))
		For ($_l_AuthsIndex; 1; Size of array:C274(ORD_at_AuthStatus))
			QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_al_TransactionIDS{$_l_AuthsIndex})
			ORD_at_TransactionID{$_l_AuthsIndex}:=[CCM_PSPTransaction:136]xPSPTransID:16
			If (ORD_al_CCID{$_l_AuthsIndex}>0)
				QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=ORD_al_CCID{$_l_AuthsIndex})
				ORD_at_CCCardNumbers{$_l_AuthsIndex}:=""
				ORD_at_CCCardNumbers{$_l_AuthsIndex}:=CCM_LoadCardNumber
			End if 
			If (ORD_al_AuthStatus{$_l_AuthsIndex}>0)
				ORD_at_AuthStatus{$_l_AuthsIndex}:=ORD_at_StatusNames{Find in array:C230(ORD_al_StatusIDs; ORD_al_AuthStatus{$_l_AuthsIndex})}
				
				Case of 
					: (ORD_al_AuthStatus{$_l_AuthsIndex}=4)
						If ($_ar_INVRefundAmount{$_l_AuthsIndex}>0)
							ORD_at_AuthStatus{$_l_AuthsIndex}:="Partial Refund "+String:C10($_ar_INVRefundAmount{$_l_AuthsIndex})
						End if 
						
					: (ORD_al_AuthStatus{$_l_AuthsIndex}=3)
						//QUERY
						//[CC_OrderAuths]TransactionID
					Else 
						ORD_ar_CCActAmount{$_l_AuthsIndex}:=0
				End case 
				
			Else 
				Case of 
					: (ORD_al_AuthStatus{$_l_AuthsIndex}=-13)
						ORD_at_AuthStatus{$_l_AuthsIndex}:="Voided"
					: (ORD_at_InvoiceCode{$_l_AuthsIndex}#"")
						//Assigned to an invoice
						ORD_at_AuthStatus{$_l_AuthsIndex}:="Assigned to invoice"
					: (ORD_ad_CCAuthDate{$_l_AuthsIndex}<=(Current date:C33-30))
						ORD_at_AuthStatus{$_l_AuthsIndex}:="Out of Date"
				End case 
			End if 
			
		End for 
		
	End if 
End if 
If (Count parameters:C259>=2)
	
	$_bo_ShowListbox:=$2
Else 
	$_bo_ShowListbox:=True:C214
End if 
If ($_bo_ShowListbox)
	//ARRAY BOOLEAN(ORD_lb_LBAuths;0)
	ARRAY BOOLEAN:C223(ORD_lb_LBAuths; 0)
	LB_SetupListbox(->ORD_lb_LBAuths; "oAuths"; "ORDa_L"; 1; ->ORD_at_CCAUTH; ->ORD_at_TransactionID; ->ORD_at_CCCardNumbers; ->ORD_ad_CCAuthDate; ->ORD_ar_CCAmount; ->ORD_at_AuthStatus; ->ORD_al_AuthStatus)
	If (Not:C34(Undefined:C82(ORD_lb_LBAuths)))
		OBJECT SET ENTERABLE:C238(ORD_at_CCAUTH; False:C215)
		OBJECT SET ENTERABLE:C238(ORD_at_CCCardNumbers; False:C215)
		OBJECT SET ENTERABLE:C238(ORD_ad_CCAuthDate; False:C215)
		OBJECT SET ENTERABLE:C238(ORD_ar_CCAmount; False:C215)
		OBJECT SET ENTERABLE:C238(ORD_al_AuthStatus; False:C215)
		LB_SetColumnHeaders(->ORD_lb_LBAuths; "ORDa_L"; 1; "Auth Code"; "Transaction"; "Card"; "Date"; "Amount"; "Status"; "Status Number")
		LB_SetColumnWidths(->ORD_lb_LBAuths; "oAuths"; 1; 66; 128; 135; 73; 66; 176; 0)
		LB_SetScroll(->ORD_lb_LBAuths; -3; -2)
		LB_SetFormat(->ORD_lb_LBAuths; 2; "|accounts"; 4)  //NG September 2008
		LB_StyleSettings(->ORD_lb_LBAuths; "Light Grey "; 9; "oAuths"; ->[ORDERS:24])
	End if 
End if 
ERR_MethodTrackerReturn("CCM_LoadOrderAuths"; $_t_oldMethodName)