//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_OM_Calendars_ListBox
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_OM_Calendars_ListBox ($_ptr_Self;$_l_FormEvent;->Cal4D_Show_aB_P;->Cal4D_Calendar_at_P)
	// //
	// //  Written by Charles Vass - 03/31/2009, 13:32
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:33`Method: Cal4D_OM_Calendars_ListBox
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_FormEvent; $2)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; Cal_pic_MainWeek; Cal_pic_Month; CAL_pic_weekBanner)
	C_POINTER:C301($_ptr_CalenderAT; $_ptr_Self; $_ptr_ShowAB; $1; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_Calendars_ListBox")

$_ptr_Self:=$1
$_l_FormEvent:=$2
$_ptr_ShowAB:=$3
$_ptr_CalenderAT:=$4

//========================    Method Actions    ==================================


Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Double Clicked:K2:5)
		Cal4D_Group_ManageDialog2
		
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Clicked:K2:4)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Data Change:K2:15)
		Cal4D_Cal_GetFullCalendar(->Cal_pic_Month)
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		Cal4D_Cal_GetDayCalendar(->CAL_pic_MainDay; ->CAL_pic_DayBanner)
		
End case 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_OM_Calendars_ListBox"; $_t_oldMethodName)