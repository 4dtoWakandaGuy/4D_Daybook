//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Info
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Info (selector) --> Text
	
	// Returns general information about the component.
	
	// Responds to these selectors:
	//   "version" : The version number as a string (might include beta info)
	//   "numeric_version" : The version number as a number
	//   "max_events" : The maximum number of text events that can be displayed at one time
	//   "max_banners" : The maximumn number of banners that can be displayed at one time
	//   "max_pictures" :  The maximumn number of pictures that can be displayed at one time
	
	// If any other selector is passed, "unexpected request" will be returned.
	
	// The "version" selector returns the version number as human readable text.
	//   It might look like "Version 2.0.3 beta 7 release 4".
	
	// The "numeric_version" selector returns the version number as a number
	//   for comparisons. For example, version 2.0 would be "200" and version
	//   2.0.1 would be returned as "201". No beta version information is
	//  returned with this selector.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : selector
	
	// Returns:
	//   $0 : Text : The info
	
	// Created by Dave Batton, March 2006
	// ----------------------------------------------------
	
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:28`Method: Cal4D_Info
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_MaxBannerObjects; <>CAL_l_MaxPictureObjects; <>CAL_l_MaxTextObjects)
	C_TEXT:C284($_t_EventName; $_t_oldMethodName; $_t_Response; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Info")


$_t_EventName:=$1

Cal4D_Init

Case of 
	: ($_t_EventName="version")
		$_t_Response:="4.0 beta 1"  // For display.
		
	: ($_t_EventName="numeric_version")  // For procedural comparisons.
		$_t_Response:="400"  //incremented 3/9/2007 by robert molina
		
	: ($_t_EventName="max_events")
		$_t_Response:=String:C10(<>CAL_l_MaxTextObjects)
		
	: ($_t_EventName="max_banners")
		$_t_Response:=String:C10(<>CAL_l_MaxBannerObjects)
		
	: ($_t_EventName="max_pictures")
		$_t_Response:=String:C10(<>CAL_l_MaxPictureObjects)
		
	Else 
		$_t_Response:="unexpected request"
End case 

$0:=$_t_Response
ERR_MethodTrackerReturn("Cal4D_Info"; $_t_oldMethodName)