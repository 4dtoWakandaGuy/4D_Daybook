//%attributes = {}
If (False:C215)
	//Project Method Name:      Start Files
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($i; $No)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start Files")
//Start Files
If (Records in selection:C76([IDENTIFIERS:16])<30)  //changed from 29 to 30, 23/03/07 -kmw
	READ WRITE:C146([IDENTIFIERS:16])
	$i:=Records in selection:C76([IDENTIFIERS:16])+1
	While ($i<31)  //changed from 30 to 31, 23/03/07 -kmw
		CREATE RECORD:C68([IDENTIFIERS:16])
		[IDENTIFIERS:16]Table_Number:1:=$i
		Case of 
			: ($i=1)
				[IDENTIFIERS:16]Name:3:="Companies"
			: ($i=2)
				[IDENTIFIERS:16]Name:3:="Contacts"
			: ($i=3)
				[IDENTIFIERS:16]Name:3:="Diary"
			: ($i=4)
				[IDENTIFIERS:16]Name:3:="Invoices"
			: ($i=5)
				[IDENTIFIERS:16]Name:3:="Letters"
			: ($i=6)
				[IDENTIFIERS:16]Name:3:="Orders"
			: ($i=7)
				[IDENTIFIERS:16]Name:3:="Batches"
			: ($i=8)
				[IDENTIFIERS:16]Name:3:="Purchases"
			: ($i=9)
				[IDENTIFIERS:16]Name:3:="Contracts"
			: ($i=10)
				[IDENTIFIERS:16]Name:3:="Movements"
			: ($i=11)
				[IDENTIFIERS:16]Name:3:="Other"
			: ($i=12)
				[IDENTIFIERS:16]Name:3:="Calls"
			: ($i=13)
				[IDENTIFIERS:16]Name:3:="Delivery Notes"
			: ($i=14)
				[IDENTIFIERS:16]Name:3:="Order Items"
			: ($i=15)
				[IDENTIFIERS:16]Name:3:="Deposits"
			: ($i=16)
				[IDENTIFIERS:16]Name:3:="Purchase Orders"
			: ($i=17)
				[IDENTIFIERS:16]Name:3:="Jobs"
			: ($i=18)
				[IDENTIFIERS:16]Name:3:="Stock Nos"
			: ($i=19)
				[IDENTIFIERS:16]Name:3:="Proformas"
			: ($i=20)
				[IDENTIFIERS:16]Name:3:="Sequences"
			: ($i=21)
				[IDENTIFIERS:16]Name:3:="Price Table"
			: ($i=25)
				[IDENTIFIERS:16]Name:3:="Credit Notes"
			: ($i=26)
				[IDENTIFIERS:16]Name:3:="Export Batch"
			: ($i=27)
				[IDENTIFIERS:16]Name:3:="Export Doc"
			: ($i=28)
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=8)
				$No:=[IDENTIFIERS:16]Number:2
				CREATE RECORD:C68([IDENTIFIERS:16])
				[IDENTIFIERS:16]Table_Number:1:=$i
				[IDENTIFIERS:16]Number:2:=$No
				[IDENTIFIERS:16]Name:3:="Payments"
			: ($i=30)  //added 23/03/07 -kmw
				[IDENTIFIERS:16]Name:3:="Projects"  //added 23/03/07 -kmw
		End case 
		DB_SaveRecord(->[IDENTIFIERS:16])
		$i:=$i+1
	End while 
	UNLOAD RECORD:C212([IDENTIFIERS:16])
	READ ONLY:C145([IDENTIFIERS:16])
	User_Vers37106B  //Updates those records that need Multiple Numbers
End if 
ERR_MethodTrackerReturn("Start Files"; $_t_oldMethodName)