//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT Search
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
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $5; PRD_t_FurtherApplicable)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT Search")
//PriceT Search

QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
If (Count parameters:C259>=2)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=$2)
	If (Count parameters:C259>=3)
		If ($3#"")
			QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=$3)
		End if 
	End if 
Else 
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1)
	If (PRD_t_FurtherApplicable#"")
		QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Further:20=PRD_t_FurtherApplicable)
	End if 
End if 

PriceT_FilterDates
If (Records in selection:C76([PRICE_TABLE:28])=0)
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
	If (Count parameters:C259>=4)
		If ($4#"")
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=$4; *)
			If ($3#"")
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=$3)
			Else 
				QUERY:C277([PRICE_TABLE:28])
			End if 
		Else 
			If ($3#"")
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Brand_Code:7=$3)
			Else 
				REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
			End if 
			
		End if 
		
	Else 
		If ([PRODUCTS:9]Group_Code:3#"")
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
			If ([PRODUCTS:9]Brand_Code:4#"")
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
			Else 
				QUERY:C277([PRICE_TABLE:28])
			End if 
			
		Else 
			If ([PRODUCTS:9]Brand_Code:4#"")
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
			Else 
				REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
			End if 
			
		End if 
		
	End if 
	PriceT_FilterDates
	If (Records in selection:C76([PRICE_TABLE:28])=0)
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
		If (Count parameters:C259>=4)
			If ($4#"")
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=$4; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7="")
			Else 
				REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
			End if 
			
		Else 
			If ([PRODUCTS:9]Group_Code:3#"")
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7="")
			Else 
				REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
			End if 
			
		End if 
		PriceT_FilterDates
		If (Records in selection:C76([PRICE_TABLE:28])=0)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
			If (Count parameters:C259>=4)
				If ($3#"")
					QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=$3; *)
					QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6="")
				Else 
					REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
				End if 
				
			Else 
				If ([PRODUCTS:9]Brand_Code:4#"")
					QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4; *)
					QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6="")
				Else 
					REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
				End if 
				
			End if 
			PriceT_FilterDates
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$1; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=""; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=""; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1="")
				If (Count parameters:C259>=5)
					If ($5#"")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=$5; *)
						QUERY SELECTION:C341([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Company_Code:8="")
					Else 
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8="")
					End if 
					
				Else 
					If ([COMPANIES:2]Company_Code:1#"")
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=[COMPANIES:2]Company_Code:1; *)
						QUERY SELECTION:C341([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Company_Code:8="")
					Else 
						QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8="")
					End if 
					
				End if 
				PriceT_FilterDates
			End if 
			ORDER BY:C49([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8; <)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceT Search"; $_t_oldMethodName)
