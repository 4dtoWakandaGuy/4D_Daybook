//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayEval
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2011 21:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BracketPosition; $_l_LengthParameter1)
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter1; $1; vMTitle3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayEval")
If (Count parameters:C259>=1)
	$_t_Parameter1:=$1
Else 
	
	$_l_BracketPosition:=Position:C15("("; vMTitle3)
	
	If ($_l_BracketPosition>0)
		$_t_Parameter1:=Substring:C12(vMTitle3; $_l_BracketPosition+1; Length:C16(vMTitle3)-$_l_BracketPosition-1)
	End if 
	
End if 

$_l_BracketPosition:=Position:C15("("; $_t_Parameter1)
If ($_l_BracketPosition>0)
	
	If ($_t_Parameter1#"")
		vMTitle3:=""
		EXECUTE FORMULA:C63("vMTitle3:="+$_t_Parameter1)
		If (vMTitle3#"")
			$_l_BracketPosition:=1
			$_l_LengthParameter1:=Length:C16(vMTitle3)
			While ($_l_BracketPosition<=$_l_LengthParameter1)
				Gen_PostKey(0; Character code:C91(Substring:C12(vMTitle3; $_l_BracketPosition; 1)); 0)
				$_l_BracketPosition:=$_l_BracketPosition+1
			End while 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_PlayEval"; $_t_oldMethodName)