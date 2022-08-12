//%attributes = {}
If (False:C215)
	//Project Method Name:      Trigger_setDiaryTimeStamp
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
	C_DATE:C307($_d_StampDate)
	C_LONGINT:C283($_l_Year; $_l_YearAdd; $_l_YearSubtract)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_StampTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trigger_setDiaryTimeStamp")
//this method will put the time date stamp into the field
//this significant date could be the date DONE not the date do
//so this may need to check a pre-but at the moment it will just
// set them based on the date.time to do
Case of 
	: ([DIARY:12]Date_Done_From:5#!00-00-00!)
		
		Case of 
			: ([DIARY:12]Date_Done_From:5<(Current date:C33(*)-(100*365)))
				Case of 
					: (Year of:C25([DIARY:12]Date_Done_From:5)<1000)
						//it probably missing a 0 at the end so multiply by 10
						$_l_Year:=Year of:C25([DIARY:12]Date_Done_From:5)*10
						$_l_YearAdd:=$_l_Year-Year of:C25([DIARY:12]Date_Done_From:5)
						[DIARY:12]Date_Done_From:5:=[DIARY:12]Date_Done_From:5+(365*$_l_YearAdd)
					Else 
						Repeat 
							[DIARY:12]Date_Done_From:5:=[DIARY:12]Date_Done_From:5+(365*100)
						Until ([DIARY:12]Date_Done_From:5>(Current date:C33(*)-(100*365)))
						
				End case 
			: ([DIARY:12]Date_Done_From:5>(Current date:C33(*)+(100*365)))
				Case of 
					: (Year of:C25([DIARY:12]Date_Done_From:5)>10000)
						//it probably missing an extra 0 at the end so divide by 10
						$_l_Year:=Year of:C25([DIARY:12]Date_Done_From:5)/10
						$_l_YearSubtract:=Year of:C25([DIARY:12]Date_Done_From:5)-$_l_Year
						[DIARY:12]Date_Done_From:5:=[DIARY:12]Date_Done_From:5-(365*$_l_YearSubtract)
					Else 
						Repeat 
							[DIARY:12]Date_Done_From:5:=[DIARY:12]Date_Done_From:5-(365*100)
						Until ([DIARY:12]Date_Done_From:5<(Current date:C33(*)+(100*365)))
				End case 
		End case 
		
		$_d_StampDate:=[DIARY:12]Date_Done_From:5
	: ([DIARY:12]Date_Do_From:4#!00-00-00!)
		Case of 
			: ([DIARY:12]Date_Do_From:4<(Current date:C33(*)-(100*365)))
				
				//I think we can safely say the date is wrong!!!!
				Case of 
					: (Year of:C25([DIARY:12]Date_Do_From:4)<1000)
						//it probably missing a 0 at the end so multiply by 10
						$_l_Year:=Year of:C25([DIARY:12]Date_Do_From:4)*10
						$_l_YearAdd:=$_l_Year-Year of:C25([DIARY:12]Date_Do_From:4)
						[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Do_From:4+(365*$_l_YearAdd)
					Else 
						Repeat 
							[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Do_From:4+(365*100)
						Until ([DIARY:12]Date_Do_From:4>(Current date:C33(*)-(100*365)))
						
				End case 
			: ([DIARY:12]Date_Do_From:4>(Current date:C33(*)+(100*365)))
				Case of 
					: (Year of:C25([DIARY:12]Date_Do_From:4)>10000)
						//it probably missing an extra 0 at the end so divide by 10
						$_l_Year:=Year of:C25([DIARY:12]Date_Do_From:4)/10
						$_l_YearSubtract:=Year of:C25([DIARY:12]Date_Do_From:4)-$_l_Year
						[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Do_From:4-(365*$_l_YearSubtract)
					Else 
						Repeat 
							[DIARY:12]Date_Do_From:4:=[DIARY:12]Date_Do_From:4-(365*100)
						Until ([DIARY:12]Date_Do_From:4<(Current date:C33(*)+(100*365)))
				End case 
		End case 
		
		$_d_StampDate:=[DIARY:12]Date_Do_From:4
		
End case 
Case of 
	: ([DIARY:12]Time_Done_From:7#?00:00:00?)
		$_ti_StampTime:=[DIARY:12]Time_Done_From:7
	: ([DIARY:12]Time_Do_From:6#?00:00:00?)
		$_ti_StampTime:=[DIARY:12]Time_Do_From:6
		
End case 
[DIARY:12]Date_Time_Stamp:45:=GEN_TimeDateStamp($_d_StampDate; $_ti_StampTime)
ERR_MethodTrackerReturn("Trigger_setDiaryTimeStamp"; $_t_oldMethodName)