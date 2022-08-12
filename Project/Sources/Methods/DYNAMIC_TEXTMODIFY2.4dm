//%attributes = {}
If (False:C215)
	//Project Method Name:      DYNAMIC_TEXTMODIFY2
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $_t_TextReturned; $_t_TextSent; $0; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DYNAMIC_TEXTMODIFY2")

//DYNAMIC_TEXTMODIFY2

//DYNAMIC_TEXTMODIFY2
//Change aa_getnextID to AA_getnextidinmethod

If (Count parameters:C259>=2)
	Case of 
		: ($1=4)
			$_t_TextReturned:=""
			$_t_TextSent:=$2
			$_t_TextReturned:=Replace string:C233($_t_TextSent; "AA_GetNextID ("; "AA_GetNextIDinMethod (")
			$0:=$_t_TextReturned
	End case 
End if 
ERR_MethodTrackerReturn("DYNAMIC_TEXTMODIFY2"; $_t_oldMethodName)