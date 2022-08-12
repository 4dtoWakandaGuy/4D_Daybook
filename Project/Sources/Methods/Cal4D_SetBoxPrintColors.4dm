//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_SetBoxPrintColors
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>CAL_d_Box1Date)
	C_LONGINT:C283(<>CAL_l_FirstBox; <>CAL_l_LastBox; $firstDateNum; $objectNumber)
	C_POINTER:C301($boxPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_SetBoxPrintColors")

// Project Method: Calendar_SetBoxPrintColors

// Searching for answers? Be sure to check out the "About..." menu located in the
// Apple menu (Macintosh) or the Help menu (Windows). There you can find online
// help for this example database, as well as a listing of numerous 4D resources
// available to you.

// Method created by Dave Batton, DataCraft.

// Called from the [Calendar];"PrintCalendar" form method to set the colors of
//   the boxes on the Calendar.



$firstDateNum:=Day of:C23(<>CAL_d_Box1Date)
For ($objectNumber; 1; (<>CAL_l_FirstBox-1))
	$boxPtr:=Get pointer:C304("<>Cal_Box"+String:C10($objectNumber))
	OBJECT SET RGB COLORS:C628($boxPtr->; Foreground color:K23:1; Background color:K23:2)
End for 

For ($objectNumber; <>CAL_l_FirstBox; <>CAL_l_LastBox)
	$boxPtr:=Get pointer:C304("<>Cal_Box"+String:C10($objectNumber))
	OBJECT SET RGB COLORS:C628($boxPtr->; Foreground color:K23:1; 0x00FFFFFF)  // White
End for 

For ($objectNumber; <>CAL_l_LastBox+1; 42)
	$boxPtr:=Get pointer:C304("<>Cal_Box"+String:C10($objectNumber))
	OBJECT SET RGB COLORS:C628($boxPtr->; Foreground color:K23:1; Background color:K23:2)
End for 
ERR_MethodTrackerReturn("Cal4D_SetBoxPrintColors"; $_t_oldMethodName)