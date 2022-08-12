//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT_SearchCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $2; PRD_t_FurtherApplicable)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_SearchCo")
//PriceT_SearchCo - Company Preference
QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1)
If (PRD_t_FurtherApplicable#"")
	QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
End if 

PriceT_SearchC2($2)
PriceT_FilterDates
If (Records in selection:C76([PRICE_TABLE:28])=0)
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
	PriceT_SearchC2($2)
	PriceT_FilterDates
	If (Records in selection:C76([PRICE_TABLE:28])=0)
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7="")
		PriceT_SearchC2($2)
		PriceT_FilterDates
		If (Records in selection:C76([PRICE_TABLE:28])=0)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6="")
			PriceT_SearchC2($2)
			PriceT_FilterDates
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				PriceT_Search($1)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_SearchCo"; $_t_oldMethodName)