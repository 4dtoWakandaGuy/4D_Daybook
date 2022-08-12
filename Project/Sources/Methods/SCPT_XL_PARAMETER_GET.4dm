//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_PARAMETER_GET
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 14:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_PARAMETER_GET")


If (Count parameters:C259=2)
	If (Not:C34(Is nil pointer:C315($1)))
		If (Not:C34(Is nil pointer:C315($2)))
			Case of 
				: (Type:C295($1->)=Is longint:K8:6) | (Type:C295($1->)=Is real:K8:4)
					Case of 
						: (Type:C295($2->)=Is longint:K8:6) | (Type:C295($2->)=Is real:K8:4)
							$1->:=$2->
						: (Type:C295($2->)=Is text:K8:3)
							$1->:=Num:C11($2->)
					End case 
				: (Type:C295($1->)=Is text:K8:3)
					Case of 
						: (Type:C295($2->)=Is longint:K8:6) | (Type:C295($2->)=Is real:K8:4)
							$1->:=String:C10($2->)
						: (Type:C295($2->)=Is text:K8:3)
							$1->:=$2->
					End case 
			End case 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SCPT_XL_PARAMETER_GET"; $_t_oldMethodName)