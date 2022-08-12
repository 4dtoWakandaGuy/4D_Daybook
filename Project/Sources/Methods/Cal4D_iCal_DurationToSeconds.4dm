//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_DurationToSeconds
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_DurationToSeconds (DURATION) --> Number
	
	// Convert a RFC 2445 DURATION value to seconds.
	// This is only going to work up to 24855 days, but that should
	//   be good enough.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : A Duration value, such as "P15DT5H0M20S"
	
	// Returns:
	//   $0 : Longint : The length of the duration in seconds
	
	// Created by Dave Batton on Jun 28, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_iCal_DurationToSeconds
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_CharacterPositions; 0)
	C_LONGINT:C283($_l_length; $_l_position; $_l_seconds; $_l_segment; $_l_start; $_l_value; $0)
	C_TEXT:C284($_t_character; $_t_duration; $_t_oldMethodName; $_t_value; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_DurationToSeconds")

$_t_duration:=$1

$_l_seconds:=0

If ($_t_duration#"")
	$_t_duration:=Uppercase:C13($_t_duration)+"X"  // The X doesn't change the result, but it makes sure we don't get an error.
	
	ARRAY INTEGER:C220($_ai_CharacterPositions; 0)
	
	For ($_l_position; 1; Length:C16($_t_duration))
		If (($_t_duration[[$_l_position]]>="A") & ($_t_duration[[$_l_position]]<="Z"))
			APPEND TO ARRAY:C911($_ai_CharacterPositions; $_l_position)
		End if 
	End for 
	
	// Now scan through the DURATION value looking for digit-number pairs.
	//   For example, "15D" or "27M".  Convert these to seconds and add them
	//   to the running total.
	For ($_l_segment; 1; Size of array:C274($_ai_CharacterPositions)-1)
		$_l_length:=$_ai_CharacterPositions{$_l_segment+1}-$_ai_CharacterPositions{$_l_segment}-1
		If ($_l_length>0)
			$_l_start:=$_ai_CharacterPositions{$_l_segment}+1
			$_t_value:=Substring:C12($_t_duration; $_l_start; $_l_length)
			$_l_value:=Num:C11($_t_value)
			$_t_character:=$_t_duration[[$_ai_CharacterPositions{$_l_segment+1}]]
			
			Case of 
				: ($_t_character="W")  // Weeks
					$_l_seconds:=$_l_seconds+($_l_value*60*60*24*7)
				: ($_t_character="D")  // Days
					$_l_seconds:=$_l_seconds+($_l_value*60*60*24)
				: ($_t_character="H")  // Hours
					$_l_seconds:=$_l_seconds+($_l_value*60*60)
				: ($_t_character="M")  // Minutes
					$_l_seconds:=$_l_seconds+($_l_value*60)
				: ($_t_character="S")  // Seconds
					$_l_seconds:=$_l_seconds+$_l_value
			End case 
		End if 
	End for 
End if 

$0:=$_l_seconds
ERR_MethodTrackerReturn("Cal4D_iCal_DurationToSeconds"; $_t_oldMethodName)