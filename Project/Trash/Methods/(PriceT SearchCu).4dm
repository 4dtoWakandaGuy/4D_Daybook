//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT_SearchCu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2010 11:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; PRD_t_FurtherApplicable)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_SearchCu")
//PriceT_Search
QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Currency_Code:13=$1; *)
QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1)
If (PRD_t_FurtherApplicable#"")
	QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
End if 
ERR_MethodTrackerReturn("PriceT_SearchCu"; $_t_oldMethodName)