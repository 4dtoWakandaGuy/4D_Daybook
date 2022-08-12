//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_FM_Cal4D_Event_d
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>Cal_al_GroupPopupIDs;0)
	//ARRAY LONGINT(<>Cal4D_al_GroupPopupIDs;0)
	//ARRAY LONGINT(SD_al_GroupIDS;0)
	//ARRAY LONGINT(SD2_al_GroupPopupIDs;0)
	//ARRAY TEXT(<>Cal_at_GroupPopupMenu;0)
	//ARRAY TEXT(<>Cal4D_at_GroupPopupMenu;0)
	//ARRAY TEXT(SD_at_GroupNames;0)
	//ARRAY TEXT(SD_at_UserNames;0)
	//ARRAY TEXT(SD2_at_GroupPopupMenu;0)
	C_BOOLEAN:C305($_bo_OldManyRelations; $_bo_OldOneRelations; CAL_bo_CanModify; DB_bo_NoLoad)
	C_DATE:C307(Cal4D_d_EventEndDate; Cal4D_d_EventStartDate)
	C_LONGINT:C283(<>CAL_l_ColorPopupMenu; <>CAL_l_CurrentUserID; <>CAL_l_DeleteButton; <>Cal_rb1; <>Cal_rb2; <>Cal_rb3; $_l_CurrentTimeUnit; $_l_element; $_l_FormEvent; $1; CAL_l_EndTime)
	C_LONGINT:C283(CAL_l_StartTime)
	C_POINTER:C301(<>Cal_ptr_EventColorField; <>CAL_ptr_EventDesciptionField; <>Cal_ptr_EventDescripField; <>Cal_ptr_EventGroupIDField; <>Cal_ptr_EventiCalDateTimeField; <>Cal_ptr_EventiCalUIDField; <>Cal_ptr_EventIDField; <>Cal_ptr_EventLEndDateField; <>CAL_ptr_EventLEndTimeFld; <>Cal_ptr_EventLocationField; <>Cal_ptr_EventLStartTimeField)
	C_POINTER:C301(<>Cal_ptr_EventTable; <>Cal_ptr_EventTitleField; <>Cal_ptr_EventTypeFldField; <>Cal_ptr_FieldLEventStartField; <>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupotherscanModField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField; Cal_ptr_UsernameField)
	C_POINTER:C301(Cal_ptr_UserTable)
	C_TEXT:C284(<>CAL_t_SharedUserName; $_t_MethodName; $_t_oldMethodName; $_t_SQL; Cal_t_EventLocation; Cal4D_t_Description; Cal4D_t_EventTitle)
	C_TIME:C306($_ti_CurrentTime; Cal4D_ti_EventEndTime; Cal4D_ti_EventStartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_FM_Cal4D_Event_d")

//===========================    Initialize and Setup    ===========================
$_l_FormEvent:=$1

//===========================      Method Actions      ===========================

Case of 
	: ($_l_FormEvent=On Close Box:K2:21)
		CANCEL:C270
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		// /_O_ENABLE BUTTON(<>Cal4D_l_DeleteButton)
		OBJECT SET ENABLED:C1123(<>CAL_l_DeleteButton; True:C214)
		<>Cal_rb1:=0
		<>Cal_rb2:=0
		<>Cal_rb3:=0
		
		If (Is new record:C668(<>Cal_ptr_EventTable->))
			//_O_DISABLE BUTTON(<>Cal4D_l_DeleteButton)
			OBJECT SET ENABLED:C1123(<>CAL_l_DeleteButton; False:C215)
			$_ti_CurrentTime:=Current time:C178
			$_l_CurrentTimeUnit:=($_ti_CurrentTime*1)/900
			$_ti_CurrentTime:=($_l_CurrentTimeUnit*900)
			
			<>Cal_ptr_EventIDField->:=0-(Sequence number:C244(<>Cal_ptr_EventTable->)+1000)  // Our records use negative IDs to differentiate them from array-based events. We start at -1000 to avoid ID -3 matching 4D's New Record constant.
			<>Cal_ptr_EventGroupIDField->:=Cal4D_Group_DefaultGroupID(<>CAL_l_CurrentUserID)
			
			<>Cal_ptr_EventiCalUIDField->:=Cal4D_NewUUID(<>Cal_ptr_EventTable; <>Cal_ptr_EventiCalUIDField)
			<>Cal_ptr_EventiCalDateTimeField->:=Cal4D_iCal_GetDTSTAMP_ZULU
			
			Cal4D_d_EventStartDate:=Cal4D_Cal_SelectedDate
			Cal4D_ti_EventStartTime:=$_ti_CurrentTime
			CAL_l_StartTime:=$_l_CurrentTimeUnit+3
			//CAL_l_StartTime:=((Cal4D_ti_EventStartTime*1)/900)+3
			
			<>Cal_ptr_FieldLEventStartField->:=Cal4D_d_EventStartDate
			<>Cal_ptr_EventLStartTimeField->:=$_ti_CurrentTime
			
			<>Cal_ptr_EventLEndDateField->:=<>Cal_ptr_FieldLEventStartField->
			<>CAL_ptr_EventLEndTimeFld->:=$_ti_CurrentTime+3600
			CAL_l_EndTime:=$_l_CurrentTimeUnit+7
			
			Cal4D_t_EventTitle:=<>Cal_ptr_EventTitleField->
			Cal4D_d_EventEndDate:=<>Cal_ptr_EventLEndDateField->
			Cal4D_ti_EventEndTime:=<>CAL_ptr_EventLEndTimeFld->
			CAL_l_EndTime:=((Cal4D_ti_EventEndTime*1)/900)+3
			
			Cal_t_EventLocation:=<>Cal_ptr_EventLocationField->
			Cal4D_t_Description:=<>Cal_ptr_EventDescripField->
			
			<>Cal_ptr_EventTypeFldField->:="Appointment"
			
			Case of 
				: (<>Cal_ptr_EventTypeFldField->="All-Day")
					<>Cal_rb1:=1
				: (<>Cal_ptr_EventTypeFldField->="Appointment")
					<>Cal_rb2:=1
				: (<>Cal_ptr_EventTypeFldField->="Banner")
					<>Cal_rb3:=1
				Else   // Just a safeguard.
					Cal4D_Alert("This event type ("+<>Cal_ptr_EventTypeFldField->+") was not expected. Please notify the database developer.")
					<>Cal_ptr_EventTypeFldField->:="All-Day"
					<>Cal_rb1:=1
			End case 
			
		Else 
			If (Locked:C147(<>Cal_ptr_EventTable->) | Read only state:C362(<>Cal_ptr_EventTable->))
				OBJECT SET ENTERABLE:C238(Cal4D_t_EventTitle; False:C215)
				OBJECT SET ENTERABLE:C238(Cal_t_EventLocation; False:C215)
				OBJECT SET ENTERABLE:C238(Cal4D_d_EventStartDate; False:C215)
				OBJECT SET ENTERABLE:C238(Cal4D_d_EventEndDate; False:C215)
				OBJECT SET ENTERABLE:C238(Cal4D_t_Description; False:C215)
				
				//DISABLE BUTTON
			End if 
			
			$_ti_CurrentTime:=<>Cal_ptr_EventLStartTimeField->
			$_l_CurrentTimeUnit:=($_ti_CurrentTime*1)/900
			$_ti_CurrentTime:=($_l_CurrentTimeUnit*900)
			
			Cal4D_t_EventTitle:=<>Cal_ptr_EventTitleField->
			Cal4D_d_EventStartDate:=<>Cal_ptr_FieldLEventStartField->
			Cal4D_ti_EventStartTime:=$_ti_CurrentTime
			CAL_l_StartTime:=$_l_CurrentTimeUnit+3
			
			Cal4D_d_EventEndDate:=<>Cal_ptr_EventLEndDateField->
			Cal4D_ti_EventEndTime:=<>CAL_ptr_EventLEndTimeFld->
			CAL_l_EndTime:=((Cal4D_ti_EventEndTime*1)/900)+3
			
			Cal_t_EventLocation:=<>Cal_ptr_EventLocationField->
			Cal4D_t_Description:=<>CAL_ptr_EventDesciptionField->
			//CAL_l_StartTime:=((Cal4D_ti_EventStartTime*1)/900)+3
			
			Case of 
				: (<>Cal_ptr_EventTypeFldField->="All-Day")
					<>Cal_rb1:=1
				: (<>Cal_ptr_EventTypeFldField->="Appointment")
					<>Cal_rb2:=1
				: (<>Cal_ptr_EventTypeFldField->="Banner")
					<>Cal_rb3:=1
				Else   // Just a safeguard.
					Cal4D_Alert("This event type ("+<>Cal_ptr_EventTypeFldField->+") was not expected. Please notify the database developer.")
					<>Cal_ptr_EventTypeFldField->:="All-Day"
					<>Cal_rb1:=1
			End case 
		End if 
		
		ARRAY LONGINT:C221(<>Cal_al_GroupPopupIDs; 0)
		ARRAY TEXT:C222(<>Cal_at_GroupPopupMenu; 0)
		
		// This is designed so that if I own the event, I can move it to my private calendar.
		//   But if somebody else owns the event, I can't do anything to make the event private again.
		If ((Is new record:C668([DIARY:12])) | (Cal4D_Event_UserOwnsEvent))
			// Cal4D_Event_UserOwnsEvent set the table to read-only for us.
			If (False:C215)
				$_t_SQL:="SELECT "+Field name:C257(<>Cal_ptr_GroupFld_ID)+", "
				$_t_SQL:=$_t_SQL+Field name:C257(<>Cal_ptr_GroupFld_Name)
				$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_GroupTable)
				$_t_SQL:=$_t_SQL+" WHERE "+Field name:C257(<>Cal_ptr_GroupUserIDField)+" = :[◊Cal4D_UserID_i]"
				$_t_SQL:=$_t_SQL+" INTO :[<>Cal_al_GroupPopupIDs], :[◊Cal4D_SD2_at_GroupPopupMenu];"
				
				Begin SQL
					EXECUTE IMMEDIATE :$_t_SQL
				End SQL
				
			Else 
				QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupUserIDField->=<>CAL_l_CurrentUserID)
				SELECTION TO ARRAY:C260(<>Cal_ptr_GroupFld_ID->; <>Cal_al_GroupPopupIDs; <>Cal_ptr_GroupFld_Name->; <>Cal_at_GroupPopupMenu)
				SORT ARRAY:C229(<>Cal_at_GroupPopupMenu; <>Cal_al_GroupPopupIDs; >)
				
			End if 
		End if 
		// Append any publicly modifyable calendars.
		ARRAY TEXT:C222(SD_at_GroupNames; 0)
		ARRAY LONGINT:C221(SD_al_GroupIDS; 0)
		ARRAY TEXT:C222(SD_at_UserNames; 0)
		
		// //  To use standard 4D Relations instead of SQL change the If (True) to If (False)
		//{
		If (True:C214)
			CAL_bo_CanModify:=True:C214
			
			$_t_SQL:="SELECT "+Table name:C256(<>Cal_ptr_GroupTable)+"."+Field name:C257(<>Cal_ptr_GroupFld_ID)+", "
			$_t_SQL:=$_t_SQL+Table name:C256(<>Cal_ptr_GroupTable)+"."+Field name:C257(<>Cal_ptr_GroupFld_Name)+", "
			$_t_SQL:=$_t_SQL+Table name:C256(Cal_ptr_UserTable)+"."+Field name:C257(Cal_ptr_UsernameField)
			$_t_SQL:=$_t_SQL+" FROM "+Table name:C256(<>Cal_ptr_GroupTable)+", "+Table name:C256(Cal_ptr_UserTable)
			$_t_SQL:=$_t_SQL+" WHERE "+Table name:C256(<>Cal_ptr_GroupTable)+"."+Field name:C257(<>Cal_ptr_GroupotherscanModField)+" = :CAL_bo_CanModify"
			$_t_SQL:=$_t_SQL+" AND "+Table name:C256(<>Cal_ptr_GroupTable)+"."+Field name:C257(<>Cal_ptr_GroupUserIDField)+" <>  :[◊Cal4D_UserID_i]"
			$_t_SQL:=$_t_SQL+" INTO :SD2_al_GroupPopupIDs, :SD2_at_GroupPopupMenu, :SD_at_UserNames;"
			
			Begin SQL
				EXECUTE IMMEDIATE :$_t_SQL
			End SQL
			
		Else 
			QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupotherscanModField->=True:C214; *)
			QUERY:C277(<>Cal_ptr_GroupTable->;  & ; <>Cal_ptr_GroupUserIDField->#<>CAL_l_CurrentUserID)
			
			GET AUTOMATIC RELATIONS:C899($_bo_OldOneRelations; $_bo_OldManyRelations)
			SET AUTOMATIC RELATIONS:C310(True:C214)
			SELECTION TO ARRAY:C260(<>Cal_ptr_GroupFld_ID->; SD_al_GroupIDS; <>Cal_ptr_GroupFld_Name->; SD_at_GroupNames; Cal_ptr_UsernameField->; SD_at_UserNames)
			SET AUTOMATIC RELATIONS:C310($_bo_OldOneRelations; $_bo_OldManyRelations)
			
		End if 
		//}
		
		If (Size of array:C274(SD_al_GroupIDS)>0)
			If (Size of array:C274(<>Cal_al_GroupPopupIDs)>0)  // So we only add a divider line if there's something to divide.
				APPEND TO ARRAY:C911(<>Cal_al_GroupPopupIDs; 0)
				APPEND TO ARRAY:C911(<>Cal_at_GroupPopupMenu; "-")
			End if 
			SORT ARRAY:C229(SD_at_UserNames; SD_at_GroupNames; SD_al_GroupIDS; >)
			For ($_l_element; 1; Size of array:C274(SD_al_GroupIDS))
				APPEND TO ARRAY:C911(<>Cal_al_GroupPopupIDs; SD_al_GroupIDS{$_l_element})
				If (SD_at_UserNames{$_l_element}=<>CAL_t_SharedUserName)
					APPEND TO ARRAY:C911(<>Cal_at_GroupPopupMenu; SD_at_GroupNames{$_l_element})
				Else 
					APPEND TO ARRAY:C911(<>Cal_at_GroupPopupMenu; SD_at_GroupNames{$_l_element}+" ("+SD_at_UserNames{$_l_element}+")")
				End if 
			End for 
		End if 
		
		// Select the appropriate calendar.
		$_l_element:=Find in array:C230(<>Cal_al_GroupPopupIDs; <>Cal_ptr_EventGroupIDField->)
		If ($_l_element=-1)
			<>Cal_ptr_EventGroupIDField->:=Cal4D_Group_DefaultGroupID(<>CAL_l_CurrentUserID)
			$_l_element:=Abs:C99(Find in array:C230(<>Cal_al_GroupPopupIDs; <>Cal_ptr_EventGroupIDField->))
		End if 
		<>Cal_at_GroupPopupMenu:=$_l_element
		
		// //  To use standard 4D Relations instead of SQL change the If (True) to If (False)
		// //  This is an example of creating a Selection using the SQL kernel
		//{
		If (True:C214)
			$_t_SQL:=Field name:C257(<>Cal_ptr_GroupFld_ID)+" = "+String:C10(<>Cal_al_GroupPopupIDs{$_l_element})
			QUERY BY SQL:C942(<>Cal_ptr_GroupTable->; $_t_SQL)
			
		Else 
			QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=<>Cal_al_GroupPopupIDs{$_l_element})
			
		End if 
		//}
		
		If (Is new record:C668(<>Cal_ptr_EventTable->))
			<>Cal_ptr_EventColorField->:=<>Cal_ptr_GroupFld_Colour->  // Default to the Group color.
		End if 
		
		<>CAL_l_ColorPopupMenu:=Cal4D_UTIL_Cal4D_ColorToIndex(<>Cal_ptr_EventColorField->)
		// //  Cal4D_UTIL_4DIndexToUserIndex (Cal4D_Util_RGBToIndexedColor ())
		
		//If (◊Cal_Po_EventColorField->=◊Cal4D_UseGroupColor_i)
		//  `◊Cal4D_ColorPopupMenu_i:=1  ` The X.
		//Else
		//End if
		
		GOTO OBJECT:C206(Cal4D_t_EventTitle)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Clicked:K2:4)
		//insert_code_here
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Outside Call:K2:11)
		//insert_code_here
		//
		//--------------------------------------------------------------------------------
End case 

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("Cal4D_FM_Cal4D_Event_d"; $_t_oldMethodName)