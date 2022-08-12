If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oAddContacts
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
	//ARRAY INTEGER(PRD_al_SubsBillingstart;0)
	//ARRAY INTEGER(PRD_at_SubsBillingFrequency;0)
	//ARRAY LONGINT(PRD_al_SubsBillingID;0)
	//ARRAY REAL(PRD_ar_SubsBilingAmount;0)
	//ARRAY TEXT(PRD_at_subsBillingFrType;0)
	//ARRAY TEXT(PRD_at_SubsBillingType;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oAddContacts"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the
If (Current date:C33(*)<[PRODUCTS:9]Actual_End_Date:49) | ([PRODUCTS:9]Actual_End_Date:49=!00-00-00!)
	DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[SUBSCRIPTIONS:93]); True:C214; "Billing")
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
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oAddContacts"; $_t_oldMethodName)
