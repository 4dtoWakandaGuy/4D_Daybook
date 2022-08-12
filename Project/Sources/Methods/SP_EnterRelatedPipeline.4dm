//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_EnterRelatedPipeline
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 12:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_New; $_bo_NewProcess)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_DiaryID; $_l_OpenSPID; $_l_PersonID; $_l_Process; $_l_TableNumber)
	C_POINTER:C301($1)
	C_REAL:C285($_r_Amount; $_r_CostPrice)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_CurrencyCode; $_t_oldMethodName; $_t_RecordCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_EnterRelatedPipeline")
//$_l_Process:=False

$_l_DiaryID:=0
Case of 
	: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
		If ([COMPANIES:2]x_ID:63>0)
			//$_l_Process:=True
			$_l_PersonID:=<>PER_l_CurrentUserID
			$_l_TableNumber:=0
			$_t_RecordCode:=""
			$_t_CurrencyCode:=""
			$_r_Amount:=0
			$_r_CostPrice:=0
			$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
			$_t_ContactCode:=""
			$_bo_New:=True:C214
		End if 
		
	: (Table:C252($1)=Table:C252(->[ORDERS:24]))
		If ([ORDERS:24]Order_Code:3#"") & ([ORDERS:24]Company_Code:1#"")
			If ([ORDERS:24]x_ID:58=0)
				[ORDERS:24]x_ID:58:=AA_GetNextIDinMethod(->[ORDERS:24]x_ID:58)
				DB_SaveRecord(->[ORDERS:24])
				AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
			End if 
			//$_l_Process:=True
			$_l_PersonID:=<>PER_l_CurrentUserID
			$_l_TableNumber:=Table:C252(->[ORDERS:24])
			$_t_RecordCode:=[ORDERS:24]Order_Code:3
			$_t_CurrencyCode:=[ORDERS:24]Currency_Code:32
			$_r_Amount:=[ORDERS:24]Total_Amount:6
			$_r_CostPrice:=[ORDERS:24]Total_Cost:11
			$_t_CompanyCode:=[ORDERS:24]Company_Code:1
			$_t_ContactCode:=[ORDERS:24]Contact_Code:2
			READ ONLY:C145([SALES_PROJECTION:113])
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]RelatedSaleTableID:8=$_l_TableNumber; *)
			QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=[ORDERS:24]x_ID:58)
			
			If (Records in selection:C76([SALES_PROJECTION:113])=0)
				$_bo_New:=True:C214
			Else 
				$_bo_New:=False:C215
				$_l_OpenSPID:=[SALES_PROJECTION:113]x_ID:1
			End if 
			UNLOAD RECORD:C212([SALES_PROJECTION:113])
		End if 
	: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
		If ([CONTACTS:1]Contact_Code:2#"") & ([CONTACTS:1]Company_Code:1#"")
			If ([CONTACTS:1]x_ID:33=0)
				[CONTACTS:1]x_ID:33:=AA_GetNextIDinMethod(->[CONTACTS:1]x_ID:33)
				DB_SaveRecord(->[CONTACTS:1])
				AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			End if 
			//$_l_Process:=True
			$_l_PersonID:=<>PER_l_CurrentUserID
			$_l_TableNumber:=0
			$_t_RecordCode:=""
			$_t_CurrencyCode:=""
			$_r_Amount:=0
			$_r_CostPrice:=0
			$_t_CompanyCode:=[CONTACTS:1]Company_Code:1
			$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
			$_bo_New:=True:C214
		End if 
	: (Table:C252($1)=Table:C252(->[CONTRACTS:17]))
		If ([CONTRACTS:17]Contract_Code:3#"") & ([CONTRACTS:17]Company_Code:1#"")
			If ([CONTRACTS:17]x_ID:12=0)
				[CONTRACTS:17]x_ID:12:=AA_GetNextIDinMethod(->[CONTRACTS:17]x_ID:12)
				DB_SaveRecord(->[CONTRACTS:17])
				AA_CheckFileUnlocked(->[CONTRACTS:17]x_ID:12)
			End if 
			//$_l_Process:=True
			$_l_PersonID:=<>PER_l_CurrentUserID
			$_l_TableNumber:=Table:C252(->[CONTRACTS:17])
			$_t_RecordCode:=[CONTRACTS:17]Contract_Code:3
			$_t_CurrencyCode:=""
			$_r_Amount:=[CONTRACTS:17]Contract_Cost:7
			$_r_CostPrice:=0
			$_t_CompanyCode:=[CONTRACTS:17]Company_Code:1
			$_t_ContactCode:=[CONTRACTS:17]Contact_Code:2
			READ ONLY:C145([SALES_PROJECTION:113])
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]RelatedSaleTableID:8=$_l_TableNumber; *)
			QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=[CONTRACTS:17]x_ID:12)
			
			If (Records in selection:C76([SALES_PROJECTION:113])=0)
				$_bo_New:=True:C214
			Else 
				$_bo_New:=False:C215
				$_l_OpenSPID:=[SALES_PROJECTION:113]x_ID:1
			End if 
			UNLOAD RECORD:C212([SALES_PROJECTION:113])
		End if 
		
	: (Table:C252($1)=Table:C252(->[JOBS:26]))
		If ([JOBS:26]Job_Code:1#"") & ([JOBS:26]Company_Code:3#"")
			If ([JOBS:26]x_ID:49=0)
				[JOBS:26]x_ID:49:=AA_GetNextIDinMethod(->[JOBS:26]x_ID:49)
				DB_SaveRecord(->[JOBS:26])
				AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
			End if 
			//$_l_Process:=True
			$_l_PersonID:=<>PER_l_CurrentUserID
			$_l_TableNumber:=Table:C252(->[JOBS:26])
			$_t_RecordCode:=[JOBS:26]Job_Code:1
			$_t_CurrencyCode:=""
			$_r_Amount:=[JOBS:26]AS_Quoted_Amount:11
			$_r_CostPrice:=0
			$_t_CompanyCode:=[JOBS:26]Company_Code:3
			$_t_ContactCode:=[JOBS:26]Contact_Code:4
			READ ONLY:C145([SALES_PROJECTION:113])
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]RelatedSaleTableID:8=$_l_TableNumber; *)
			QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]RelatedSaleRecordID:9=[JOBS:26]x_ID:49)
			If (Records in selection:C76([SALES_PROJECTION:113])=0)
				$_bo_New:=True:C214
			Else 
				$_bo_New:=False:C215
				$_l_OpenSPID:=[SALES_PROJECTION:113]x_ID:1
			End if 
			UNLOAD RECORD:C212([SALES_PROJECTION:113])
		End if 
	: (Table:C252($1)=Table:C252(->[DIARY:12]))
		If ([DIARY:12]x_ID:50=0)
			[DIARY:12]x_ID:50:=AA_GetNextIDinMethod(->[DIARY:12]x_ID:50)
		End if 
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		If ([DIARY:12]Contact_Code:2#"") & ([DIARY:12]Company_Code:1#"")
			$_bo_NewProcess:=True:C214
			$_l_PersonID:=<>PER_l_CurrentUserID
			$_l_TableNumber:=0
			$_t_RecordCode:=""
			$_t_CurrencyCode:=""
			$_r_Amount:=0
			$_r_CostPrice:=0
			$_t_CompanyCode:=[DIARY:12]Company_Code:1
			$_t_ContactCode:=[DIARY:12]Contact_Code:2
			$_l_DiaryID:=[DIARY:12]x_ID:50
			Case of 
					
				: ([DIARY:12]Job_Code:19#"")
					$_l_TableNumber:=Table:C252(->[JOBS:26])
					$_t_RecordCode:=[DIARY:12]Job_Code:19
				: ([DIARY:12]Job_Code:19#"")
					$_l_TableNumber:=Table:C252(->[JOBS:26])
					$_t_RecordCode:=[DIARY:12]Job_Code:19
			End case 
			
			READ ONLY:C145([SALES_PROJECTION:113])
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]RelatedDiaryID:27=[DIARY:12]x_ID:50)
			If (Records in selection:C76([SALES_PROJECTION:113])=0)
				$_bo_New:=True:C214
			Else 
				$_bo_New:=False:C215
				$_l_OpenSPID:=[SALES_PROJECTION:113]x_ID:1
			End if 
			UNLOAD RECORD:C212([SALES_PROJECTION:113])
			
		Else 
			$_l_Process:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
		End if 
		
End case 

If ($_l_Process=0)
	If ($_bo_New)
		$_l_Process:=New process:C317("SP_NewPipeline"; DB_ProcessMemoryinit(1); "Enter Sales Pipeline"; $_l_Process; $_l_PersonID; $_l_TableNumber; $_t_RecordCode; $_t_CurrencyCode; $_r_Amount; $_r_CostPrice; $_t_CompanyCode; $_t_ContactCode; $_l_DiaryID)
	Else 
		$_l_Process:=New process:C317("SP_ModifyPipeline"; DB_ProcessMemoryinit(1); "View Sales Pipeline"; $_l_OpenSPID)
	End if 
Else 
	
End if 
ERR_MethodTrackerReturn("SP_EnterRelatedPipeline"; $_t_oldMethodName)
