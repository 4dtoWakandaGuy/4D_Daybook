If (False:C215)
	//Table Form Method Name: [SUBSCRIPTIONS]Subs_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/05/2011 08:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SUB_at_ShortBillingTypes;0)
	//ARRAY TEXT(SUBS_at_BillingTypes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; SUBS_l_PageNumber)
	C_REAL:C285(SB_l_Billing)
	C_TEXT:C284($_t_oldMethodName; SB_t_BillingType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SUBSCRIPTIONS].Subs_In"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If ([SUBSCRIPTIONS:93]Product_Code:1="") & (Record number:C243([SUBSCRIPTIONS:93])<0)
			[SUBSCRIPTIONS:93]Product_Code:1:=[PRODUCTS:9]Product_Code:1
			[SUBSCRIPTIONS:93]Product_Name:2:=[PRODUCTS:9]Product_Name:2
		End if 
		If (SUBS_l_PageNumber=0)
		End if 
		Case of 
			: (SUBS_l_PageNumber=1)  //Bliling
				ARRAY TEXT:C222(SUBS_at_BillingTypes; 0)
				ARRAY TEXT:C222(SUB_at_ShortBillingTypes; 0)
				If ([SUBSCRIPTIONS:93]Type:7="")
					OBJECT SET VISIBLE:C603(SUBS_at_BillingTypes; True:C214)
					OBJECT SET VISIBLE:C603(SB_t_BillingType; False:C215)
					APPEND TO ARRAY:C911(SUBS_at_BillingTypes; "Bill - Invoice & Payment")
					APPEND TO ARRAY:C911(SUB_at_ShortBillingTypes; "BIP")
					
					APPEND TO ARRAY:C911(SUBS_at_BillingTypes; "Bill-Invoice but No Payment")
					APPEND TO ARRAY:C911(SUB_at_ShortBillingTypes; "BIN")
					APPEND TO ARRAY:C911(SUBS_at_BillingTypes; "Bill-No Invoice but Payment")
					APPEND TO ARRAY:C911(SUB_at_ShortBillingTypes; "BNP")
					APPEND TO ARRAY:C911(SUBS_at_BillingTypes; "Bill - No Invoice & No Payment")
					APPEND TO ARRAY:C911(SUB_at_ShortBillingTypes; "BNN")
					SUBS_at_BillingTypes:=0
				Else 
					OBJECT SET VISIBLE:C603(SB_t_BillingType; True:C214)
					OBJECT SET VISIBLE:C603(SUBS_at_BillingTypes; False:C215)
					SB_t_BillingType:=[SUBSCRIPTIONS:93]X_Subscription_Type:12
				End if 
				SB_l_Billing:=[SUBSCRIPTIONS:93]After_Number:5
				WS_AutoscreenSize(2; 240; 570)
			: (SUBS_l_PageNumber=2)  //Renewals Letter
				[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Renewals Mailiing"
				[SUBSCRIPTIONS:93]Type:7:="REN"
				
				FORM GOTO PAGE:C247(2)
				WS_AutoscreenSize(2; 240; 570)
		End case 
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM [SUBSCRIPTIONS].Subs_In"; $_t_oldMethodName)
