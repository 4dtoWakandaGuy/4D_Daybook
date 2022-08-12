//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_InitSVGCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2009 17:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_InitSVGCalendar")

//NG October 2009
//This method will initialise the settings for the SVG Calenders
ERR_MethodTrackerReturn("SD2_InitSVGCalendar"; $_t_oldMethodName)