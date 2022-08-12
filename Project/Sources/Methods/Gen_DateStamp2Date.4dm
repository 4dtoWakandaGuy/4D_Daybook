//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_DateStamp2Date
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_DateStamp2Date")
//WT July 2001
//$1=longint date stamp
//$2=pointer to field or var to put date in
// Gen_DateStamp2Date($1;$DateVar): $DateVar = date returned
If (Count parameters:C259>=2)
	$2->:=!1999-12-30!+($1\(24*60*60))
End if 
ERR_MethodTrackerReturn("Gen_DateStamp2Date"; $_t_oldMethodName)