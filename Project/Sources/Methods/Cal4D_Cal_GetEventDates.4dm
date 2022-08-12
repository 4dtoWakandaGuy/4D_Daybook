//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetEventDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:42`Method: Cal4D_Cal_GetEventDates
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(CAL_d_EvtEndDate; CAL_d_EvtStartDate)
	C_POINTER:C301(<>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventLEndDateField; <>Cal_ptr_EventTable; <>Cal_ptr_FieldLEventStartField)
	C_TEXT:C284($_t_oldMethodName; $_t_SQL; Cal_t_SelectedEventUID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetEventDates")

If (Cal_t_SelectedEventUID#"")
	If (False:C215)
		
		$_t_SQL:="SELECT "+Field name:C257(<>Cal_ptr_FieldLEventStartField)+", "+Field name:C257(<>Cal_ptr_EventLEndDateField)
		$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
		$_t_SQL:=$_t_SQL+" WHERE "+Field name:C257(<>Cal_ptr_EventiCalUIDField)+" = :Cal_t_SelectedEventUID"
		$_t_SQL:=$_t_SQL+" INTO :CAL_d_EvtStartDate, :CAL_d_EvtEndDate;"
		
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL
		End SQL
	Else 
		QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_UUID:1=Cal_t_SelectedEventUID)
		CAL_d_EvtStartDate:=[SF_DiaryView:184]Diary_DisplayDateStart:4
		CAL_d_EvtEndDate:=[SF_DiaryView:184]Diary_DIsplayDateEnd:5
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_GetEventDates"; $_t_oldMethodName)