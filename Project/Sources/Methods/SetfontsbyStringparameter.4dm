//%attributes = {}
If (False:C215)
	//Project Method Name:      SetfontsbyStringparameter
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
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284(<>FormFont; $_t_FontName; $_t_oldMethodName; $_t_Parameter; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SetfontsbyStringparameter")

//This method is based on SETFONTS. With 2 significant differences.
//1  The font size and font name are passed in $1
//2 The things to set the font are passed as parameters rather than a connected string
//Also this will test if the font is installed on the machine doing the printing.
//This should be used for setting the fonts of static text
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
		$_t_Parameter:=${$_l_ParameterIndex}
		If ($_t_Parameter#"")
			If ($_t_Parameter[[1]]="*")
				//paramter is an object name
				$_t_Parameter:=Substring:C12($_t_Parameter; 2)
				OBJECT SET FONT:C164(*; $_t_Parameter; $_t_FontName)
				OBJECT SET FONT SIZE:C165(*; $_t_Parameter; $_l_FontSize)
				OBJECT SET FONT STYLE:C166(*; $_t_Parameter; $_l_FontStyle)
			Else 
				//Parameter is a variable name
				$_ptr_Variable:=Get pointer:C304(${$_l_ParameterIndex})
				OBJECT SET FONT:C164($_ptr_Variable->; $_t_FontName)
				OBJECT SET FONT SIZE:C165($_ptr_Variable->; $_l_FontSize)
				OBJECT SET FONT STYLE:C166($_ptr_Variable->; $_l_FontStyle)
			End if 
		End if 
		
	End for 
End if 
ERR_MethodTrackerReturn("SetfontsbyStringparameter"; $_t_oldMethodName)
