//%attributes = {}
If (False:C215)
	//Project Method Name:      Set_Fonts_ByPointer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FontSize; $_l_Index; $_l_ParametersCount; $1)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284(<>FormFont; $_t_oldMethodName; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle17)
	C_TEXT:C284(vTitle18; vTitle19; vTitle2; vTitle20; vTitle3; vTitle4; vTitle5; vTitle6; vTitle7; vTitle8; vTitle9)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Set_Fonts_ByPointer")
//NG Feb 2008 This method is now largely defunct and replaced by the more flexibleSetFontsByPointerParameter the new method has the font size, font name(optional valiue=defaults to preferred font) and font style(optional value). The values are then passed as pointers.
//This method  is left in place as it may be used on some superreports

If (Count parameters:C259>=2)
	$_l_FontSize:=$1
	$_l_ParametersCount:=Count parameters:C259
	For ($_l_Index; 2; $_l_ParametersCount)
		$_ptr_Variable:=${$_l_Index}
		If (Not:C34(Is nil pointer:C315($_ptr_Variable)))
			OBJECT SET FONT:C164($_ptr_Variable->; <>FormFont)
			If ($_l_FontSize>0)
				OBJECT SET FONT SIZE:C165($_ptr_Variable->; $_l_FontSize)
			End if 
		End if 
	End for 
	
End if 
ERR_MethodTrackerReturn("Set_Fonts_ByPointer"; $_t_oldMethodName)
