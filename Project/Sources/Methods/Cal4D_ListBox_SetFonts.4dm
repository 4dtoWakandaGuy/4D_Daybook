//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_ListBox_SetFonts
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_ListBox_SetFonts (->list box{; font size})
	
	// There's a bug in 4D Insider 2004.2 that prevents list boxes from
	//   using their style sheets in a component. So we work around it
	//   with this method.
	// The listbox header variables must be declared for this to work
	//   in a compiled database. Otherwise you'll get runtime errors. I
	//   tried to find a way around this but wasn't able to.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : The list box to fix
	
	// Returns: Nothing
	
	// Created by Dave Batton, March 2006
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:28`Method: Cal4D_ListBox_SetFonts
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_ColumnFontSize; $_l_HeaderFontSize; $_l_Index; $2)
	C_POINTER:C301($_ptr_listbox; $1)
	C_TEXT:C284(<>Cal_t_DisplayFont; $_t_FontName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_ListBox_SetFonts")

$_ptr_listbox:=$1

If (Count parameters:C259>=2)
	$_l_ColumnFontSize:=$2
Else 
	$_l_ColumnFontSize:=12
End if 

// Then the message list font.
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
LISTBOX GET ARRAYS:C832($_ptr_listbox->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)

$_t_FontName:=<>Cal_t_DisplayFont
$_l_HeaderFontSize:=11

For ($_l_Index; 1; Size of array:C274($_aptr_ColumnVariables))
	OBJECT SET FONT:C164($_aptr_ColumnVariables{$_l_Index}->; $_t_FontName)
	OBJECT SET FONT SIZE:C165($_aptr_ColumnVariables{$_l_Index}->; $_l_ColumnFontSize)
	
	OBJECT SET FONT:C164($_aptr_HeaderVariables{$_l_Index}->; $_t_FontName)
	OBJECT SET FONT SIZE:C165($_aptr_HeaderVariables{$_l_Index}->; $_l_HeaderFontSize)
End for 
ERR_MethodTrackerReturn("Cal4D_ListBox_SetFonts"; $_t_oldMethodName)