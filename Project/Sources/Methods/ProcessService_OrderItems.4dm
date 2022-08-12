//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_OrderItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_DelimPosition1; $_l_DelimPosition2; $_l_RecordNumber)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; $_t_CompositeKey; $_t_OIJobCode; $_t_OIJobStageCode; $_t_OIStageCode; $_t_oldMethodName; $_t_TransTypeCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_OrderItems")
//ProcessService_OrderItems
//Added 28/02/07 - kmw
//Runs various functionality called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCAddOI") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCModOI")  //added 28/02/07 -kmw
		//
		$_l_RecordNumber:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_CompositeKey)
		$_l_DelimPosition1:=Position:C15("*|Delim1|*"; $_t_CompositeKey)
		$_l_DelimPosition2:=Position:C15("*|Delim2|*"; $_t_CompositeKey)
		$_t_OIJobCode:=Substring:C12($_t_CompositeKey; 1; ($_l_DelimPosition1-1))
		$_t_OIStageCode:=Substring:C12($_t_CompositeKey; ($_l_DelimPosition1+10); (($_l_DelimPosition2)-($_l_DelimPosition1+10)))
		$_t_OIJobStageCode:=Substring:C12($_t_CompositeKey; ($_l_DelimPosition2+10))
		//
		READ WRITE:C146([JOB_STAGES:47])
		
		If ($_t_OIStageCode="") & ($_t_OIJobStageCode="")  //Order Line is not associated with a Job Stage - so we are updating or creating totals on a Job
			JC_FindJobFromOI($_l_RecordNumber; $_t_OIJobCode)
			//********************* Now load the job or if it doesn't exist then create it **********************
			Case of 
				: (Records in selection:C76([JOBS:26])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job found?)
					
					If (Check_Locked(->[JOBS:26]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				: (Records in selection:C76([JOBS:26])=1)  //one job stage record found so load it
					If (Check_Locked(->[JOBS:26]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				Else   //none found so create a new one using job stage code and composite key values based on current job personnel record
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_l_RecordNumber)  //changed from above line (i think it was a typo) to this 11/10/07 -kmw
					
					JC_AddJobAsResultOfOrderItem
					$0:=True:C214
			End case 
			//*********************************************************************************
			If ($0=True:C214)  //Job successfully loaded or a new one was created
				READ ONLY:C145([JOB_STAGES:47])
				READ ONLY:C145([ORDER_ITEMS:25])
				//
				JC_UpdateJobAllTotals
				//
				DB_SaveRecord(->[JOBS:26])  //the above update routines don't actually issue a save so do so now
				UNLOAD RECORD:C212([JOBS:26])
				READ ONLY:C145([JOBS:26])
				
			End if 
			
		Else   //Order Line attached to a Job Stage - so we are updating or creating totals on a Job Stage
			JC_FindJSFromOI($_l_RecordNumber; $_t_OIJobCode; $_t_OIStageCode; $_t_OIJobStageCode)
			//********************* Now load the job stage or if it doesn't exist then create it **********************
			Case of 
				: (Records in selection:C76([JOB_STAGES:47])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job Stage found?)
					
					If (Check_Locked(->[JOB_STAGES:47]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				: (Records in selection:C76([JOB_STAGES:47])=1)  //one job stage record found so load it
					If (Check_Locked(->[JOB_STAGES:47]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				Else   //none found so create a new one using job stage code and composite key values based on current job personnel record
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_l_RecordNumber)
					JC_AddJSAsResultOfOrderItem
					$0:=True:C214
			End case 
			//*********************************************************************************
			If ($0=True:C214)  //Job Stage successfully loaded or a new one was created
				READ ONLY:C145([JOB PERSONNEL:48])
				READ ONLY:C145([ORDER_ITEMS:25])
				READ ONLY:C145([JOBS:26])
				//
				JC_UpdateJSAllTotals
				//
				DB_SaveRecord(->[JOB_STAGES:47])  //the above update routines don't actually issue a save so do so now
				UNLOAD RECORD:C212([JOB_STAGES:47])
				READ ONLY:C145([JOB_STAGES:47])
			End if 
		End if 
		
		JC_FindJobFromOI($_l_RecordNumber; $_t_OIJobCode)
		If ([JOBS:26]Use_WIP:47) & (<>WIP_t_CIPTRANS#"") & (<>WIP_t_CIWTrans#"")  //added 09/03/07 -kmw
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_l_RecordNumber)
			If ([ORDER_ITEMS:25]Invoice_Number:17="") | ([ORDER_ITEMS:25]Invoice_Number:17="N")
				$_t_TransTypeCode:=<>WIP_t_CIPTRANS
			Else 
				$_t_TransTypeCode:=<>WIP_t_CIWTrans
			End if 
			If ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCModOI")
				JC_PostReverseToWIP($_l_RecordNumber; $_t_TransTypeCode)
			End if 
			JC_PostToWIP($_l_RecordNumber; $_t_TransTypeCode)
		End if 
		
		//
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCDelOI")  //added 28/02/07 -kmw
		//
		$_l_RecordNumber:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_CompositeKey)
		$_l_DelimPosition1:=Position:C15("*|Delim1|*"; $_t_CompositeKey)
		$_l_DelimPosition2:=Position:C15("*|Delim2|*"; $_t_CompositeKey)
		$_t_OIJobCode:=Substring:C12($_t_CompositeKey; 1; ($_l_DelimPosition1-1))
		$_t_OIStageCode:=Substring:C12($_t_CompositeKey; ($_l_DelimPosition1+10); (($_l_DelimPosition2)-($_l_DelimPosition1+10)))
		$_t_OIJobStageCode:=Substring:C12($_t_CompositeKey; ($_l_DelimPosition2+10))
		//
		READ WRITE:C146([JOB_STAGES:47])
		
		If ($_t_OIStageCode="") & ($_t_OIJobStageCode="")  //Order Line is not associated with a Job Stage - so we are updating or creating totals on a Job
			JC_FindJobFromOI($_l_RecordNumber; $_t_OIJobCode)
			//********************* Now load the job or if it doesn't exist then create it **********************
			Case of 
				: (Records in selection:C76([JOBS:26])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job found?)
					
					If (Check_Locked(->[JOBS:26]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				: (Records in selection:C76([JOBS:26])=1)  //one job stage record found so load it
					If (Check_Locked(->[JOBS:26]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				Else   //none found so do nothing
					//do nothing
					$0:=True:C214
			End case 
			//*********************************************************************************
			If ($0=True:C214) & (Records in selection:C76([JOBS:26])>0)  //Job successfully found and loaded
				READ ONLY:C145([JOB_STAGES:47])
				READ ONLY:C145([ORDER_ITEMS:25])
				//
				JC_UpdateJobAllTotals
				//
				DB_SaveRecord(->[JOBS:26])  //the above update routines don't actually issue a save so do so now
				UNLOAD RECORD:C212([JOBS:26])
				READ ONLY:C145([JOBS:26])
				
			End if 
			
		Else   //Order Line attached to a Job Stage - so we are updating or creating totals on a Job Stage
			JC_FindJSFromOI($_l_RecordNumber; $_t_OIJobCode; $_t_OIStageCode; $_t_OIJobStageCode)
			//********************* Now load the job stage or if it doesn't exist then create it **********************
			Case of 
				: (Records in selection:C76([JOB_STAGES:47])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job Stage found?)
					
					If (Check_Locked(->[JOB_STAGES:47]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				: (Records in selection:C76([JOB_STAGES:47])=1)  //one job stage record found so load it
					If (Check_Locked(->[JOB_STAGES:47]; 1))
						$0:=True:C214
					Else   //job stage locked so return false to let it have another go later
						$0:=False:C215
					End if 
					
				Else   //none found so do nothing
					//do nothing
					$0:=True:C214
			End case 
			//*********************************************************************************
			If ($0=True:C214) & (Records in selection:C76([JOB_STAGES:47])>0)  //Job Stage successfully found and loaded
				READ ONLY:C145([JOB PERSONNEL:48])
				READ ONLY:C145([ORDER_ITEMS:25])
				READ ONLY:C145([JOBS:26])
				//
				JC_UpdateJSAllTotals
				//
				DB_SaveRecord(->[JOB_STAGES:47])  //the above update routines don't actually issue a save so do so now
				UNLOAD RECORD:C212([JOB_STAGES:47])
				READ ONLY:C145([JOB_STAGES:47])
			End if 
		End if 
		
		JC_FindJobFromOI($_l_RecordNumber; $_t_OIJobCode)
		If ([JOBS:26]Use_WIP:47) & (<>WIP_t_CIPTRANS#"") & (<>WIP_t_CIWTrans#"")  //added 09/03/07 -kmw
			//QUERY([ORDER ITEMS];[ORDER ITEMS]x_ID=$_l_RecordNumber)
			//If ([ORDER ITEMS]Invoice No="") | ([ORDER ITEMS]Invoice No="N"))
			$_t_TransTypeCode:=<>WIP_t_CIPTRANS  //order item deleted so no way of seeing if it was invoiced or not...However will assume it wasn't invoiced as there should be no way a user can delete an invoiced order item
			//Else
			//$_t_TransTypeCode:=◊WIPCIWTrans
			//End if
			JC_PostReverseToWIP($_l_RecordNumber; $_t_TransTypeCode)
		End if 
		
End case 
UNLOAD RECORD:C212([DIARY:12])
UNLOAD RECORD:C212([JOB PERSONNEL:48])
UNLOAD RECORD:C212([xDiaryRelations:137])
UNLOAD RECORD:C212([JOBS:26])
ERR_MethodTrackerReturn("ProcessService_OrderItems"; $_t_oldMethodName)
