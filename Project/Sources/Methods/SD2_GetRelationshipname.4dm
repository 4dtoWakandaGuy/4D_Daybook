//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetRelationshipname
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 14:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_DiaryFieldNumber;0)
	//ARRAY LONGINT(SD2_al_RelatedCodeFieldNumber;0)
	//ARRAY LONGINT(SD2_al_RelatedFieldNumber;0)
	//ARRAY LONGINT(SD2_al_RelatedtableNumber;0)
	//ARRAY LONGINT(SD2_al_SubrelationTables;0;0)
	//ARRAY TEXT(SD2_at_RelationShipSelector;0)
	//ARRAY TEXT(SD2_at_SubRelationNames;0;0)
	C_BOOLEAN:C305(SD2_bo_RelationsPopInit)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_RelationRow)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetRelationshipname")

If (Not:C34(SD2_bo_RelationsPopInit))
	ARRAY TEXT:C222(SD2_at_RelationShipSelector; 99)  // the name of the relation
	ARRAY LONGINT:C221(SD2_al_RelatedtableNumber; 99)
	ARRAY LONGINT:C221(SD2_al_RelatedCodeFieldNumber; 99)
	ARRAY LONGINT:C221(SD2_al_RelatedFieldNumber; 99)
	ARRAY LONGINT:C221(SD2_al_DiaryFieldNumber; 99)  //the diary field to which the related record CODE gets put(not all relations will have this)
	ARRAY LONGINT:C221(SD2_al_SubrelationTables; 99; 0)
	ARRAY TEXT:C222(SD2_at_SubRelationNames; 99; 0)
	//note that these get 'knocked out' when the action code is entered if the action has table restrictions-
	$_l_CurrentRow:=1
	SD2_at_RelationShipSelector{$_l_CurrentRow}:="Company"
	SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[COMPANIES:2])
	SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[COMPANIES:2]x_ID:63)
	SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[COMPANIES:2]Company_Code:1)
	SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=Field:C253(->[DIARY:12]Company_Code:1)
	
	$_l_CurrentRow:=$_l_CurrentRow+1
	SD2_at_RelationShipSelector{$_l_CurrentRow}:="Contact"
	SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[CONTACTS:1])
	SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[CONTACTS:1]x_ID:33)
	SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
	SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=Field:C253(->[DIARY:12]Contact_Code:2)
	
	
	If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>=2)
		
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Service Call"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[SERVICE_CALLS:20])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[SERVICE_CALLS:20]x_ID:27)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[SERVICE_CALLS:20]Call_Code:4)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=Field:C253(->[DIARY:12]Call_Code:25)
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Contract"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[CONTRACTS:17])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[CONTRACTS:17]x_ID:12)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[CONTRACTS:17]Contract_Code:3)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>=2)
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Invoice"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[INVOICES:39])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=0  //Field(->[INVOICES]x_ID)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[INVOICES:39]Invoice_Number:1)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
		If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>=2)
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_at_RelationShipSelector{$_l_CurrentRow}:="Transaction Batch"
			SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[TRANSACTION_BATCHES:30])
			SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=0  //Field(->[trans in]x_ID)
			SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[TRANSACTION_BATCHES:30]Batch_Number:10)
			SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(Module_JobCosting))>=2)
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Job Personnel"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[JOB PERSONNEL:48])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[JOB PERSONNEL:48]X_ID:14)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[JOB PERSONNEL:48]Job_Personnel_Code:18)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Job Stage"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[JOB_STAGES:47])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[JOB_STAGES:47]x_ID:54)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[JOB_STAGES:47]Job_Stage_code:52)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Job"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[JOBS:26])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[JOBS:26]x_ID:49)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[JOBS:26]Job_Code:1)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=Field:C253(->[DIARY:12]Job_Code:19)
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Project"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[PROJECTS:89])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[PROJECTS:89]X_ID:11)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[PROJECTS:89]Project_Code:1)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
	End if 
	If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>=2)
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Order Item"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[ORDER_ITEMS:25])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=0
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Order"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[ORDERS:24])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[ORDERS:24]x_ID:58)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[ORDERS:24]Order_Code:3)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=Field:C253(->[DIARY:12]Order_Code:26)
		
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>=2)
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Purchase order"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[PURCHASE_ORDERS:57])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[PURCHASE_ORDERS:57]x_ID:21)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
		If ((DB_GetModuleSettingByNUM(Module_PurchaseLedger))>=2)
			
			$_l_CurrentRow:=$_l_CurrentRow+1
			
			SD2_at_RelationShipSelector{$_l_CurrentRow}:="Purchase Invoice"
			SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[PURCHASE_INVOICES:37])
			SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[PURCHASE_INVOICES:37]x_ID:35)
			SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1)
			SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
			If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>=2)
				$_l_RelationRow:=Find in array:C230(SD2_at_RelationShipSelector; "Transaction Batch")
				If ($_l_RelationRow<0)
					$_l_CurrentRow:=$_l_CurrentRow+1
					SD2_at_RelationShipSelector{$_l_CurrentRow}:="Transaction Batch"
					SD2_at_RelationShipSelector{$_l_CurrentRow}:="Transaction Batch"
					SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[TRANSACTION_BATCHES:30])
					SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=0  //Field(->[trans in]x_ID)
					SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[TRANSACTION_BATCHES:30]Batch_Number:10)
					SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
				End if 
			End if 
			
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(Module_StockControl))>=2)
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Stock Movement"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[STOCK_MOVEMENTS:40])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=0  //Field(->[stock movements]x_ID)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1)
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
		$_l_CurrentRow:=$_l_CurrentRow+1
		SD2_at_RelationShipSelector{$_l_CurrentRow}:="Subscription"
		SD2_al_RelatedtableNumber{$_l_CurrentRow}:=Table:C252(->[SUBSCRIPTIONS:93])
		SD2_al_RelatedFieldNumber{$_l_CurrentRow}:=Field:C253(->[SUBSCRIPTIONS:93]x_ID:11)
		SD2_al_RelatedCodeFieldNumber{$_l_CurrentRow}:=0
		SD2_al_DiaryFieldNumber{$_l_CurrentRow}:=0
		
	End if 
	ARRAY TEXT:C222(SD2_at_RelationShipSelector; $_l_CurrentRow)  // the name of the relation
	ARRAY LONGINT:C221(SD2_al_RelatedtableNumber; $_l_CurrentRow)
	ARRAY LONGINT:C221(SD2_al_RelatedCodeFieldNumber; $_l_CurrentRow)
	ARRAY LONGINT:C221(SD2_al_RelatedFieldNumber; $_l_CurrentRow)
	ARRAY LONGINT:C221(SD2_al_DiaryFieldNumber; $_l_CurrentRow)  //the diary field to which the related record CODE gets put(not all relations will have this)
	
End if 
If (Count parameters:C259>=1)
	$0:=""
	For ($_l_Index; 1; Size of array:C274(SD2_al_RelatedtableNumber))
		If (SD2_al_RelatedtableNumber{$_l_Index}=$1)
			If ($2>0)
				If (SD2_al_RelatedFieldNumber{$_l_Index}>0)
					If (SD2_al_RelatedFieldNumber{$_l_Index}=$2)
						$0:=SD2_at_RelationShipSelector{$_l_Index}
						$_l_Index:=9999999
					Else 
						If (SD2_al_RelatedCodeFieldNumber{$_l_Index}>0)
							If (SD2_al_RelatedCodeFieldNumber{$_l_Index}=$2)
								$0:=SD2_at_RelationShipSelector{$_l_Index}
								$_l_Index:=9999999
							End if 
						End if 
						
					End if 
					
				Else 
					If (SD2_al_RelatedCodeFieldNumber{$_l_Index}>0)
						If (SD2_al_RelatedCodeFieldNumber{$_l_Index}=$2)
							$0:=SD2_at_RelationShipSelector{$_l_Index}
							$_l_Index:=9999999
						End if 
					End if 
				End if 
			End if 
		End if 
		
	End for 
End if 
ERR_MethodTrackerReturn("SD2_GetRelationshipname"; $_t_oldMethodName)
