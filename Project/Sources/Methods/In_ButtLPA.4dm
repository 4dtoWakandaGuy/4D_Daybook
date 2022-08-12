//%attributes = {}
If (False:C215)
	//Project Method Name:      In_ButtLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ColonPosition)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("In_ButtLPA")

//InButt LPA


If (($1#"") & ($1#"File"))
	If (($1="Gen_CULPA") & (Count parameters:C259>1))
		Gen_CULPA($2)
	Else 
		If (($1="P:@") | ($1="R:@"))
			//Can't execute the proc before next rec etc because it would accept
			If ($1="P:@")
				$_t_ExecuteMethodName:=Substring:C12($1; 3; 32000)
				$_l_ColonPosition:=Position:C15(":"; $_t_ExecuteMethodName)
				If ($_l_ColonPosition>0)
					$_t_ExecuteMethodName:=Substring:C12($_t_ExecuteMethodName; 1; $_l_ColonPosition-1)
				End if 
				//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$t)
				
				//EXECUTE FORMULA($t)
				$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_ExecuteMethodName)
				EXECUTE METHOD:C1007($_t_ExecuteMethodName)
			End if 
		Else 
			//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1)
			//EXECUTE FORMULA($1)
			$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($1)
			EXECUTE METHOD:C1007($_t_ExecuteMethodName)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("In_ButtLPA"; $_t_oldMethodName)