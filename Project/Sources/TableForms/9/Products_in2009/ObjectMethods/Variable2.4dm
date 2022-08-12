If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.Variable2
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
	//C_UNKNOWN(vButtDisPro)
	//ARRAY LONGINT(PRD_al_ProductsTabPage;0)
	//ARRAY LONGINT(PRD_al_ViewTabletoTable;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_FilterDates;0)
	//ARRAY TEXT(PRD_at_FilterDates2;0)
	//ARRAY TEXT(PRD_at_FiltersSubsCodes;0)
	//ARRAY TEXT(PRD_at_FilterSubs;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(PRD_bo_notDoneonly)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Dayof; $_l_Year; $_l_Dayof; $_l_Year)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_oldMethodName; $_t_SubsciptionType; vButtDisPro; $_t_oldMethodName; $_t_SubsciptionType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.Variable2"; Form event code:C388)

//Prod_l_PagePref
If (PRD_al_ProductsTabPage{PRD_at_ProductsTab}#FORM Get current page:C276) & (PRD_at_ProductsTab>0)
	If (FORM Get current page:C276=1)
		Case of 
				
			: (PRD_al_ViewTabletoTable{PRD_at_ViewTabsLabels}=Table:C252(->[PRICE_TABLE:28]))
				If ([PRICE_TABLE:28]Table_Code:12#"")
					DB_SaveRecord(->[PRICE_TABLE:28])
					
				End if 
		End case 
	End if 
	FORM GOTO PAGE:C247(PRD_al_ProductsTabPage{PRD_at_ProductsTab})
	Case of 
		: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=8)
			COPY ARRAY:C226(PRD_at_FilterDates; PRD_at_FilterDates2)
			
			If (PRD_at_FilterSubs=0)
				PRD_at_FilterSubs:=1
			End if 
			$_t_SubsciptionType:=PRD_at_FiltersSubsCodes{PRD_at_FilterSubs}
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7=$_t_SubsciptionType; *)
			QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4#0)
			If (PRD_bo_notDoneonly)
				QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Date_Done:9=!00-00-00!)
			End if 
			If ($_t_SubsciptionType="ISS")
				OBJECT SET VISIBLE:C603(*; "oFIlterDates4"; True:C214)
				If (PRD_at_FilterDates2>0)
					Case of 
						: (PRD_at_FilterDates2{PRD_at_FilterDates2}="Future Dates")
							QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=Current date:C33(*))
						: (PRD_at_FilterDates2{PRD_at_FilterDates2}="From Current Month")
							$_d_Date:=Current date:C33(*)
							$_l_Dayof:=Day of:C23(Current date:C33(*))
							If ($_l_Dayof>1)
								Repeat 
									$_d_Date:=$_d_Date-1
									$_l_Dayof:=Day of:C23($_d_Date)
								Until ($_l_Dayof=1)
							End if 
							QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=$_d_Date)
						: (PRD_at_FilterDates2{PRD_at_FilterDates2}="From Current Year")
							$_l_Year:=Year of:C25(Current date:C33(*))
							$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
							QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=$_d_Date)
						Else 
							$_l_Year:=Num:C11(PRD_at_FilterDates{PRD_at_FilterDates})
							//$_l_Year:=Year of(Current date(*))
							$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
							QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3>=$_d_Date)
							
					End case 
					ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; >)
				End if 
			Else 
				OBJECT SET VISIBLE:C603(*; "oFIlterDates4"; False:C215)
			End if 
			
	End case 
	If (Size of array:C274(PRD_aPtr_RelatedConfiguration)>=9)
		
		$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			//$name:=$_ptr_ArrayReferences->{10}
			Case of 
				: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=3)
					In_ButtChkDis(->vButtDisPro; "Product"; "Component")
				: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=2)
					In_ButtChkDis(->vButtDisPro; "Product"; "Further Analysis")
				: (PRD_al_ProductsTabPage{PRD_at_ProductsTab}=1)
					In_ButtChkDis(->vButtDisPro; "Product"; "Supplier")
			End case 
		Else 
			In_ButtChkDis(->vButtDisPro)
		End if 
	Else 
		
		
		In_ButtChkDis(->vButtDisPro)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Products_In,PRD_at_ProductsTab"; $_t_oldMethodName)
