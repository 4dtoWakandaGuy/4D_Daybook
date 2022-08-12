//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetOriginTimezone
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_TimeZones; 0)
	C_BOOLEAN:C305($_bo_ProcessingDST)
	C_DATE:C307($_d_Date; $_d_StartDate)
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_Code; $_t_Data; $_t_Dayof; $_t_MethodName; $_t_MonthOf; $_t_oldMethodName; $_t_Tag; $_t_value; $_t_YearOf; $_t_zID; $_t_zNameDT)
	C_TEXT:C284($_t_zOffsetFromDT; $_t_zOffsetFromST; $_t_zOffsetToDT; $_t_zOffsetToST; $_t_ZoneName; $0)
	C_TIME:C306($_ti_Time; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetOriginTimezone")

$_ti_Time:=$1
Repeat 
	RECEIVE PACKET:C104($_ti_Time; $_t_Data; Char:C90(Line feed:K15:40))
	$_t_Data:=STR_Trim($_t_Data; "B")
	$_l_CharacterPosition:=Position:C15(":"; $_t_Data)
	$_t_Tag:=Substring:C12($_t_Data; 1; $_l_CharacterPosition-1)
	$_t_value:=Substring:C12($_t_Data; $_l_CharacterPosition+1)
	//========================    Method Actions    ==================================
	
	//RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU
	//END:DAYLIGHT
	//RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU
	//END:STANDARD
	Case of 
		: ($_t_Tag="TZID")
			$_t_zID:=$_t_value
			
		: ($_t_Data="BEGIN:DAYLIGHT")
			$_bo_ProcessingDST:=True:C214
			
		: ($_t_Data="BEGIN:STANDARD")
			$_bo_ProcessingDST:=False:C215
			
		: ($_bo_ProcessingDST & ($_t_Tag="TZOFFSETFROM"))  //TZOFFSETFROM:-800
			$_t_zOffsetFromDT:=$_t_value
			
		: ($_bo_ProcessingDST & ($_t_Tag="TZOFFSETTO"))  //TZOFFSETTO:-700
			$_t_zOffsetToDT:=$_t_value
			
		: ($_bo_ProcessingDST & ($_t_Tag="DTSTART"))  //DTSTART:20070311T020000
			$_t_YearOf:=String:C10(Year of:C25(Current date:C33))
			$_t_MonthOf:=Substring:C12($_t_value; 5; 2)
			$_t_Dayof:=Substring:C12($_t_value; 7; 2)
			$_d_StartDate:=Date:C102($_t_MonthOf+"/"+$_t_Dayof+"/"+$_t_YearOf)
			
		: ($_bo_ProcessingDST & ($_t_Tag="TZNAME"))  //TZNAME:PDT
			$_t_zNameDT:=$_t_value
			
		: (Not:C34($_bo_ProcessingDST) & ($_t_Tag="TZOFFSETFROM"))  //TZOFFSETFROM:-700
			$_t_zOffsetFromST:=$_t_value
			
		: (Not:C34($_bo_ProcessingDST) & ($_t_Tag="TZOFFSETTO"))  //TZOFFSETTO:-800
			$_t_zOffsetToST:=$_t_value
			
		: (Not:C34($_bo_ProcessingDST) & ($_t_Tag="DTSTART"))  //DTSTART:20071104T020000
			$_t_YearOf:=String:C10(Year of:C25(Current date:C33))
			$_t_MonthOf:=Substring:C12($_t_value; 5; 2)
			$_t_Dayof:=Substring:C12($_t_value; 7; 2)
			$_d_StartDate:=Date:C102($_t_MonthOf+"/"+$_t_Dayof+"/"+$_t_YearOf)
			
		: (Not:C34($_bo_ProcessingDST) & ($_t_Tag="TZNAME"))  //TZNAME:PST
			$_t_ZoneName:=$_t_value
			
	End case 
	
	//========================    Clean up and Exit    =================================
	
Until ($_t_Data="END:VTIMEZONE")

ARRAY TEXT:C222($_at_TimeZones; 0)
$_d_Date:=Current date:C33
If (($_d_Date>=$_d_StartDate) & ($_d_Date<=$_d_StartDate))
	Cal4D_iCal_GetTimezones(->$_at_TimeZones; "DT")
	$_t_Code:=Substring:C12($_at_TimeZones{Find in array:C230($_at_TimeZones; "@"+$_t_zOffsetToDT+"@")}; 1; 1)
Else 
	Cal4D_iCal_GetTimezones(->$_at_TimeZones; "ST")
	$_t_Code:=Substring:C12($_at_TimeZones{Find in array:C230($_at_TimeZones; "@"+$_t_zOffsetToST+"@")}; 1; 1)
End if 

$0:=$_t_Code
ERR_MethodTrackerReturn("Cal4D_iCal_GetOriginTimezone"; $_t_oldMethodName)