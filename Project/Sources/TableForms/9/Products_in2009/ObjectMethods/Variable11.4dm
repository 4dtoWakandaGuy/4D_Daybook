If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.Variable11
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; PROD_t_Currency)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.Variable11"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		Check_MinorNC(->PROD_t_Currency; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
		If (PROD_t_Currency#"")
			
			If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
				//this already had a currency
				Gen_Confirm("Are you sure you wish to change the default selling currency for this product?"; "No"; "Yes")
				If (Ok=0)
					
					
					[PRODUCTS:9]Default_Price_Currency_ID:45:=[CURRENCIES:71]X_ID:3
					PROD_t_Currency:=[CURRENCIES:71]Currency_Code:1
					
				Else 
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
					PROD_t_Currency:=[CURRENCIES:71]Currency_Code:1
				End if 
			Else 
				[PRODUCTS:9]Default_Price_Currency_ID:45:=[CURRENCIES:71]X_ID:3
				PROD_t_Currency:=[CURRENCIES:71]Currency_Code:1
			End if 
		Else 
			//no currency found!!
			
			
			If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
				READ ONLY:C145([CURRENCIES:71])
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
				PROD_t_Currency:=[CURRENCIES:71]Currency_Code:1
			Else 
				PROD_t_Currency:=<>SYS_t_BaseCurrency
				
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.Variable11"; $_t_oldMethodName)
