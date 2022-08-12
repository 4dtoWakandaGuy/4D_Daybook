//%attributes = {}

//Database Method Name:      UTIL_isUUIDNil
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  28/10/2017
//Created BY:  DefaultUser
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting; $_bo_isNil; $0)
	C_TEXT:C284($_txt_UUIDtext; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("UTIL_isUUIDNil")
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      UTIL_isUUIDNil
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
	//Date Created: 02/10/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_txt_UUIDtext:=$1
Else 
	
	
	
End if 

//-------------------- Main Method -------------------
If (Length:C16($_txt_UUIDtext)>0)  //can only test the first char if the string is not empty
	
	$_bo_isNil:=($_txt_UUIDtext[[1]]="-")  // a temporary uuid assigned when adding rows to an array for records that dont yet exist
	
End if 
$0:=($_txt_UUIDtext="") | ($_txt_UUIDtext=("0"*32)) | ($_txt_UUIDtext="20202020202020202020202020202020") | ($_bo_isNil)
// | (Position("20";$_txt_UUIDtext)>0)
ERR_MethodTrackerReturn("UTIL_isUUIDNil"; $_t_oldMethodName)