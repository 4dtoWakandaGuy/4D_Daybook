//%attributes = {}
If (False:C215)
	//Project Method Name:      UppersSurname
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
	C_LONGINT:C283(<>SYS_l_AutoCapitalization)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UppersSurname")
If (Count parameters:C259>=1)
	$0:=$1
	If ((Substring:C12($0; 1; 1)#"!") & (<>SYS_l_AutoCapitalization<2))
		If ($0="Mc@")
			$0:=Substring:C12($0; 1; 2)+Uppercase:C13(Substring:C12($0; 3; 1))+Substring:C12($0; 4; 32000)
		End if 
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("UppersSurname"; $_t_oldMethodName)