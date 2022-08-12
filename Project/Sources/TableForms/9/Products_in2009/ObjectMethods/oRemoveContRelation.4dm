If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oRemoveContRelation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROD_lb_SubsBillings;0)
	//ARRAY INTEGER(PRD_al_SubsBillingstart;0)
	//ARRAY INTEGER(PRD_at_SubsBillingFrequency;0)
	//ARRAY LONGINT(PRD_al_SubsBillingID;0)
	//ARRAY REAL(PRD_ar_SubsBilingAmount;0)
	//ARRAY TEXT(PRD_at_subsBillingFrType;0)
	//ARRAY TEXT(PRD_at_SubsBillingType;0)
	C_LONGINT:C283($_l_Column; $_l_ModuleAccess; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oRemoveContRelation"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the

LISTBOX GET CELL POSITION:C971(PROD_lb_SubsBillings; $_l_Column; $_l_Row)
If ($_l_Row>0)
	
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Subscriptions)
	If ($_l_ModuleAccess>0) & ($_l_ModuleAccess#3)
		READ WRITE:C146([SUBSCRIPTIONS:93])
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]x_ID:11=PRD_al_SubsBillingID{$_l_Row})
		
		Gen_Confirm("Are you sure you want to delete the billing after issue number"+String:C10([SUBSCRIPTIONS:93]After_Number:5); "No"; "Yes")
		If (ok=0)
			DELETE RECORD:C58([SUBSCRIPTIONS:93])
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="B@"; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsBillingID)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; PRD_ar_SubsBilingAmount)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Subscription_Type:12; PRD_at_SubsBillingType)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_al_SubsBillingstart)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Unit_Number:6; PRD_at_SubsBillingFrequency)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Units_Type:13; PRD_at_subsBillingFrType)
			
		End if 
		READ ONLY:C145([SUBSCRIPTIONS:93])
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oRemoveContRelation"; $_t_oldMethodName)
