//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_mORderAuthorize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/06/2009 09:38
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
$_t_oldMethodName:=ERR_MethodTracker("CCM_mORderAuthorize"; Form event code:C388)

//This is a menu item

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
	If (CCM_l_CardToUse#0)
		$_l_Process:=New process:C317("CCM_OrderAuthorize"; 128000; "Authorize"+[ORDERS:24]Order_Code:3; [ORDERS:24]Order_Code:3; [ORDERS:24]x_ID:58; [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; [ORDERS:24]Total_Total:8; [ORDERS:24]Currency_Code:32; Current process:C322; 0; CCM_l_CardToUse; *)
	Else 
		$_l_Process:=New process:C317("CCM_OrderAuthorize"; 128000; "Authorize"+[ORDERS:24]Order_Code:3; [ORDERS:24]Order_Code:3; [ORDERS:24]x_ID:58; [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; [ORDERS:24]Total_Total:8; [ORDERS:24]Currency_Code:32; Current process:C322; *)
	End if 
	SHOW PROCESS:C325($_l_Process)
	BRING TO FRONT:C326($_l_Process)
End if 
ERR_MethodTrackerReturn("CCM_mORderAuthorize"; $_t_oldMethodName)