//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InDTimeDo
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
	C_LONGINT:C283($_l_Days)
	C_REAL:C285(<>TimeDay; $_r_Units; vTot)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultTimeDayStart; <>SYS_ti_DefaultTimeUnits; $_ti_EndTime; $_ti_Hours)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InDTimeDo")
//Diary_InDTimeDo - See also DiaryInDTime

If ([DIARY:12]Date_Do_To:33>[DIARY:12]Date_Do_From:4)  //If >1 day
	$_l_Days:=([DIARY:12]Date_Do_To:33-[DIARY:12]Date_Do_From:4)-1
	If ($_l_Days>0)
		$_ti_Hours:=Time:C179(Time string:C180(($_l_Days*<>TimeDay)*<>SYS_ti_DefaultTimeUnits))  //multiply by day no of units
	Else 
		$_ti_Hours:=0
	End if 
	// If ([DIARY]Time do From>◊TimeDaySt)
	$_ti_EndTime:=<>SYS_ti_DefaultTimeDayStart+Time:C179(Time string:C180(<>TimeDay*<>SYS_ti_DefaultTimeUnits))
	If ([DIARY:12]Time_Do_From:6<$_ti_EndTime)
		$_ti_Hours:=$_ti_Hours+($_ti_EndTime-[DIARY:12]Time_Do_From:6)
	End if 
	//  Else
	//   $_ti_Hours:=$_ti_Hours+Time(Time string(◊TimeDay*◊TimeUnit))
	//  End if
	If ([DIARY:12]Time_Do_To:35><>SYS_ti_DefaultTimeDayStart)
		$_ti_Hours:=$_ti_Hours+([DIARY:12]Time_Do_To:35-<>SYS_ti_DefaultTimeDayStart)
	End if 
Else 
	If ([DIARY:12]Time_Do_To:35>[DIARY:12]Time_Do_From:6)
		$_ti_Hours:=[DIARY:12]Time_Do_To:35-[DIARY:12]Time_Do_From:6
	Else 
		$_ti_Hours:=0
	End if 
End if 
[DIARY:12]Units:20:=Round:C94(Num:C11(String:C10($_ti_Hours/<>SYS_ti_DefaultTimeUnits)); 2)
[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
[DIARY:12]Cost_Value:75:=Round:C94(([DIARY:12]Cost_Rate:74*[DIARY:12]Units:20); 2)  //added 30/03/07 -kmw
vTot:=1
ERR_MethodTrackerReturn("Diary_InDTimeDo"; $_t_oldMethodName)