//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Feet to Dec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharPosition; $_l_CharPosition2)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Feet to Dec")
$_l_CharPosition:=Position:C15("'"; $1)
If ($_l_CharPosition=0)
	$0:=Num:C11($1)
Else 
	$0:=Num:C11(Substring:C12($1; 1; $_l_CharPosition-1))
	$_l_CharPosition2:=Position:C15("."; $1)
	If ($_l_CharPosition2=0)
		$0:=Round:C94(($0+(Num:C11(Substring:C12($1; $_l_CharPosition+1; 32000))/12)); 2)
	Else 
		$0:=Round:C94(($0+(Num:C11(Substring:C12($1; $_l_CharPosition+1; $_l_CharPosition2-1))/12)+(Num:C11(Substring:C12($1; $_l_CharPosition2+1; 32000))/100)); 2)
	End if 
End if 
ERR_MethodTrackerReturn("Feet to Dec"; $_t_oldMethodName)