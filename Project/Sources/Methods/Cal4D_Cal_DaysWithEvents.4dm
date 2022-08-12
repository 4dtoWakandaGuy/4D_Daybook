//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_DaysWithEvents
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_Cal_DaysWithEvents
	////
	////  Written by Charles Vass - 04/09/2009, 11:49
	////
	////  Purpose:
	////
	////  $1 - DATE - A date within the target month
	////  $2 - POINTER - Pointer to Dates array
	////
	////
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:46`Method: Cal4D_Cal_DaysWithEvents
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_CurrentDiaryPerson;0)
	C_DATE:C307($_D_Date; $_d_DayofFIrst; $_d_DayStart; $1)
	C_LONGINT:C283($_l_Day; $_l_DayNumber; $_l_Index; $_l_Month; $_l_MonthID; $_l_NumberofRecords; $_l_RecordsInSelection; $_l_year; SD_l_priorityQuery; SD2_l_DiaryInstanceUID; SD2_l_IncludeCompleted)
	C_POINTER:C301($_po_Dates; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_DaysWithEvents")

$_D_Date:=$1
$_po_Dates:=$2

$_l_NumberofRecords:=Cal4D_Cal_DaysInMonth($_D_Date)
ARRAY DATE:C224($_po_Dates->; $_l_NumberofRecords)

$_l_year:=Year of:C25($_D_Date)
$_l_Month:=Month of:C24($_D_Date)
$_l_Day:=Day of:C23($_D_Date)
$_D_Date:=Date:C102(String:C10($_l_Month)+"/1/"+String:C10($_l_year))

For ($_l_Index; 1; $_l_NumberofRecords)
	$_po_Dates->{$_l_Index}:=$_D_Date
	$_D_Date:=Add to date:C393($_D_Date; 0; 0; 1)
End for 

//========================    Method Actions    ==================================
//15/01/2010
SD2_LoadSchedule(SD2_l_DiaryInstanceUID; 0; $_po_Dates->{1}; $_po_Dates->{Size of array:C274($_po_Dates->)}; ->SD2_al_CurrentDiaryPerson; SD2_l_IncludeCompleted; SD_l_priorityQuery)
CREATE SET:C116([SF_DiaryView:184]; "$Currentmonth")
SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordsInSelection)
//need to make sure this works
For ($_l_Index; $_l_NumberofRecords; 1; -1)
	USE SET:C118("$Currentmonth")
	QUERY SELECTION:C341([SF_DiaryView:184]; [SF_DiaryView:184]Diary_DisplayDateStart:4<=$_po_Dates->{$_l_Index}; *)
	QUERY SELECTION:C341([SF_DiaryView:184];  & ; [SF_DiaryView:184]Diary_DIsplayDateEnd:5>=$_po_Dates->{$_l_Index})
	If ($_l_RecordsInSelection=0)
		DELETE FROM ARRAY:C228($_po_Dates->; $_l_Index)
	End if 
End for 
SET QUERY DESTINATION:C396(Into current selection:K19:1)
ERR_MethodTrackerReturn("Cal4D_Cal_DaysWithEvents"; $_t_oldMethodName)