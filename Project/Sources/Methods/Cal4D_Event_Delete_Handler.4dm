//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Delete_Handler
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
	C_BOOLEAN:C305($_bo_Result)
	C_LONGINT:C283($_l_EventID)
	C_PICTURE:C286(Cal_pic_MainWeek; CAL_pic_weekBanner)
	C_POINTER:C301(<>Cal_ptr_EventIDField; <>Cal_ptr_EventLStartTimeField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_FieldLEventStartField; CAL_ptr_4DFullCalendar)
	C_TEXT:C284($_t_MethodName; $_t_Msg; $_t_oldMethodName; Cal_t_SelectedCellRef; Cal_t_SelectedMiniCellRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Delete_Handler")

If (Records in selection:C76(<>Cal_ptr_EventTable->)=1)
	$_t_Msg:=<>Cal_ptr_EventTitleField->+" on "
	$_t_Msg:=$_t_Msg+String:C10(<>Cal_ptr_FieldLEventStartField->; Internal date short:K1:7)+" at "
	$_t_Msg:=$_t_Msg+String:C10(<>Cal_ptr_EventLStartTimeField->; HH MM AM PM:K7:5)
	
	$_l_EventID:=<>Cal_ptr_EventIDField->
	UNLOAD RECORD:C212(<>Cal_ptr_EventTable->)
	
	Gen_Confirm("Delete Event"+Char:C90(13)+$_t_Msg; "Yes"; "No")
	$_bo_Result:=(OK=1)
	//========================    Method Actions    ==================================
	
	If ($_bo_Result)
		
		Cal4D_Event_Delete($_l_EventID)
		Cal4D_Cal_ClearSelectedEvent
		Cal_t_SelectedMiniCellRef:=""
		Cal_t_SelectedCellRef:=""
		
		////  Redraw the calendars
		//{
		Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
		Cal4D_Cal_GetWeekCalendar(->Cal_pic_MainWeek; ->CAL_pic_weekBanner)
		Cal4D_Cal_RedrawMinis
		//}
	End if 
	
	
End if 
ERR_MethodTrackerReturn("Cal4D_Event_Delete_Handler"; $_t_oldMethodName)