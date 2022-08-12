//%attributes = {}

If (False:C215)
	//Project Method Name:      Check_PersAnal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_POINTER:C301($1; $2)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>PER_t_CurrentUserInitials; $_t_oldMethodName; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_PersAnal")

//modiifieid NG August 2003 to accomodate import settings
$_t_oldMethodName:=ERR_MethodTracker("Check_PersAnal")
If (DB_t_CurrentFormUsage#"None")
	If ((<>PersAnOver) | (<>PER_t_CurrentUserInitials=$1->))
		$2->:=<>Per_t_CurrentDefaultAnalCode
	Else 
		RELATE ONE:C42($1->)
		If (([PERSONNEL:11]Analysis_Code:20#"") & ([PERSONNEL:11]Analysis_Code:20#"ASK"))
			$2->:=[PERSONNEL:11]Analysis_Code:20
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Check_PersAnal"; $_t_oldMethodName)