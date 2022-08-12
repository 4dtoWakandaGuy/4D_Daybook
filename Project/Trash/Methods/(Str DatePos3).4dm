//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str DatePos3
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
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Position; $0)
	C_TEXT:C284($_t_DateString; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str DatePos3")
If (Count parameters:C259>=1)
	$_t_DateString:=String:C10($1; 4)
	$_l_Position:=Str_PosDivide($_t_DateString)
	$_t_DateString:=Substring:C12($_t_DateString; $_l_Position+1; 99)
	$_l_Position:=Str_PosDivide($_t_DateString)
	$0:=Num:C11(Substring:C12($_t_DateString; $_l_Position+1; 99))
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("Str DatePos3"; $_t_oldMethodName)