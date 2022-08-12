//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      DB_FixMethods2019//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/01/2011 10:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($event)
	//C_UNKNOWN($oldMethodName)
	C_BOOLEAN:C305(LAY_b_FiltersActive; Lay_b_UpdateFilters)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("___Orphan___4755")

$oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.OcsFilterZeros"; Form event code:C388)
$event:=Form event code:C388

Case of 
	: ($event=On Clicked:K2:4)
		
		LAY_b_FiltersActive:=True:C214
		Lay_b_UpdateFilters:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.OcsFilterZeros"; $OldMethodName)