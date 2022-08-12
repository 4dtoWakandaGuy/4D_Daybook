//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_CheckDefaultAction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/06/2010 18:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_LONGINT:C283($_l_ActionRow; $_l_DoneRow; $_l_FormRow; $_l_LocationRow; $_l_LocationsRow; $_l_ReminderRow; $_l_TabsColumn; $_l_ThreadedRow; $_l_toDoColumn; $_l_WorkflowColumn)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_CheckDefaultAction")
//This method checks the existance of a' hard coded' diary action record.
//in previous version of daybook there were some instances of hard coded action codes-with no action code
//note that the action code is HIDDEN from the user when going to action codes so cannot be modified or deleted

If (Count parameters:C259>=1)
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$1)
	If (Records in selection:C76([ACTIONS:13])=0)
		
		Case of 
			: ($1="IMR")
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Received Email"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				$_l_DoneRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")
				If ($_l_DoneRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_DoneRow}:=0  //This is NOT a done action...it
				End if 
				$_l_ReminderRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder")
				If ($_l_ReminderRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ReminderRow}:=1  //This should get a reminder
				End if 
				$_l_ReminderRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder Time")
				If ($_l_ReminderRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ReminderRow}:=1  //This should get a reminder straight away!!
				End if 
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_WorkflowColumn:=Find in array:C230(SD2_at_DiaryLocations; "Workflow")
					If ($_l_WorkflowColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_WorkflowColumn})
					End if 
				End if 
				$_l_ActionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
				If ($_l_ActionRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ActionRow}:=4  //(Force user to complete
				End if 
				
				$_l_FormRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
				If ($_l_FormRow>0)
					SD2_at_ActionVirtFieldDataTXT{$_l_FormRow}:="Email"  //(Force user to complete
				End if   //...SO TO GET THIS WORKING I HAVE TO DO THIS FORM..and somehow this form needs to know that when processing via a that the reminder must be different
				
				
				
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
				
			: ($1="DOC")
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Attached Document"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				$_l_DoneRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")
				If ($_l_DoneRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_DoneRow}:=1
				End if 
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_TabsColumn:=Find in array:C230(SD2_at_DiaryLocations; "Diary Tabs Only")
					If ($_l_TabsColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_TabsColumn})
					End if 
				End if 
				$_l_ActionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
				If ($_l_ActionRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ActionRow}:=3
				End if 
				
				
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="SVS")
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Service Call"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationRow>0)
					$_l_toDoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_toDoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationRow}; SD2_al_DiaryLocations{$_l_toDoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1  //open original item
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="JCJ")  //JOB-job costing
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Job(Job Costing)"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_toDoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_toDoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_toDoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")  //open original item
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="JST")  //JOB STAGE-job costing
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Job Stage"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_TodoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_TodoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_TodoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="JAMT")  //JOB agency Manager
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Agency Job(Temp)"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_toDoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_toDoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_toDoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="JAMP")  //JOB agency Manager
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Agency Job(Perm)"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_toDoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_toDoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_toDoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="JTR")  //Time Recording for agency jobs-note currently these don't happen
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Job Time"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_toDoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_toDoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_toDoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
				
				
			: ($1="EVT")  //Event
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Event"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_toDoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_toDoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_toDoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="ATT")  //Event attendence
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Event Attendance"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_toDoColumn:=Find in array:C230(SD2_at_DiaryLocations; "To Do List")
					If ($_l_toDoColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_toDoColumn})
					End if 
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}:=1
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
				
			: ($1="PDT")  //publication dates
				
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Publication Dates"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				$_l_DoneRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")
				If ($_l_ThreadedRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_DoneRow}:=0  //This is NOT a done action...it
				End if 
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_WorkflowColumn:=Find in array:C230(SD2_at_DiaryLocations; "Workflow")
					If ($_l_WorkflowColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_WorkflowColumn})
					End if 
				End if 
				$_l_actionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
				If ($_l_actionRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_actionRow}:=4  //(auto complete
				End if 
				
				$_l_FormRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
				If ($_l_FormRow>0)
					SD2_at_ActionVirtFieldDataTXT{$_l_FormRow}:="Pagination"
				End if 
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
			: ($1="COM")
				
				SD2_LoadDiaryTypes
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:=$1
				[ACTIONS:13]Action_Name:2:="Comment"
				[ACTIONS:13]Default_Description:6:=""
				[ACTIONS:13]xActionTypeID:10:=-1  //hidden-as an action
				[ACTIONS:13]xID:12:=AA_GetNextID(->[ACTIONS:13]xID:12)
				SD2_ActionAttributesToArrays
				$_l_DoneRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")
				If ($_l_DoneRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_DoneRow}:=1
				End if 
				ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
				$_l_LocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsRow>0)
					$_l_TabsColumn:=Find in array:C230(SD2_at_DiaryLocations; "Diary Tabs Only")
					
					If ($_l_TabsColumn>0)
						APPEND TO ARRAY:C911(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsRow}; SD2_al_DiaryLocations{$_l_TabsColumn})
					End if 
				End if 
				$_l_actionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
				If ($_l_actionRow>0)
					SD2_al_ActionVirtFieldDataLong{$_l_actionRow}:=3
				End if 
				
				
				SD2_ActionArraystoAttributes
				DB_SaveRecord(->[ACTIONS:13])
				
		End case 
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_CheckDefaultAction"; $_t_oldMethodName)
