//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPDelS2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:39`Method: Orders_PPDelS2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; $_bo_Continue; $0)
	C_DATE:C307(vDelDate; vDoDateF)
	C_TEXT:C284($_t_CurrentFormUsage2; $_t_oldMethodName; $1; DB_t_CurrentFormUsage2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDelS2")
$0:=False:C215
If (Count parameters:C259>=1)
	$_t_CurrentFormUsage2:=$1
Else 
	$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
End if 
If (Gen_PPCreditChk(->[ORDERS:24]Company_Code:1; ->[CREDIT_STAGES:54]Prevent_Deliver:8; "Delivered"))
	vDelDate:=vDoDateF
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
	Orders_PPDelSrc($_t_CurrentFormUsage2)
	If (Records in selection:C76([ORDER_ITEMS:25])=0)
		Gen_Alert("There are no Items to Deliver on Order "+[ORDERS:24]Order_Code:3; "Skip it")
	Else 
		If (<>DB_bo_NewStockActive)
			
			$_bo_Continue:=STK_OrdersPrintDelAddSerial
			If ($_bo_Continue)
				If (Transact_SttLck(->[ORDER_ITEMS:25]Item_Number:27; 0))
					$0:=True:C214
					// NG 10/12/2002 i am not sure this is correct!
					//       CANCEL TRANSACTION
					OK:=0
					//Transact_End   ` 13/05/02 pb NG Feb 2009 this is clearly pants..
				Else 
					Gen_Alert("There are Items on Order "+[ORDERS:24]Order_Code:3+" that are locked by another Process or User"; "Skip it")
				End if 
			End if 
		Else 
			Orders_PPDel3
			If (OK=1)
				If (Transact_SttLck(->[ORDER_ITEMS:25]Item_Number:27; 0))
					$0:=True:C214
					// NG 10/12/2002 i am not sure this is correct!
					//       CANCEL TRANSACTION
					OK:=0
					Transact_End  // 13/05/02 pb
				Else 
					Gen_Alert("There are Items on Order "+[ORDERS:24]Order_Code:3+" that are locked by another Process or User"; "Skip it")
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Orders_PPDelS2"; $_t_oldMethodName)
