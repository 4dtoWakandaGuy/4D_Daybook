//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Edit
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_Edit (group ID) --> Number
	
	// Displays a dialog allowing the user to edit the group information.
	// A additional options are available if the group is a subscription (was created
	//   from a URL).
	// Returns the group record ID.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : A group record ID (optional)
	
	// Returns:
	//   $0 : Longint : The group record ID
	
	// Created by Dave Batton on Jun 16, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:26`Method: Cal4D_Group_Edit
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY LONGINT(Cal_al_RowFontColor;0)
	//ARRAY TEXT(Cal_at_Calendar;0)
	C_BOOLEAN:C305($_bo_OldManyRelations; $_bo_OldOneRelations)
	C_LONGINT:C283($_l_ColourOLD; $_l_ProcessState; $_l_ProcessTime; $_l_RecordID; $_l_RecordsinSelection; $_l_windowReference; $0; $1)
	C_POINTER:C301(<>Cal_ptr_EventColorField; <>Cal_ptr_EventTable; <>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupicalURLField; <>CAL_ptr_GroupiCalUUIDField; <>Cal_ptr_GroupTable; CAL_ptr_4DFullCalendar)
	C_TEXT:C284(<>CAL_t_FullAndMinisProcName; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Edit")


$_l_RecordID:=$1

Cal4D_Init

Cal4D_Group_LoadRecord($_l_RecordID; "*")

If (<>Cal_ptr_GroupicalURLField->#"")
	Cal4D_iCal_Edit($_l_RecordID)
	
Else 
	$_l_windowReference:=Open form window:C675("Cal4D_Group_Edit"; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)
	
	READ WRITE:C146(<>Cal_ptr_GroupTable->)
	
	If ($_l_RecordID=New record:K29:1)
		CREATE RECORD:C68(<>Cal_ptr_GroupTable->)
		<>Cal_ptr_GroupFld_ID->:=Sequence number:C244(<>Cal_ptr_GroupTable->)
		<>CAL_ptr_GroupiCalUUIDField->:=Cal4D_NewUUID(<>Cal_ptr_GroupTable; <>CAL_ptr_GroupiCalUUIDField)
		DIALOG:C40("Cal4D_Group_Edit")
		If (OK=1)
			SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
		End if 
		
	Else 
		If (Count parameters:C259>0)
			QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=$_l_RecordID)
		End if 
		If (Records in selection:C76(<>Cal_ptr_GroupTable->)>=1)
			$_l_ColourOLD:=<>Cal_ptr_GroupFld_Colour->
			DIALOG:C40("Cal4D_Group_Edit")
			
			If (OK=1)  // If the group's color was modified, we need to update the events on the calendar.
				SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
				If (<>Cal_ptr_GroupFld_Colour->#$_l_ColourOLD)
					
					// // Modified by: Charles Vass (04/12/2009, 07:30)
					// //  Apply the color change to evehts
					//{
					GET AUTOMATIC RELATIONS:C899($_bo_OldOneRelations; $_bo_OldManyRelations)
					SET AUTOMATIC RELATIONS:C310(True:C214)
					
					READ WRITE:C146(<>Cal_ptr_EventTable->)
					
					RELATE MANY:C262(<>Cal_ptr_GroupTable->)
					APPLY TO SELECTION:C70(<>Cal_ptr_EventTable->; <>Cal_ptr_EventColorField->:=<>Cal_ptr_GroupFld_Colour->)
					
					READ ONLY:C145(<>Cal_ptr_EventTable->)
					SET AUTOMATIC RELATIONS:C310($_bo_OldOneRelations; $_bo_OldManyRelations)
					//}
					
					Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
					
					// // Modified by: Charles Vass (04/12/2009, 07:34)
					//Cal4D_Cal_Redraw
				End if 
			End if 
		Else 
			BEEP:C151  // Something went wrong. We couldn't find the record.
			OK:=0
		End if 
	End if 
	
	CLOSE WINDOW:C154
	$_l_RecordID:=<>Cal_ptr_GroupFld_ID->
	UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
	
	PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	
	If (<>CAL_t_FullAndMinisProcName=$_t_ProcessName)
		ALL RECORDS:C47(<>Cal_ptr_GroupTable->)
		ORDER BY:C49(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_Name->)
		$_l_RecordsinSelection:=Records in selection:C76(<>Cal_ptr_GroupTable->)
		ARRAY BOOLEAN:C223(Cal_lb_ListboxCalender; $_l_RecordsinSelection)
		ARRAY TEXT:C222(Cal_at_Calendar; $_l_RecordsinSelection)
		ARRAY LONGINT:C221(Cal_al_RowFontColor; $_l_RecordsinSelection)
		For ($_l_ProcessState; 1; $_l_RecordsinSelection)
			GOTO SELECTED RECORD:C245(<>Cal_ptr_GroupTable->; $_l_ProcessState)
			Cal_lb_ListboxCalender{$_l_ProcessState}:=True:C214
			Cal_at_Calendar{$_l_ProcessState}:=<>Cal_ptr_GroupFld_Name->
			Cal_al_RowFontColor{$_l_ProcessState}:=<>Cal_ptr_GroupFld_Colour->
		End for 
		REDRAW:C174(Cal_lb_ListboxCalender)
	End if 
	
	UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
	
End if 
READ ONLY:C145(<>Cal_ptr_GroupTable->)

$0:=$_l_RecordID
ERR_MethodTrackerReturn("Cal4D_Group_Edit"; $_t_oldMethodName)