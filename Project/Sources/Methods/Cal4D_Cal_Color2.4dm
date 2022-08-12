//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Color2
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Cal_Color2 (->variable; RGB color) --> Number
	
	// Called from Cal4D_Color to set/get a specific color variable.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : To an IP variable
	//   $2 : Longint : An RGB color value
	
	// Returns:
	//   $0 : Longint : An RGB color value
	
	// Created by Dave Batton on Jul 26, 2004
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:36`Method: Cal4D_Cal_Color2
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Colour; $0; $2)
	C_POINTER:C301($_po_Var; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Color2")
$_po_Var:=$1
$_l_Colour:=$2

If ($_l_Colour>0)
	$_po_Var->:=$_l_Colour
	Cal4D_Cal_Redraw
Else 
	$_l_Colour:=$_po_Var->
End if 

$0:=$_l_Colour
ERR_MethodTrackerReturn("Cal4D_Cal_Color2"; $_t_oldMethodName)