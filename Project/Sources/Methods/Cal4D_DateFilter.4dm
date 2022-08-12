//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_DateFilter
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_DateFilter (->date field or variable)
	
	// Interprets what has been entered as a date.  Also checks to see if
	//   a "function" key is hit and acts accordingly.
	// Place in the object method of a date field or variable:
	//     Cal4D_DateFilter(Self)
	// Assume's the date field's On Before Keystroke event is enabled.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : The calling object
	
	// Returns: Nothing
	
	// Method created by Tom Dillon, DataCraft
	// ----------------------------------------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:37`Method: Cal4D_DateFilter
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_TheDate)
	C_POINTER:C301($_ptr_FormObject; $1)
	C_TEXT:C284($_t_Keystroke; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_DateFilter")



$_ptr_FormObject:=$1

Case of 
	: (Form event code:C388=On Before Keystroke:K2:6)
		$_t_Keystroke:=Keystroke:C390
		
		Case of   // Check to see if a "function" key is hit
			: (($_t_Keystroke="+") | ($_t_Keystroke="="))  // Add a day
				$_d_TheDate:=Cal4D_StringToDate(Get edited text:C655)
				$_ptr_FormObject->:=Add to date:C393($_d_TheDate; 0; 0; 1)
				FILTER KEYSTROKE:C389("")
				
			: ($_t_Keystroke="-")  // Subtract a day
				$_d_TheDate:=Cal4D_StringToDate(Get edited text:C655)
				$_ptr_FormObject->:=Add to date:C393($_d_TheDate; 0; 0; -1)
				FILTER KEYSTROKE:C389("")
				
			: ($_t_Keystroke="T")  // Today
				$_ptr_FormObject->:=Current date:C33
				FILTER KEYSTROKE:C389("")
				
			: ($_t_Keystroke="M")  // First of Month
				$_ptr_FormObject->:=Add to date:C393(Current date:C33; 0; 0; -Day of:C23(Current date:C33)+1)
				FILTER KEYSTROKE:C389("")
				
			: ($_t_Keystroke="H")  // End of montH
				$_ptr_FormObject->:=Add to date:C393(Current date:C33; 0; 1; -Day of:C23(Current date:C33))
				FILTER KEYSTROKE:C389("")
				
			: ($_t_Keystroke="Y")  // First of Year
				$_ptr_FormObject->:=Date:C102("1/1/"+String:C10(Year of:C25(Current date:C33)))
				FILTER KEYSTROKE:C389("")
				
			: ($_t_Keystroke="R")  // End of yeaR
				$_ptr_FormObject->:=Date:C102("1/1/"+String:C10(Year of:C25(Current date:C33)+1))-1
				
			: (($_t_Keystroke>="0") | ($_t_Keystroke<="9"))
				// Don't filter the keystroke.
				
			Else 
				FILTER KEYSTROKE:C389("")
		End case 
		
	: (Form event code:C388=On Data Change:K2:15)  // Interpret the entry
		$_ptr_FormObject->:=Cal4D_StringToDate(Get edited text:C655)
		
End case 
ERR_MethodTrackerReturn("Cal4D_DateFilter"; $_t_oldMethodName)