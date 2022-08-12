If (False:C215)
	//object Name: [ORDERS]Orders_In.oAuthorizePayment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 00:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; CCM_l_CardToUse)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oAuthorizePayment"; Form event code:C388)


If (Gen_PPChkStSing(->[ORDERS:24]State:15; 2))
	
	If ([ORDERS:24]x_ID:58=0)
		[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
	End if 
	
	//a complet reworking
	//here we need
	//1)Total value of order
	//2)Total Amount already Authorized(but not invoice)
	//3)Total Amount Invoiced but not linked to an auth
	//4 Company code
	//5 Contact Code
	//Order Code
	//need to test the order state here
	DB_SaveRecord(->[ORDERS:24])
	DB_SaveRecord(->[ORDER_ITEMS:25])
	
	If (CCM_l_CardToUse#0)
		$_l_Process:=New process:C317("CCM_OrderAuthorize"; 64000; "Authorize"+[ORDERS:24]Order_Code:3; [ORDERS:24]Order_Code:3; [ORDERS:24]x_ID:58; [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; [ORDERS:24]Total_Total:8; [ORDERS:24]Currency_Code:32; Current process:C322; 0; CCM_l_CardToUse; *)
	Else 
		$_l_Process:=New process:C317("CCM_OrderAuthorize"; 64000; "Authorize"+[ORDERS:24]Order_Code:3; [ORDERS:24]Order_Code:3; [ORDERS:24]x_ID:58; [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; [ORDERS:24]Total_Total:8; [ORDERS:24]Currency_Code:32; Current process:C322; *)
	End if 
	
	SHOW PROCESS:C325($_l_Process)
	BRING TO FRONT:C326($_l_Process)
	
End if 
ERR_MethodTrackerReturn("OBJ:Orders_In,xApply"; $_t_oldMethodName)
