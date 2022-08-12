//%attributes = {}
If (False:C215)
	//Project Method Name:      JobsTC JobCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 18:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//Array TEXT(SD_at_TrState;0)
	C_BOOLEAN:C305($2)
	C_POINTER:C301($1; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobsTC JobCheck")
//JobsTC JobCheck - check that a job you've allocated is allowed

If (($1->#"") & (Substring:C12(BUT_p_ButtonStringPointer->; 2; 1)="J"))
	States_CUArr(->[JOBS:26]State:9)
	If (((<>SYS_al_RecStateRestriction{26}{vStPos}\2)%2)=1)
		Gen_Alert("You have Read Only access to Jobs with that State, so you cannot post "+"to it"; "Try again")
		$1->:=""
		GOTO OBJECT:C206($1->)
	End if 
	If (Count parameters:C259=1)
		If (($1->#"") & (SD_at_TrState=1) & ([JOBS:26]Budget_TR:28=False:C215))
			Gen_Alert("This Job will not receive Budget postings"; "Try again")
			$1->:=""
			GOTO OBJECT:C206($1->)
		End if 
		If (($1->#"") & (SD_at_TrState=1) & ([JOBS:26]Actual_TR:29=False:C215))
			Gen_Alert("This Job will not receive Actual postings"; "Try again")
			$1->:=""
			GOTO OBJECT:C206($1->)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("JobsTC JobCheck"; $_t_oldMethodName)