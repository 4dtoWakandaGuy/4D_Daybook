//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss Calc
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
	//ARRAY LONGINT(aApptO;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($l; ch1; r1; r2; s1; s2; vAdd; vSNo; vStockLevel)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProduct; vTitleL)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss Calc")
Menu_Record("StockAss Calc"; "Trial Assembly")
If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1="")
	Gen_Alert("Please first specify the Code of the Product to Assemble"; "Try again")
	OK:=0
Else 
	vProduct:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
	vQuantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
	QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	If (DB_t_CurrentFormUsage="Display")
		Form_SRArray(1)
		ARRAY LONGINT:C221(aApptO; 1)
		SRSerial{1}:=vProduct
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=vProduct)
		SRDesc{1}:=[PRODUCTS:9]Product_Name:2
		SRQtyT{1}:="0"
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=vProduct; *)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[MOVEMENT_TYPES:60]Stock_Minus:4; *)
		StockLev_ACLSr
		SRRate{1}:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
	End if 
	
	vStockLevel:=1
	vSNo:=StockAss_Calc2
	vTitleL:="ASSEMBLY AVAILABILITY"
	vAdd:=0
	
	//_O_OBJECT SET COLOR(vSNo;-62211)
	UTIL_setObjectByColour(0; "vSNo"; -62211)
	
	OBJECT SET ENABLED:C1123(r1; True:C214)
	OBJECT SET ENABLED:C1123(r2; True:C214)
	OBJECT SET ENABLED:C1123(s1; True:C214)
	OBJECT SET ENABLED:C1123(s2; True:C214)
	OBJECT SET ENABLED:C1123(ch1; True:C214)
	OBJECT SET FORMAT:C236(vSNo; "|Quantities")
	GOTO OBJECT:C206([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	If ((r1=0) & (r2=0))
		r2:=1
	End if 
	If ((s1=0) & (s2=0))
		s2:=1
	End if 
End if 
ERR_MethodTrackerReturn("StockAss Calc"; $_t_oldMethodName)
