//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote Code
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
	C_LONGINT:C283($i)
	C_REAL:C285($_l_Number)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote Code")
$0:=""
For ($i; 1; Length:C16($1))
	$_l_Number:=Round:C94((Character code:C91(Substring:C12($1; $i; 1))/2); 1)
	If ($_l_Number=Int:C8($_l_Number))
		$0:=Char:C90(Int:C8($_l_Number))+String:C10(Random:C100%6)+$0
	Else 
		$0:=Char:C90(Int:C8($_l_Number))+String:C10(Random:C100%(9-6+1)+6)+$0
	End if 
End for 
ERR_MethodTrackerReturn("Remote Code"; $_t_oldMethodName)