//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_BoxObjectMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:22`Method: Cal4D_BoxObjectMethod
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Cal4D_Lb_CalenderList;0)
	//ARRAY DATE(<>Cal4D_ad_EventOEndDates;0)
	//ARRAY DATE(<>Cal4D_ad_EventOStartDates;0)
	//ARRAY LONGINT(<>CAL4D_al_EventIDS;0)
	C_BOOLEAN:C305($_bo_anEventWasSelected)
	C_DATE:C307($_d_EndDate; $_d_selectedDate; $_d_StartDate; $_d_ThisBoxDate)
	C_LONGINT:C283($_i_duration; $_i_element; $_i_eventID; $_l_Color; $_l_Event; $_l_GroupID; $_l_SourceProcess; $_l_SourceRow; $0)
	C_POINTER:C301(<>Cal_ptr_EventIDField; <>Cal_ptr_EventTable; <>CAL_ptr_EventEndDateFld; <>CAL_ptr_EventStartDateFld; <>CAL_ptr_SelectedObject; $_ptr_destinationObject; $_ptr_sourceObject; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Title; $_t_Type)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_BoxObjectMethod")
$_l_Event:=Form event code:C388
If (Count parameters:C259>=1)
	$_ptr_destinationObject:=$1
	
	$0:=0
	
	Case of 
		: ($_l_Event=On Clicked:K2:4)
			$_bo_anEventWasSelected:=Not:C34(Is nil pointer:C315(<>CAL_ptr_SelectedObject))
			
			Cal4D_DeselectObject(<>CAL_ptr_SelectedObject)
			$_d_selectedDate:=Cal4D_Cal_SelectedDate
			$_d_ThisBoxDate:=Cal4D_GetDateByBoxNumber(Cal4D_GetObjectNumber($_ptr_destinationObject))
			
			// If the user holds down the shift key while selecting the currently selected date, deselect the date.
			If ((Cal4D_Cal_SelectedDate=$_d_ThisBoxDate) & (Shift down:C543))
				$_d_ThisBoxDate:=!00-00-00!
			End if 
			
			Cal4D_Cal_SelectedDate($_d_ThisBoxDate)
			
			If (($_d_selectedDate#$_d_ThisBoxDate) | ($_bo_anEventWasSelected))
				Cal4D_CallCallbackMethod(On Selection Change:K2:29; No current record:K29:2)
			End if 
			
			
		: ($_l_Event=On Double Clicked:K2:5)
			Cal4D_Cal_SelectedDate(Cal4D_GetDateByBoxNumber(Cal4D_GetObjectNumber($_ptr_destinationObject)))
			If (Not:C34(Cal4D_CallCallbackMethod(On Double Clicked:K2:5; No current record:K29:2)))
				Cal4D_Event_Edit(New record:K29:1)
			End if 
			
			
		: ($_l_Event=On Drag Over:K2:13)
			_O_DRAG AND DROP PROPERTIES:C607($_ptr_sourceObject; $_l_SourceRow; $_l_SourceProcess)
			
			// If the source is the list box, then just grab the pointer we stuffed into
			//   <>Cal4D_SelectedObjectPtr when the list box selection changed.
			If ($_ptr_sourceObject=(-><>Cal_Lb_CalenderList))
				$_ptr_sourceObject:=<>CAL_ptr_SelectedObject
			End if 
			
			$_i_eventID:=Cal4D_GetEventIDfromFormObject($_ptr_sourceObject)
			Cal4D_Event_GetData($_i_eventID; ->$_t_Type; ->$_t_Title; ->$_d_StartDate; ->$_ti_StartTime; ->$_d_EndDate; ->$_ti_EndTime; ->$_l_Color; ->$_l_GroupID)
			
			$_d_ThisBoxDate:=Cal4D_GetDateByBoxNumber(Cal4D_GetObjectNumber($_ptr_destinationObject))
			If ($_d_StartDate=$_d_ThisBoxDate)
				$0:=-1  // Don't allow a drop onto the date it's alread on.
			Else 
				$0:=0
			End if 
			
			
		: ($_l_Event=On Drop:K2:12)
			_O_DRAG AND DROP PROPERTIES:C607($_ptr_sourceObject; $_l_SourceRow; $_l_SourceProcess)
			
			// If the source is the list box, then just grab the pointer we stuffed into
			//   <>Cal4D_SelectedObjectPtr when the list box selection changed.
			If ($_ptr_sourceObject=(-><>Cal_Lb_CalenderList))
				$_ptr_sourceObject:=<>CAL_ptr_SelectedObject
			End if 
			
			$_i_eventID:=Cal4D_GetEventIDfromFormObject($_ptr_sourceObject)
			Cal4D_Event_GetData($_i_eventID; ->$_t_Type; ->$_t_Title; ->$_d_StartDate; ->$_ti_StartTime; ->$_d_EndDate; ->$_ti_EndTime; ->$_l_Color; ->$_l_GroupID)
			
			Case of 
				: (($_i_eventID<0) & (Not:C34(Cal4D_Event_UserCanModifyEvent)))  // It's another user's public event.
					Cal4D_Alert("EventNotOwned")
					
				: (($_i_eventID<0) & (Cal4D_Event_IsSubscribed))
					Cal4D_Alert("LockedSubscriptionEvent")
					
				: (($_i_eventID<0) & (Cal4D_Event_IsLocked))
					Cal4D_Alert("LockedEvent")
					
				Else 
					$_d_ThisBoxDate:=Cal4D_GetDateByBoxNumber(Cal4D_GetObjectNumber($_ptr_destinationObject))
					Cal4D_Cal_SelectedDate($_d_ThisBoxDate)
					
					$_i_eventID:=Cal4D_GetEventIDfromFormObject($_ptr_sourceObject)
					
					If ($_i_eventID>0)  // It's an array based event.
						$_i_element:=Find in array:C230(<>Cal_al_EventIDS; $_i_eventID)
						If ($_i_element>0)
							$_i_duration:=<>Cal_ad_EventOEndDates{$_i_element}-<>Cal_ad_EventOStartDates{$_i_element}
							<>Cal_ad_EventOStartDates{$_i_element}:=$_d_ThisBoxDate
							<>Cal_ad_EventOEndDates{$_i_element}:=<>Cal_ad_EventOStartDates{$_i_element}+$_i_duration
							Cal4D_CallCallbackMethod(On Drop:K2:12; $_i_eventID; <>Cal_ad_EventOStartDates{$_i_element}; <>Cal_ad_EventOEndDates{$_i_element})
						End if 
						
					Else 
						If (Macintosh option down:C545)  // Duplicate the event.
							DUPLICATE RECORD:C225(<>Cal_ptr_EventTable->)
							<>Cal_ptr_EventIDField->:=0-(Sequence number:C244(<>Cal_ptr_EventTable->)+1000)  // Our records use negative IDs to differentiate them from array-based events. We start at -1000 to avoid ID -3 matching 4D's New Record constant.
						Else 
							READ WRITE:C146(<>Cal_ptr_EventTable->)
							LOAD RECORD:C52(<>Cal_ptr_EventTable->)
						End if 
						$_i_duration:=<>CAL_ptr_EventEndDateFld->-<>CAL_ptr_EventStartDateFld->
						<>CAL_ptr_EventStartDateFld->:=$_d_ThisBoxDate
						<>CAL_ptr_EventEndDateFld->:=<>CAL_ptr_EventStartDateFld->+$_i_duration
						SAVE RECORD:C53(<>Cal_ptr_EventTable->)
					End if 
					
					Cal4D_PlaceEvents
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("Cal4D_BoxObjectMethod"; $_t_oldMethodName)