//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_PrintFormMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_NextObjectNum; $i)
	C_POINTER:C301($pictPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_PrintFormMethod")

// Project Method: Calendar_PrintFormMethod

// Searching for answers? Be sure to check out the "About..." menu located in the
// Apple menu (Macintosh) or the Help menu (Windows). There you can find online
// help for this example database, as well as a listing of numerous 4D resources
// available to you.

// Method created by Dave Batton, DataCraft.



Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		Cal4D_SetBoxPrintColors
		Cal4D_SetNumbers
		Cal4D_PlaceEvents
		
		// Normally we work with transparent pictures, because it looks really cool.  But
		//   when we print, transparent pictures turn out black.  So we need them to be
		//   non-transparent.  The only way I've found to do this procedurally is to copy
		//   them to the clipboard, then get them back out of the clipboard.  It's weird,
		//   but it works.
		// ◊Cal_NextObjectNum was set to the number of pictures +1 when we called
		//   Calendar_PlaceEvents.  It's a little questionable to assume the value is
		//   still valid, but it's much faster than doing another search, so we'll use it.
		//   But you might break it if you change how events are placed.
		For ($i; 1; (<>CAL_l_NextObjectNum-1))
			$pictPtr:=Get pointer:C304("<>Cal_Pict"+String:C10($i))
			SET PICTURE TO PASTEBOARD:C521($pictPtr->)
			GET PICTURE FROM PASTEBOARD:C522($pictPtr->)
		End for 
End case 
ERR_MethodTrackerReturn("Cal4D_PrintFormMethod"; $_t_oldMethodName)