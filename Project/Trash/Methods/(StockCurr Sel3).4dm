//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockCurr_Sel3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/11/2010 08:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProdCode; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_Sel3")
//StockCurr_Sel3
If (vStatus="•ALL")
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=vProdCode; *)
Else 
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=vProdCode; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=vStatus; *)
End if 
//we should not be restricting stock by currency UNLESS it is a preference
If (DB_t_CurrentFormUsage="Jobs")
	StockCurr_ACLS2([JOBS:26]Analysis_Code:24; [JOBS:26]Currency_Code:25; [JOBS:26]Layer_Code:26)
Else 
	StockCurr_ACLS2([ORDERS:24]Analysis_Code:33; [ORDERS:24]Currency_Code:32; [ORDERS:24]Layer_Code:47)
End if 
If (Records in selection:C76([CURRENT_STOCK:62])>0)
	//QUERY SELECTION([CURRENT_STOCK];[CURRENT_STOCK]Quantity#0)
	//COPY NAMED SELECTION([CURRENT_STOCK];"$TemP")
	//$RO:=Read only state([CURRENT_STOCK])
	//READ WRITE([CURRENT_STOCK])
	//APPLY TO SELECTION([CURRENT_STOCK];STK_UpdateCurrentStock2011 )
	//UNLOAD RECORD([CURRENT_STOCK]
	//If ($RO)
	//READ ONLY([CURRENT_STOCK])
	//End if
	//USE NAMED SELECTION("$temP")
	QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4#0)
End if 
ERR_MethodTrackerReturn("StockCurr_Sel3"; $_t_oldMethodName)