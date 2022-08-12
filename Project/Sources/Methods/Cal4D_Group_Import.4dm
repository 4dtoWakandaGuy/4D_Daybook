//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Import
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_Import ({path}) --> Number
	
	// Imports the selected calendar file. A new group is created for the
	//   imported events, and the group ID number is returned.
	// If an empty path string is passed, an Open File dialog is presented to
	//   allow the user to select the calendar file.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : The full path to the calendar file (optional)
	
	// Returns:
	//   $0 : Longint : The new group ID
	
	// Created by Dave Batton on Jun 16, 2004
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_Group_Import
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY LONGINT(Cal_al_GroupID;0)
	//ARRAY LONGINT(Cal_al_RowFontColor;0)
	//ARRAY TEXT(Cal_at_Calendar;0)
	//ARRAY TEXT(CAL_at_TimeZones;0)
	C_BOOLEAN:C305($_t_WasInTransaction)
	C_LONGINT:C283(<>CAL_l_CurrentUserID; <>CAL_l_UseGroupColor; $_l_GroupID; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsInTable; $0)
	C_POINTER:C301(<>Cal_ptr_EventTable; <>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>CAL_ptr_GroupiCalUUIDField; <>Cal_ptr_GroupotherscanModField; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupTable)
	C_POINTER:C301(<>Cal_ptr_GroupUserIDField)
	C_TEXT:C284(<>CAL_t_FullAndMinisProcName; $_t_CalendarPath; $_t_GroupName; $_t_oldMethodName; $_t_ProcessName; $_t_Zone; $1; CAL_t_CalendarName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Import")



If (Count parameters:C259>=1)
	$_t_CalendarPath:=$1
Else 
	$_t_CalendarPath:=""
End if 

Cal4D_Init

$_l_GroupID:=0

If ($_t_CalendarPath="")
	$_ti_DocumentRef:=DB_OpenDocument(""; ""; Read mode:K24:5)
	If (OK=1)
		$_t_CalendarPath:=Document
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
Else 
	OK:=1
End if 

If (OK=1)
	$_t_Zone:=Substring:C12(Cal4D_iCal_GetTimezone; 3)
	ARRAY TEXT:C222(CAL_at_TimeZones; 0)
	Cal4D_iCal_GetTimezones(->CAL_at_TimeZones; $_t_Zone)
	
	If (Test path name:C476($_t_CalendarPath)=Is a document:K24:1)
		$_t_WasInTransaction:=In transaction:C397
		Cal4D_TRANSACTION("START")  // These can't be nested, so this is harmless if we're already in one.
		
		$_t_GroupName:=Cal4D_iCal_GetCalendarName($_t_CalendarPath)
		QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_Name->=$_t_GroupName)
		If (Records in selection:C76(<>Cal_ptr_GroupTable->)=0)
			CAL_t_CalendarName:=""
			CREATE RECORD:C68(<>Cal_ptr_GroupTable->)
			<>Cal_ptr_GroupFld_ID->:=Sequence number:C244(<>Cal_ptr_GroupTable->)
			<>Cal_ptr_GroupicalURLField->:=""
			<>Cal_ptr_GroupFld_Name->:=$_t_GroupName
			<>CAL_ptr_GroupiCalUUIDField->:=Cal4D_NewUUID(<>Cal_ptr_GroupTable; <>CAL_ptr_GroupiCalUUIDField)
			<>Cal_ptr_GroupotherscanviewField->:=True:C214
			<>Cal_ptr_GroupotherscanModField->:=False:C215
			<>Cal_ptr_GroupicaluserNameField->:=""
			<>Cal_ptr_GroupicalPasswordField->:=""
			<>Cal_ptr_GroupUserIDField->:=<>CAL_l_CurrentUserID  //3/1/2007-Robert Molina-Displays imported Ical data.  Without this code group user ID is 0 in group table and imported ical data is not displayed.
			
			//◊Cal_po_GroupicalURLField
			//◊Cal_po_GroupFld_Colour:=
			//◊Cal4D_GroupiCalUpdateIntFld_ptr:=
			//◊Cal4D_GroupiCalLastUpdteFld_ptr:=
			//◊Cal4D_GroupDescripFld_ptr:=
			
			SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
			$_l_GroupID:=<>Cal_ptr_GroupFld_ID->
			
			PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If (<>CAL_t_FullAndMinisProcName=$_t_ProcessName)
				$_l_ProcessTime:=Size of array:C274(Cal_lb_ListboxCalender)+1
				//INSERT LISTBOX ROW(CAL_abo_Calendars;$_l_ProcessTime)
				INSERT IN ARRAY:C227(Cal_lb_ListboxCalender; $_l_ProcessTime)
				INSERT IN ARRAY:C227(Cal_at_Calendar; $_l_ProcessTime)
				INSERT IN ARRAY:C227(Cal_al_RowFontColor; $_l_ProcessTime)
				INSERT IN ARRAY:C227(Cal_al_GroupID; $_l_ProcessTime)
				
				Cal_lb_ListboxCalender{$_l_ProcessTime}:=True:C214
				Cal_at_Calendar{$_l_ProcessTime}:=<>Cal_ptr_GroupFld_Name->
				Cal_al_RowFontColor{$_l_ProcessTime}:=<>Cal_ptr_GroupFld_Colour->
				Cal_al_GroupID{$_l_ProcessTime}:=<>Cal_ptr_GroupFld_ID->
				
				REDRAW:C174(Cal_lb_ListboxCalender)
			End if 
		End if 
		
		<>CAL_l_UseGroupColor:=<>Cal_ptr_GroupFld_Colour->
		
		$_l_RecordsInTable:=Records in table:C83(<>Cal_ptr_EventTable->)
		//Mssg("Message Open";"Importing iCalendar File";$_t_GroupName)
		
		Cal4D_iCal_ImportCalendarFile($_t_CalendarPath; <>Cal_ptr_GroupFld_ID->)
		If (CAL_t_CalendarName#"")
			<>Cal_ptr_GroupFld_Name->:=CAL_t_CalendarName
		End if 
		
		UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
		//Gen_Alert("Message Close")
		
		Case of 
			: (($_t_WasInTransaction) & (Error#0))
				// Don't end the existing transaction.
				Cal4D_UpdateEvents
				
			: (Error=0)
				Cal4D_TRANSACTION("VALIDATE")
				Cal4D_UpdateEvents
				
			Else 
				Cal4D_TRANSACTION("CANCEL")
				
		End case 
		
		////  Inform the user of how many records were imported
		//{
		$_l_RecordsInTable:=Records in table:C83(<>Cal_ptr_EventTable->)-$_l_RecordsInTable
		Gen_Alert("Imported Calendar Events"+Char:C90(13)+"Records Imported: "+String:C10($_l_RecordsInTable))
		//}
	End if 
End if 

$0:=$_l_GroupID
ERR_MethodTrackerReturn("Cal4D_Group_Import"; $_t_oldMethodName)