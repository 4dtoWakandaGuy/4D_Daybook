//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_ParseArrays
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_ParseArrays
	////
	////  Written by Charles Vass - 07/08/2009, 09:05
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 16:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllDayEndDate; 0)
	ARRAY DATE:C224($_ad_AllDayStartDate; 0)
	ARRAY DATE:C224($_ad_BnrEndDate; 0)
	ARRAY DATE:C224($_ad_BnrStartDate; 0)
	ARRAY DATE:C224($_ad_CalEndDate; 0)
	ARRAY DATE:C224($_ad_CalStartDate; 0)
	ARRAY LONGINT:C221($_al_AllDayColor; 0)
	ARRAY LONGINT:C221($_al_AllDayEndTime; 0)
	ARRAY LONGINT:C221($_al_AllDayStartTime; 0)
	ARRAY LONGINT:C221($_al_BnrColor; 0)
	ARRAY LONGINT:C221($_al_BnrEndTime; 0)
	ARRAY LONGINT:C221($_al_BnrStartTime; 0)
	ARRAY LONGINT:C221($_al_CalendarColour; 0)
	ARRAY LONGINT:C221($_al_CalendarTimeEnd; 0)
	ARRAY LONGINT:C221($_al_CalStartTime; 0)
	ARRAY TEXT:C222($_at_ActionCode; 0)
	ARRAY TEXT:C222($_at_AllDayCALTimeZone; 0)
	ARRAY TEXT:C222($_at_AllDayEventType; 0)
	ARRAY TEXT:C222($_at_AllDayiCalUID; 0)
	ARRAY TEXT:C222($_at_AllDayTitle; 0)
	ARRAY TEXT:C222($_at_BnrCALTimeZone; 0)
	ARRAY TEXT:C222($_at_BnrEventType; 0)
	ARRAY TEXT:C222($_at_BnriCalUID; 0)
	ARRAY TEXT:C222($_at_BnrTitle; 0)
	ARRAY TEXT:C222($_at_iCalUUID; 0)
	ARRAY TEXT:C222($_at_TimeZone; 0)
	ARRAY TEXT:C222($_at_Title; 0)
	C_LONGINT:C283($_l_BannerCount; $_l_index; $_l_RowNumber)
	C_POINTER:C301($_Ptr_CalenderBlob; $1)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_ParseArrays")


$_Ptr_CalenderBlob:=$1


$_l_index:=0

//========================    Method Actions    ==================================

$_l_index:=CAL4D_GetVarsFromBlob($_l_index; $_Ptr_CalenderBlob; ->$_al_CalStartTime; ->$_al_CalendarTimeEnd; ->$_at_Title; ->$_at_ActionCode; ->$_at_iCalUUID; ->$_al_CalendarColour; ->$_ad_CalStartDate; ->$_ad_CalEndDate; ->$_at_TimeZone)

$_l_BannerCount:=Count in array:C907($_at_ActionCode; "Banner")
If ($_l_BannerCount>0)
	$_l_RowNumber:=0
	$_l_index:=Find in array:C230($_at_ActionCode; "Banner")+($_l_BannerCount-1)
	Repeat 
		$_l_RowNumber:=$_l_RowNumber+1
		INSERT IN ARRAY:C227($_al_BnrStartTime; $_l_RowNumber)
		INSERT IN ARRAY:C227($_al_BnrEndTime; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_BnrTitle; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_BnrEventType; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_BnriCalUID; $_l_RowNumber)
		INSERT IN ARRAY:C227($_al_BnrColor; $_l_RowNumber)
		INSERT IN ARRAY:C227($_ad_BnrStartDate; $_l_RowNumber)
		INSERT IN ARRAY:C227($_ad_BnrEndDate; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_BnrCALTimeZone; $_l_RowNumber)
		
		$_al_BnrStartTime{$_l_RowNumber}:=$_al_CalStartTime{$_l_index}
		$_al_BnrEndTime{$_l_RowNumber}:=$_al_CalendarTimeEnd{$_l_index}
		$_at_BnrTitle{$_l_RowNumber}:=$_at_Title{$_l_index}
		$_at_BnrEventType{$_l_RowNumber}:=$_at_ActionCode{$_l_index}
		$_at_BnriCalUID{$_l_RowNumber}:=$_at_iCalUUID{$_l_index}
		$_al_BnrColor{$_l_RowNumber}:=$_al_CalendarColour{$_l_index}
		$_ad_BnrStartDate{$_l_RowNumber}:=$_ad_CalStartDate{$_l_index}
		$_ad_BnrEndDate{$_l_RowNumber}:=$_ad_CalEndDate{$_l_index}
		$_at_BnrCALTimeZone{$_l_RowNumber}:=$_at_TimeZone{$_l_index}
		
		DELETE FROM ARRAY:C228($_al_CalStartTime; $_l_index)
		DELETE FROM ARRAY:C228($_al_CalendarTimeEnd; $_l_index)
		DELETE FROM ARRAY:C228($_at_Title; $_l_index)
		DELETE FROM ARRAY:C228($_at_ActionCode; $_l_index)
		DELETE FROM ARRAY:C228($_at_iCalUUID; $_l_index)
		DELETE FROM ARRAY:C228($_al_CalendarColour; $_l_index)
		DELETE FROM ARRAY:C228($_ad_CalStartDate; $_l_index)
		DELETE FROM ARRAY:C228($_ad_CalEndDate; $_l_index)
		DELETE FROM ARRAY:C228($_at_TimeZone; $_l_index)
		
		$_l_BannerCount:=$_l_BannerCount-1
		$_l_index:=$_l_index-1
	Until ($_l_BannerCount=0)
	
End if 

$_l_BannerCount:=Count in array:C907($_at_ActionCode; "All-day")
If ($_l_BannerCount>0)
	$_l_RowNumber:=0
	$_l_index:=Find in array:C230($_at_ActionCode; "All-day")+($_l_BannerCount-1)
	Repeat 
		$_l_RowNumber:=$_l_RowNumber+1
		INSERT IN ARRAY:C227($_al_AllDayStartTime; $_l_RowNumber)
		INSERT IN ARRAY:C227($_al_AllDayEndTime; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_AllDayTitle; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_AllDayEventType; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_AllDayiCalUID; $_l_RowNumber)
		INSERT IN ARRAY:C227($_al_AllDayColor; $_l_RowNumber)
		INSERT IN ARRAY:C227($_ad_AllDayStartDate; $_l_RowNumber)
		INSERT IN ARRAY:C227($_ad_AllDayEndDate; $_l_RowNumber)
		INSERT IN ARRAY:C227($_at_AllDayCALTimeZone; $_l_RowNumber)
		
		$_al_AllDayStartTime{$_l_RowNumber}:=$_al_CalStartTime{$_l_index}
		$_al_AllDayEndTime{$_l_RowNumber}:=$_al_CalendarTimeEnd{$_l_index}
		$_at_AllDayTitle{$_l_RowNumber}:=$_at_Title{$_l_index}
		$_at_AllDayEventType{$_l_RowNumber}:=$_at_ActionCode{$_l_index}
		$_at_AllDayiCalUID{$_l_RowNumber}:=$_at_iCalUUID{$_l_index}
		$_al_AllDayColor{$_l_RowNumber}:=$_al_CalendarColour{$_l_index}
		$_ad_AllDayStartDate{$_l_RowNumber}:=$_ad_CalStartDate{$_l_index}
		$_ad_AllDayEndDate{$_l_RowNumber}:=$_ad_CalEndDate{$_l_index}
		$_at_AllDayCALTimeZone{$_l_RowNumber}:=$_at_TimeZone{$_l_index}
		
		DELETE FROM ARRAY:C228($_al_CalStartTime; $_l_index)
		DELETE FROM ARRAY:C228($_al_CalendarTimeEnd; $_l_index)
		DELETE FROM ARRAY:C228($_at_Title; $_l_index)
		DELETE FROM ARRAY:C228($_at_ActionCode; $_l_index)
		DELETE FROM ARRAY:C228($_at_iCalUUID; $_l_index)
		DELETE FROM ARRAY:C228($_al_CalendarColour; $_l_index)
		DELETE FROM ARRAY:C228($_ad_CalStartDate; $_l_index)
		DELETE FROM ARRAY:C228($_ad_CalEndDate; $_l_index)
		DELETE FROM ARRAY:C228($_at_TimeZone; $_l_index)
		
		$_l_BannerCount:=$_l_BannerCount-1
		$_l_index:=$_l_index-1
	Until ($_l_BannerCount=0)
	
End if 

//========================    Clean up and Exit    =================================

SET BLOB SIZE:C606($_Ptr_CalenderBlob->; 0)
CAL4D_VarstoBlob($_Ptr_CalenderBlob; ->$_al_CalStartTime; ->$_al_CalendarTimeEnd; ->$_at_Title; ->$_at_ActionCode; ->$_at_iCalUUID; ->$_al_CalendarColour; ->$_ad_CalStartDate; ->$_ad_CalEndDate; ->$_at_TimeZone)
CAL4D_AppendBlobVar($_Ptr_CalenderBlob; ->$_al_BnrStartTime; ->$_al_BnrEndTime; ->$_at_BnrTitle; ->$_at_BnrEventType; ->$_at_BnriCalUID; ->$_al_BnrColor; ->$_ad_BnrStartDate; ->$_ad_BnrEndDate; ->$_at_BnrCALTimeZone)
CAL4D_AppendBlobVar($_Ptr_CalenderBlob; ->$_al_AllDayStartTime; ->$_al_AllDayEndTime; ->$_at_AllDayTitle; ->$_at_AllDayEventType; ->$_at_AllDayiCalUID; ->$_al_AllDayColor; ->$_ad_AllDayStartDate; ->$_ad_AllDayEndDate; ->$_at_AllDayCALTimeZone)
ERR_MethodTrackerReturn("Cal4D_ParseArrays"; $_t_oldMethodName)