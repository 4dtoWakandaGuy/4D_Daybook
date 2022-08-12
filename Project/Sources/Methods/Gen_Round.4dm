//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Round
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 11:54:51If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_DecimalPlacesonPrices; $2; $3)
	C_REAL:C285($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Round")
If (Count parameters:C259>=3)
	If ($1#0)
		Case of 
			: ($3=1)  //Prices
				$0:=Round:C94($1; <>SYS_l_DecimalPlacesonPrices)
			: ($3=2)  //Amounts
				$0:=Round:C94($1; 2)
			: ($3=3)  //Discounts Percentages - not Amounts
				If (<>SYS_l_DecimalPlacesonPrices#2)
					$0:=Round:C94($1; <>SYS_l_DecimalPlacesonPrices)
				Else 
					$0:=Round:C94($1; 1)
				End if 
			: ($3=4)  //Margin & other Percentages - Not Amounts
				$0:=Round:C94($1; <>SYS_l_DecimalPlacesonPrices)
			: ($3=5)  //Item Tax Amounts - Totals are Amounts
				$0:=Round:C94($1; 2)
			: ($3=6)  //Quantities
				$0:=Round:C94($1; 2)
			: ($3=7)  //Stock Quantities
				$0:=Round:C94($1; 3)
			Else 
				$0:=Round:C94($1; $2)
		End case 
	Else 
		$0:=$1
	End if 
Else 
	If ($1#0)
		$0:=Round:C94($1; $2)
	Else 
		$0:=$1
	End if 
End if 
ERR_MethodTrackerReturn("Gen_Round"; $_t_oldMethodName)
