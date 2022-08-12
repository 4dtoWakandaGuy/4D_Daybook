//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Title
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
	C_DATE:C307(<>DB_d_CurrentDate; $CWB; $D; $WB)
	C_TEXT:C284(<>TimeAct; $_t_oldMethodName; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Title")
//Diary_Title
If ([DIARY:12]Date_Done_From:5>!00-00-00!)
	$D:=[DIARY:12]Date_Done_From:5
Else 
	$D:=[DIARY:12]Date_Do_From:4
End if 
If ($D=<>DB_d_CurrentDate)
	vTitle:="Today"
Else 
	If ($D=(<>DB_d_CurrentDate+1))
		vTitle:="Tomorrow"
	Else 
		If ($D=(<>DB_d_CurrentDate-1))
			vTitle:="Yesterday"
		Else 
			$wb:=$D-Day number:C114($D-1)
			$cwb:=<>DB_d_CurrentDate-Day number:C114(<>DB_d_CurrentDate-1)
			If ($wb=$cwb)
				vTitle:="This "+DayName($D)
			Else 
				If ($wb=($cwb-7))
					vTitle:="Last "+DayName($D)
				Else 
					If ($wb=($cwb+7))
						vTitle:="Next "+DayName($D)
					Else 
						If ($wb=($cwb+14))
							vTitle:=DayName($D)+" Week"
						Else 
							vTitle:=DayName($D)
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
If (([DIARY:12]Action_Code:9=<>TimeAct) & (<>TimeAct#""))
	vTitle:=vTitle+"'s Time"
Else 
	vTitle:=vTitle+"'s Diary"
End if 
ERR_MethodTrackerReturn("Diary_Title"; $_t_oldMethodName)