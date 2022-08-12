//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_CalndrDayName
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
	C_DATE:C307(WS_d_DiaryDate1; WS_d_DiaryDate2; WS_d_DiaryDate3; WS_d_DiaryDate4; WS_d_DiaryDate5; WS_d_DiaryDate6; WS_d_DiaryDate7)
	C_TEXT:C284($_t_oldMethodName; WT_DayNum_DayName1; WT_DayNum_DayName2; WT_DayNum_DayName3; WT_DayNum_DayName4; WT_DayNum_DayName5; WT_DayNum_DayName6; WT_DayNum_DayName7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_CalndrDayName")
//WT_CalndrDayName: sets the day name for the weekly view
Case of 
	: (Day number:C114(WS_d_DiaryDate1)=1)
		WT_DayNum_DayName1:="Sunday"
	: (Day number:C114(WS_d_DiaryDate1)=2)
		WT_DayNum_DayName1:="Monday"
	: (Day number:C114(WS_d_DiaryDate1)=3)
		WT_DayNum_DayName1:="Tuesday"
	: (Day number:C114(WS_d_DiaryDate1)=4)
		WT_DayNum_DayName1:="Wednesday"
	: (Day number:C114(WS_d_DiaryDate1)=5)
		WT_DayNum_DayName1:="Thursday"
	: (Day number:C114(WS_d_DiaryDate1)=6)
		WT_DayNum_DayName1:="Friday"
	: (Day number:C114(WS_d_DiaryDate1)=7)
		WT_DayNum_DayName1:="Saturday"
End case 
Case of 
	: (Day number:C114(WS_d_DiaryDate2)=1)
		WT_DayNum_DayName2:="Sunday"
	: (Day number:C114(WS_d_DiaryDate2)=2)
		WT_DayNum_DayName2:="Monday"
	: (Day number:C114(WS_d_DiaryDate2)=3)
		WT_DayNum_DayName2:="Tuesday"
	: (Day number:C114(WS_d_DiaryDate2)=4)
		WT_DayNum_DayName2:="Wednesday"
	: (Day number:C114(WS_d_DiaryDate2)=5)
		WT_DayNum_DayName2:="Thursday"
	: (Day number:C114(WS_d_DiaryDate2)=6)
		WT_DayNum_DayName2:="Friday"
	: (Day number:C114(WS_d_DiaryDate2)=7)
		WT_DayNum_DayName2:="Saturday"
End case 
Case of 
	: (Day number:C114(WS_d_DiaryDate3)=1)
		WT_DayNum_DayName3:="Sunday"
	: (Day number:C114(WS_d_DiaryDate3)=2)
		WT_DayNum_DayName3:="Monday"
	: (Day number:C114(WS_d_DiaryDate3)=3)
		WT_DayNum_DayName3:="Tuesday"
	: (Day number:C114(WS_d_DiaryDate3)=4)
		WT_DayNum_DayName3:="Wednesday"
	: (Day number:C114(WS_d_DiaryDate3)=5)
		WT_DayNum_DayName3:="Thursday"
	: (Day number:C114(WS_d_DiaryDate3)=6)
		WT_DayNum_DayName3:="Friday"
	: (Day number:C114(WS_d_DiaryDate3)=7)
		WT_DayNum_DayName3:="Saturday"
End case 
Case of 
	: (Day number:C114(WS_d_DiaryDate4)=1)
		WT_DayNum_DayName4:="Sunday"
	: (Day number:C114(WS_d_DiaryDate4)=2)
		WT_DayNum_DayName4:="Monday"
	: (Day number:C114(WS_d_DiaryDate4)=3)
		WT_DayNum_DayName4:="Tuesday"
	: (Day number:C114(WS_d_DiaryDate4)=4)
		WT_DayNum_DayName4:="Wednesday"
	: (Day number:C114(WS_d_DiaryDate4)=5)
		WT_DayNum_DayName4:="Thursday"
	: (Day number:C114(WS_d_DiaryDate4)=6)
		WT_DayNum_DayName4:="Friday"
	: (Day number:C114(WS_d_DiaryDate4)=7)
		WT_DayNum_DayName4:="Saturday"
End case 
Case of 
	: (Day number:C114(WS_d_DiaryDate5)=1)
		WT_DayNum_DayName5:="Sunday"
	: (Day number:C114(WS_d_DiaryDate5)=2)
		WT_DayNum_DayName5:="Monday"
	: (Day number:C114(WS_d_DiaryDate5)=3)
		WT_DayNum_DayName5:="Tuesday"
	: (Day number:C114(WS_d_DiaryDate5)=4)
		WT_DayNum_DayName5:="Wednesday"
	: (Day number:C114(WS_d_DiaryDate5)=5)
		WT_DayNum_DayName5:="Thursday"
	: (Day number:C114(WS_d_DiaryDate5)=6)
		WT_DayNum_DayName5:="Friday"
	: (Day number:C114(WS_d_DiaryDate5)=7)
		WT_DayNum_DayName5:="Saturday"
End case 
Case of 
	: (Day number:C114(WS_d_DiaryDate6)=1)
		WT_DayNum_DayName6:="Sunday"
	: (Day number:C114(WS_d_DiaryDate6)=2)
		WT_DayNum_DayName6:="Monday"
	: (Day number:C114(WS_d_DiaryDate6)=3)
		WT_DayNum_DayName6:="Tuesday"
	: (Day number:C114(WS_d_DiaryDate6)=4)
		WT_DayNum_DayName6:="Wednesday"
	: (Day number:C114(WS_d_DiaryDate6)=5)
		WT_DayNum_DayName6:="Thursday"
	: (Day number:C114(WS_d_DiaryDate6)=6)
		WT_DayNum_DayName6:="Friday"
	: (Day number:C114(WS_d_DiaryDate7)=7)
		WT_DayNum_DayName6:="Saturday"
End case 
Case of 
	: (Day number:C114(WS_d_DiaryDate7)=1)
		WT_DayNum_DayName7:="Sunday"
	: (Day number:C114(WS_d_DiaryDate7)=2)
		WT_DayNum_DayName7:="Monday"
	: (Day number:C114(WS_d_DiaryDate7)=3)
		WT_DayNum_DayName7:="Tuesday"
	: (Day number:C114(WS_d_DiaryDate7)=4)
		WT_DayNum_DayName7:="Wednesday"
	: (Day number:C114(WS_d_DiaryDate7)=5)
		WT_DayNum_DayName7:="Thursday"
	: (Day number:C114(WS_d_DiaryDate7)=6)
		WT_DayNum_DayName7:="Friday"
	: (Day number:C114(WS_d_DiaryDate7)=7)
		WT_DayNum_DayName7:="Saturday"
End case 
ERR_MethodTrackerReturn("WT_CalndrDayName"; $_t_oldMethodName)