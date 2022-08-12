//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SuperDiary SaveChk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Ask; $_bo_SetResult; $1; SD_bo_RecordModified; SD_bo_ResultsDialog)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_OK; SD_l_RecNeedssaving; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SuperDiary SaveChk")
//SuperDiary SaveChk: asks to save changes before a change of screen

If (Count parameters:C259>=1)
	$_bo_Ask:=$1
Else 
	$_bo_Ask:=True:C214
End if 

//SD_bo_AddingDiaryRecord:=True
If (SD_bo_RecordModified)
	
	If (SD_bo_ResultsDialog=False:C215)
		If (SD_l_RecNeedssaving=1)
			If ($_bo_Ask=True:C214)
				Gen_Confirm("This record has been modified. Save changes?"; "Save"; "Discard")
			Else 
				$_l_OK:=1
			End if 
			If (OK=1)
				SD_Saverecord
			End if 
			SD_bo_RecordModified:=False:C215
		End if 
	Else 
		//do we need to
		//put up the results dialog?
		$_bo_SetResult:=False:C215
		
		Case of 
			: ([DIARY:12]Diary_Code:3="")
				$_bo_SetResult:=False:C215
			: (Old:C35([DIARY:12]Done:14)=False:C215) & ([DIARY:12]Done:14)
				//diary item has been set to done
				$_bo_SetResult:=True:C214
			: (([DIARY:12]Date_Done_From:5>!00-00-00!) & ([DIARY:12]Done:14=False:C215))
				
				//done date has been set
			: (([DIARY:12]Date_Do_To:33<Current date:C33(*)) & ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Date_Done_To:34=!00-00-00!) & ([DIARY:12]Action_Code:9#"TASK"))
				//it should be done
				$_bo_SetResult:=True:C214
				
			: (([DIARY:12]Date_Do_To:33=Current date:C33(*)) & ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Date_Done_To:34=!00-00-00!) & ([DIARY:12]Time_Do_To:35<Current time:C178(*)) & ([DIARY:12]Action_Code:9#"TASK"))
				//it should be done
				$_bo_SetResult:=True:C214
				
			: (([DIARY:12]Date_Do_To:33=!00-00-00!) & ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Date_Do_From:4<Current date:C33(*)) & ([DIARY:12]Action_Code:9#"TASK"))
				//it should be done
				$_bo_SetResult:=True:C214
				
			: (([DIARY:12]Date_Do_To:33=!00-00-00!) & ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Date_Do_From:4=Current date:C33(*)) & ([DIARY:12]Time_Do_To:35<Current time:C178(*)) & ([DIARY:12]Action_Code:9#"TASK"))
				$_bo_SetResult:=True:C214
		End case 
		If ($_bo_SetResult)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
			DIALOG:C40([USER:15]; "DiaryResultsDialog")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			SD_bo_RecordModified:=False:C215
		Else 
			If (SD_l_RecNeedssaving=1)
				If ($_bo_Ask=True:C214)
					Gen_Confirm("This record has been modified. Save changes?"; "Save"; "Discard")
				Else 
					$_l_OK:=1
				End if 
				If (OK=1)
					SD_Saverecord
				End if 
				SD_bo_RecordModified:=False:C215
			End if 
		End if 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("SuperDiary SaveChk"; $_t_oldMethodName)
