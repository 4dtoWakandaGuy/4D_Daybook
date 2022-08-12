If (False:C215)
	//object Name: [SUBSCRIPTIONS]Subs_In.oBillingTypeARRAY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/05/2011 08:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SUB_at_ShortBillingTypes;0)
	//ARRAY TEXT(SUBS_at_BillingTypes;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS].Subs_In.oBillingTypeARRAY"; Form event code:C388)
If (SUBS_at_BillingTypes>0)
	[SUBSCRIPTIONS:93]X_Subscription_Type:12:=SUBS_at_BillingTypes{SUBS_at_BillingTypes}
	[SUBSCRIPTIONS:93]Type:7:=SUB_at_ShortBillingTypes{SUBS_at_BillingTypes}
	If ([SUBSCRIPTIONS:93]Type:7="BNN") | ([SUBSCRIPTIONS:93]Type:7="BIN")
		If ([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8#0)
			Gen_Confirm("Are you sure you want to clear the billing amount?"; "Yes"; "No")
			If (OK=1)
				[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8:=0
			End if 
		End if 
		OBJECT SET ENTERABLE:C238([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; False:C215)
	Else 
		OBJECT SET ENTERABLE:C238([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; True:C214)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [SUBSCRIPTIONS].Subs_In.oBillingTypeARRAY"; $_t_oldMethodName)
