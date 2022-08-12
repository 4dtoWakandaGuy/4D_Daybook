//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DB_FixMethods2019//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($Event)
	//C_UNKNOWN($oldMethodName)
	C_BOOLEAN:C305(LAY_b_FiltersActive; Lay_b_UpdateFilters)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("___Orphan___4707")

$oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oCoTypesCB4"; Form event code:C388)
$Event:=Form event code:C388
Case of 
	: ($event=On Clicked:K2:4)
		LAY_b_FiltersActive:=True:C214
		Lay_b_UpdateFilters:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oCoTypesCB4"; $OldMethodName)