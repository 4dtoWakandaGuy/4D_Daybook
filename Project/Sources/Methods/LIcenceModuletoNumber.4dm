//%attributes = {}
If (False:C215)
	//Project Method Name:      LIcenceModuletoNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LIcenceModuletoNumber")

//This method will return a constant for a given input
$0:=0
If (Count parameters:C259>=1)
	Case of 
		: (Position:C15("Marketing"; $1)>0)
			$0:=Module_DiaryManager
		: (Position:C15("Sequences"; $1)>0)
			$0:=Module_Sequences
		: (Position:C15("Enquiries"; $1)>0)
			$0:=Module_Enquiries
			
		: (Position:C15("Price Table"; $1)>0)
			$0:=Module_PriceTable
		: (Position:C15("Campaign Manager"; $1)>0)
			$0:=14
		: (Position:C15("Sales Manager"; $1)>0)
			$0:=Module_SalesManager
		: (Position:C15("Word Processor"; $1)>0)
			$0:=Module_WPManager
		: (Position:C15("Mailsort"; $1)>0)
			$0:=31
		: (Position:C15("Stock"; $1)>0)
			$0:=Module_StockControl
		: (Position:C15("Assemblies"; $1)>0)
			$0:=Module_Assemblies
		: (Position:C15("Serial Nos"; $1)>0)
			$0:=Module_SerialNos
		: (Position:C15("Sales Orders"; $1)>0)
			$0:=Module_SalesOrders
		: (Position:C15("Purchase Orders"; $1)>0)
			$0:=Module_PurchaseOrders
		: (Position:C15("Sales Ledger"; $1)>0)
			$0:=Module_SalesLedger
		: (Position:C15("Purchase Ledger"; $1)>0)
			$0:=Module_PurchaseLedger
			
		: (Position:C15("Cheque Writer"; $1)>0)  //: (Position("Check Writer";$1)>0) `Changed (corrected typo leading to cheque writer module not being licenced) - 11/12/08 v631b120l -kmw
			$0:=Module_ChequeWriter
		: (Position:C15("General Ledger"; $1)>0)
			$0:=Module_NominalLedger
		: (Position:C15("Multi Currency"; $1)>0)
			$0:=Module_MultiCurrency
		: (Position:C15("Multi Layer"; $1)>0)
			$0:=Module_MultiLayer
		: (Position:C15("Service Control"; $1)>0)
			$0:=Module_ServiceCentre
			
			
		: (Position:C15("Job Costing"; $1)>0)
			$0:=Module_JobCosting
		: (Position:C15("Ad Booking"; $1)>0)
			$0:=19
		: (Position:C15("Remote access"; $1)>0)
			$0:=21
		: (Position:C15("Macros"; $1)>0)
			$0:=Module_Macros
		: (Position:C15("QuickAddress"; $1)>0)
		: (Position:C15("Subscription"; $1)>0)
			$0:=Module_Subscriptions
		: (Position:C15("Fax Manager"; $1)>0)
			$0:=Module_FaxManager
		: (Position:C15("Internet manager"; $1)>0)
			$0:=Module_IntServer
	End case 
End if 


If ($0=0)  //Added 11/12/08 v631b120l -kmw
	//TRACE//Added 11/12/08 v631b120l -kmw
End if   //Added 11/12/08 v631b120l -kmw
ERR_MethodTrackerReturn("LIcenceModuletoNumber"; $_t_oldMethodName)