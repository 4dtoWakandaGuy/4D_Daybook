If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oRemoveContRelation1
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
	//ARRAY BOOLEAN(PROD_lb_SubsMailings;0)
	//ARRAY INTEGER(PRD_ai_SubsRenwalStart;0)
	//ARRAY LONGINT(PRD_al_SubsRenewalID;0)
	//ARRAY TEXT(PRD_at_SubsRenwalLetterCode;0)
	C_LONGINT:C283($_l_Column; $_l_ModuleAccess; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oRemoveContRelation1"; Form event code:C388)


LISTBOX GET CELL POSITION:C971(PROD_lb_SubsMailings; $_l_Column; $_l_Row)
If ($_l_Row>0)
	
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Subscriptions)
	If ($_l_ModuleAccess>0) & ($_l_ModuleAccess#3)
		READ WRITE:C146([SUBSCRIPTIONS:93])
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]x_ID:11=PRD_al_SubsRenewalID{$_l_Row})
		
		Gen_Confirm("Are you sure you want to delete the Renewal Mailing after issue number"+String:C10([SUBSCRIPTIONS:93]After_Number:5); "No"; "Yes")
		If (ok=0)
			DELETE RECORD:C58([SUBSCRIPTIONS:93])
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="REN"; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsRenewalID)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_ai_SubsRenwalStart)
			SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Renewals_Document_Reference:15; PRD_at_SubsRenwalLetterCode)
		End if 
		READ ONLY:C145([SUBSCRIPTIONS:93])
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oRemoveContRelation1"; $_t_oldMethodName)
