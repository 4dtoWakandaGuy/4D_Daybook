//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Substring Word
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
	C_LONGINT:C283($_l_StartPoint; $2; $3)
	C_TEXT:C284($_t_LastChar; $_t_oldMethodName; $_t_Single; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Substring Word")
If (Count parameters:C259>=3)
	$0:=Substring:C12($1; $2; $3+1)
	If (Length:C16($0)>$3)
		$_l_StartPoint:=$3+1
		$_t_Single:=Substring:C12($0; $_l_StartPoint; 1)
		While (($_t_Single#" ") & ($_t_Single#",") & ($_t_Single#":") & ($_t_Single#".") & ($_t_Single#";") & ($_t_Single#"-") & ($_l_StartPoint>($3/2)))
			IDLE:C311  // 7/04/03 pb
			$0:=Substring:C12($0; 1; Length:C16($0)-1)
			$_l_StartPoint:=$_l_StartPoint-1
		End while 
		If (Substring:C12($0; Length:C16($0); 1)=" ")
			$0:=Substring:C12($0; 1; Length:C16($0)-1)
		End if 
		$_t_LastChar:=Substring:C12($0; Length:C16($0); 1)
		If (($_t_LastChar=",") | ($_t_LastChar=":") | ($_t_LastChar=".") | ($_t_LastChar=";") | ($_t_LastChar="-"))
			$0:=Substring:C12($0; 1; Length:C16($0)-1)
		End if 
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Substring Word"; $_t_oldMethodName)
