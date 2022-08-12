//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetSelectedEvent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:55`Method: Cal4D_Cal_GetSelectedEvent
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; CAL_l_TmpEventID)
	C_POINTER:C301(<>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventIDField; <>Cal_ptr_EventTable)
	C_TEXT:C284($_t_DiaryViewID; $_t_oldMethodName; $_t_SQL; CAL_t_DiaryCode; Cal_t_SelectedEventUID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetSelectedEvent")

CAL_l_TmpEventID:=0


If (Cal_t_SelectedEventUID#"")
	If (False:C215)
		$_t_SQL:="SELECT "+Field name:C257(<>Cal_ptr_EventIDField)
		$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
		$_t_SQL:=$_t_SQL+" WHERE "+Field name:C257(<>Cal_ptr_EventiCalUIDField)+" = :Cal_t_SelectedEventUID"
		$_t_SQL:=$_t_SQL+" INTO :CAL_l_TmpEventID;"
		
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL
		End SQL
	Else 
		
		QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_UUID:1=Cal_t_SelectedEventUID)
		$_t_DiaryViewID:=[SF_DiaryView:184]DiaryView_DiaryID:3
		CAL_t_DiaryCode:=$_t_DiaryViewID
		CAL_l_TmpEventID:=0
		$_t_SQL:="SELECT "+"x_ID"
		$_t_SQL:=$_t_SQL+" FROM "+"DIARY"
		$_t_SQL:=$_t_SQL+" WHERE "+"Diary_Code =:CAL_t_DiaryCode"
		$_t_SQL:=$_t_SQL+" INTO :CAL_l_TmpEventID"
		Begin SQL
			EXECUTE IMMEDIATE :$_t_SQL;
		End SQL
		
	End if 
End if 


$0:=CAL_l_TmpEventID
ERR_MethodTrackerReturn("Cal4D_Cal_GetSelectedEvent"; $_t_oldMethodName)