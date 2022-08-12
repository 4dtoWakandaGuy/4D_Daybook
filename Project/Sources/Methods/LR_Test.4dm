//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_Test
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
	//ARRAY TEXT(LIC_at_NonStdAttrbNamesArray;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbValuesArray;0)
	//ARRAY TEXT(LIC_at_StdAttrbNamesArray;0)
	//ARRAY TEXT(LIC_at_StdAttrbValuesArray;0)
	//ARRAY TEXT(LIC_at_ModNonStdAttrbNameArray;0)
	//ARRAY TEXT(LIC_at_ModNonStdAttrbValueArray;0)
	//ARRAY TEXT(LIC_at_ModStdAttrbNameArray;0)
	//ARRAY TEXT(LIC_at_ModStdAttrbValueArray;0)
	C_POINTER:C301(LR_ptr_LicenceFile; LR_ptr_LicenceID; LIC_ptr_LicenceTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_Test")

//this method now only valid if for some reason testing old version of EBLOB

//same goes in general for the methods "LR_LicStdAttrbNameValPairs","LR_LicNonStdAttrbNameValPairs"...
//..."LR_ModStdAttrbNameValPairs"and"LR_ModNonStdAttrbNameValPairs" in that they are now only valid for...
//...extracting data from old EBLOBS

LR_Custom

ALL RECORDS:C47(LIC_ptr_LicenceTable->)
//
//ORDER BY(LIC_ptr_LicenceTable->;LR_ptr_LicenceDateModified->)
ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceID->; <)  //get the most recent licence

//
//$LicenceFileText:=LR_LicenceFileEBLOBToClearTxt ([LR_Licence]LicenceFile)
//

//
//
ARRAY TEXT:C222(LIC_at_StdAttrbNamesArray; 0)
ARRAY TEXT:C222(LIC_at_StdAttrbValuesArray; 0)
//
LR_LicStdAttrbNameValPairs(LR_ptr_LicenceFile; ->LIC_at_StdAttrbNamesArray; ->LIC_at_StdAttrbValuesArray)
//
//
ARRAY TEXT:C222(LIC_at_NonStdAttrbNamesArray; 0)
ARRAY TEXT:C222(LIC_at_NonStdAttrbValuesArray; 0)
//
LR_LicNonStdAttrbNameValPairs(LR_ptr_LicenceFile; ->LIC_at_NonStdAttrbNamesArray; ->LIC_at_NonStdAttrbValuesArray)
//
//
ARRAY TEXT:C222(LIC_at_ModStdAttrbNameArray; 0)
ARRAY TEXT:C222(LIC_at_ModStdAttrbValueArray; 0)
//
LR_ModStdAttrbNameValPairs(LR_ptr_LicenceFile; ->LIC_at_ModStdAttrbNameArray; ->LIC_at_ModStdAttrbValueArray)
//
//
ARRAY TEXT:C222(LIC_at_ModNonStdAttrbNameArray; 0)
ARRAY TEXT:C222(LIC_at_ModNonStdAttrbValueArray; 0)
//
LR_ModNonStdAttrbNameValPairs(LR_ptr_LicenceFile; ->LIC_at_ModNonStdAttrbNameArray; ->LIC_at_ModNonStdAttrbValueArray)
//
ERR_MethodTrackerReturn("LR_Test"; $_t_oldMethodName)