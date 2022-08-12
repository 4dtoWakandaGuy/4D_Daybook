
If (False:C215)
	//Form Name:      PERSONNEL.Ask_Person.oACCLoginPasswordEnter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting)
	C_LONGINT:C283($_l_FormEvent; $_l_TriggerEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL]Ask_Person.oACCLoginPasswordEnter"; Form event code:C388)
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Form Object Method Name:      ACCESS_LOGINSELECT.oACCLoginPasswordEnter
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/10/2015
	//Created BY: Nigel Greenlee
	
	//////22/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Form event code:C388>=1)
	
	$_l_FormEvent:=Form event code:C388
	
Else 
	
	
	
	If (<>UNIT_bo_UnitTesting)
		
	End if 
	
End if 

//-------------------- Main Method -------------------

Case of 
		
	: ($_l_FormEvent=On Clicked:K2:4)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL]Ask_Person.oACCLoginPasswordEnter"; $_t_oldMethodName)
