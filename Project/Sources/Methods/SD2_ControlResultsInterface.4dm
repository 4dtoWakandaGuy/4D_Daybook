//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ControlResultsInterface
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
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	C_LONGINT:C283($_l_ResultRow; SD2_l_Completed)
	C_TEXT:C284($_t_oldMethodName; SD2_t_SELResultName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ControlResultsInterface")

//this method controls the visibility of the results pop-ups on the screen
//SD2_ControlResultsInterface
//This is called usually when the action code is changed so
//Find the result codes for this action
If ([DIARY:12]Action_Code:9#"")
	OBJECT SET VISIBLE:C603([DIARY:12]Done:14; True:C214)
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
	
End if 

Case of 
	: (Size of array:C274(SD2_at_ResultNames)>1)
		If (Not:C34([DIARY:12]Done:14)) | ([DIARY:12]Result_Code:11="")
			OBJECT SET VISIBLE:C603(*; "oDiaryResult@"; True:C214)  // Set all the result objects to visible
			If ([DIARY:12]Result_Code:11="")
				SD2_t_SELResultName:=""
				OBJECT SET ENTERABLE:C238(SD2_t_SELResultName; True:C214)
				OBJECT SET VISIBLE:C603(SD2_at_ResultNames; True:C214)
				
			Else 
				//This should never be-if the result code is set then this should be done
				$_l_ResultRow:=Find in array:C230(SD2_at_ResultCodes; [DIARY:12]Result_Code:11)
				If ($_l_ResultRow>0)
					SD2_t_SELResultName:=SD2_at_ResultNames{$_l_ResultRow}
				Else 
					QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
					If (Records in selection:C76([RESULTS:14])=1)
						SD2_t_SELResultName:=[RESULTS:14]Result_Name:2
					Else 
						SD2_t_SELResultName:="Unknown Result"
					End if 
					UNLOAD RECORD:C212([RESULTS:14])
					
				End if 
				OBJECT SET ENTERABLE:C238(SD2_t_SELResultName; False:C215)
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*; "oDiaryResultNamePopUp@"; False:C215)  // Set all the result pop up to invisible"
			//and set the value of the result
			$_l_ResultRow:=Find in array:C230(SD2_at_ResultCodes; [DIARY:12]Result_Code:11)
			If ($_l_ResultRow>0)
				SD2_t_SELResultName:=SD2_at_ResultNames{$_l_ResultRow}
			Else 
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
				If (Records in selection:C76([RESULTS:14])=1)
					SD2_t_SELResultName:=[RESULTS:14]Result_Name:2
				Else 
					SD2_t_SELResultName:="Unknown Result"
				End if 
				UNLOAD RECORD:C212([RESULTS:14])
				
			End if 
			OBJECT SET ENTERABLE:C238(SD2_t_SELResultName; False:C215)
		End if 
		
		
	: (Size of array:C274(SD2_at_ResultNames)=1)
		//there is only one result so hide the results popup and set the result code if the object is completed
		If (SD2_l_Completed=1)  //entering a record of something that is done
			//this would only be set here is the action code is filled
			//so here we can hide the completed button and the result code fields and pop ups
			OBJECT SET VISIBLE:C603(*; "oDone@"; False:C215)  //but we do not set the DONE button till the LPA because that way we can continue to call SD2_SetInterface in the 'during' phase
			OBJECT SET VISIBLE:C603(*; "oDiaryResult@"; False:C215)  // But we do not set the Result Code until the LPA because that way we can continue to call SD2_SetInterface in the during phase
			
		Else 
			If ([DIARY:12]Done:14)  //this is a completed diary action
				//The result should be set
				If ([DIARY:12]Result_Code:11#"")
					//we do not set the result fields to visible here-if they are visible that is ok
					OBJECT SET VISIBLE:C603(*; "oDiaryResultNamePopUp@"; False:C215)  // Set all the result pop up to invisible"
					//and set the value of the result
					$_l_ResultRow:=Find in array:C230(SD2_at_ResultCodes; [DIARY:12]Result_Code:11)
					If ($_l_ResultRow>0)
						SD2_t_SELResultName:=SD2_at_ResultNames{$_l_ResultRow}
					Else 
						QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
						If (Records in selection:C76([RESULTS:14])=1)
							SD2_t_SELResultName:=[RESULTS:14]Result_Name:2
						Else 
							SD2_t_SELResultName:="Unknown Result"
						End if 
						UNLOAD RECORD:C212([RESULTS:14])
						
					End if 
				Else 
					//the done button may just have been clicked
					//we will set the result code in the LPA phase if the done button remains checked
				End if 
			Else 
				//there is pronably no action so no results-hide the
				//There is only one result but we should make sure the completed CB is visible-not the result code fields
				OBJECT SET VISIBLE:C603(*; "oDone@"; True:C214)  //but we do not set the DONE button
				OBJECT SET VISIBLE:C603(*; "oDiaryResult@"; False:C215)  // But we do not set the Result Code until the LPA because that way we can continue to call SD2_SetInterface in the during phase
				//if the DONE button is clicked then the result will be set in the lpa method
			End if 
		End if 
	Else 
		//There are no results=there is probably no action selected so no point in showng the completed fields
		//Rcall of this method when there are results will display them again if needed
		If (Not:C34([DIARY:12]Done:14))
			If ([DIARY:12]Action_Code:9="")
				OBJECT SET VISIBLE:C603(*; "oDone@"; False:C215)  //but we do not set the DONE button till the LPA because that way we can continue to call SD2_SetInterface in the 'during' phase
				OBJECT SET VISIBLE:C603(*; "oDiaryResult@"; False:C215)  // But we do not set the Result Code until the LPA because that way we can continue to call SD2_SetInterface in the during phase
			Else 
				//an action code has been set so why no results---because all results are applicable
				ALL RECORDS:C47([RESULTS:14])
				ARRAY TEXT:C222(SD2_at_ResultCodes; 0)
				ARRAY TEXT:C222(SD2_at_ResultNames; 0)
				SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; SD2_at_ResultCodes; [RESULTS:14]Result_Name:2; SD2_at_ResultNames)
				SORT ARRAY:C229(SD2_at_ResultNames; SD2_at_ResultCodes)
				If (Size of array:C274(SD2_at_ResultCodes)>0)  // just in case there are no results on the datafile
					SD2_ControlResultsInterface
				End if 
				
			End if 
		Else 
			//this is a done action-appropriate to display the result if it is set
			OBJECT SET VISIBLE:C603(*; "oDiaryResultLabel@"; True:C214)
			QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
			If (Records in selection:C76([RESULTS:14])=1)
				SD2_t_SELResultName:=[RESULTS:14]Result_Name:2
			Else 
				SD2_t_SELResultName:="Unknown Result"
			End if 
			UNLOAD RECORD:C212([RESULTS:14])
			OBJECT SET ENTERABLE:C238(SD2_t_SELResultName; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryResultNamePopUp@"; False:C215)  // Set all the result pop up to invisible"
		End if 
End case 
ERR_MethodTrackerReturn("SD2_ControlResultsInterface"; $_t_oldMethodName)
