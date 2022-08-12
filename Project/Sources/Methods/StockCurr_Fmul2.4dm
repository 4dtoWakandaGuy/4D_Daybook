//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_Fmul2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_Fmul2")
//StockCurr_Fmul2- for use in Included Formulae

If (Count parameters:C259>=2)
	If ($2="•ALL")
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1)
	Else 
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$1; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$2; *)
	End if 
	If (Count parameters:C259>2)
		Case of 
			: ($3="A")
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5#0; *)
			: ($3="F")
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
		End case 
	End if 
	If (Count parameters:C259>5)
		StockCurr_ACLS2($4; $5; $6)
	Else 
		QUERY:C277([CURRENT_STOCK:62])
	End if 
	$0:=Gen_Round((Sum:C1([CURRENT_STOCK:62]Quantity:4)); 2; 2)
Else 
	$0:=0
End if 
UNLOAD RECORD:C212([CURRENT_STOCK:62])
ERR_MethodTrackerReturn("StockCurr_Fmul2"; $_t_oldMethodName)