//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Time Post
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
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_JobCodeRow; xDelete)
	C_REAL:C285($_r_DiaryUnits; $_r_DiaryValue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time Post")

//don't think this method is used anymore (if it is anywhere then it shouldn't be because posting now handled by triggers and process services) - kmw

$_t_oldMethodName:=ERR_MethodTracker("Time Post")
//Time Post
[DIARY:12]Value:16:=[DIARY:12]Charge_Rate:22*[DIARY:12]Units:20
[DIARY:12]Cost_Value:75:=[DIARY:12]Cost_Rate:74*[DIARY:12]Units:20  //added 30/03/07 -kmw (this method shouldn't be being used any more but just in case)
RELATE ONE:C42([DIARY:12]Result_Code:11)
READ WRITE:C146([JOBS:26])
READ WRITE:C146([JOB_STAGES:47])
READ WRITE:C146([JOB PERSONNEL:48])
If ([RESULTS:14]Time_Post:5)
	If ((xDelete=1) | ((Old:C35([DIARY:12]Job_Code:19)#"") & ((Old:C35([DIARY:12]Job_Code:19)#[DIARY:12]Job_Code:19) | (Old:C35([DIARY:12]Stage_Code:21)#[DIARY:12]Stage_Code:21) | (Old:C35([DIARY:12]Person:8)#[DIARY:12]Person:8) | (Old:C35([DIARY:12]Charge_Rate:22)#[DIARY:12]Charge_Rate:22) | (Old:C35([DIARY:12]Units:20)#[DIARY:12]Units:20))))
		$_r_DiaryUnits:=Old:C35([DIARY:12]Units:20)
		$_r_DiaryValue:=Old:C35([DIARY:12]Value:16)
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=Old:C35([DIARY:12]Job_Code:19))
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=Old:C35([DIARY:12]Job_Code:19); *)
		QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=Old:C35([DIARY:12]Stage_Code:21))
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=Old:C35([DIARY:12]Job_Code:19); *)
		QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=Old:C35([DIARY:12]Stage_Code:21); *)
		QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Person:3=Old:C35([DIARY:12]Person:8))
		If ((Records in selection:C76([JOB PERSONNEL:48])>0) & (Records in selection:C76([JOB_STAGES:47])>0) & (Records in selection:C76([JOBS:26])>0))
			If ((Check_LockMess(->[JOBS:26]; "Job")) & (Check_LockMess(->[JOB_STAGES:47]; "Job Stage")) & (Check_LockMess(->[JOB PERSONNEL:48]; "Job Personnel record")))
				
				If (Not:C34((([DIARY:12]Done:14) & ([JOBS:26]Actual_TR:29=False:C215)) | (([DIARY:12]Done:14=False:C215) & ([JOBS:26]Budget_TR:28=False:C215))))
					
					If (Old:C35([DIARY:12]Done:14))
						[JOB PERSONNEL:48]JT_Actual_Units:5:=Round:C94(([JOB PERSONNEL:48]JT_Actual_Units:5-$_r_DiaryUnits); 2)
						[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=Round:C94(([JOB PERSONNEL:48]JT_Act_Sales_Amount:6-$_r_DiaryValue); 2)
						[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=Round:C94(([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
					Else 
						[JOB PERSONNEL:48]JT_Budget_Units:4:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Units:4-$_r_DiaryUnits); 2)
						[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8-$_r_DiaryValue); 2)
						[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
					End if 
					DB_SaveRecord(->[JOB PERSONNEL:48])
					
					If (Old:C35([DIARY:12]Done:14))
						[JOB_STAGES:47]AT_Actual_Units:5:=Round:C94(([JOB_STAGES:47]AT_Actual_Units:5-$_r_DiaryUnits); 2)
						[JOB_STAGES:47]JT_Actual_Sales_Amount:6:=Round:C94(([JOB_STAGES:47]JT_Actual_Sales_Amount:6-$_r_DiaryValue); 2)
						[JOB_STAGES:47]JT_Actual_Cost_Amount:29:=Round:C94(([JOB_STAGES:47]JT_Actual_Cost_Amount:29-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
						
						If ((DB_bo_RecordModified) & ([JOBS:26]Use_WIP:47))
							If (([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N"))
								$_l_JobCodeRow:=Find in array:C230(SRProdCode; [JOB_STAGES:47]Job_Code:1)
								If ($_l_JobCodeRow<1)
									INSERT IN ARRAY:C227(SRProdCode; 9999; 1)
									INSERT IN ARRAY:C227(SRAmount; 9999; 1)
									$_l_JobCodeRow:=Size of array:C274(SRProdCode)
									SRProdCode{$_l_JobCodeRow}:=[JOB_STAGES:47]Job_Code:1
								End if 
								SRAmount{$_l_JobCodeRow}:=Round:C94((SRAmount{$_l_JobCodeRow}-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
								[JOB_STAGES:47]JT_WIP_Cost_Amount:43:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount:43-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
								[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount:43+[JOB_STAGES:47]JC_WIP_Cost_Amount:44); 2)
							Else 
								$_l_JobCodeRow:=Find in array:C230(SRQtyT; [JOB_STAGES:47]Job_Code:1)
								If ($_l_JobCodeRow<1)
									INSERT IN ARRAY:C227(SRQtyT; 9999; 1)
									INSERT IN ARRAY:C227(SRPrice; 9999; 1)
									$_l_JobCodeRow:=Size of array:C274(SRQtyT)
									SRQtyT{$_l_JobCodeRow}:=[JOB_STAGES:47]Job_Code:1
								End if 
								SRPrice{$_l_JobCodeRow}:=Round:C94((SRPrice{$_l_JobCodeRow}-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
							End if 
						End if 
						
					Else 
						[JOB_STAGES:47]JT_Budget_Units:4:=Round:C94(([JOB_STAGES:47]JT_Budget_Units:4-$_r_DiaryUnits); 2)
						[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]AT_Budget_Sales_Amount:8-$_r_DiaryValue); 2)
						[JOB_STAGES:47]JT_Budget_Cost_Amount:30:=Round:C94(([JOB_STAGES:47]JT_Budget_Cost_Amount:30-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
					End if 
					JobStages_InT2
					DB_SaveRecord(->[JOB_STAGES:47])
					
					If (Old:C35([DIARY:12]Done:14))
						[JOBS:26]AT_Actual_Units:16:=Round:C94(([JOBS:26]AT_Actual_Units:16-$_r_DiaryUnits); 2)
						[JOBS:26]J_ Actual_Sales_Amount:17:=Round:C94(([JOBS:26]J_ Actual_Sales_Amount:17-$_r_DiaryValue); 2)
						[JOBS:26]JT_Actual_Cost_Amount:31:=Round:C94(([JOBS:26]JT_Actual_Cost_Amount:31-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
						
						If ((DB_bo_RecordModified) & ([JOBS:26]Use_WIP:47) & (([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")))
							[JOBS:26]JT_WIP_Cost_Amount:43:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount:43-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
							[JOBS:26]JS_WIP_Cost_Amount:45:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount:43+[JOBS:26]JC_WIP_Cost_Amount:44); 2)
						End if 
						
					Else 
						[JOBS:26]JT_Budget_Units:20:=Round:C94(([JOBS:26]JT_Budget_Units:20-$_r_DiaryUnits); 2)
						[JOBS:26]JT_Bud_Sales_Amount:23:=Round:C94(([JOBS:26]JT_Bud_Sales_Amount:23-$_r_DiaryValue); 2)
						[JOBS:26]JT_Budget_Cost_Amount:30:=Round:C94(([JOBS:26]JT_Budget_Cost_Amount:30-($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
					End if 
					Jobs_InLPTot2
					DB_SaveRecord(->[JOBS:26])
					AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
					
				End if 
				
			Else 
				OK:=0
			End if 
		End if 
	End if 
	If (xDelete=0)
		$_r_DiaryUnits:=[DIARY:12]Units:20
		$_r_DiaryValue:=[DIARY:12]Value:16
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[DIARY:12]Job_Code:19; *)
		QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=[DIARY:12]Stage_Code:21)
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[DIARY:12]Job_Code:19; *)
		QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[DIARY:12]Stage_Code:21; *)
		QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Person:3=[DIARY:12]Person:8)
		If ((Check_LockMess(->[JOBS:26]; "Job")) & (Check_LockMess(->[JOB_STAGES:47]; "Job Stage")) & (Check_LockMess(->[JOB PERSONNEL:48]; "Job Personnel record")))
			
			//Don't post it if it's not wanted
			If (Not:C34((([DIARY:12]Done:14) & ([JOBS:26]Actual_TR:29=False:C215)) | (([DIARY:12]Done:14=False:C215) & ([JOBS:26]Budget_TR:28=False:C215))))
				
				If (Records in selection:C76([JOB PERSONNEL:48])=0)
					CREATE RECORD:C68([JOB PERSONNEL:48])
					[JOB PERSONNEL:48]Person:3:=[DIARY:12]Person:8
					If ([JOB PERSONNEL:48]Person:3#[PERSONNEL:11]Initials:1)
						RELATE ONE:C42([JOB PERSONNEL:48]Person:3)
					End if 
					[JOB PERSONNEL:48]JT_Sales_Rate:7:=[DIARY:12]Charge_Rate:22
					[JOB PERSONNEL:48]JT_Cost_Rate:9:=[PERSONNEL:11]Cost_Rate:30
					[JOB PERSONNEL:48]Job_Code:1:=[DIARY:12]Job_Code:19
					[JOB PERSONNEL:48]Stage_Code:2:=[DIARY:12]Stage_Code:21
				End if 
				If ([DIARY:12]Done:14)
					[JOB PERSONNEL:48]JT_Actual_Units:5:=Round:C94(([JOB PERSONNEL:48]JT_Actual_Units:5+$_r_DiaryUnits); 2)
					[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=Round:C94(([JOB PERSONNEL:48]JT_Act_Sales_Amount:6+$_r_DiaryValue); 2)
					[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=Round:C94(([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
				Else 
					[JOB PERSONNEL:48]JT_Budget_Units:4:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Units:4+$_r_DiaryUnits); 2)
					[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8+$_r_DiaryValue); 2)
					[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
				End if 
				DB_SaveRecord(->[JOB PERSONNEL:48])
				
				If (Records in selection:C76([JOB_STAGES:47])=0)
					CREATE RECORD:C68([JOB_STAGES:47])
					[JOB_STAGES:47]Job_Code:1:=[DIARY:12]Job_Code:19
					[JOB_STAGES:47]Stage_Code:2:=[DIARY:12]Stage_Code:21
					RELATE ONE:C42([JOB_STAGES:47]Stage_Code:2)
					[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2
				End if 
				If ([DIARY:12]Done:14)
					[JOB_STAGES:47]AT_Actual_Units:5:=Round:C94(([JOB_STAGES:47]AT_Actual_Units:5+$_r_DiaryUnits); 2)
					[JOB_STAGES:47]JT_Actual_Sales_Amount:6:=Round:C94(([JOB_STAGES:47]JT_Actual_Sales_Amount:6+$_r_DiaryValue); 2)
					[JOB_STAGES:47]JT_Actual_Cost_Amount:29:=Round:C94(([JOB_STAGES:47]JT_Actual_Cost_Amount:29+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
					
					If ((DB_bo_RecordModified) & ([JOBS:26]Use_WIP:47))
						If (([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N"))
							$_l_JobCodeRow:=Find in array:C230(SRProdCode; [JOB_STAGES:47]Job_Code:1)
							If ($_l_JobCodeRow<1)
								INSERT IN ARRAY:C227(SRProdCode; 9999; 1)
								INSERT IN ARRAY:C227(SRAmount; 9999; 1)
								$_l_JobCodeRow:=Size of array:C274(SRProdCode)
								SRProdCode{$_l_JobCodeRow}:=[JOB_STAGES:47]Job_Code:1
							End if 
							SRAmount{$_l_JobCodeRow}:=Round:C94((SRAmount{$_l_JobCodeRow}+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
							[JOB_STAGES:47]JT_WIP_Cost_Amount:43:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount:43+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
							[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount:43+[JOB_STAGES:47]JC_WIP_Cost_Amount:44); 2)
						Else 
							$_l_JobCodeRow:=Find in array:C230(SRQtyT; [JOB_STAGES:47]Job_Code:1)
							If ($_l_JobCodeRow<1)
								INSERT IN ARRAY:C227(SRQtyT; 9999; 1)
								INSERT IN ARRAY:C227(SRPrice; 9999; 1)
								$_l_JobCodeRow:=Size of array:C274(SRQtyT)
								SRQtyT{$_l_JobCodeRow}:=[JOB_STAGES:47]Job_Code:1
							End if 
							SRPrice{$_l_JobCodeRow}:=Round:C94((SRPrice{$_l_JobCodeRow}+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
						End if 
					End if 
					
				Else 
					[JOB_STAGES:47]JT_Budget_Units:4:=Round:C94(([JOB_STAGES:47]JT_Budget_Units:4+$_r_DiaryUnits); 2)
					[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]AT_Budget_Sales_Amount:8+$_r_DiaryValue); 2)
					[JOB_STAGES:47]JT_Budget_Cost_Amount:30:=Round:C94(([JOB_STAGES:47]JT_Budget_Cost_Amount:30+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
				End if 
				JobStages_InT2
				DB_SaveRecord(->[JOB_STAGES:47])
				
				If ([DIARY:12]Done:14)
					[JOBS:26]AT_Actual_Units:16:=Round:C94(([JOBS:26]AT_Actual_Units:16+$_r_DiaryUnits); 2)
					[JOBS:26]J_ Actual_Sales_Amount:17:=Round:C94(([JOBS:26]J_ Actual_Sales_Amount:17+$_r_DiaryValue); 2)
					[JOBS:26]JT_Actual_Cost_Amount:31:=Round:C94(([JOBS:26]JT_Actual_Cost_Amount:31+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
					
					If ((DB_bo_RecordModified) & ([JOBS:26]Use_WIP:47) & (([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")))
						[JOBS:26]JT_WIP_Cost_Amount:43:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount:43+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
						[JOBS:26]JS_WIP_Cost_Amount:45:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount:43+[JOBS:26]JC_WIP_Cost_Amount:44); 2)
					End if 
					
				Else 
					[JOBS:26]JT_Budget_Units:20:=Round:C94(([JOBS:26]JT_Budget_Units:20+$_r_DiaryUnits); 2)
					[JOBS:26]JT_Bud_Sales_Amount:23:=Round:C94(([JOBS:26]JT_Bud_Sales_Amount:23+$_r_DiaryValue); 2)
					[JOBS:26]JT_Budget_Cost_Amount:30:=Round:C94(([JOBS:26]JT_Budget_Cost_Amount:30+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)); 2)
				End if 
				[JOBS:26]Stage_Code:18:=[DIARY:12]Stage_Code:21
				Jobs_InLPTot2
				DB_SaveRecord(->[JOBS:26])
				AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
				
			End if 
			
		Else 
			OK:=0
		End if 
	End if 
End if 
READ ONLY:C145([JOBS:26])
READ ONLY:C145([JOB_STAGES:47])
READ ONLY:C145([JOB PERSONNEL:48])
UNLOAD RECORD:C212([JOBS:26])
UNLOAD RECORD:C212([JOB_STAGES:47])
UNLOAD RECORD:C212([JOB PERSONNEL:48])
ERR_MethodTrackerReturn("Time Post"; $_t_oldMethodName)
