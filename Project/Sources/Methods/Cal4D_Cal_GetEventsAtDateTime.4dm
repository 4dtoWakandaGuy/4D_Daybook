//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetEventsAtDateTime
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:43`Method: Cal4D_Cal_GetEventsAtDateTime
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY LONGINT(Cal_al_GroupID;0)
	C_BOOLEAN:C305($_bo_FirstPass)
	C_DATE:C307($1; Cal_d_tempDate)
	C_LONGINT:C283($_l_index; $0; Cal4D_l_SQLCnt)
	C_POINTER:C301(<>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventLStartTimeField; <>Cal_ptr_EventTable; <>Cal_ptr_EventTypeFldField; <>Cal_ptr_FieldLEventStartField)
	C_TEXT:C284($_t_oldMethodName; $_t_SQL)
	C_TIME:C306($2; CAL_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetEventsAtDateTime")

Cal_d_tempDate:=$1
CAL_ti_StartTime:=$2
$_bo_FirstPass:=True:C214

//========================    Method Actions    ==================================

If (False:C215)
	////  Get events of the day
	//{
	$_t_SQL:="SELECT COUNT(*)"
	$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_EventTable)
	
	$_t_SQL:=$_t_SQL+" WHERE ("+Field name:C257(<>Cal_ptr_FieldLEventStartField)+" = :Cal_d_tempDate"
	$_t_SQL:=$_t_SQL+" AND "+Field name:C257(<>Cal_ptr_EventLStartTimeField)+" = :CAL_ti_StartTime"
	$_t_SQL:=$_t_SQL+") AND ("
	For ($_l_index; 1; Size of array:C274(Cal_lb_ListboxCalender))
		If (Cal_lb_ListboxCalender{$_l_index})
			If ($_l_index<=Size of array:C274(Cal_al_GroupID))
				If ($_bo_FirstPass)
					$_bo_FirstPass:=False:C215
					$_t_SQL:=$_t_SQL+Field name:C257(<>Cal_ptr_EventGroupIDField)+" = "+String:C10(Cal_al_GroupID{$_l_index})
				Else 
					$_t_SQL:=$_t_SQL+" OR "+Field name:C257(<>Cal_ptr_EventGroupIDField)+" = "+String:C10(Cal_al_GroupID{$_l_index})
				End if 
			End if 
		End if 
	End for 
	
	$_t_SQL:=$_t_SQL+") ORDER BY "+Field name:C257(<>Cal_ptr_EventTypeFldField)+", "+Field name:C257(<>Cal_ptr_EventLStartTimeField)
	$_t_SQL:=$_t_SQL+" INTO :Cal4D_l_SQLCnt;"
	
	Begin SQL
		EXECUTE IMMEDIATE :$_t_SQL;
	End SQL
	//}
End if 

//========================    Clean up and Exit    =================================

$0:=Cal4D_l_SQLCnt
ERR_MethodTrackerReturn("Cal4D_Cal_GetEventsAtDateTime"; $_t_oldMethodName)