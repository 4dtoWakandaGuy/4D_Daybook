//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetSalesOrderState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	C_BOOLEAN:C305($_bo_AskState; $4)
	C_LONGINT:C283($_l_CompareState; $_l_ItemNumber; $_l_Return; $_l_TableNumber; $0; $1; $3)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetSalesOrderState")
READ ONLY:C145([ORDERS:24])

READ ONLY:C145([JOBS:26])
READ ONLY:C145([JOB_STAGES:47])
READ ONLY:C145([CONTRACTS:17])
READ ONLY:C145([PROJECTS:89])

If (Count parameters:C259>=4)
	$_bo_AskState:=$4
Else 
	$_bo_AskState:=True:C214
End if 
$0:=0
If (Count parameters:C259>=2)
	If ($1>0) & ($2#"")
		Case of 
			: ($1=Table:C252(->[ORDERS:24]))
				//related to a sales order
				If ([ORDERS:24]Order_Code:3#$2)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$2)
				End if 
				
				$_l_TableNumber:=$1
				If ([ORDERS:24]State:15="")
					States_Start(->[ORDERS:24]State:15)
				End if 
				If ([TABLE_RECORD_STATES:90]State_Reference:4#[ORDERS:24]State:15)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[ORDERS:24]State:15)
				End if 
			: ($1=Table:C252(->[JOBS:26]))
				//elated to a Job
				If ([JOBS:26]Job_Code:1#$2)
					QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$2)
				End if 
				$_l_TableNumber:=$1
				If ([JOBS:26]State:9="")
					States_Start(->[JOBS:26]State:9)
				End if 
				If ([TABLE_RECORD_STATES:90]State_Reference:4#[JOBS:26]State:9)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[JOBS:26]State:9)
					
				End if 
				
				
				
			: ($1=Table:C252(->[JOB_STAGES:47]))
				//related to a Job "
				// the state will be the state of the JOB
				If ([JOB_STAGES:47]Stage_Code:2#$2)
					QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2=$2)
				End if 
				If ([JOB_STAGES:47]Job_Code:1#"")
					If ([JOBS:26]Job_Code:1#[JOB_STAGES:47]Job_Code:1)
						QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)
					End if 
					$_l_TableNumber:=$1
					If ([JOBS:26]State:9="")
						States_Start(->[JOBS:26]State:9)
					End if 
					If ([TABLE_RECORD_STATES:90]State_Reference:4#[JOBS:26]State:9)
						QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[JOBS:26]State:9)
					End if 
					
				Else 
					//no job
				End if 
			: ($1=Table:C252(->[PROJECTS:89]))  //related to a Project
				
				If ([PROJECTS:89]Project_Code:1#$2)
					QUERY:C277([PROJECTS:89]; [PROJECTS:89]Project_Code:1=$2)
				End if 
				$_l_TableNumber:=$1
				If ([PROJECTS:89]State:9="")
					States_Start(->[PROJECTS:89]State:9)
				End if 
				If ([TABLE_RECORD_STATES:90]State_Reference:4#[PROJECTS:89]State:9)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[PROJECTS:89]State:9)
				End if 
				
				
		End case 
		If ([TABLE_RECORD_STATES:90]xPipeStateID:7=0) & ($3=0)
			If ($_bo_AskState)
				//no state is set up
				SP_LoadStates
				
				$_l_Return:=0
				Case of 
					: (Records in selection:C76([TABLE_RECORD_STATES:90])=1)
						//OK
						$_l_ItemNumber:=AA_ListSelector(->SP_at_ListPipelineStatus; "Status for file state "+[TABLE_RECORD_STATES:90]Entry_Name:5+" is not setup."+" Please select the correct Status")
						If ($_l_ItemNumber>0)
							$_l_Return:=SP_al_ListPipelineStatus{$_l_ItemNumber}
						End if 
						
					Else 
						//not OK
						$_l_ItemNumber:=AA_ListSelector(->SP_at_ListPipelineStatus; "There is no Reference for this file state."+" Please select the correct Status")
						If ($_l_ItemNumber>0)
							$_l_Return:=SP_al_ListPipelineStatus{$_l_ItemNumber}
						End if 
						
				End case 
				$0:=$_l_Return
			Else 
				$0:=0
			End if 
			
			
			
			
			
		Else 
			
			$_l_CompareState:=[TABLE_RECORD_STATES:90]xPipeStateID:7
			If ($_l_CompareState>0)
				$0:=$_l_CompareState
			Else 
				$0:=$3
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SP_GetSalesOrderState"; $_t_oldMethodName)
