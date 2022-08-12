//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_TestDlog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(LIC_at_LicenceAtributes;0)
	//ARRAY TEXT(LIC_at_LicenceAttibuteVal;0)
	//ARRAY TEXT(LIC_at_LicencedModules;0)
	//ARRAY TEXT(LIC_at_LicenceNosAtributes;0)
	//ARRAY TEXT(LIC_at_LicenceNosAttibuteVal;0)
	//ARRAY TEXT(LIC_at_ModAttrbNames;0)
	//ARRAY TEXT(LIC_at_ModAttrbValues;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbValues;0)
	//ARRAY TEXT(LIC_at_StdAttrbNames;0)
	//ARRAY TEXT(LIC_at_StdAttrbValues;0)
	C_BOOLEAN:C305($1; LR_bo_Enable; WIN_bo_TrackerInited)
	C_DATE:C307($_d_Date; LR_D_LastLicenceDate)
	C_LONGINT:C283($_l_Index; $_l_OK; $_l_WindowReferenceRow; LR_l_LicenceType; WIN_l_CurrentWinRef)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_ptr_LicenceDateAdded; LR_ptr_LicenceFile; LR_ptr_LicenceTimeAdded)
	C_TEXT:C284($_t_ModuleName; $_t_Name; $_t_oldMethodName; LR_t_LicencedOrg)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_TestDlog")
//Path_TestDlog
//this proc assumes that the User record is currently loaded & writable
LR_l_LicenceType:=1  //Defautl
ARRAY TEXT:C222(LIC_at_LicenceAtributes; 0)
ARRAY TEXT:C222(LIC_at_LicenceAttibuteVal; 0)
ARRAY TEXT:C222(LIC_at_LicenceNosAtributes; 0)
ARRAY TEXT:C222(LIC_at_LicenceNosAttibuteVal; 0)
ARRAY TEXT:C222(LIC_at_LicencedModules; 0)
Open_Any_Window(270; 450)

LR_Custom
If (LR_bo_Enable)
	LR_l_LicenceType:=2
Else 
	LR_l_LicenceType:=1
End if 
//If (LR_t_LicenceHost#"")
//LR_l_LicenceType:=2
If (Records in table:C83(LIC_ptr_LicenceTable->)>0)
	ALL RECORDS:C47(LIC_ptr_LicenceTable->)
	ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->; <; LR_ptr_LicenceTimeAdded->; <)  //Sorted so they are in date order and within the date they are in time order
	$_d_Date:=LR_ptr_LicenceDateAdded->
	//********************** altered to use new Eblob type (array vars placed in blob directly as opposed to parsing text) ***********
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
	$_l_WindowReferenceRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "USER")
	If ($_l_WindowReferenceRow>0)  //it should be
		LR_t_LicencedOrg:=DB_GetOrganisation
	Else 
		LR_t_LicencedOrg:=DB_GetOrganisation
	End if 
	$_l_WindowReferenceRow:=Find in array:C230(LIC_at_StdAttrbNames; "LICENSE EXPIRY DATE")
	If ($_l_WindowReferenceRow<0)
		$_l_WindowReferenceRow:=Find in array:C230(LIC_at_StdAttrbNames; "LICENCE EXPIRY DATE")
	End if 
	If ($_l_WindowReferenceRow>0)
		LR_D_LastLicenceDate:=Date:C102(LIC_at_StdAttrbValues{$_l_WindowReferenceRow})
	Else 
		LR_D_LastLicenceDate:=!00-00-00!
	End if 
	
	// This gives us the licenced modules of the last build
	For ($_l_Index; 1; Size of array:C274(LIC_at_ModAttrbNames); 4)
		$_t_Name:=LIC_at_ModAttrbNames{$_l_Index+1}
		$_t_Name:=Replace string:C233($_t_Name; "NAME"; "SELECTED")
		//Here we cannot currently do a find in array because the we need to take "name" off and put "selected" on
		$_l_WindowReferenceRow:=Find in array:C230(LIC_at_NonsModAttrbNames; $_t_Name)
		If ($_l_WindowReferenceRow>0)
			If (LIC_at_NonsModAttrbvalues{$_l_WindowReferenceRow}="TRUE")
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
	
	
Else 
	//although the licence function is turned on there is no licence on this system
	LR_D_LastLicenceDate:=!00-00-00!
End if 
//Else
//LR_l_LicenceType:=1
//End if
//End if
DIALOG:C40([COMPANIES:2]; "dPath_Test")
CLOSE WINDOW:C154
$_l_OK:=OK
OK:=1
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
//TRACE

If ($_l_OK=1)
	DB_SaveRecord(->[USER:15])
End if   // licence number accepted
ERR_MethodTrackerReturn("Path_TestDlog"; $_t_oldMethodName)
