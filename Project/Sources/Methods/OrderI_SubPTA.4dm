//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_SubPTA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 08:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_REAL:C285($_r_SalesPrice)
	C_TEXT:C284(<>GenPrice; $_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubPTA")
//OrderI_SubPTA


If ([PRICE_TABLE:28]Pricing_Basis:17=0)
	RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
	If ([PRICE_GROUPS:18]Price_Code:1#[PRICE_TABLE:28]Price_Code:2)
		QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=[PRICE_TABLE:28]Price_Code:2)
	End if 
	If (Records in selection:C76([PRICE_GROUPS:18])=1)
		If ([PRICE_GROUPS:18]Price_Based:3=True:C214)
			If (Count parameters:C259=0)
				If (Old:C35([ORDER_ITEMS:25]Quantity:3)=0)
					[ORDER_ITEMS:25]Sales_Price:4:=[PRICE_TABLE:28]Price_Discount:3
				Else 
					If ([PRICE_TABLE:28]Price_Discount:3#[ORDER_ITEMS:25]Sales_Price:4) & (Old:C35([ORDER_ITEMS:25]Quantity:3)#([ORDER_ITEMS:25]Quantity:3))
						//CONFIRM("Change unit price from "+String([ORDER ITEMS]Sales Price)+" to "+String([PRICE TABLE]Price Discount)+"?";"Yes";"No")
						Gen_Confirm("Change unit price from "+String:C10([ORDER_ITEMS:25]Sales_Price:4)+" to "+String:C10([PRICE_TABLE:28]Price_Discount:3)+"?"; "Yes"; "No")
						If (False:C215)  //bsw 4/06/04
							//CONFIRM("Change unit price from "+String([ORDER ITEMS]Sales Price)+" to "+String([PRICE TABLE]Price Discount)+"?";"Yes";"No")
							Gen_Confirm("Change unit price from "+String:C10([ORDER_ITEMS:25]Sales_Price:4)+" to "+String:C10([PRICE_TABLE:28]Price_Discount:3)+"?"; "Yes"; "No")
						End if 
						If (OK=1)
							[ORDER_ITEMS:25]Sales_Price:4:=[PRICE_TABLE:28]Price_Discount:3
						End if 
						
					End if 
				End if 
			Else 
				$1->:=[PRICE_TABLE:28]Price_Discount:3
			End if 
			
			
		Else 
			If (Count parameters:C259=0)
				If (Old:C35([ORDER_ITEMS:25]Quantity:3)=0)
					[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
					[ORDER_ITEMS:25]Discount:37:=[PRICE_TABLE:28]Price_Discount:3
				Else 
					$_r_SalesPrice:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
					If ($_r_SalesPrice#[ORDER_ITEMS:25]Sales_Price:4)
						If (False:C215)  //bsw 4/06/04
							//CONFIRM("Change unit price from "+String([ORDER ITEMS]Sales Price)+" to "+String($_r_SalesPrice)+"?";"Yes";"No")
							Gen_Confirm("Change unit price from "+String:C10([ORDER_ITEMS:25]Sales_Price:4)+" to "+String:C10($_r_SalesPrice)+"?"; "Yes"; "No")
						End if 
						//If (OK=1)
						[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
						[ORDER_ITEMS:25]Discount:37:=[PRICE_TABLE:28]Price_Discount:3
						//End if
					End if 
				End if 
			Else 
				$1->:=Gen_Round(($1->*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
			End if 
			
		End if 
		
	End if 
	Case of 
		: ([PRICE_TABLE:28]Pricing_Basis:17=1)
			If (Count parameters:C259=0)
				If (Old:C35([ORDER_ITEMS:25]Quantity:3)=0)
					[ORDER_ITEMS:25]Sales_Price:4:=[PRICE_TABLE:28]Price_Discount:3
				Else 
					If ([PRICE_TABLE:28]Price_Discount:3#[ORDER_ITEMS:25]Sales_Price:4) & (Old:C35([ORDER_ITEMS:25]Quantity:3)#([ORDER_ITEMS:25]Quantity:3))
						Gen_Confirm("Change unit price from "+String:C10([ORDER_ITEMS:25]Sales_Price:4)+" to "+String:C10([PRICE_TABLE:28]Price_Discount:3)+"?"; "Yes"; "No")
						If (OK=1)
							[ORDER_ITEMS:25]Sales_Price:4:=[PRICE_TABLE:28]Price_Discount:3
						End if 
						OK:=1
					End if 
				End if 
			Else 
				$1->:=[PRICE_TABLE:28]Price_Discount:3
			End if 
			
		: ([PRICE_TABLE:28]Pricing_Basis:17=3)
			If (Count parameters:C259=0)
				If (Old:C35([ORDER_ITEMS:25]Quantity:3)=0)
					[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
					[ORDER_ITEMS:25]Discount:37:=[PRICE_TABLE:28]Price_Discount:3
				Else 
					
					$_r_SalesPrice:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
					If ($_r_SalesPrice#[ORDER_ITEMS:25]Sales_Price:4)
						[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Retail_Price:38*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
						[ORDER_ITEMS:25]Discount:37:=[PRICE_TABLE:28]Price_Discount:3
						
					End if 
				End if 
			Else 
				$1->:=Gen_Round(($1->*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
			End if 
			
	End case 
End if 
If (Count parameters:C259=0)
	If (([PRICE_GROUPS:18]Override:6=False:C215) & (<>GenPrice#""))
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=<>GenPrice; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8=[COMPANIES:2]Company_Code:1)
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
			If ([PRICE_TABLE:28]Pricing_Basis:17=0)
				If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
					If (Old:C35([ORDER_ITEMS:25]Quantity:3)=0)
						[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
					Else 
						$_r_SalesPrice:=Gen_Round(([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
						If ($_r_SalesPrice#[ORDER_ITEMS:25]Sales_Price:4)
							If (False:C215)  //bsw 4/06/04
								//CONFIRM("Change unit price from "+String([ORDER ITEMS]Sales Price)+" to "+String($_r_SalesPrice)+"?";"Yes";"No")
								Gen_Confirm("Change unit price from "+String:C10([ORDER_ITEMS:25]Sales_Price:4)+" to "+String:C10($_r_SalesPrice)+"?"; "Yes"; "No")
							End if 
							//            If (OK=1)
							[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
							//            End if
						End if 
					End if 
				End if 
			Else 
				If ([PRICE_TABLE:28]Pricing_Basis:17=3)
					If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
						If (Old:C35([ORDER_ITEMS:25]Quantity:3)=0)
							[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
						Else 
							
							$_r_SalesPrice:=Gen_Round(([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
							If ($_r_SalesPrice#[ORDER_ITEMS:25]Sales_Price:4)
								[ORDER_ITEMS:25]Sales_Price:4:=Gen_Round(([ORDER_ITEMS:25]Sales_Price:4*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
Else 
	If (([PRICE_GROUPS:18]Override:6=False:C215) & (<>GenPrice#""))
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=<>GenPrice; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8=$2)
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			RELATE ONE:C42([PRICE_TABLE:28]Price_Code:2)
			If ([PRICE_TABLE:28]Pricing_Basis:17=0)
				If ([PRICE_GROUPS:18]Price_Based:3=False:C215)
					$1->:=Gen_Round(($1->*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
				End if 
			Else 
				If ([PRICE_TABLE:28]Pricing_Basis:17=3)
					$1->:=Gen_Round(($1->*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 1)
				End if 
			End if 
		End if 
	End if 
	
End if 


If (Count parameters:C259=0)
	Calc_Item
End if 
ERR_MethodTrackerReturn("OrderI_SubPTA"; $_t_oldMethodName)
