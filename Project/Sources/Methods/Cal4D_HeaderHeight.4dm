//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_HeaderHeight
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method:   --> Number
	
	// Returns the height of the header, based on what's displayed there.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns:
	//   $0 : Longint : The header height
	
	// Created by Dave Batton on May 28, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:30`Method: Cal4D_HeaderHeight
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_DisplayMonthYearText; <>Cal_bo_DisplayNavButtons)
	C_LONGINT:C283(<>CAL_l_ColumnHeight; $_l_HeaderHeight; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_HeaderHeight")


Case of 
	: (<>Cal_bo_DisplayNavButtons)
		$_l_HeaderHeight:=40  // Note the largest number must come first.
		
	: (<>Cal_bo_DisplayMonthYearText)
		$_l_HeaderHeight:=40  // Currently these values are the same, but they don't need to be.
		
	Else 
		$_l_HeaderHeight:=0
End case 

// Make room for the divider line if a header will be drawn.
If ($_l_HeaderHeight>0)
	$_l_HeaderHeight:=$_l_HeaderHeight+<>CAL_l_ColumnHeight
End if 

$0:=$_l_HeaderHeight
ERR_MethodTrackerReturn("Cal4D_HeaderHeight"; $_t_oldMethodName)