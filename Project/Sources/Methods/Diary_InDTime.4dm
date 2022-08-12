//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InDTime
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
	C_BOOLEAN:C305($_bo_CalcTimeUnits; vDontAutoCalcTimeUnits)
	C_LONGINT:C283($_l_Days)
	C_REAL:C285(<>TimeDay; $_r_Units; vTot)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultTimeDayStart; <>SYS_ti_DefaultTimeUnits; $_ti_EndTime; $_ti_Hours)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InDTime")

//******************************** added 22/05/07 -kmw ********************************
If (vDontAutoCalcTimeUnits=True:C214)
	CONFIRM:C162("Update Time Units field to reflect change to Date/Time Done fields?")
	If (OK=1)
		$_bo_CalcTimeUnits:=True:C214
	Else 
		$_bo_CalcTimeUnits:=False:C215
	End if 
Else   //this is the old behaviour which was to always update time units without asking user first....it should always behave like this unless programmer deliberately sets vDontAutoCalcTimeUnits to TRUE somewhere since the process was opened (e.g...Time entry screen sets this value to true if user explicitly alters the Time Units field, or in any regard if the Time record is being modified (ie not new)....both good indications that program should not automatically overwrite whatever is in there without checking with user)
	$_bo_CalcTimeUnits:=True:C214
End if 
//********************************************************************************

If ($_bo_CalcTimeUnits)  //added 22/05/07 -kmw
	If ([DIARY:12]Date_Done_To:34>[DIARY:12]Date_Done_From:5)  //If >1 day
		$_l_Days:=([DIARY:12]Date_Done_To:34-[DIARY:12]Date_Done_From:5)-1
		If ($_l_Days>0)
			$_ti_Hours:=Time:C179(Time string:C180(($_l_Days*<>TimeDay)*<>SYS_ti_DefaultTimeUnits))  //multiply by day no of units
		Else 
			$_ti_Hours:=0
		End if 
		// If ([DIARY]Time Done From>◊TimeDaySt)
		$_ti_EndTime:=<>SYS_ti_DefaultTimeDayStart+Time:C179(Time string:C180(<>TimeDay*<>SYS_ti_DefaultTimeUnits))
		If ([DIARY:12]Time_Done_From:7<$_ti_EndTime)
			$_ti_Hours:=$_ti_Hours+($_ti_EndTime-[DIARY:12]Time_Done_From:7)
		End if 
		//  Else
		//   $_ti_Hours:=$_ti_Hours+Time(Time string(◊TimeDay*◊TimeUnit))
		//  End if
		If ([DIARY:12]Time_Done_To:36><>SYS_ti_DefaultTimeDayStart)
			$_ti_Hours:=$_ti_Hours+([DIARY:12]Time_Done_To:36-<>SYS_ti_DefaultTimeDayStart)
		End if 
	Else 
		If ([DIARY:12]Time_Done_To:36>[DIARY:12]Time_Done_From:7)
			$_ti_Hours:=[DIARY:12]Time_Done_To:36-[DIARY:12]Time_Done_From:7
		Else 
			$_ti_Hours:=0
		End if 
	End if 
	[DIARY:12]Units:20:=Round:C94(Num:C11(String:C10($_ti_Hours/<>SYS_ti_DefaultTimeUnits)); 2)
	[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
	[DIARY:12]Cost_Value:75:=Round:C94(([DIARY:12]Cost_Rate:74*[DIARY:12]Units:20); 2)  //added 30/03/07 -kmw
	vTot:=1
End if   //added 22/05/07 -kmw
ERR_MethodTrackerReturn("Diary_InDTime"; $_t_oldMethodName)