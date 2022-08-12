//%attributes = {}

If (False:C215)
	//Project Method Name:      Jobs_WIPAdj
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_WipPosted; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_OK; $_l_PeriodID; $_l_WindowReferenceRow; r0; s1; WIN_l_CurrentWinRef)
	C_REAL:C285(vAmount)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_oldMethodName; $_t_WIPTransactionType; vPeriod; vSolution)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_WIPAdj")

//this method may not work correctly anymore due to trigger/process services causing total updates overriding  any chances to WIP amounts that this method makes (kmw 13/03/07)


$_t_oldMethodName:=ERR_MethodTracker("Jobs_WIPAdj")
//Jobs_WIPAdj
Menu_Record("Jobs_WIPAdj"; "WIP Adjustment")
If (Not:C34(Read only state:C362([JOBS:26])))
	If ([JOBS:26]Use_WIP:47)
		If ((<>WIP_t_TRPTrans#"") | (<>WIP_t_CIPTRANS#""))
			If (Jobs_WIPCheck)
				If (Modified record:C314([JOB_STAGES:47]))
					DB_SaveRecord(->[JOB_STAGES:47])
				End if 
				If (Modified record:C314([ORDER_ITEMS:25]))
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					
				End if 
				vSolution:=[JOB_STAGES:47]Stage_Code:2
				vAmount:=0
				vDate:=<>DB_d_CurrentDate
				$_l_PeriodID:=Check_Period
				Check_PerClose
				vPeriod:=[PERIODS:33]Period_Code:1
				Open_Any_Window(222; 361)
				DIALOG:C40([JOBS:26]; "dAsk_WIPadj")
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
					If ((vAmount#0) & (vDate>!00-00-00!) & (vPeriod#""))
						Gen_Confirm("Are you sure you want to Post this Adjustment?"; "Post it"; "Cancel")
						If (OK=1)
							
							//  START TRANSACTION
							StartTransaction  // 13/05/02 pb
							
							Jobs_WIPStart("WIP Adjustment"; vDate)
							
							If (r0=1)
								If (s1=1)
									$_t_WIPTransactionType:=<>WIP_t_TRPTrans
								Else 
									$_t_WIPTransactionType:=<>WIP_t_TRWTrans
								End if 
							Else 
								If (s1=1)
									$_t_WIPTransactionType:=<>WIP_t_CIPTRANS
								Else 
									$_t_WIPTransactionType:=<>WIP_t_CIWTrans
								End if 
							End if 
							
							JC_AdjustJSWIPTime(False:C215)  //added 20/03/07 -kmw
							JC_AdjustJSWIPCost(False:C215)  //added 20/03/07 -kmw
							//JC_AdjustJSWIPTC (False)  `added 20/03/07 -kmw
							
							JC_AdjustJobWIPTime(False:C215)  //added 20/03/07 -kmw
							JC_AdjustJobWIPCost(False:C215)  //added 20/03/07 -kmw
							//JC_AdjustJobWIPTC (False)  `added 20/03/07 -kmw
							
							
							If (vSolution#"")
								Jobs_InvWIP2($_t_WIPTransactionType; "WIP Adjustment: Stage "+vSolution; vAmount; vDate; vPeriod)
								If (s1=1)
									If (r0=1)
										//[JOB STAGES]JT WIP Cost Am:=Round(([JOB STAGES]JT WIP Cost Am+vAmount);2)
										[JOB_STAGES:47]JT_WIP_Cost_Amount_Adjusted:63:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount_Adjusted:63+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
										//[JOBS]JT WIP Cost Am:=Round(([JOBS]JT WIP Cost Am+vAmount);2)
										[JOBS:26]JT_WIP_Cost_Amount_Adj:60:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount_Adj:60+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									Else 
										//[JOB STAGES]JC WIP Cost Am:=Round(([JOB STAGES]JC WIP Cost Am+vAmount);2)
										[JOB_STAGES:47]JC_WIP_Cost_Amount_Adjusted:61:=Round:C94(([JOB_STAGES:47]JC_WIP_Cost_Amount_Adjusted:61+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
										//[JOBS]JC WIP Cost Am:=Round(([JOBS]JC WIP Cost Am+vAmount);2)
										[JOBS:26]JC_WIP_Cost_Amount_Adjusted:57:=Round:C94(([JOBS:26]JC_WIP_Cost_Amount_Adjusted:57+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									End if 
									//[JOB STAGES]JS WIP Cost Am:=Round(([JOB STAGES]JS WIP Cost Am+vAmount);2)
									[JOB_STAGES:47]JS_WIP_Cost_Amount_Adjusted:62:=Round:C94(([JOB_STAGES:47]JS_WIP_Cost_Amount_Adjusted:62+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									//[JOBS]JS WIP Cost Am:=Round(([JOBS]JS WIP Cost Am+vAmount);2)
									[JOBS:26]JS_WIP_Cost_Amount_Adj:59:=Round:C94(([JOBS:26]JS_WIP_Cost_Amount_Adj:59+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
								Else 
									If (r0=1)
										//[JOB STAGES]JT WIP Cost Am:=Round(([JOB STAGES]JT WIP Cost Am-vAmount);2)
										[JOB_STAGES:47]JT_WIP_Cost_Amount_Adjusted:63:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount_Adjusted:63-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
										//[JOBS]JT WIP Cost Am:=Round(([JOBS]JT WIP Cost Am-vAmount);2)
										[JOBS:26]JT_WIP_Cost_Amount_Adj:60:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount_Adj:60-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									Else 
										//[JOB STAGES]JC WIP Cost Am:=Round(([JOB STAGES]JC WIP Cost Am-vAmount);2)
										[JOB_STAGES:47]JC_WIP_Cost_Amount_Adjusted:61:=Round:C94(([JOB_STAGES:47]JC_WIP_Cost_Amount_Adjusted:61-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
										//[JOBS]JC WIP Cost Am:=Round(([JOBS]JC WIP Cost Am-vAmount);2)
										[JOBS:26]JC_WIP_Cost_Amount_Adjusted:57:=Round:C94(([JOBS:26]JC_WIP_Cost_Amount_Adjusted:57-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									End if 
									//[JOB STAGES]JS WIP Cost Am:=Round(([JOB STAGES]JS WIP Cost Am-vAmount);2)
									[JOB_STAGES:47]JS_WIP_Cost_Amount_Adjusted:62:=Round:C94(([JOB_STAGES:47]JS_WIP_Cost_Amount_Adjusted:62-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									//[JOBS]JS WIP Cost Am:=Round(([JOBS]JS WIP Cost Am-vAmount);2)
									[JOBS:26]JS_WIP_Cost_Amount_Adj:59:=Round:C94(([JOBS:26]JS_WIP_Cost_Amount_Adj:59-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
								End if 
							Else 
								Jobs_InvWIP2($_t_WIPTransactionType; "WIP Adjustment: No Stage"; vAmount; vDate; vPeriod)
								If (s1=1)
									//[JOBS]JC WIP Job Cost Am:=Round(([JOBS]JC WIP Job Cost Am+vAmount);2)
									[JOBS:26]JC_WIP_JOB_Cost_Amount_Adj:58:=Round:C94(([JOBS:26]JC_WIP_JOB_Cost_Amount_Adj:58+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									//[JOBS]JC WIP Cost Am:=Round(([JOBS]JC WIP Cost Am+vAmount);2)
									[JOBS:26]JC_WIP_Cost_Amount_Adjusted:57:=Round:C94(([JOBS:26]JC_WIP_Cost_Amount_Adjusted:57+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									//[JOBS]JS WIP Cost Am:=Round(([JOBS]JS WIP Cost Am+vAmount);2)
									[JOBS:26]JS_WIP_Cost_Amount_Adj:59:=Round:C94(([JOBS:26]JS_WIP_Cost_Amount_Adj:59+vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
								Else 
									//[JOBS]JC WIP Job Cost Am:=Round(([JOBS]JC WIP Job Cost Am-vAmount);2)
									[JOBS:26]JC_WIP_JOB_Cost_Amount_Adj:58:=Round:C94(([JOBS:26]JC_WIP_JOB_Cost_Amount_Adj:58-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									//[JOBS]JC WIP Cost Am:=Round(([JOBS]JC WIP Cost Am-vAmount);2)
									[JOBS:26]JC_WIP_Cost_Amount_Adjusted:57:=Round:C94(([JOBS:26]JC_WIP_Cost_Amount_Adjusted:57-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
									//[JOBS]JS WIP Cost Am:=Round(([JOBS]JS WIP Cost Am-vAmount);2)
									[JOBS:26]JS_WIP_Cost_Amount_Adj:59:=Round:C94(([JOBS:26]JS_WIP_Cost_Amount_Adj:59-vAmount); 2)  //changed so that WIP cost adjustments affect a seperate "adjustment" field which gets added to true WIP cost field during totalling  20/03/07 -kmw
								End if 
							End if 
							
							JC_AdjustJSWIPTime  //added 20/03/07 -kmw
							JC_AdjustJSWIPCost  //added 20/03/07 -kmw
							//JC_AdjustJSWIPTC   `added 20/03/07 -kmw
							JC_UpdateJSWIPTC  //added 20/03/07 -kmw
							
							JC_AdjustJobWIPTime  //added 20/03/07 -kmw
							JC_AdjustJobWIPCost  //added 20/03/07 -kmw
							//JC_AdjustJobWIPTC   `added 20/03/07 -kmw
							JC_UpdateJobWIPTC  //added 20/03/07 -kmw
							
							//vDirectEdit:=True
							//JC_UpdateJSAllTotals   `added 20/03/07 -kmw
							
							//vDirectEdit:=True
							//JC_UpdateJobAllTotals   `added 20/03/07 -kmw
							
							
							//If (OK=1)  `removed (unnneccesary?) OK check 20/03/07 -kmw
							//
							JC_JobTotalArraysLoadValues  //added 20/03/07 -kmw
							//
							DB_SaveRecord(->[JOB_STAGES:47])
							DB_SaveRecord(->[JOBS:26])
							AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
							
							
							
							//End if  `removed (unnneccesary?) OK check 20/03/07 -kmw
							
							//If (OK=1) `removed (unnneccesary?) OK check 20/03/07 -kmw
							$_bo_WipPosted:=Jobs_WIPEnd
							
							//End if  `removed (unnneccesary?) OK check 20/03/07 -kmw
							Transact_End($_bo_WipPosted)
							
							
						End if 
					Else 
						Gen_Alert("You must specify an Amount, a Date and a Period"; "Cancel")
					End if 
				End if 
				Jobs_PPEnd
			End if 
		Else 
			Gen_Alert("WIP postings are not requested in the Preferences"; "Cancel")
		End if 
	Else 
		Gen_Alert("The WIP postings check box is not turned on"; "Cancel")
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_WIPAdj"; $_t_oldMethodName)