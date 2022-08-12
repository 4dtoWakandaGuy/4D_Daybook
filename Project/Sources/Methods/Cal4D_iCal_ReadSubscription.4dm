//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_ReadSubscription
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_ReadSubscription
	
	// Read the data from the .ics file construct arrays from it.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : The path to the file to import
	//   $2 : Pointer :
	//   $3 : Pointer :
	//   $4 : Pointer :
	//   $5 : Pointer :
	//   $6 : Pointer :
	//   $7 : Pointer :
	
	// Returns: Nothing
	
	// Created by Add Komoncharoensiri, 4D, Inc.
	//   Method originally named iCal_ReadSubscription.
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_iCal_ReadSubscription
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Valid)
	C_LONGINT:C283($_l_element; $_l_position; Cal_l_CalImportElement)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>CAL_ptr_GroupiCalUUIDField; $10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_CalendarPath; $_t_Data; $_t_oldMethodName; $1; CAL_t_CalendarName; CAL_t_CalImportLastTag; CAL_t_lZone; CAL_t_oZone)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_ReadSubscription")


$_t_CalendarPath:=$1  // Absolute path to the .ICS file

If (Test path name:C476($_t_CalendarPath)=1)
	$_ti_DocumentRef:=DB_OpenDocument($_t_CalendarPath; "TEXT"; Read mode:K24:5)
	If (OK=1)
		
		CAL_t_lZone:=Substring:C12(Cal4D_iCal_GetTimezone; 1; 1)
		
		// Make sure this is a valid iCalendar file.
		Repeat 
			RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Data; Char:C90(Line feed:K15:40))
			$_bo_Valid:=$_t_Data="BEGIN:VCALENDAR@"
		Until ((OK=0) | ($_bo_Valid))
		
		If ($_bo_Valid)
			Cal_l_CalImportElement:=0  // Checked and modified in the Cal4D_iCal_DataToArrays routine.
			CAL_t_CalImportLastTag:=""
			Repeat 
				RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Data; Char:C90(Line feed:K15:40))
				Case of 
					: ($_t_Data="X-WR-TIMEZONE:@")  // //  ex:
						
					: ($_t_Data="PRODID:@")  // //  ex:
						
					: ($_t_Data="X-WR-CALNAME:@")  // //  ex:
						$_l_position:=Position:C15(":"; $_t_Data)
						CAL_t_CalendarName:=Substring:C12($_t_Data; $_l_position+1)
						
					: ($_t_Data="X-WR-RELCALID:@")  // //  ex:E6A9A4D1-4C2D-4D73-A76A-0D0E11C1CC6C
						$_l_position:=Position:C15(":"; $_t_Data)
						<>CAL_ptr_GroupiCalUUIDField->:=Substring:C12($_t_Data; $_l_position+1)
						
					: (($_t_Data="X-APPLE-CALENDAR-COLOR:@") | ($_t_Data="X-4D-CALENDAR-COLOR:@"))  // //  ex:#E51717
						<>Cal_ptr_GroupFld_Colour->:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Substring:C12($_t_Data; $_l_position+1))
						
					: ($_t_Data="BEGIN:VTIMEZONE@")
						CAL_t_oZone:=Cal4D_iCal_GetOriginTimezone($_ti_DocumentRef)
						
					Else 
						Cal4D_iCal_DataToArrays($_t_Data)
						
				End case 
				
			Until (OK=0)
		Else 
			Error:=19340
		End if 
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_ReadSubscription"; $_t_oldMethodName)