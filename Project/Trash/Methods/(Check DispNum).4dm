//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check DispNum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 06:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check DispNum")
OK:=1
If (Records in selection:C76($1->)>4000)
	If (Records in selection:C76($1->)>6000)
		Gen_Confirm("There are "+String:C10(Records in selection:C76($1->))+" "+$2+" to choose from.  Display the the first 6000?"; "Yes"; "No")
		REDUCE SELECTION:C351($1->; 6000)
	Else 
		Gen_Confirm("There are "+String:C10(Records in selection:C76($1->))+" "+$2+" to choose from.  Display them?"; "Yes"; "No")
	End if 
	If (OK=0)
		ONE RECORD SELECT:C189($1->)
		UNLOAD RECORD:C212($1->)
		OK:=0
	End if 
End if 
ERR_MethodTrackerReturn("Check DispNum"; $_t_oldMethodName)