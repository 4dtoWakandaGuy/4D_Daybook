//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_TCInLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DiaryJobCodes; 0)
	ARRAY TEXT:C222($_at_DiaryJobStageCodes; 0)
	ARRAY TEXT:C222($_at_DiaryPersonCodes; 0)
	ARRAY TEXT:C222($_at_DiaryResultCodes; 0)
	ARRAY TEXT:C222($_at_DiaryResultCodes_; 0)
	ARRAY TEXT:C222($_at_OrderItemJobCodes; 0)
	ARRAY TEXT:C222($_at_OrderItemJobStageCodes; 0)
	ARRAY TEXT:C222($_at_OrderItemStates; 0)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_CostItems; $_l_DiaryRecordsCount; $_l_Index; $_l_OrderItemsRecordsCount; $_l_TimeItems; $_l_TimeItems2; $_l_TimeItems3; $_l_TimeItems4)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_JobCodesCombined; $_t_oldMethodName; $_t_Rejects; vPeriod)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_TCInLPA")



If (((<>WIP_t_TRPTrans#"") | (<>WIP_t_TRWTrans#"") | (<>WIP_t_CIPTRANS#"") | (<>WIP_t_CIWTrans#"")) & (DB_GetModuleSettingByNUM(1)#5) & (([ORDERS:24]Order_Period:42="") | ([ORDERS:24]Required_Date:9=!00-00-00!)))
	Gen_Alert("You must first specify a WIP Date and Period"; "Try again")
Else 
	If (Modified record:C314([DIARY:12]))
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	End if 
	If (Modified record:C314([ORDER_ITEMS:25]))
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	End if 
	
	Jobs_TC_GetSelectionsFromArrays  //added 11/01/07 -kmw (previously record selection wsn't guaranteed to and in fact usually didn't  match  the records displayed in listbox arrays)
	
	$_l_DiaryRecordsCount:=Records in selection:C76([DIARY:12])
	$_l_OrderItemsRecordsCount:=Records in selection:C76([ORDER_ITEMS:25])
	If (($_l_DiaryRecordsCount>0) | ($_l_OrderItemsRecordsCount>0))
		SELECTION TO ARRAY:C260([DIARY:12]Job_Code:19; $_at_DiaryJobCodes; [DIARY:12]Stage_Code:21; $_at_DiaryJobStageCodes; [DIARY:12]Person:8; $_at_DiaryPersonCodes; [DIARY:12]Result_Code:11; $_at_DiaryResultCodes)
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Job_Code:34; $_at_OrderItemJobCodes; [ORDER_ITEMS:25]Job_Stage:35; $_at_OrderItemJobStageCodes; [ORDER_ITEMS:25]State:46; $_at_OrderItemStates)
		$_l_TimeItems:=0
		$_l_TimeItems2:=0
		$_l_TimeItems3:=0
		$_l_TimeItems4:=0
		$_t_JobCodesCombined:=""
		$_t_Rejects:=""
		
		For ($_l_Index; 1; $_l_DiaryRecordsCount)
			If ($_at_DiaryJobCodes{$_l_Index}="")
				$_l_TimeItems:=$_l_TimeItems+1
			End if 
			If ($_at_DiaryPersonCodes{$_l_Index}="")
				$_l_TimeItems2:=$_l_TimeItems2+1
			End if 
			If ($_at_DiaryResultCodes{$_l_Index}="")
				$_l_TimeItems3:=$_l_TimeItems3+1
			End if 
			
			If ($_at_DiaryJobStageCodes{$_l_Index}="")
				$_l_TimeItems4:=$_l_TimeItems4+1
			Else 
				If (($_t_JobCodesCombined#("@"+$_at_DiaryJobCodes{$_l_Index}+"/"+$_at_DiaryJobStageCodes{$_l_Index}+" @")) & ($_t_Rejects#("@"+$_at_DiaryJobCodes{$_l_Index}+"/"+$_at_DiaryJobStageCodes{$_l_Index}+" @")))
					If (([JOB_STAGES:47]Job_Code:1#$_at_DiaryJobCodes{$_l_Index}) | ([JOB_STAGES:47]Stage_Code:2#$_at_DiaryJobStageCodes{$_l_Index}))
						QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_at_DiaryJobCodes{$_l_Index}; *)
						QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=$_at_DiaryJobStageCodes{$_l_Index})
					End if 
					If (([JOB_STAGES:47]Invoice_Number:10#"") & ([JOB_STAGES:47]Invoice_Number:10#"N"))
						$_t_JobCodesCombined:=$_t_JobCodesCombined+$_at_DiaryJobCodes{$_l_Index}+"/"+$_at_DiaryJobStageCodes{$_l_Index}+" "
					Else 
						$_t_Rejects:=$_t_Rejects+$_at_DiaryJobCodes{$_l_Index}+"/"+$_at_DiaryJobStageCodes{$_l_Index}+" "
					End if 
				End if 
			End if 
			
		End for 
		
		$_l_CostItems:=0
		$_l_CostItems:=0
		For ($_l_Index; 1; $_l_OrderItemsRecordsCount)
			If ($_at_OrderItemJobCodes{$_l_Index}="")
				$_l_CostItems:=$_l_CostItems+1
			End if 
			If (($_at_OrderItemJobStageCodes{$_l_Index}="") & (($_at_OrderItemStates{$_l_Index}#"A") | (DB_GetModuleSettingByNUM(1)=5)))
				$_l_CostItems:=$_l_CostItems+1
			Else 
				If ($_at_OrderItemJobStageCodes{$_l_Index}#"")
					If (($_t_JobCodesCombined#("@"+$_at_OrderItemJobCodes{$_l_Index}+"/"+$_at_OrderItemJobStageCodes{$_l_Index}+" @")) & ($_t_Rejects#("@"+$_at_OrderItemJobCodes{$_l_Index}+"/"+$_at_OrderItemJobStageCodes{$_l_Index}+" @")))
						If (([JOB_STAGES:47]Job_Code:1#$_at_OrderItemJobCodes{$_l_Index}) | ([JOB_STAGES:47]Stage_Code:2#$_at_OrderItemJobStageCodes{$_l_Index}))
							QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_at_OrderItemJobCodes{$_l_Index}; *)
							QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=$_at_OrderItemJobStageCodes{$_l_Index})
						End if 
						If (([JOB_STAGES:47]Invoice_Number:10#"") & ([JOB_STAGES:47]Invoice_Number:10#"N"))
							$_t_JobCodesCombined:=$_t_JobCodesCombined+$_at_OrderItemJobCodes{$_l_Index}+"/"+$_at_OrderItemJobStageCodes{$_l_Index}+" "
						Else 
							$_t_Rejects:=$_t_Rejects+$_at_OrderItemJobCodes{$_l_Index}+"/"+$_at_OrderItemJobStageCodes{$_l_Index}+" "
						End if 
					End if 
				End if 
			End if 
		End for 
		
		If (($_l_TimeItems>0) | ($_l_CostItems>0))
			Gen_Alert(String:C10($_l_TimeItems)+" Time and "+String:C10($_l_CostItems)+" Cost Items have not been allocated Job Codes"; "Try again")
		Else 
			If ($_l_TimeItems2>0)
				Gen_Alert(String:C10($_l_TimeItems2)+" Time Item(s) have not been allocated Personnel"; "Try again")
			Else 
				If ($_l_TimeItems3>0)
					Gen_Alert(String:C10($_l_TimeItems3)+" Time Item(s) have not been allocated Charge Types"; "Try again")
				Else 
					If ($_l_TimeItems4>0)
						Gen_Alert(String:C10($_l_TimeItems4)+" Time Item(s) have not been allocated Stage Codes"; "Try again")
					Else 
						If ($_l_CostItems>0)
							If ((DB_GetModuleSettingByNUM(1))=5)
								Gen_Alert(String:C10($_l_CostItems)+" Cost Items(s) have not been allocated Stage Codes"; "Try again")
							Else 
								Gen_Alert(String:C10($_l_CostItems)+" Cost Items(s) have been created as 'Budget' Items,"+" but have not been allocated Stage Codes"; "Try again")
							End if 
						Else 
							OK:=0
							If ($_t_JobCodesCombined#"")
								Gen_Confirm("The following Jobs/Stage(s) have been Invoiced: "+$_t_JobCodesCombined+Char:C90(13)+"Any WIP on these Items will be Written Off.  "+"Are you sure you want to allocate to them?"; "Try again"; "Yes")
							End if 
							If (OK=0)
								Gen_Confirm("Are you ready to post "+String:C10($_l_DiaryRecordsCount)+" Time and "+String:C10($_l_OrderItemsRecordsCount)+" Cost entries?"; "Post them"; "Try again")
								If (OK=1)
									vDate:=[ORDERS:24]Required_Date:9
									vPeriod:=[ORDERS:24]Order_Period:42
									QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3="zzzz9999")
									ACCEPT:C269
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	Else 
		CANCEL:C270
		OK:=0
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_TCInLPA"; $_t_oldMethodName)