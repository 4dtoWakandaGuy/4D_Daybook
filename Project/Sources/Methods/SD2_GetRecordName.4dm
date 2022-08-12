//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetRecordName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_KeepLoaded; $2)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetRecordName")

//This method returns the record' name of the current record

$0:=""
If (Count parameters:C259>=1)
	$_l_TableNumber:=Table:C252($1)
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			
			If ([COMPANIES:2]Company_Name:2="")
				If ([COMPANIES:2]Address_Line_one:3#"")
					$0:="("+[COMPANIES:2]Address_Line_one:3+")"
				Else 
					If ([COMPANIES:2]Deleted:61=1)
						$0:="("+"Company Deleted"+")"
					Else 
						If ([COMPANIES:2]Company_Code:1#"")
							$0:="("+"Unknown"+")"
						End if 
					End if 
				End if 
				
			Else 
				$0:=[COMPANIES:2]Company_Name:2
			End if 
		: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			If ([CONTACTS:1]Contact_Name:31#"")
				$0:=[CONTACTS:1]Contact_Name:31
			Else 
				If ([CONTACTS:1]Surname:5#"")
					$0:=[CONTACTS:1]Surname:5
				Else 
					$0:="???"
				End if 
			End if 
		: ($_l_TableNumber=Table:C252(->[ACCOUNTS:32]))
			$0:=[ACCOUNTS:32]Account_Name:3
			
			
		: ($_l_TableNumber=Table:C252(->[CONTRACTS:17]))
			QUERY:C277([CONTRACT_TYPES:19]; [CONTRACT_TYPES:19]Contract_Type_Code:1=[CONTRACTS:17]Contract_Type_Code:4)
			$0:=[CONTRACT_TYPES:19]Contract_Type_Name:2
			UNLOAD RECORD:C212([CONTRACT_TYPES:19])
		: ($_l_TableNumber=Table:C252(->[DIARY:12]))
			$0:=[DIARY:12]Subject:63
		: ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
			$0:=[DOCUMENTS:7]Heading:2
		: ($_l_TableNumber=Table:C252(->[INVOICES:39]))
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INVOICES:39]Company_Code:2)
			
			If ([COMPANIES:2]Company_Name:2="")
				If ([COMPANIES:2]Address_Line_one:3#"")
					$0:="("+[COMPANIES:2]Address_Line_one:3+")"
				Else 
					If ([COMPANIES:2]Deleted:61=1)
						$0:="("+"Company Deleted"+")"
					Else 
						If ([COMPANIES:2]Company_Code:1#"")
							$0:="("+"Unknown"+")"
						End if 
					End if 
				End if 
				
			Else 
				$0:=[COMPANIES:2]Company_Name:2
			End if 
			UNLOAD RECORD:C212([COMPANIES:2])
		: ($_l_TableNumber=Table:C252(->[JOB PERSONNEL:48]))
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB PERSONNEL:48]Job_Code:1)
			QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=[JOB PERSONNEL:48]Job_stage_Code:17)
			$0:=[JOBS:26]Job_Name:2+" "+[JOB_STAGES:47]Stage_Name:3+" "+[JOB PERSONNEL:48]X_Job_Person_Name:12
			UNLOAD RECORD:C212([JOBS:26])
			UNLOAD RECORD:C212([JOB_STAGES:47])
		: ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)
			$0:=[JOBS:26]Job_Name:2+" "+[JOB_STAGES:47]Stage_Name:3
		: ($_l_TableNumber=Table:C252(->[JOBS:26]))
			$0:=[JOBS:26]Job_Name:2
		: ($_l_TableNumber=Table:C252(->[ORDER_ITEMS:25]))
			$0:=[ORDER_ITEMS:25]Order_Code:1+"  "+String:C10([ORDER_ITEMS:25]Item_Number:27)+":"+[ORDER_ITEMS:25]Product_Name:13
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INVOICES:39]Company_Code:2)
			
			If ([COMPANIES:2]Company_Name:2="")
				If ([COMPANIES:2]Address_Line_one:3#"")
					$0:="("+[COMPANIES:2]Address_Line_one:3+")"
				Else 
					If ([COMPANIES:2]Deleted:61=1)
						$0:="("+"Company Deleted"+")"
					Else 
						If ([COMPANIES:2]Company_Code:1#"")
							$0:="("+"Unknown"+")"
						End if 
					End if 
				End if 
				
			Else 
				$0:=[COMPANIES:2]Company_Name:2
			End if 
			UNLOAD RECORD:C212([COMPANIES:2])
			
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			$0:=[PRODUCTS:9]Product_Name:2
		: ($_l_TableNumber=Table:C252(->[PROJECTS:89]))
			$0:=[PROJECTS:89]Project_Name:2
		: ($_l_TableNumber=Table:C252(->[PURCHASE_ORDERS:57]))
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PURCHASE_ORDERS:57]Company_Code:1)
			
			If ([COMPANIES:2]Company_Name:2="")
				If ([COMPANIES:2]Address_Line_one:3#"")
					$0:="("+[COMPANIES:2]Address_Line_one:3+")"
				Else 
					If ([COMPANIES:2]Deleted:61=1)
						$0:="("+"Company Deleted"+")"
					Else 
						If ([COMPANIES:2]Company_Code:1#"")
							$0:="("+"Unknown"+")"
						End if 
					End if 
				End if 
				
			Else 
				$0:=[COMPANIES:2]Company_Name:2
			End if 
			UNLOAD RECORD:C212([COMPANIES:2])
		: ($_l_TableNumber=Table:C252(->[PURCHASE_INVOICES:37]))
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PURCHASE_INVOICES:37]Company_Code:2)
			
			If ([COMPANIES:2]Company_Name:2="")
				If ([COMPANIES:2]Address_Line_one:3#"")
					$0:="("+[COMPANIES:2]Address_Line_one:3+")"
				Else 
					If ([COMPANIES:2]Deleted:61=1)
						$0:="("+"Company Deleted"+")"
					Else 
						If ([COMPANIES:2]Company_Code:1#"")
							$0:="("+"Unknown"+")"
						End if 
					End if 
				End if 
				
			Else 
				$0:=[COMPANIES:2]Company_Name:2
			End if 
			UNLOAD RECORD:C212([COMPANIES:2])
			
		: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[SERVICE_CALLS:20]Company_Code:1)
			
			If ([COMPANIES:2]Company_Name:2="")
				If ([COMPANIES:2]Address_Line_one:3#"")
					$0:="("+[COMPANIES:2]Address_Line_one:3+")"
				Else 
					If ([COMPANIES:2]Deleted:61=1)
						$0:="("+"Company Deleted"+")"
					Else 
						If ([COMPANIES:2]Company_Code:1#"")
							$0:="("+"Unknown"+")"
						End if 
					End if 
				End if 
				
			Else 
				$0:=[COMPANIES:2]Company_Name:2
			End if 
			UNLOAD RECORD:C212([COMPANIES:2])
			
		: ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENTS:40]))
			$0:=[STOCK_MOVEMENTS:40]Movement_Type:6+":"+String:C10([STOCK_MOVEMENTS:40]Movement_Date:5; 4)
			
		: ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCHES:30]))
			$0:=String:C10([TRANSACTION_BATCHES:30]Batch_Date:1; 4)+" :"+String:C10([TRANSACTION_BATCHES:30]Batch_Amount:3)
			
	End case 
	If (Count parameters:C259>=2)
		$_bo_KeepLoaded:=$2
	Else 
		$_bo_KeepLoaded:=False:C215
	End if 
	//by default this will unload the record  is pointing at
	If (Not:C34($_bo_KeepLoaded))
		UNLOAD RECORD:C212($1->)
	End if 
End if 
ERR_MethodTrackerReturn("SD2_GetRecordName"; $_t_oldMethodName)
