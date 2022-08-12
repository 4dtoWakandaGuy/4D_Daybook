//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary TimeCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_DATE:C307($_d_DateDoFrom; $_d_DateDoTo)
	C_TEXT:C284($_t_DiaryCode; $_t_DiaryPerson; $_t_Found; $_t_oldMethodName; $1)
	C_TIME:C306(<>SYS_ti_DefaultDiaryTimeCheck; $_ti_TimeDoFrom; $_ti_TimeDoneFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary TimeCheck")
If (([DIARY:12]Date_Do_From:4>!00-00-00!) & ([DIARY:12]Time_Do_From:6>?00:00:00?) & ([DIARY:12]Done:14=False:C215))
	If (Count parameters:C259=0)
		Menu_Record("Diary TimeCheck"; "Check Time Conflicts")
		$_bo_OK:=In_ButtChkMan(->[DIARY:12]; "3 9")
	Else 
		$_bo_OK:=True:C214
	End if 
	If ($_bo_OK)
		OK:=1
		If (Modified record:C314([DIARY:12]))
			Diary_PersPrior
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		End if 
		If (OK=1)
			$_d_DateDoFrom:=[DIARY:12]Date_Do_From:4
			$_d_DateDoTo:=[DIARY:12]Date_Do_To:33
			$_ti_TimeDoFrom:=[DIARY:12]Time_Do_From:6-<>SYS_ti_DefaultDiaryTimeCheck
			If ([DIARY:12]Time_Do_To:35=?00:00:00?)
				$_ti_TimeDoneFrom:=[DIARY:12]Time_Do_From:6+<>SYS_ti_DefaultDiaryTimeCheck
			Else 
				$_ti_TimeDoneFrom:=[DIARY:12]Time_Do_To:35+<>SYS_ti_DefaultDiaryTimeCheck
			End if 
			$_t_DiaryPerson:=[DIARY:12]Person:8
			$_t_DiaryCode:=[DIARY:12]Diary_Code:3
			CUT NAMED SELECTION:C334([DIARY:12]; "Diary Time")
			$_t_Found:=""
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33>=$_d_DateDoFrom; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=$_d_DateDoTo; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=$_t_DiaryPerson; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Time_Do_From:6>?00:00:00?)
			If (Records in selection:C76([DIARY:12])>1)
				FIRST RECORD:C50([DIARY:12])
				While ((Not:C34(End selection:C36([DIARY:12]))) & ($_t_Found=""))
					If ([DIARY:12]Diary_Code:3#$_t_DiaryCode)
						If ([DIARY:12]Date_Do_From:4=$_d_DateDoFrom)
							If ([DIARY:12]Date_Do_To:33=[DIARY:12]Date_Do_From:4)
								If (([DIARY:12]Time_Do_From:6=($_ti_TimeDoFrom+<>SYS_ti_DefaultDiaryTimeCheck)) | (([DIARY:12]Time_Do_From:6>=$_ti_TimeDoFrom) & ([DIARY:12]Time_Do_To:35<=$_ti_TimeDoneFrom)) | (([DIARY:12]Time_Do_From:6<=$_ti_TimeDoFrom) & ([DIARY:12]Time_Do_To:35>=$_ti_TimeDoneFrom)) | (([DIARY:12]Time_Do_From:6<=$_ti_TimeDoFrom) & ([DIARY:12]Time_Do_To:35>=$_ti_TimeDoFrom)) | (([DIARY:12]Time_Do_From:6<=$_ti_TimeDoneFrom) & ([DIARY:12]Time_Do_To:35>=$_ti_TimeDoneFrom)))
									$_t_Found:="Found"
								End if 
							Else 
								If (([DIARY:12]Time_Do_From:6=($_ti_TimeDoFrom+<>SYS_ti_DefaultDiaryTimeCheck)) | (([DIARY:12]Time_Do_From:6<=$_ti_TimeDoneFrom) & ($_d_DateDoFrom=$_d_DateDoTo)) | ($_d_DateDoFrom#$_d_DateDoTo))
									$_t_Found:="Found"
								End if 
							End if 
						Else 
							If ([DIARY:12]Date_Do_From:4<$_d_DateDoFrom)
								$_t_Found:="Found"
							Else 
								If ([DIARY:12]Time_Do_To:35>=$_ti_TimeDoFrom)
									$_t_Found:="Found"
								End if 
							End if 
						End if 
					End if 
					If ($_t_Found="")
						NEXT RECORD:C51([DIARY:12])
					End if 
				End while 
			End if 
			If ($_t_Found#"")
				RELATE ONE:C42([DIARY:12]Company_Code:1)
				RELATE ONE:C42([DIARY:12]Action_Code:9)
				$_t_Found:=[DIARY:12]Company_Code:1+":  "+[COMPANIES:2]Company_Name:2+Char:C90(13)+[DIARY:12]Action_Code:9+":  "+[ACTIONS:13]Action_Name:2+Char:C90(13)
				Case of 
					: ([DIARY:12]Date_Do_To:33=[DIARY:12]Date_Do_From:4)
						If ([DIARY:12]Time_Do_To:35=[DIARY:12]Time_Do_From:6)
							$_t_Found:=$_t_Found+"Date: "+String:C10([DIARY:12]Date_Do_To:33)+Char:C90(13)+"Time:  "+String:C10([DIARY:12]Time_Do_From:6; 2)
						Else 
							$_t_Found:=$_t_Found+"Date: "+String:C10([DIARY:12]Date_Do_To:33)+Char:C90(13)+"Time:  "+String:C10([DIARY:12]Time_Do_From:6; 2)+" to "+String:C10([DIARY:12]Time_Do_To:35; 2)
						End if 
					: ([DIARY:12]Date_Do_From:4=$_d_DateDoFrom)
						$_t_Found:=$_t_Found+"Date: "+String:C10([DIARY:12]Date_Do_From:4)+Char:C90(13)+"Time:  "+"From "+String:C10([DIARY:12]Time_Do_From:6; 2)
					: ([DIARY:12]Date_Do_To:33=$_d_DateDoTo)
						$_t_Found:=$_t_Found+"Date: "+String:C10([DIARY:12]Date_Do_To:33)+Char:C90(13)+"Time:  "+"To "+String:C10([DIARY:12]Time_Do_To:35; 2)
					Else 
						$_t_Found:=$_t_Found+"Date: "+String:C10($_d_DateDoFrom)+Char:C90(13)+"Time:  "+"All Day"
				End case 
			End if 
			USE NAMED SELECTION:C332("Diary Time")
			If ($_t_Found#"")
				Gen_Confirm($_t_DiaryPerson+" is already booked as follows: "+Char:C90(13)+$_t_Found; "Try again"; "Allow")
				If (OK=1)
					[DIARY:12]Time_Checked:28:=False:C215
				Else 
					[DIARY:12]Time_Checked:28:=True:C214
				End if 
			Else 
				[DIARY:12]Time_Checked:28:=True:C214
				If ((Count parameters:C259=0) & ([DIARY:12]Time_Checked:28))
					Gen_Alert("That Time is not booked"; "")
				End if 
			End if 
		End if 
	End if 
Else 
	[DIARY:12]Time_Checked:28:=True:C214
	If (Count parameters:C259=0)
		Gen_Alert("Time checking is only valid for To Do Diary Items with a Date and Time specified"; "")
	End if 
End if 
ERR_MethodTrackerReturn("Diary TimeCheck"; $_t_oldMethodName)