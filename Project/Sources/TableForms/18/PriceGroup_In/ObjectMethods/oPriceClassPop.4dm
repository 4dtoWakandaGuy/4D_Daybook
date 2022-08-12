If (False:C215)
	//object Name: [PRICE_GROUPS]PriceGroup_In.oPriceClassPop
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PG_at_PriceClasses;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRICE_GROUPS].PriceGroup_In.oPriceClassPop"; Form event code:C388)
Case of 
	: (PG_at_PriceClasses=1)  //Price Based
		If ([PRICE_GROUPS:18]PriceGroupClass:9#0) & ([PRICE_GROUPS:18]Price_Based:3=False:C215)
			//Changing to price based
			Gen_Confirm("Are you sure you want to modify the pricing basis of this group? This will affect entries already made!"; "No"; "Yes")
			If (OK=0)
				[PRICE_GROUPS:18]Price_Based:3:=True:C214
				[PRICE_GROUPS:18]PriceGroupClass:9:=1
			Else 
				Case of   //note the sequence on screen is not the same as the classes
					: ([PRICE_GROUPS:18]PriceGroupClass:9=3)
						PG_at_PriceClasses:=2
					: ([PRICE_GROUPS:18]PriceGroupClass:9=2)
						PG_at_PriceClasses:=3
				End case 
			End if 
		Else 
			[PRICE_GROUPS:18]Price_Based:3:=True:C214
			[PRICE_GROUPS:18]PriceGroupClass:9:=1
		End if 
	: (PG_at_PriceClasses=2)  // Discount based
		If (([PRICE_GROUPS:18]PriceGroupClass:9#0) & ([PRICE_GROUPS:18]PriceGroupClass:9#3)) | ([PRICE_GROUPS:18]Price_Based:3=True:C214)
			//Changing to discount based
			Gen_Confirm("Are you sure you want to modify the pricing basis of this group? This will affect entries already made!"; "No"; "Yes")
			If (OK=0)
				[PRICE_GROUPS:18]Price_Based:3:=False:C215
				[PRICE_GROUPS:18]PriceGroupClass:9:=3
			Else 
				Case of   //note the sequence on screen is not the same as the classes
					: ([PRICE_GROUPS:18]PriceGroupClass:9=3)
						PG_at_PriceClasses:=2
					: ([PRICE_GROUPS:18]PriceGroupClass:9=1)
						PG_at_PriceClasses:=1
				End case 
			End if 
		Else 
			[PRICE_GROUPS:18]Price_Based:3:=False:C215
			[PRICE_GROUPS:18]PriceGroupClass:9:=3
		End if 
		
	: (PG_at_PriceClasses=3)  //Mixed
		If (([PRICE_GROUPS:18]PriceGroupClass:9#0) & ([PRICE_GROUPS:18]PriceGroupClass:9#2)) | ([PRICE_GROUPS:18]Price_Based:3=True:C214)
			//Changing to discount based
			Gen_Confirm("Are you sure you want to modify the pricing basis of this group? This will affect entries already made!"; "No"; "Yes")
			If (OK=0)
				[PRICE_GROUPS:18]Price_Based:3:=False:C215
				[PRICE_GROUPS:18]PriceGroupClass:9:=2
			Else 
				Case of   //note the sequence on screen is not the same as the classes
					: ([PRICE_GROUPS:18]PriceGroupClass:9=2)
						PG_at_PriceClasses:=3
					: ([PRICE_GROUPS:18]PriceGroupClass:9=1)
						PG_at_PriceClasses:=1
				End case 
			End if 
		Else 
			[PRICE_GROUPS:18]Price_Based:3:=False:C215
			[PRICE_GROUPS:18]PriceGroupClass:9:=2
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRICE_GROUPS].PriceGroup_In.oPriceClassPop"; $_t_oldMethodName)
