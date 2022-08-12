//%attributes = {}
If (False:C215)
	//Project Method Name:      SetFontsByPointerParameter
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
	C_LONGINT:C283(<>DataSize; $_l_FontSize; $_l_FontStyle; $_l_ParameterIndex; $1; $3)
	C_TEXT:C284(<>FormFont; $_t_FontName; $_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SetFontsByPointerParameter")

//This method is based on SETFONTS. With 2 significant differences.
//1  The font size and font name are passed in $1
//2 The things to set the font are passed as POINTERS parameters rather than a connected string
//Also this will test if the font is installed on the machine doing the printing.
//This should be used for setting the fonts ofvariables and fields.

If (Count parameters:C259>=4)
	If ($1>0)
		$_l_FontSize:=$1
	Else 
		$_l_FontSize:=<>DataSize
	End if 
	If ($2#"")
		$_t_FontName:=$2
	Else 
		$_t_FontName:=<>FormFont
	End if 
	If ($3>0)
		$_l_FontStyle:=$3
	Else 
		$_l_FontStyle:=Plain:K14:1
	End if 
	For ($_l_ParameterIndex; 4; Count parameters:C259)
		
		//Parameter is a variable name
		
		OBJECT SET FONT:C164(${$_l_ParameterIndex}->; $_t_FontName)
		OBJECT SET FONT SIZE:C165(${$_l_ParameterIndex}->; $_l_FontSize)
		OBJECT SET FONT STYLE:C166(${$_l_ParameterIndex}->; $_l_FontStyle)
		
		
	End for 
End if 
ERR_MethodTrackerReturn("SetFontsByPointerParameter"; $_t_oldMethodName)
