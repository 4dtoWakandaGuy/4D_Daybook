//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_CFEnd
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
	C_LONGINT:C283(bd11; vNo3)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_CFEnd")
//StatsView CF End - end of the SVCF procedures
If (bd11=1)
	CREATE SET:C116($1->; "Extra")
	INTERSECTION:C121("Master"; "Extra"; "Extra")
	USE SET:C118("Extra")
End if 
vNo3:=Records in selection:C76($1->)
USE NAMED SELECTION:C332("Select")
CLEAR NAMED SELECTION:C333("Select")
MESSAGES ON:C181
ERR_MethodTrackerReturn("StatsView_CFEnd"; $_t_oldMethodName)