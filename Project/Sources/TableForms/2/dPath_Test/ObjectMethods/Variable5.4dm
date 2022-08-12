If (False:C215)
	//object Name: [COMPANIES]dPath_Test.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(LIC_at_ModAttrbNames;0)
	//ARRAY TEXT(LIC_at_ModAttrbValues;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbValues;0)
	//ARRAY TEXT(LIC_at_StdAttrbNames;0)
	//ARRAY TEXT(LIC_at_StdAttrbValues;0)
	C_BOOLEAN:C305(LIC_bo_FileImported)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_AttributesRow; xOK)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_ptr_LicenceDateAdded; LR_ptr_LicenceFile; LR_ptr_LicenceTimeAdded)
	C_TEXT:C284(<>PathName; $_t_oldMethodName; vTitle3; vTitle4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Variable5"; Form event code:C388)
LIC_bo_FileImported:=False:C215
LR_LicenceFileImportEFile
If (LIC_bo_FileImported)
	ALL RECORDS:C47(LIC_ptr_LicenceTable->)
	ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->; <; LR_ptr_LicenceTimeAdded->; <)  //Sorted so they are in date order and within the date they are in time order
	FIRST RECORD:C50(LIC_ptr_LicenceTable->)
	//
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
	$_l_AttributesRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENSENUMBER")
	If ($_l_AttributesRow<0)
		$_l_AttributesRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENCENUMBER")
	End if 
	Case of 
		: ($_l_AttributesRow<1)
			ALERT:C41("Sorry. The licence nu"+"mber couldn't be determined from the licence file. Please report this problem. In"+" t"+"he mean time, try asking for the licence number and typing it in manually.")
			<>PathName:=""
		: (LIC_at_NonStdAttrbValues{$_l_AttributesRow}="")
			ALERT:C41("Sorry. The licence nu"+"mber couldn't be determined from the licence file. Please report this problem. In"+" t"+"he mean time, try asking "+" for the licence"+" number and typing it in manually.")
			<>PathName:=""
		Else 
			<>PathName:=LIC_at_NonStdAttrbValues{$_l_AttributesRow}  //Licence Number
	End case 
	//
	LicNumScreenPathNameEntryCheck
	//
	$_l_AttributesRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "VALIDATION3")
	Case of 
		: ($_l_AttributesRow<1)
			$_l_AttributesRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "VALIDCODE")
			Case of 
				: ($_l_AttributesRow<1)
					ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
					vTitle3:=""
				: (LIC_at_NonStdAttrbValues{$_l_AttributesRow}="")
					ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
					vTitle3:=""
				Else 
					vTitle3:=LIC_at_NonStdAttrbValues{$_l_AttributesRow}  //Validation Code
			End case 
		: (LIC_at_NonStdAttrbValues{$_l_AttributesRow}="")
			$_l_AttributesRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "VALIDCODE")
			Case of 
				: ($_l_AttributesRow<1)
					ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
					vTitle3:=""
				: (LIC_at_NonStdAttrbValues{$_l_AttributesRow}="")
					ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
					vTitle3:=""
				Else 
					vTitle3:=LIC_at_NonStdAttrbValues{$_l_AttributesRow}  //Validation Code
			End case 
		Else 
			vTitle3:=LIC_at_NonStdAttrbValues{$_l_AttributesRow}  //Validation Code
	End case 
	//
	If (vTitle3#"")
		Date_Test2(vTitle3)
		If (<>DB_d_CurrentDate>[USER:15]Limit Date:58)
			BEEP:C151
			vTitle4:="Not Accepted"
			vTitle3:=""
			GOTO OBJECT:C206(vTitle3)
			OBJECT SET ENABLED:C1123(xOK; False:C215)
		Else 
			vTitle4:=String:C10(([USER:15]Limit Date:58-<>DB_d_CurrentDate)+1)+" days remaining"
			vTitle3:=""
			OBJECT SET ENABLED:C1123(xOK; True:C214)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Variable5"; $_t_oldMethodName)
