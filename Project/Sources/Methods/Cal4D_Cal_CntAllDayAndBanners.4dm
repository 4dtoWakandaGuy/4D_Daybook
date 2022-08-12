//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_CntAllDayAndBanners
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:00`Method: Cal4D_Cal_CntAllDayAndBanners
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1; Cal_d_tempDate)
	C_LONGINT:C283($0; CAL_l_Count)
	C_POINTER:C301(<>Cal_ptr_EventLEndDateField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTypeFldField; <>Cal_ptr_FieldLEventStartField)
	C_TEXT:C284($_t_oldMethodName; $_t_SQL; SD2_t_CurrentContectView)
	C_TIME:C306(SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_CntAllDayAndBanners")

CAL_l_Count:=0
If (Count parameters:C259>=1)
	Cal_d_tempDate:=$1
	If (False:C215)
		//========================    Method Actions    ==================================
		
		$_t_SQL:="SELECT COUNT(*)"
		
		$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
		$_t_SQL:=$_t_SQL+" WHERE ("+Field name:C257(<>Cal_ptr_EventTypeFldField)+" = 'All-Day'"
		$_t_SQL:=$_t_SQL+" OR "+Field name:C257(<>Cal_ptr_EventTypeFldField)+" = 'Banner')"
		
		$_t_SQL:=$_t_SQL+" AND ("+Field name:C257(<>Cal_ptr_FieldLEventStartField)+" = :Cal_d_tempDate"
		$_t_SQL:=$_t_SQL+" OR ("+Field name:C257(<>Cal_ptr_FieldLEventStartField)+" < :Cal_d_tempDate"
		$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>Cal_ptr_EventLEndDateField)+" >= :Cal_d_tempDate))"
		
		$_t_SQL:=$_t_SQL+" INTO :CAL_l_Count;"
		
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL
		End SQL
	Else 
		
		QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_ContextUUID:2=SD2_t_CurrentContectView)
		QUERY SELECTION:C341([SF_DiaryView:184]; [SF_DiaryView:184]Diary_DisplayTimeStart:6<=SD_ti_SettingsTimeStart; *)
		QUERY SELECTION:C341([SF_DiaryView:184];  & ; [SF_DiaryView:184]Diary_DisplayTimeEnd:7>=SD_ti_SettingsTimeEnd)
		CAL_l_Count:=Records in selection:C76([SF_DiaryView:184])
		
	End if 
	//========================    Clean up and Exit    =================================
	
	$0:=CAL_l_Count
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_CntAllDayAndBanners"; $_t_oldMethodName)