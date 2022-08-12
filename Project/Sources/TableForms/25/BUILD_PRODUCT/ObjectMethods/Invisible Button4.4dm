If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.Invisible Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2011 10:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; OI_bo_AlloptionsSelected; OI_bo_CustomerPriceSet; OI_bo_ProductEnter)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(OI_R_BuiltPrice; OI_R_SalesPrice)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.Invisible Button4"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//First validate it is ready to save...
		If (OI_bo_AlloptionsSelected)
			$_bo_Continue:=True:C214
			If (Not:C34(OI_bo_CustomerPriceSet))
				If (OI_R_SalesPrice=0)
					OI_R_SalesPrice:=Gen_RequestAmount("Please confirm the customer price for this"; Is real:K8:4; OI_R_BuiltPrice; "Continue"; "Stop")
					$_bo_Continue:=(OK=1)
				Else 
					OI_R_SalesPrice:=Gen_RequestAmount("Please confirm the customer price for this"; Is real:K8:4; OI_R_SalesPrice; "Continue"; "Stop")
					$_bo_Continue:=(OK=1)
				End if 
			End if 
			If ($_bo_Continue)
				Gen_Confirm("Are you sure you are ready to create this entry"; "Yes"; "No")
				If (OK=1)
					OI_bo_ProductEnter:=True:C214
					CANCEL:C270
				End if 
				OK:=1
			End if 
		Else 
			Gen_Alert("Sorry you cannot  save this until all parts are set!")
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.Invisible Button4"; $_t_oldMethodName)
