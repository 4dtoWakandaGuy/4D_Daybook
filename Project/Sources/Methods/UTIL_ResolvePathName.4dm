//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_ResolvePathName
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
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting)
	C_LONGINT:C283($_l_CharacterReference)
	C_TEXT:C284($_Txt_FullPathName; $0; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("UTIL_ResolvePathName")
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      UTIL_ResolvePathName
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
	//pass this method a path to a document(or folder). it will give you the path without the folder
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------
If (Count parameters:C259>=1)
	$_Txt_FullPathName:=$1
Else 
	
	//UNIT_TESTINGINIT (Current method name)
	
	If (<>UNIT_bo_UnitTesting)
		
	End if 
	
End if 

//-------------------- Main Method -------------------

If ($_Txt_FullPathName#"")
	$_l_CharacterReference:=Length:C16($_Txt_FullPathName)-1
	Repeat 
		If ($_Txt_FullPathName[[$_l_CharacterReference]]=Folder separator:K24:12)
			$0:=Substring:C12($_Txt_FullPathName; 1; $_l_CharacterReference)
			$_l_CharacterReference:=0
		Else 
			$_l_CharacterReference:=$_l_CharacterReference-1
		End if 
	Until ($_l_CharacterReference=0)
End if 
ERR_MethodTrackerReturn("UTIL_ResolvePathName"; $_t_oldMethodName)