If (False:C215)
	//object Name: [CCM_PSPTransaction]ALL_FIELDS.bLabels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CCM_PSPTransaction].ALL_FIELDS.bLabels"; Form event code:C388)
PRINT LABEL:C39(Current form table:C627->; Char:C90(1))
ERR_MethodTrackerReturn("OBJ [CCM_PSPTransaction].ALL_FIELDS.bLabels"; $_t_oldMethodName)