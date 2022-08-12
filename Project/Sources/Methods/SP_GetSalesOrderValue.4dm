//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetSalesOrderValue
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
	//C_UNKNOWN($0)
	//C_UNKNOWN($1)
	//C_UNKNOWN($2)
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN($6)
	//C_UNKNOWN(APR_SPOrderAmount2)
	//C_UNKNOWN(APR_SPOrderAmount3)
	//C_UNKNOWN(BPR_SPprojectAmount2)
	//C_UNKNOWN(M_Returnamount)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_LONGINT:C283($1; APR_SPOrderAmount2; APR_SPOrderAmount3; BPR_SPprojectAmount2; $_l_Index)
	C_POINTER:C301($4; $5; $6; $3)
	C_REAL:C285($_r_TotalValue; $0; M_Returnamount; SP_R_OrderCostPlusPercent; $_r_CostAmount; $_r_TotalValue; SP_R_OrderCostPlusPercent)
	C_TEXT:C284($2; SP_t_OrderCostScript; SP_t_ProjectCostScript; $_t_oldMethodName; SP_t_OrderCostScript; SP_t_ProjectCostScript)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetSalesOrderValue")
SP_LoadGenPrefs
$0:=0

If (Count parameters:C259>=2)
	If ($1>0) & ($2#"")
		Case of 
			: ($1=Table:C252(->[ORDERS:24]))
				If ([ORDERS:24]Order_Code:3#$2)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$2)
				End if 
				$0:=[ORDERS:24]Total_Amount:6
				If ([ORDERS:24]Forecast_Date:23#!00-00-00!)
					$5->:=[ORDERS:24]Forecast_Date:23
				End if 
				If ([ORDERS:24]Forecast_PC:22>0)
					$4->:=[ORDERS:24]Forecast_PC:22
				End if 
				//$file:=$1
				If ([ORDERS:24]State:15="")
					States_Start(->[ORDERS:24]State:15)
				End if 
				If ([TABLE_RECORD_STATES:90]State_Reference:4#[ORDERS:24]State:15)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[ORDERS:24]State:15)
				End if 
				If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
					If ([TABLE_RECORD_STATES:90]xStateClass:8=2)
						$_r_TotalValue:=[ORDERS:24]Total_Amount:6
						Case of 
							: (APR_SPOrderAmount2=1)
								//cost plus a%
								$_r_CostAmount:=Round:C94(([ORDERS:24]Total_Cost:11*SP_R_OrderCostPlusPercent)/100; 2)
								$6->:=[ORDERS:24]Total_Cost:11+$_r_CostAmount
							: (APR_SPOrderAmount3=1)
								//use a macro
								M_Returnamount:=$6->
								Macro_AccType(SP_t_OrderCostScript; True:C214)
								$6->:=M_Returnamount
						End case 
						
					Else 
						$_r_TotalValue:=0
					End if 
					UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
				Else 
					READ ONLY:C145([ORDER_ITEMS:25])
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17#"")
					$_r_TotalValue:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
				End if 
				//This is an order
				$3->:=$_r_TotalValue
			: ($1=Table:C252(->[PROJECTS:89]))
				
				If ([PROJECTS:89]Project_Code:1#$2)
					QUERY:C277([PROJECTS:89]; [PROJECTS:89]Project_Code:1=$2)
				End if 
				//$file:=$1
				If ([PROJECTS:89]State:9="")
					States_Start(->[PROJECTS:89]State:9)
				End if 
				If ([TABLE_RECORD_STATES:90]State_Reference:4#[PROJECTS:89]State:9)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[PROJECTS:89]State:9)
				End if 
				If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
					If ([TABLE_RECORD_STATES:90]xStateClass:8=2)
						QUERY:C277([JOBS:26]; [JOBS:26]Project_Code:27=[PROJECTS:89]Project_Code:1)
						RELATE MANY SELECTION:C340([JOB_STAGES:47]Job_Code:1)
						QUERY SELECTION:C341([JOB_STAGES:47]; [JOB_STAGES:47]Invoice_Number:10#"")
						SELECTION TO ARRAY:C260([JOB_STAGES:47]Invoice_Number:10; $_at_InvoiceNumbers)
						CREATE EMPTY SET:C140([INVOICES:39]; "Temp")
						For ($_l_Index; 1; Size of array:C274($_at_InvoiceNumbers))
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
							ADD TO SET:C119([INVOICES:39]; "Temp")
						End for 
						USE SET:C118("Temp")
						$3->:=Sum:C1([INVOICES:39]Total_Invoiced:5)
						Case of 
							: (BPR_SPprojectAmount2=1)
								//use a macro
								M_Returnamount:=$6->
								Macro_AccType(SP_t_ProjectCostScript; True:C214)
								$6->:=M_Returnamount
						End case 
					Else 
						$_r_TotalValue:=0
					End if 
					UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
				Else 
					QUERY:C277([JOBS:26]; [JOBS:26]Project_Code:27=[PROJECTS:89]Project_Code:1)
					RELATE MANY SELECTION:C340([JOB_STAGES:47]Job_Code:1)
					QUERY SELECTION:C341([JOB_STAGES:47]; [JOB_STAGES:47]Invoice_Number:10#"")
					SELECTION TO ARRAY:C260([JOB_STAGES:47]Invoice_Number:10; $_at_InvoiceNumbers)
					CREATE EMPTY SET:C140([INVOICES:39]; "Temp")
					For ($_l_Index; 1; Size of array:C274($_at_InvoiceNumbers))
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
						ADD TO SET:C119([INVOICES:39]; "Temp")
					End for 
					USE SET:C118("Temp")
					$3->:=Sum:C1([INVOICES:39]Total_Invoiced:5)
					If ($3->>0)
						Case of 
							: (BPR_SPprojectAmount2=1)
								//use a macro
								M_Returnamount:=$6->
								Macro_AccType(SP_t_ProjectCostScript; True:C214)
								$6->:=M_Returnamount
						End case 
					End if 
					
				End if 
				UNLOAD RECORD:C212([INVOICES:39])
				UNLOAD RECORD:C212([JOB_STAGES:47])
			: ($1=Table:C252(->[JOBS:26]))
				
				If ([JOBS:26]Job_Code:1#$2)
					QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$2)
				End if 
				//$file:=$1
				If ([JOBS:26]State:9="")
					States_Start(->[JOBS:26]State:9)
				End if 
				If ([TABLE_RECORD_STATES:90]State_Reference:4#[JOBS:26]State:9)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[JOBS:26]State:9)
				End if 
				If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
					
					$_r_TotalValue:=0
					
					UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
					
					
				End if 
				UNLOAD RECORD:C212([INVOICES:39])
				
				
				
				
				
		End case 
	End if 
	
End if 
ERR_MethodTrackerReturn("SP_GetSalesOrderValue"; $_t_oldMethodName)
