//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_Edit
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_Edit (event ID)
	
	// Opens the specified event.  If it's from a subscription, a view-only
	//  version is displayed.  Otherwise it's displayed for editing.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : The event ID number
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 21, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:39`Method: Cal4D_Event_Edit
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AccessLevel; $_l_eventID; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_Edit")


$_l_eventID:=$1

If ($_l_eventID=New record:K29:1)
	//Cal4D_Event_Edit2 ($_l_eventID)
	Gen_Alert("add new diary record")
	
Else 
	//TRACE
	//$1 is the [DIARY]x_ID
	$_l_AccessLevel:=SD2_GetuserAccessRights($_l_eventID; <>PER_l_CurrentUserID)
	
	
	//RELATE ONE(◊Cal_po_EventGroupIDField->)
	If ($_l_AccessLevel>0)
		If ($_l_AccessLevel=2)
			READ WRITE:C146([DIARY:12])
		Else 
			READ ONLY:C145([DIARY:12])
		End if 
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$1)
		
		// If it's part of a subscription, just display it in read-only mode.
		Case of 
				//: (Records in selection([DIARY])#1)
				//Cal4D_Alert ("EventRecordNotFound")
				
			: (Not:C34(Cal4D_Event_UserCanModifyEvent))  // It's another user's public event.
				//Cal4D_Event_View ()
				SD2_EditDiaryRecord([DIARY:12]Diary_Code:3; "Schedule")
				
			: (Cal4D_Event_UserCanModifyEvent)  // It's another user's public event.
				//Cal4D_Event_Edit2 ($_l_eventID)
				SD2_EditDiaryRecord([DIARY:12]Diary_Code:3; "Schedule")
				
			: (Cal4D_Event_IsLocked)
				//Cal4D_Event_View ($_l_eventID)
				SD2_EditDiaryRecord([DIARY:12]Diary_Code:3; "Schedule")
				
			Else 
				//Cal4D_Event_Edit2 ($_l_eventID)
				SD2_EditDiaryRecord([DIARY:12]Diary_Code:3; "Schedule")
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_Event_Edit"; $_t_oldMethodName)