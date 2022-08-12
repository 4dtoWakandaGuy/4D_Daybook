//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetButtonFunction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/02/2011 16:19 v7.0.0/B45
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
//TRACE
$_t_oldMethodName:=ERR_MethodTracker("DB_GetButtonFunction")
$0:=0
If (Count parameters:C259>=1)
	Case of 
		: ($1="Cancel")
			$0:=1
		: ($1="OK")
			$0:=2
		: ($1="Minus")
			$0:=3
		: ($1="Plus")
			$0:=4
		: ($1="PlusOption")
			$0:=401
		: ($1="Minus")
			$0:=5
		: ($1="Open")
			$0:=6
		: ($1="Previous")
			$0:=7
		: ($1="Next")
			$0:=8
		: ($1="First")
			$0:=9
		: ($1="Last")
			$0:=10
		: ($1="Select")
			$0:=11
		: ($1="Select")
			$0:=12
		: ($1="Sort")
			$0:=13
		: ($1="Set")
			$0:=14
		: ($1="Set")
			$0:=14
		: ($1="Report")
			$0:=15
		: ($1="Graph")
			$0:=16
		: ($1="Apply")
			$0:=17
		: ($1="Count")
			$0:=18
		: ($1="Tel")
			$0:=19
		: ($1="Diary")
			$0:=20
		: ($1="QVShow")
			$0:=29
		: ($1="QVSearch")
			$0:=30
		: ($1="SPshow")
			$0:=31
		: ($1="SPenter")
			$0:=32
		: ($1="Q2U")
			$0:=99
		: ($1="M:@")
			$0:=101
		: ($1="-1@")
			$0:=102
		: ($1="Stats")
			$0:=103
		: ($1="Refresh")
			$0:=104
		: ($1="Find")
			$0:=106
		: ($1="Find0")
			$0:=107
		: ($1="Select0")
			$0:=108
		: ($1="Close")
			$0:=109
		: ($1="Delete")
			$0:=110
		: ($1="GetFormTable")
			$0:=400
		: ($1="GetRecordCode")
			$0:=500
		: ($1="Get Company Code")
			$0:=501
		: ($1="Get Contact Code")
			$0:=502
		: ($1="Get Record ID")
			$0:=503
		: ($1="Get Company Name")
			$0:=510
		: ($1="Get Address")
			$0:=511
			
		: ($1="Enter Related Diary")
			$0:=512
		: ($1="View Related Diary")
			$0:=513
			
		: ($1="DragCopy")
			$0:=599
		: ($1="ReceiveDragged")
			$0:=600
		: ($1="RetreiveDraggedOrderLines")
			$0:=601
		: ($1="CopyProduct")
			$0:=700
		: ($1="DropStock")
			$0:=701
			
		: ($1="Auto Print")
			$0:=800
		: ($1="ReceiveBatchItem")
			$0:=801
		: ($1="GetNextBatchItem")
			$0:=802
		: ($1="DeleteBatchItem")
			$0:=803
		: ($1="AddBatchItem")
			$0:=804
		: ($1="ReloadAuths")
			$0:=820
			
		: ($1="RefreshPeriods")
			$0:=821
		: ($1="Subfunction")
			$0:=902
		: ($1="MenuReset")
			$0:=903
			
		: ($1="Refresh")  //Update related
			$0:=904
			
		: ($1="Save Quick Add")  //Update related
			$0:=2601
			
		: ($1="Cancel Quick Add")  //Update related
			$0:=2602
			
		: ($1="Clear Line Quick Add")  //Update related
			$0:=2603
			
		: ($1="Add Line Quick Add")  //Update related
			$0:=2604
			
		: ($1="Add Line Quick Repeat")  //Update related
			$0:=2704
			
		: ($1="ReloadOrderItems")
			$0:=2605
		: ($1="AutoClose")
			$0:=2606
		: ($1="StockItemSplit")
			
			$0:=(Table:C252(->[STOCK_MOVEMENTS:40])+100)+1
		: ($1="FormWindows")
			$0:=906
	End case 
	If ($0=0)
		//TRACE
		//Other numbers
		//512=
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_GetButtonFunction"; $_t_oldMethodName)
