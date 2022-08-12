//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_JSCopy
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 11:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_All; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_NextOrderSortReference; $_l_PeriodID; $_l_RecordsinSelection; vST; xNext)
	C_REAL:C285(vTot3)
	C_TEXT:C284(<>WIP_t_CIPTRANS; $_t_From; $_t_oldMethodName; $_t_To)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_JSCopy")
//OrdersI JSCopy - Job Stages Functions menu
Menu_Record("OrderI_JSCopy"; "Copy or Move Items")
If (Records in selection:C76([ORDER_ITEMS:25])>0)
	If (FORM Get current page:C276>1)
		If ([ORDER_ITEMS:25]Product_Code:2="")
			FIRST RECORD:C50([ORDER_ITEMS:25])
		End if 
		If (Records in selection:C76([ORDER_ITEMS:25])>1)
			Gen_Confirm("Do you want to copy or move All Cost Items, or just the one selected: "+[ORDER_ITEMS:25]Product_Code:2+"?"; "Selected"; "All")
			If (OK=1)
				$_bo_All:=False:C215
				ONE RECORD SELECT:C189([ORDER_ITEMS:25])
			Else 
				$_bo_All:=True:C214
			End if 
		Else 
			$_bo_All:=False:C215
		End if 
		If (FORM Get current page:C276=2)
			$_t_From:="Budget"
			$_t_To:="Actual"
		Else 
			$_t_To:="Budget"
			$_t_From:="Actual"
		End if 
		Gen_Confirm3("Do you want to Move or to Copy the Cost Item(s) from "+$_t_From+" to "+$_t_To+"?"; "Copy"; "Cancel"; "Move")
		If (OK=1) | (xNext=1)
			
			DB_bo_RecordModified:=False:C215
			
			
			If ($_t_From="Budget")
				If ((DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & ([JOBS:26]Use_WIP:47) & ((<>WIP_t_CIPTRANS#"") & (Records in selection:C76([ORDER_ITEMS:25])>0)))
					
					If (False:C215)  //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
						Gen_Confirm("Do you want to post WIP Amounts?"; "Yes"; "No")
						If (OK=1)
							vDate:=<>DB_d_CurrentDate
							$_l_PeriodID:=Check_Period
							Check_PerClose
							If ((OK=1) & ([PERIODS:33]Period_Code:1#""))
								//  START TRANSACTION
								StartTransaction  // 13/05/02 pb
								
								Jobs_WIPStart("Posted from 'Copy or Move Items'"; <>DB_d_CurrentDate)
								Form_SRArray(0)
							End if 
						End if 
					End if   //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
					
				End if 
			End if 
			
			If (xNext=1)
				
				FIRST RECORD:C50([ORDER_ITEMS:25])
				While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
					If ($_t_From="Budget")
						[ORDER_ITEMS:25]State:46:="A"
					Else 
						[ORDER_ITEMS:25]State:46:="B"
					End if 
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					
					If (False:C215)  //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
						Jobs_CostWIP
						[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=Round:C94(([JOB_STAGES:47]JC_WIP_Cost_Amount:44+[ORDER_ITEMS:25]Cost_Amount:15); 2)
						[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount:43+[JOB_STAGES:47]JC_WIP_Cost_Amount:44); 2)
					End if   //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
					
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End while 
				
			Else 
				
				FIRST RECORD:C50([ORDER_ITEMS:25])
				CREATE SET:C116([ORDER_ITEMS:25]; "$_t_TooCopy")
				$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
				
				For ($_l_Index; 1; $_l_RecordsinSelection)
					USE SET:C118("$_t_TooCopy")
					GOTO SELECTED RECORD:C245([ORDER_ITEMS:25]; $_l_Index)
					
					//While (Not(End selection([ORDER ITEMS])))
					COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Sel")
					DUPLICATE RECORD:C225([ORDER_ITEMS:25])
					[ORDER_ITEMS:25]x_ID:58:=0
					
					OrderI_No
					[ORDER_ITEMS:25]Delivery_Date:11:=!00-00-00!
					[ORDER_ITEMS:25]Item_Locked:16:=False:C215
					[ORDER_ITEMS:25]Invoice_Number:17:=""
					[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
					[ORDER_ITEMS:25]Serial_Number:24:=""
					[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
					[ORDER_ITEMS:25]Allocated:28:=0
					[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
					//Prob setting sort order here
					
					$_l_NextOrderSortReference:=1
					If ($_t_From="Budget")
						[ORDER_ITEMS:25]State:46:="A"
						$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; ""; $_l_NextOrderSortReference; "A")
						//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order Code;$_l_NextOrderSortReference)
						[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
						[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
					Else 
						[ORDER_ITEMS:25]State:46:="B"
						$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; ""; $_l_NextOrderSortReference; "B")
						//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order Code;$_l_NextOrderSortReference)
						[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
						[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
					End if 
					
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					
					If (False:C215)  //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
						Jobs_CostWIP
						[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=Round:C94(([JOB_STAGES:47]JC_WIP_Cost_Amount:44+[ORDER_ITEMS:25]Cost_Amount:15); 2)
						[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount:43+[JOB_STAGES:47]JC_WIP_Cost_Amount:44); 2)
					End if   //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
					
					//USE NAMED SELECTION("$Sel")
					//NEXT RECORD([ORDER ITEMS])
					//End while
				End for 
			End if 
			
			
		End if 
		
		If (False:C215)  //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
			
			If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
				OrderI_LevelSrc(0)
				vST:=0
			End if 
			If ($_t_From="Budget")
				COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Sel")
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A")
				[JOB_STAGES:47]JC_Actual_Cost_Amount:32:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
				[JOB_STAGES:47]JC_Actual_Sales_Amount:31:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
				USE NAMED SELECTION:C332("$Sel")
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="B")
				[JOB_STAGES:47]JC_Budget_Cost_Amount:34:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
				[JOB_STAGES:47]JC_Budget_Sales_Amount:33:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
			Else 
				COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Sel")
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="B")
				[JOB_STAGES:47]JC_Budget_Cost_Amount:34:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
				[JOB_STAGES:47]JC_Budget_Sales_Amount:33:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
				USE NAMED SELECTION:C332("$Sel")
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A")
				[JOB_STAGES:47]JC_Actual_Cost_Amount:32:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
				[JOB_STAGES:47]JC_Actual_Sales_Amount:31:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
			End if 
			JobStages_InT2
			
			vTot3:=1
		End if   //added 13/03/07 -kmw (all Time, Cost and WIP posting handled from triggers/process services now)
		
		JC_UpdateJSAllTotals  //added 13/03/07 -kmw (trigger will (in this case unnessarily) do this later on but do it here so user gets immediate feedback)
		
		DB_bo_RecordModified:=True:C214
		
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
	Else 
		Gen_Alert("This Function can only be used from the Budget or Actual Costs pages"; "Cancel")
	End if 
Else 
	Gen_Alert("This Function copies or moves existing Cost Items - there are none"; "Cancel")
End if 
ERR_MethodTrackerReturn("OrderI_JSCopy"; $_t_oldMethodName)