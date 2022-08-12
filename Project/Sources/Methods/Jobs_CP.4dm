//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_CP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>SYS_bo_CopyPreviousDate; WIN_bo_TrackerInited)
	C_DATE:C307($_d_EndDate; $_d_RequiredDate; $_d_RequiredDate2; $_d_StartDate)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; r0; r1; r2; s1; s2; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_JobCode; $_t_JobCodeOLD; $_t_JobState; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vSolution)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_CP")
//Jobs_CP
Menu_Record("Jobs_CP"; "Copy Previous")

If (In_ButtChkMan(->[JOBS:26]; "1"))
	If (Gen_PPChkStSing(->[JOBS:26]State:9; 18))
		If (Modified record:C314([JOB_STAGES:47]))
			
			DB_SaveRecord(->[JOB_STAGES:47])
		End if 
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
		QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Invoice_Number:10#""; *)
		QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Invoice_Number:10#"N")
		If (Records in selection:C76([JOB_STAGES:47])>0)
			Gen_Alert("You cannot Copy Previous from a Job that has any Invoice Nos allocated"; "Cancel")
		Else 
			Gen_Confirm("This function copies the details of a Previous Job, overwriting those of the "+"one currently on screen"; ""; "")
			If (OK=1)
				If (Modified record:C314([JOBS:26]))
					$_t_JobCode:=[JOBS:26]Job_Code:1
					DB_SaveRecord(->[JOBS:26])
					If ($_t_JobCode="")
						[JOBS:26]Job_Code:1:=$_t_JobCode
					End if 
					
					AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
				End if 
				If (Modified record:C314([ORDER_ITEMS:25]))
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					
				End if 
				$_t_JobCode:=[JOBS:26]Job_Code:1
				$_d_StartDate:=[JOBS:26]Start_Date:6
				$_d_EndDate:=[JOBS:26]End_Date:7
				$_d_RequiredDate:=[JOBS:26]Required_Date:8
				$_t_JobState:=[JOBS:26]State:9
				CUT NAMED SELECTION:C334([JOBS:26]; "$Sel")
				
				vSolution:=""
				Open_Any_Window(222; 361; 4)
				DIALOG:C40([JOBS:26]; "dask_CP")
				CLOSE WINDOW:C154
				$_l_OK:=OK
				OK:=1
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				
				If ($_l_OK=1)
					If (vSolution#[JOBS:26]Job_Code:1)
						QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=vSolution)
					End if 
					If (Records in selection:C76([JOBS:26])>0)
						Are_You_Sure
						If (OK=1)
							
							CUT NAMED SELECTION:C334([JOBS:26]; "$Sel2")
							USE NAMED SELECTION:C332("$Sel")
							DB_DeletionControl(->[JOBS:26])
							
							DELETE RECORD:C58([JOBS:26])
							QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_t_JobCode)
							DELETE SELECTION:C66([JOB_STAGES:47])
							QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=$_t_JobCode)
							DELETE SELECTION:C66([JOB PERSONNEL:48])
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=$_t_JobCode; *)
							QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Item_Locked:16=False:C215)
							DELETE SELECTION:C66([ORDER_ITEMS:25])
							
							USE NAMED SELECTION:C332("$Sel2")
							If (r0=1)
								QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
								CREATE SET:C116([JOB_STAGES:47]; "PuMaster")
							End if 
							$_t_JobCodeOLD:=[JOBS:26]Job_Code:1
							
							DUPLICATE RECORD:C225([JOBS:26])
							[JOBS:26]x_ID:49:=0
							
							[JOBS:26]Comments:15:=[JOBS:26]Comments:15+(Char:C90(13)*(Num:C11([JOBS:26]Comments:15#"")))+"Copy of Job Code "+[JOBS:26]Job_Code:1
							[JOBS:26]Job_Code:1:=$_t_JobCode
							[JOBS:26]State:9:=$_t_JobState
							If (<>SYS_bo_CopyPreviousDate=False:C215)
								[JOBS:26]Start_Date:6:=$_d_StartDate
								[JOBS:26]End_Date:7:=$_d_EndDate
								[JOBS:26]Required_Date:8:=$_d_RequiredDate
							End if 
							[JOBS:26]JT_WIP_Cost_Amount:43:=0
							[JOBS:26]JC_WIP_Cost_Amount:44:=0
							[JOBS:26]JS_WIP_Cost_Amount:45:=0
							
							If (r0=1)
								FIRST RECORD:C50([JOB_STAGES:47])
								While (Not:C34(End selection:C36([JOB_STAGES:47])))
									ONE RECORD SELECT:C189([JOB_STAGES:47])
									CREATE SET:C116([JOB_STAGES:47]; "Extra")
									DIFFERENCE:C122("PuMaster"; "Extra"; "PuMaster")
									DUPLICATE RECORD:C225([JOB_STAGES:47])
									[JOB_STAGES:47]Job_Code:1:=$_t_JobCode
									[JOB_STAGES:47]Invoice_Number:10:=""
									[JOB_STAGES:47]AS_Invoice_Excluding_Tax:9:=0
									[JOB_STAGES:47]AS_Invoice_Including_Tax:28:=0
									[JOB_STAGES:47]AT_Actual_Units:5:=0
									[JOB_STAGES:47]JT_Budget_Units:4:=0
									[JOB_STAGES:47]JT_Actual_Sales_Amount:6:=0
									[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=0
									[JOB_STAGES:47]JT_Actual_Cost_Amount:29:=0
									[JOB_STAGES:47]JT_Budget_Cost_Amount:30:=0
									[JOB_STAGES:47]JC_Actual_Sales_Amount:31:=0
									[JOB_STAGES:47]JC_Actual_Cost_Amount:32:=0
									[JOB_STAGES:47]JC_Budget_Sales_Amount:33:=0
									[JOB_STAGES:47]JC_Budget_Cost_Amount:34:=0
									[JOB_STAGES:47]JS_Actual_Sales_Amount:35:=0
									[JOB_STAGES:47]JS_Actual_Cost_Amount:36:=0
									[JOB_STAGES:47]JS_Budget_Sales_Amount:37:=0
									[JOB_STAGES:47]JS_Budget_Cost_Amount:38:=0
									[JOB_STAGES:47]JS_Actual_Margin:39:=0
									[JOB_STAGES:47]JS_Actual_Margin_PC:40:=0
									[JOB_STAGES:47]JS_Budget_Margin:41:=0
									[JOB_STAGES:47]JS_Budget_Margin_PC:42:=0
									[JOB_STAGES:47]JT_WIP_Cost_Amount:43:=0
									[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=0
									[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=0
									[JOB_STAGES:47]JS_Locked:16:=False:C215
									
									If (r2=1)
										QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=$_t_JobCodeOLD; *)
										QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[JOB_STAGES:47]Stage_Code:2)
										CREATE SET:C116([JOB PERSONNEL:48]; "OMaster")
										FIRST RECORD:C50([JOB PERSONNEL:48])
										While (Not:C34(End selection:C36([JOB PERSONNEL:48])))
											ONE RECORD SELECT:C189([JOB PERSONNEL:48])
											CREATE SET:C116([JOB PERSONNEL:48]; "Extra")
											DIFFERENCE:C122("OMaster"; "Extra"; "OMaster")
											DUPLICATE RECORD:C225([JOB PERSONNEL:48])
											[JOB PERSONNEL:48]Job_Code:1:=$_t_JobCode
											If (s2=1)
												[JOB PERSONNEL:48]JT_Budget_Units:4:=[JOB PERSONNEL:48]JT_Actual_Units:5
												[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=[JOB PERSONNEL:48]JT_Act_Sales_Amount:6
												[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10
											End if 
											[JOB PERSONNEL:48]JT_Actual_Units:5:=0
											[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=0
											[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=0
											DB_SaveRecord(->[JOB PERSONNEL:48])
											USE SET:C118("OMaster")
										End while 
									End if 
									
									If (r1=1)
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=$_t_JobCodeOLD; *)
										QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2; *)
										If (s1=1)
											QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="B")
										Else 
											QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="A")
										End if 
										CREATE SET:C116([ORDER_ITEMS:25]; "AMaster")
										FIRST RECORD:C50([ORDER_ITEMS:25])
										While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
											ONE RECORD SELECT:C189([ORDER_ITEMS:25])
											CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
											DIFFERENCE:C122("AMaster"; "Extra"; "AMaster")
											DUPLICATE RECORD:C225([ORDER_ITEMS:25])
											[ORDER_ITEMS:25]x_ID:58:=0
											
											[ORDER_ITEMS:25]Job_Code:34:=$_t_JobCode
											If ((DB_GetModuleSettingByNUM(1))#5)
												[ORDER_ITEMS:25]State:46:="B"
											End if 
											OrderI_No
											[ORDER_ITEMS:25]Delivery_Date:11:=!00-00-00!
											[ORDER_ITEMS:25]Item_Locked:16:=False:C215
											[ORDER_ITEMS:25]Invoice_Number:17:=""
											[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
											[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
											[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
											[ORDER_ITEMS:25]Supplier_Invoice_Number:22:=""
											[ORDER_ITEMS:25]Supplier_Delivery_Number:23:=""
											[ORDER_ITEMS:25]Serial_Number:24:=""
											[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
											[ORDER_ITEMS:25]Allocated:28:=0
											[ORDER_ITEMS:25]Contract_Code:29:=""
											[ORDER_ITEMS:25]Order_Code:1:=""
											DB_SaveRecord(->[ORDER_ITEMS:25])
											AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
											USE SET:C118("AMaster")
										End while 
										
										QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=$_t_JobCode; *)
										QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
										If ((DB_GetModuleSettingByNUM(1))=5)
											[JOB_STAGES:47]JC_Actual_Cost_Amount:32:=Round:C94((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2)
											[JOB_STAGES:47]JC_Actual_Sales_Amount:31:=Round:C94((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2)
										Else 
											[JOB_STAGES:47]JC_Budget_Cost_Amount:34:=Round:C94((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2)
											[JOB_STAGES:47]JC_Budget_Sales_Amount:33:=Round:C94((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2)
										End if 
									End if 
									
									If (r2=1)
										QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=$_t_JobCode; *)
										QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[JOB_STAGES:47]Stage_Code:2)
										JobStages_InTo
									End if 
									
									DB_SaveRecord(->[JOB_STAGES:47])
									USE SET:C118("PuMaster")
								End while 
								
							End if 
							
							QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_t_JobCode)
							ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2; >)
							Jobs_InLPTot
							DB_SaveRecord(->[JOBS:26])
							AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
							$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
							DB_t_CurrentFormUsage:="CP"
							Jobs_InLPB
							DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
							
						Else 
							USE NAMED SELECTION:C332("$Sel")
						End if 
					Else 
						Gen_Alert("Job not found"; "Cancel")
						USE NAMED SELECTION:C332("$Sel")
					End if 
				Else 
					USE NAMED SELECTION:C332("$Sel")
				End if 
				
			End if 
		End if 
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
		ORDER BY:C49([JOB_STAGES:47]Stage_Code:2; >)
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_CP"; $_t_oldMethodName)