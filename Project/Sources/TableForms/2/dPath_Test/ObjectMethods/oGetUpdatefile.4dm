If (False:C215)
	//object Name: [COMPANIES]dPath_Test.oGetUpdatefile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(LIC_at_LicencedModules;0)
	//ARRAY TEXT(LIC_at_ModAttrbNames;0)
	//ARRAY TEXT(LIC_at_ModAttrbValues;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbValues;0)
	//ARRAY TEXT(LIC_at_StdAttrbNames;0)
	//ARRAY TEXT(LIC_at_StdAttrbValues;0)
	C_BOOLEAN:C305(LIC_bo_FileImported)
	C_DATE:C307($_d_Date; LR_D_LastLicenceDate)
	C_LONGINT:C283($_l_AttributeRow; $_l_ExpiryRow; $_l_Index; $_l_NumberRow; $_l_UserRow)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_ptr_LicenceDateAdded; LR_ptr_LicenceFile; LR_ptr_LicenceTimeAdded)
	C_TEXT:C284(<>PathName; <>UserName; $_t_AttributeName; $_t_ModuleName; $_t_oldMethodName; LR_t_LicencedOrg; Vtitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.oGetUpdatefile"; Form event code:C388)
ARRAY TEXT:C222(LIC_at_LicencedModules; 0)

LIC_bo_FileImported:=False:C215

<>UserName:=Vtitle2  //added 17/01/08 -kmw to make the same as license upDate_Button
[USER:15]Organisation:1:=<>UserName  //added 17/01/08 -kmw to make the same as license upDate_Button
DB_SaveRecord(->[USER:15])  //added 17/01/08 -kmw to make the same as license upDate_Button

LR_LicenceFileImportEFile


ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->; <)  //Sorted so they are in date order and within the date they are in time order
$_d_Date:=LR_ptr_LicenceDateAdded->
QUERY:C277(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->=$_d_Date)
ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceTimeAdded->; <)
//********************** altered to use new Eblob type (array vars placed in blob directly as opposed to parsing text) ***********



//probably could factor out most of from here on down into a generic function used by both "Update License" and 'Import license File" buttons

ARRAY TEXT:C222(LIC_at_NonStdAttrbNames; 0)
ARRAY TEXT:C222(LIC_at_NonStdAttrbValues; 0)
ARRAY TEXT:C222(LIC_at_StdAttrbNames; 0)
ARRAY TEXT:C222(LIC_at_StdAttrbValues; 0)
ARRAY TEXT:C222(LIC_at_ModAttrbNames; 0)
ARRAY TEXT:C222(LIC_at_ModAttrbValues; 0)
//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
ARRAY TEXT:C222(LIC_at_NonsModAttrbNames; 0)
ARRAY TEXT:C222(LIC_at_NonsModAttrbvalues; 0)
LR_LicenceFileEBLOBToArrays(LR_ptr_LicenceFile; ->LIC_at_StdAttrbNames; ->LIC_at_StdAttrbValues; ->LIC_at_NonStdAttrbNames; ->LIC_at_NonStdAttrbValues; ->LIC_at_ModAttrbNames; ->LIC_at_ModAttrbValues; ->LIC_at_NonsModAttrbNames; ->LIC_at_NonsModAttrbvalues)
//LR_LicNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonStdAttrbNames;->LIC_at_NonStdAttrbValues)
//LR_LicStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_StdAttrbNames;->LIC_at_StdAttrbValues)
//LR_ModStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_ModAttrbNames;->LIC_at_ModAttrbValues)
//LR_ModNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonsModAttrbNames;->LIC_at_NonsModAttrbvalues)
//*********************************************************************************************
$_l_UserRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "USER")
If ($_l_UserRow>0)  //it should be
	LR_t_LicencedOrg:=LIC_at_NonStdAttrbValues{$_l_UserRow}
Else 
	LR_t_LicencedOrg:="UNKNOWN"
End if 
Vtitle2:=LR_t_LicencedOrg
$_l_ExpiryRow:=Find in array:C230(LIC_at_StdAttrbNames; "LICENSE EXPIRY DATE")
If ($_l_ExpiryRow<0)
	$_l_ExpiryRow:=Find in array:C230(LIC_at_StdAttrbNames; "LICENCE EXPIRY DATE")
End if 
If ($_l_ExpiryRow>0)
	LR_D_LastLicenceDate:=Date:C102(LIC_at_StdAttrbValues{$_l_ExpiryRow})
Else 
	LR_D_LastLicenceDate:=!00-00-00!
End if 
$_l_NumberRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENSENUMBER")
If ($_l_NumberRow<0)
	$_l_NumberRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENCENUMBER")
End if 
If ($_l_NumberRow>0)
	<>PathName:=LIC_at_NonStdAttrbValues{$_l_NumberRow}
Else 
	<>PathName:=""
End if 
// This gives us the licenced modules of the last build
For ($_l_Index; 1; Size of array:C274(LIC_at_ModAttrbNames); 4)
	$_t_AttributeName:=LIC_at_ModAttrbNames{$_l_Index+1}
	$_t_AttributeName:=Replace string:C233($_t_AttributeName; "NAME"; "SELECTED")
	//Here we cannot currently do a find in array because the we need to take "name" off and put "selected" on
	$_l_AttributeRow:=Find in array:C230(LIC_at_NonsModAttrbNames; $_t_AttributeName)
	If ($_l_AttributeRow>0)
		If (LIC_at_NonsModAttrbvalues{$_l_AttributeRow}="TRUE")
			//is licencesed
			$_t_ModuleName:=LIC_at_ModAttrbValues{$_l_Index+2}
			APPEND TO ARRAY:C911(LIC_at_LicencedModules; $_t_ModuleName)
		Else 
			//no licenced
		End if 
	Else 
		//not licenced for this module
	End if 
End for 

//And update the user record and redo Path_Check
ERR_MethodTrackerReturn("OBJ:dPath_Test,xSearch"; $_t_oldMethodName)
