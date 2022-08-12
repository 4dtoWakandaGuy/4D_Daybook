//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss AvailP
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
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss AvailP")
Menu_Record("StockAss AvailP"; "Print BoM")
$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Stock Available")
//PAGE SETUP([STOCK ITEMS];"StockAss_BoMHdr")
//PRINT SETTINGS
If ($_l_OK>=0)  //see comment in Print_SetSize about this
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=SRSerial{1})
	Print form:C5([STOCK_MOVEMENT_ITEMS:27]; "StockAss_BoMHdr")
	StockAss_BoM2
	
	PRT_SetPrinterPaperOptions("Stock Available")  //NG June 2005
	//Feb 2007 moved the above inside the loop
End if 
ERR_MethodTrackerReturn("StockAss AvailP"; $_t_oldMethodName)