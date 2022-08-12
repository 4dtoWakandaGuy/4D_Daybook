//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_BuildDay
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
	C_DATE:C307($2)
	C_LONGINT:C283($_HL_HoursLIstID; $_HL_LIstID; $_l_CharacterPosition; $_l_EndHour; $_l_Index; $_l_Index2; $_l_ItemReference; $_l_StartHour; $_l_Time; $_l_Time2; $_l_TimeReferenceNew)
	C_LONGINT:C283($SD_HL_l_TENS; $SD_l_TimeSpace; SD_HL_l_Hours3; SD_HL_l_Mins; SD_HL_l_tens; SD_l_TimeSpace2)
	C_REAL:C285($1)
	C_TEXT:C284($_t_HourString; $_t_ItemText; $_t_oldMethodName)
	C_TIME:C306($_ti_HourTime; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_BuildDay")
If (SD_l_TimeSpace2=0)
	$SD_l_TimeSpace:=15
Else 
	$SD_l_TimeSpace:=SD_l_TimeSpace2
	
End if 


$_HL_LIstID:=New list:C375
If (Not:C34(Is a list:C621(SD_HL_l_Mins)))
	SD_HL_l_Mins:=New list:C375
End if 

APPEND TO LIST:C376(SD_HL_l_Mins; "1"; 1; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "2"; 2; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "3"; 3; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "4"; 4; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "5"; 5; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "6"; 6; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "7"; 7; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "8"; 8; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "9"; 9; 0; True:C214)
APPEND TO LIST:C376(SD_HL_l_Mins; "10"; 10; 0; True:C214)
SD_HL_l_tens:=New list:C375
For ($_l_Index; 0; 59; $SD_l_TimeSpace)
	If ($_l_Index=0)
		APPEND TO LIST:C376(SD_HL_l_tens; "0"; 60; 0; True:C214)
	Else 
		APPEND TO LIST:C376(SD_HL_l_tens; String:C10($_l_Index); $_l_Index; 0; True:C214)
	End if 
End for 

$_l_StartHour:=SD_ti_SettingsTimeStart*1  //Time_In seconds since midnight
If (SD_ti_SettingsTimeEnd=?00:00:00?)  //NG  new lines here 3/3/2004
	SD_ti_SettingsTimeEnd:=?23:59:59?
Else 
	If (SD_ti_SettingsTimeEnd<SD_ti_SettingsTimeStart)
		SD_ti_SettingsTimeEnd:=SD_ti_SettingsTimeStart
	End if 
End if   //NG new lines 3/3/2004 end here

$_l_StartHour:=Int:C8($_l_StartHour/3600)
$_l_EndHour:=SD_ti_SettingsTimeEnd*1  //Time_In seconds since midnight

$_l_EndHour:=(Int:C8($_l_EndHour/3600))+1

SD_HL_l_Hours3:=New list:C375
For ($_l_Index; $_l_StartHour; $_l_EndHour)
	$_l_Time:=$_l_Index*3600
	$_t_HourString:=Time string:C180($_l_Time)
	
	
	$_l_TimeReferenceNew:=GEN_TimeDateStamp($2; Time:C179($_t_HourString))
	$_t_HourString:=Substring:C12($_t_HourString; 1; Length:C16($_t_HourString)-3)
	$_HL_HoursLIstID:=Copy list:C626(SD_HL_l_tens)
	
	For ($_l_Index2; 1; Count list items:C380($_HL_HoursLIstID))
		GET LIST ITEM:C378($_HL_HoursLIstID; $_l_Index2; $_l_ItemReference; $_t_ItemText)
		If ($_l_ItemReference<60)
			$_ti_HourTime:=Time:C179(Time string:C180(($_l_ItemReference*60)+$_l_Time))
			$_l_TimeReferenceNew:=GEN_TimeDateStamp($2; $_ti_HourTime)
			SET LIST ITEM:C385($_HL_HoursLIstID; $_l_ItemReference; $_t_ItemText; $_l_TimeReferenceNew)
		Else 
			$_l_Time2:=($_l_Index-1)*3600
			$_ti_HourTime:=Time:C179(Time string:C180(($_l_ItemReference*60)+$_l_Time2))
			$_l_TimeReferenceNew:=GEN_TimeDateStamp($2; $_ti_HourTime)
			
			SET LIST ITEM:C385($_HL_HoursLIstID; $_l_ItemReference; $_t_ItemText; $_l_TimeReferenceNew)
		End if 
		
	End for 
	
	
	For ($_l_Index2; 1; Count list items:C380($_HL_HoursLIstID))
		GET LIST ITEM:C378($_HL_HoursLIstID; $_l_Index2; $_l_ItemReference; $_t_ItemText)
		$_l_CharacterPosition:=Position:C15(":"; $_t_HourString)
		If ($_l_CharacterPosition>0)
			$_t_HourString:=Substring:C12($_t_HourString; 1; $_l_CharacterPosition)
		End if 
		If ($_t_ItemText="0")
			$_t_ItemText:="00"
		End if 
		
		$_t_ItemText:=$_t_HourString+$_t_ItemText
		//  SD_d_TestDate:=!00/00/00!
		// SD_ti_TestTime:=†00:00:00†
		//   Gen_TimeStamp2Date ($_l_ItemReference;->SD_d_TestDate;->SD_ti_TestTime)`just here for check
		APPEND TO LIST:C376($1; $_t_ItemText; -($_l_ItemReference))  //add to the Diary Items List
	End for 
	
End for 
ERR_MethodTrackerReturn("SD_BuildDay"; $_t_oldMethodName)