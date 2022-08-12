//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME RelateOne
	//------------------ Method Notes ------------------
	//IME RelateOne
	//Rollo 18/6/2004
	
	//Perform a Relate One and Return a field value in one statement
	//to be called from DBList and DBEdit definitions Macros
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountParameters)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME RelateOne")


$_l_CountParameters:=Count parameters:C259

If ($_l_CountParameters>0)
	
	RELATE ONE:C42($1->)
	
	If ($_l_CountParameters>1)
		$0:=$2->
	Else 
		$0:=""
	End if 
	
	
Else 
	$0:="IME RelateOne - Error - no parameters"
End if 
ERR_MethodTrackerReturn("IME RelateOne"; $_t_oldMethodName)