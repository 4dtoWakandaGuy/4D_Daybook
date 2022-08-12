//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Plural Single
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
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Plural Single")
If ($2=1)
	Case of 
		: ($1="are")
			$0:="is"
		: ($1="them")
			$0:="it"
		: ($1="s")
			$0:=""
		Else 
			$0:=$1
	End case 
Else 
	Case of 
		: ($1="is")
			$0:="are"
		: ($1="it")
			$0:="them"
		: ($1="")
			$0:="s"
		Else 
			$0:=$1
	End case 
End if 
ERR_MethodTrackerReturn("Plural Single"; $_t_oldMethodName)