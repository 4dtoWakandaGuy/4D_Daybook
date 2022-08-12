//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_isComponentInstalled
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/01/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ComponentNames; 0)
	
	
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting; $0)
	C_LONGINT:C283($_l_ComponentPosition)
	C_TEXT:C284($_t_oldMethodName; $_Txt_ComponentToText; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("UTIL_isComponentInstalled")
If (False:C215)
	//Project Method Name:      UTIL_isComponentInstalled
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
	//Date Created: 10/09/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 

//---------- Type Parameters & Local Variables ----------
If (True:C214)
	ARRAY TEXT:C222($_at_ComponentNames; 0)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_Txt_ComponentToText:=$1
	
Else 
	
	
End if 

//-------------------- Main Method -------------------
If ($_Txt_ComponentToText#"")
	ARRAY TEXT:C222($_at_ComponentNames; 0)
	COMPONENT LIST:C1001($_at_ComponentNames)
	$0:=False:C215
	$_l_ComponentPosition:=Find in array:C230($_at_ComponentNames; $_Txt_ComponentToText)
	If ($_l_ComponentPosition>0)
		$0:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("UTIL_isComponentInstalled"; $_t_oldMethodName)