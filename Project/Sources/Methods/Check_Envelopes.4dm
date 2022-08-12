//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Envelopes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(rComp; vNo; zComp)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Envelopes")
//Check_Envelopes
If ((zComp=1) & (rComp=0))
	Gen_Confirm("Insert Envelopes, centred on the manual feed, one by one"; ""; "")
Else 
	Gen_Confirm("Insert "+String:C10(vNo)+" Envelopes, centred on the manual feed, one by one"; ""; "")
End if 
ERR_MethodTrackerReturn("Check_Envelopes"; $_t_oldMethodName)