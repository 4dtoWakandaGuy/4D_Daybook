//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_CenterWindow
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_CenterWindow (->table; form name{; window type}) --> Number
	
	// Opens a window centered over the frontmost window.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : Form's table
	//   $2 : Text : Form name
	
	// Returns:
	//   $0 : Longint : The window reference
	
	// Created by Dave Batton on Jul 30, 2004
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:37`Method: Cal4D_CenterWindow
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FormHeight; $_l_FormWidth; $_l_WIndowBottom; $_l_WIndowLeft; $_l_WindowRef; $_l_WIndowRight; $_l_WIndowTop; $_l_WIndowType; $0; $2)
	C_TEXT:C284($_t_FormName; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_CenterWindow")

$_t_FormName:=$1
If (Count parameters:C259>=2)
	$_l_WIndowType:=$2
Else 
	$_l_WIndowType:=Plain fixed size window:K34:6  //Movable form dialog box
End if 

GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)

// If the frontmost window is the hidden 4D splash screen, we don't want to center over it, so pick a new spot.
If ((($_l_WIndowRight-$_l_WIndowLeft)<10) | (($_l_WIndowRight<-1000) & ($_l_WIndowBottom<-1000)))
	$_l_WIndowLeft:=Screen width:C187/2
	$_l_WIndowTop:=Screen height:C188/3
	$_l_WIndowRight:=$_l_WIndowLeft+1
	$_l_WIndowBottom:=$_l_WIndowTop+1
	If (($_l_WIndowType=Sheet window:K34:15) | ($_l_WIndowType=Resizable sheet window:K34:16))
		$_l_WIndowType:=Movable dialog box:K34:7
	End if 
End if 

FORM GET PROPERTIES:C674($_t_FormName; $_l_FormWidth; $_l_FormHeight)

$_l_WIndowLeft:=$_l_WIndowLeft+(($_l_WIndowRight-$_l_WIndowLeft-$_l_FormWidth)/2)
$_l_WIndowTop:=$_l_WIndowTop+(($_l_WIndowBottom-$_l_WIndowTop-$_l_FormHeight/2))

$_l_WindowRef:=Open form window:C675($_t_FormName; $_l_WIndowType; $_l_WIndowLeft; $_l_WIndowTop)

$0:=$_l_WindowRef
ERR_MethodTrackerReturn("Cal4D_CenterWindow"; $_t_oldMethodName)