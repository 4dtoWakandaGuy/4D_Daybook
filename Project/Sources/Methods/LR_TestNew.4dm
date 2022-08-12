//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_TestNew
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
	//ARRAY TEXT(LIC_at_ModNonStdAttrbNameArray;0)
	//ARRAY TEXT(LIC_at_ModNonStdAttrbValueArray;0)
	//ARRAY TEXT(LIC_at_ModStdAttrbNameArray;0)
	//ARRAY TEXT(LIC_at_ModStdAttrbValueArray;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbNamesArray;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbValuesArray;0)
	//ARRAY TEXT(LIC_at_StdAttrbNamesArray;0)
	//ARRAY TEXT(LIC_at_StdAttrbValuesArray;0)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_ptr_LicenceFile; LR_ptr_LicenceID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_TestNew")

ALL RECORDS:C47(LIC_ptr_LicenceTable->)
//
//ORDER BY(LIC_ptr_LicenceTable->;LR_ptr_LicenceDateModified->)
ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceID->; <)  //get the most recent licence

//
//$LicenceFileText:=LR_LicenceFileEBLOBToClearTxt ([LR_Licence]LicenceFile)
//
LR_Custom
//
//
ARRAY TEXT:C222(LIC_at_StdAttrbNamesArray; 0)
ARRAY TEXT:C222(LIC_at_StdAttrbValuesArray; 0)
//
ARRAY TEXT:C222(LIC_at_NonStdAttrbNamesArray; 0)
ARRAY TEXT:C222(LIC_at_NonStdAttrbValuesArray; 0)
//
ARRAY TEXT:C222(LIC_at_ModStdAttrbNameArray; 0)
ARRAY TEXT:C222(LIC_at_ModStdAttrbValueArray; 0)
//
ARRAY TEXT:C222(LIC_at_ModNonStdAttrbNameArray; 0)
ARRAY TEXT:C222(LIC_at_ModNonStdAttrbValueArray; 0)
//

LR_LicenceFileEBLOBToArrays(LR_ptr_LicenceFile; ->LIC_at_StdAttrbNamesArray; ->LIC_at_StdAttrbValuesArray; ->LIC_at_NonStdAttrbNamesArray; ->LIC_at_NonStdAttrbValuesArray; ->LIC_at_ModStdAttrbNameArray; ->LIC_at_ModStdAttrbValueArray; ->LIC_at_ModNonStdAttrbNameArray; ->LIC_at_ModNonStdAttrbValueArray)
ERR_MethodTrackerReturn("LR_TestNew"; $_t_oldMethodName)
