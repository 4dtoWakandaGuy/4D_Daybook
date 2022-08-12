If (False:C215)
	//object Name: [ORDERS]Orders_In.oListBoxAuths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 09:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ORD_ad_CCAuthDate;0)
	//ARRAY LONGINT(ORD_al_AuthRecord;0)
	//ARRAY LONGINT(ORD_al_AuthStatus;0)
	//ARRAY TEXT(ORD_at_AuthStatus;0)
	//ARRAY TEXT(ORD_at_CCAUTH;0)
	//ARRAY TEXT(ORD_at_InvoiceCode;0)
	C_BOOLEAN:C305($_bo_Stop; CCM_bo_IsLicenced)
	C_LONGINT:C283($_l_event; $_l_Process; $_l_SelectedRow; bVoid)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here







$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oListBoxAuths"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_SelectedRow:=Self:C308->
ORD_at_CCAUTH:=$_l_SelectedRow
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		If ($_l_SelectedRow>0)
			If (ORD_al_AuthStatus{$_l_SelectedRow}=1) | (ORD_al_AuthStatus{$_l_SelectedRow}=0)
				$_bo_Stop:=False:C215
				If (ORD_al_AuthStatus{$_l_SelectedRow}=0)
					Case of 
						: (ORD_at_InvoiceCode{$_l_SelectedRow}#"")
							//Assigned to an invoice
							$_bo_Stop:=True:C214
						: (ORD_ad_CCAuthDate{$_l_SelectedRow}<=(Current date:C33-30))
							$_bo_Stop:=True:C214
					End case 
				End if 
				If (Not:C34($_bo_Stop))
					
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
					
					$_l_Process:=New process:C317("CCM_OrderAuthorize"; 64000; "Authorize"+[ORDERS:24]Order_Code:3; [ORDERS:24]Order_Code:3; [ORDERS:24]x_ID:58; [ORDERS:24]Company_Code:1; [ORDERS:24]Contact_Code:2; [ORDERS:24]Total_Total:8; [ORDERS:24]Currency_Code:32; Current process:C322; ORD_al_AuthRecord{$_l_SelectedRow}; *)
					SHOW PROCESS:C325($_l_Process)
					BRING TO FRONT:C326($_l_Process)
				Else 
					Gen_Alert("You cannot edit an authorization with a status of "+ORD_at_AuthStatus{$_l_SelectedRow}+"!")
					
				End if 
			Else 
				Gen_Alert("You cannot edit an authorization with a status of "+ORD_at_AuthStatus{$_l_SelectedRow}+"!")
				
			End if 
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		If ($_l_SelectedRow>0)
			Case of 
				: (ORD_al_AuthStatus{$_l_SelectedRow}=1) | (ORD_al_AuthStatus{$_l_SelectedRow}>=3)  // Awating invoicing
					If (CCM_bo_IsLicenced)
						OBJECT SET VISIBLE:C603(bVoid; True:C214)
						//_O_ENABLE BUTTON(bVoid)
						OBJECT SET ENABLED:C1123(bVoid; True:C214)
					End if 
				Else 
					OBJECT SET VISIBLE:C603(bVoid; False:C215)
					//_O_DISABLE BUTTON(bVoid)
					OBJECT SET ENABLED:C1123(bVoid; False:C215)
			End case 
		Else 
			OBJECT SET VISIBLE:C603(bVoid; False:C215)
			//_O_DISABLE BUTTON(bVoid)
			OBJECT SET ENABLED:C1123(bVoid; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ:Orders_In,ORD_lb_LBAuths"; $_t_oldMethodName)
