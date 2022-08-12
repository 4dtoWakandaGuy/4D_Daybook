//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsSaveNEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsSaveNEW
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_OverRideSR; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_UseStandardSR; 0)
	ARRAY POINTER:C280($_aptr_PrefsToSave; 0)
	ARRAY TEXT:C222($_at_OutputDocumentBody; 0)
	ARRAY TEXT:C222($_at_OutputDocumentFrom; 0)
	ARRAY TEXT:C222($_at_OutputDocumentNames; 0)
	ARRAY TEXT:C222($_at_OutputDocumentSubject; 0)
	ARRAY TEXT:C222($_at_Print1D; 0)
	ARRAY TEXT:C222($_at_PrintOption1; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption1_1D; 0)
	ARRAY TEXT:C222($_at_PrintOption2; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption2_1D; 0)
	ARRAY TEXT:C222($_at_PrintOption2Cont; 0)
	ARRAY TEXT:C222($_at_PrintOption2Email; 0)
	ARRAY TEXT:C222($_at_PrintOption2Person; 0)
	ARRAY TEXT:C222($_at_PrintOption2Role; 0)
	ARRAY TEXT:C222($_at_PrintOption2Val; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption3; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption3_1D; 0)
	ARRAY TEXT:C222($_at_PrintOption3Cont; 0)
	ARRAY TEXT:C222($_at_PrintOption3Email; 0)
	ARRAY TEXT:C222($_at_PrintOption3Pers; 0)
	ARRAY TEXT:C222($_at_PrintOption3Role; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption3Role_1D; 0)
	ARRAY TEXT:C222($_at_PrintOption4; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption4_1D; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_ReportNames; 0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	//ARRAY TEXT(SR_at_PreferencesName;0)
	//ARRAY TEXT(SR_at_TempTextOfBLOB;0)
	C_BLOB:C604($_blb_BuildPrefsBlob; SR_blb_TempPrefBLOB)
	C_BOOLEAN:C305($_bo_SaveToTemp)
	C_LONGINT:C283($_l_ArrayRows; $_l_ArraySize; $_l_Index; $_l_IndexRow; $_l_NamedPreferencePosition; $_l_NewElement; $_l_Offset; $_l_PreferencesID; $_l_Size; $_l_SizeofBlob; $_l_Temp)
	C_LONGINT:C283($_l_Transfer; $4; $5; SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_OBJECT:C1216($_obj_ReportPreferences)
	C_POINTER:C301($_ptr_ALttoArray; $_ptr_AlttoCont; $_ptr_AlttoEmail; $_ptr_AlttoPers; $_ptr_AlttoRole; $_ptr_DocumentBody; $_ptr_DocumentName; $_ptr_DocumentSubject; $_ptr_DocumentTo; $_ptr_Pref; $_ptr_Prefs)
	C_POINTER:C301($_ptr_PrefstoSave; $_ptr_toArray; $_ptr_toCont; $_ptr_toEmail; $_ptr_toPerson; $_ptr_toRole; $3; SR_ptr_BLOBToLoadFrom; SR_ptr_BLOBToSaveTo)
	C_TEXT:C284($_t_oldMethodName; $_t_PreferencesName; $_t_ReportPrefCodeStr; $_t_ReportPrefCompDocStr; $_t_ReportPrefDocCodeStr; $_t_ReportPrefLevelType; $_t_SeletedValue; $_t_SRTemp; $1; $2; SR_t_EmailPrintOption2Cont)
	C_TEXT:C284(SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsSaveNEW")


//Added 13/11/08 v631b120g -kmw


If (Count parameters:C259>1)
	$_t_ReportPrefCodeStr:=$1
Else 
	$_t_ReportPrefCodeStr:=[DOCUMENTS:7]Document_Code:1  //Default to assuming have been passed a report code
End if 

If (Count parameters:C259>=2)
	$_t_ReportPrefLevelType:=$2  //Pass either "REPORT" or "COMPANY" to specify what table code you have passed and to determine what level of report pref is being loaded
Else 
	$_t_ReportPrefLevelType:="REPORT"  //Default to assuming have been passed a report code
End if 

//C_TEXT($SR_S40_ReportPrefInternalRptStr)  `Added internal RPT handling 14/11/08 v631b120i -kmw
$_t_ReportPrefDocCodeStr:=""
$_t_ReportPrefCompDocStr:=""
//$SR_S40_ReportPrefInternalRptStr:=""  `Added internal RPT handling 14/11/08 v631b120i -kmw


//
//********************* Added selective pref save 19/11/08 v631b120i -kmw *********************
If (Count parameters:C259>2)  //Have been passed a pointer to an array of pointers, each element of which points to either the var that should be loaded into (THESE NEED TO BE IN CORRECT ORDER) or else is a null pointer indicating that we are not loading that particular pref
	If (Size of array:C274($3->)>0)
		$_ptr_PrefsToSave:=$3
	Else 
		Reports_PrefsDeclareDefaults
		ARRAY POINTER:C280($_aptr_PrefsToSave; 0)
		Reports_BuildArrayofElements(->$_aptr_PrefsToSave; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
		$_ptr_PrefsToSave:=->$_aptr_PrefsToSave
	End if 
Else   //Assume loading prefs into default vars
	Reports_PrefsDeclareDefaults
	ARRAY POINTER:C280($_aptr_PrefsToSave; 0)
	Reports_BuildArrayofElements(->$_aptr_PrefsToSave; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
	$_ptr_PrefsToSave:=->$_aptr_PrefsToSave
End if 
//****************************************************************************************************

Reports_PrefArraysToFormVars  //Added 23/02/09 v631b120o -kmw (unfortunately, calling this in here makes it less generic than I oringally intended - but easiest way to ensure form vars and pref arrays are bound)


Case of 
	: ($_t_ReportPrefLevelType="REPORT")
		$_t_ReportPrefDocCodeStr:=$_t_ReportPrefCodeStr
		If ($_t_ReportPrefDocCodeStr#"")
			$_t_PreferencesName:="SR_REPORT_"+$_t_ReportPrefDocCodeStr
			$_l_Offset:=0
		End if 
		
	: ($_t_ReportPrefLevelType="COMPANY REPORT")
		$_t_ReportPrefCompDocStr:=$_t_ReportPrefCodeStr
		If ($_t_ReportPrefCompDocStr#"")
			$_t_PreferencesName:="SR_COMPDOC_"+$_t_ReportPrefCompDocStr
			$_l_Offset:=0
		End if 
		
		//: ($_t_ReportPrefLevelType="INTERNAL")  `Added internal RPT handling 14/11/08 v631b120i -kmw
		//$SR_S40_ReportPrefInternalRptStr:=$_t_ReportPrefCodeStr
		//If ($SR_S40_ReportPrefInternalRptStr#"")
		//$_t_PreferencesName:="INTERNAL_"+$SR_S40_ReportPrefInternalRptStr
		//$_l_Offset:=0
		//End if
		
	Else 
		Gen_Alert("Bad param passed to method Reports_PrefsSaveNEW. Contact developer.")
End case 



While (Semaphore:C143("EditReportPrefs"))  //NOTE: kmw 03/03/09 v631b120o - This should probably be replaced with a more contextual semaphore name (perhaps based on the Preference name) - as it's probably currently a choke point.
	DelayTicks
End while 
$_l_PreferencesID:=PREF_GetPreferenceID("Report Print Preferences")



//*************************************** added 28/11/08 v631b120i -kmw ***************************************
$_bo_SaveToTemp:=False:C215  //start by always saving to temp....ie no permanent saves....later this must be contextual depending on if we are saving to temp DURING process or else if we are going through one by one saving temps to perm (eg after user ticks out)

Reports_PrefsDeclareTemps


If ($_bo_SaveToTemp)
	SET BLOB SIZE:C606(SR_blb_TempPrefBLOB; 0)
	SR_ptr_BLOBToSaveTo:=->SR_blb_TempPrefBLOB
	$_l_NamedPreferencePosition:=Find in array:C230(SR_at_PreferencesName; $_t_PreferencesName)
	If ($_l_NamedPreferencePosition>0)
		TEXT TO BLOB:C554(SR_at_TempTextOfBLOB{$_l_NamedPreferencePosition}; SR_blb_TempPrefBLOB; Mac text without length:K22:10)
	End if 
	
Else 
	SR_ptr_BLOBToSaveTo:=->[PREFERENCES:116]DataBlob:2
	//******************************************************************************************************************
	READ WRITE:C146([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID; *)
	QUERY:C277([PREFERENCES:116];  & [PREFERENCES:116]Pref_OwnerTable:3=$4; *)
	QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$5)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_PreferencesID
	Else 
		LOAD RECORD:C52([PREFERENCES:116])
	End if 
	
End if   //added 28/11/08 v631b120i -kmw


SET BLOB SIZE:C606($_blb_BuildPrefsBlob; 0)

//SET BLOB SIZE([Preferences]DataBlob;0)
//[Preferences]IDNumber:=$_l_PreferencesID
//VARIABLE TO BLOB(SR_l_CompSettingsUseStandardSR;[Preferences]DataBlob;*)  `Added 17/11/08 v631b120i -kmw
//VARIABLE TO BLOB(SR_l_CompSettingsOverrideSR;[Preferences]DataBlob;*)  `Added 17/11/08 v631b120i -kmw



$_l_Temp:=0

$_t_SRTemp:=""

$_l_Offset:=0
//$_l_SizeofBlob:=BLOB size([Preferences]DataBlob)
$_l_SizeofBlob:=BLOB size:C605(SR_ptr_BLOBToSaveTo->)  //changed to use pointer 28/11/08 v631b120i -kmw
OK:=1
//
//********************* added kmw 26/11/08 v631b120i *********************
$_l_ArraySize:=Size of array:C274($_ptr_PrefsToSave->)
//Because this preference record contains all the prefs for either the company or report then we must first load the blob, then append the arrays
ARRAY TEXT:C222($_at_ReportNames; 0)
ARRAY LONGINT:C221($_al_UseStandardSR; 0)  //This is a one dimensional array of longints
ARRAY LONGINT:C221($_al_OverRideSR; 0)
ARRAY TEXT:C222($_at_PrintOption1; 0; 0)
ARRAY TEXT:C222($_at_PrintOption2; 0; 0)
ARRAY TEXT:C222($_at_PrintOption2Val; 0; 0)
ARRAY TEXT:C222($_at_PrintOption3; 0; 0)
ARRAY TEXT:C222($_at_PrintOption3Role; 0; 0)
ARRAY TEXT:C222($_at_PrintOption4; 0; 0)
//NG-JUly 2020-rewriting this to store the preferences in an object.
C_OBJECT:C1216($_obj_ReportPreferences)

OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_Properties; $_al_PropertyTypes)
If (Find in array:C230($_at_Properties; "ReportNames")<0)
	
	//this data is still in the blob so we extract it first-note that the option2val is a 2D array so we have the then extract the correct columns into the arrays 
	$_l_Offset:=0
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
		$_l_SizeofBlob:=BLOB size:C605([PREFERENCES:116]DataBlob:2)  //changed to use pointer 28/11/08 v631b120i -kmw
		If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_ReportNames; $_l_Offset)
			If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_UseStandardSR; $_l_Offset)
				If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_OverRideSR; $_l_Offset)
					$_l_ArrayRows:=Size of array:C274($_at_ReportNames)
					ARRAY TEXT:C222($_at_PrintOption1; $_l_ArrayRows; 0)  //so getting this straight-this means we have one row per 
					ARRAY TEXT:C222($_at_PrintOption2; $_l_ArrayRows; 0)
					ARRAY TEXT:C222($_at_PrintOption2Val; $_l_ArrayRows; 0)
					ARRAY TEXT:C222($_at_PrintOption3; $_l_ArrayRows; 0)
					ARRAY TEXT:C222($_at_PrintOption3Role; $_l_ArrayRows; 0)
					ARRAY TEXT:C222($_at_PrintOption4; $_l_ArrayRows; 0)
					///
					INSERT IN ARRAY:C227($_at_PrintOption2Email; $_l_NewElement; 1)  //this is one value per report
					INSERT IN ARRAY:C227($_at_PrintOption2Cont; $_l_NewElement; 1)  //this is one value per report
					INSERT IN ARRAY:C227($_at_PrintOption2Role; $_l_NewElement; 1)  //this is one value per report
					INSERT IN ARRAY:C227($_at_PrintOption2Person; $_l_NewElement; 1)  //this is one value per report
					
					INSERT IN ARRAY:C227($_at_PrintOption3Email; $_l_NewElement; 1)  //this is one value per report
					INSERT IN ARRAY:C227($_at_PrintOption3Cont; $_l_NewElement; 1)  //this is one value per report
					INSERT IN ARRAY:C227($_at_PrintOption3Role; $_l_NewElement; 1)  //this is one value per report
					INSERT IN ARRAY:C227($_at_PrintOption3Pers; $_l_NewElement; 1)  //this is one value per report
					
					//OB GET ARRAY($_obj_ReportPreferences;"AltToPersonPersonValue";$_at_PrintOption3Pers)  //this is one value per report
					
					INSERT IN ARRAY:C227($_at_OutputDocumentNames; $_l_NewElement; 1)
					INSERT IN ARRAY:C227($_at_OutputDocumentFrom; $_l_NewElement; 1)
					INSERT IN ARRAY:C227($_at_OutputDocumentSubject; $_l_NewElement; 1)
					INSERT IN ARRAY:C227($_at_OutputDocumentBody; $_l_NewElement; 1)
					
					
					/////looking  at this below-how can it have worked SR_Ptr_BlobtoLoadFrom only exists here. nowewhere else
					
					If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
						
						For ($_l_Index; 1; $_l_ArrayRows)
							If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
								ARRAY TEXT:C222($_at_Print1D; 0)
								
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_Print1D; $_l_Offset)
								//BLOB TO VARIABLE(SR_ptr_BLOBToLoadFrom->;$_at_Print1D;$_l_Offset)
								COPY ARRAY:C226($_at_Print1D; $_at_PrintOption1{$_l_Index})
							End if 
						End for 
						ARRAY TEXT:C222($_at_PrintOption1_1D; Size of array:C274($_at_PrintOption1))
						//The point here is that above we were storing all values-but what it the selected preference?
						
						
						
						If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
							For ($_l_Index; 1; $_l_ArrayRows)
								If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
									ARRAY TEXT:C222($_at_Print1D; 0)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_Print1D; $_l_Offset)
									
									//BLOB TO VARIABLE(SR_ptr_BLOBToLoadFrom->;$_at_Print1D;$_l_Offset)
									COPY ARRAY:C226($_at_Print1D; $_at_PrintOption2{$_l_Index})
								End if 
							End for 
							ARRAY TEXT:C222($_at_PrintOption2_1D; Size of array:C274($_at_PrintOption1))
							//The point here is that above we were storing all values-but what it the selected preference?
							
							
							If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
								
								For ($_l_Index; 1; $_l_ArrayRows)
									If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
										ARRAY TEXT:C222($_at_Print1D; 0)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_Print1D; $_l_Offset)
										//BLOB TO VARIABLE(SR_ptr_BLOBToLoadFrom->;$_at_Print1D;$_l_Offset)
										COPY ARRAY:C226($_at_Print1D; $_at_PrintOption2Val{$_l_Index})
									End if 
								End for 
								//$_at_PrintOption2Val is now replaced with multiple arrays
								ARRAY TEXT:C222($_at_PrintOption2Email; Size of array:C274($_at_PrintOption1))  //this is one value per report
								ARRAY TEXT:C222($_at_PrintOption2Cont; Size of array:C274($_at_PrintOption1))  //this is one value per report
								ARRAY TEXT:C222($_at_PrintOption2Role; Size of array:C274($_at_PrintOption1))  //this is one value per report
								ARRAY TEXT:C222($_at_PrintOption2Person; Size of array:C274($_at_PrintOption1))  //this is one value per report
								For ($_l_Transfer; 1; Size of array:C274($_at_PrintOption2Val))
									If (Size of array:C274($_at_PrintOption2Val{$_l_Transfer})>=3)
										$_at_PrintOption2Role{$_l_Transfer}:=$_at_PrintOption2Val{$_l_Transfer}{3}
									End if 
									If (Size of array:C274($_at_PrintOption2Val{$_l_Transfer})>=6)
										$_at_PrintOption2Cont{$_l_Transfer}:=$_at_PrintOption2Val{$_l_Transfer}{6}
									End if 
									If (Size of array:C274($_at_PrintOption2Val{$_l_Transfer})>=7)
										$_at_PrintOption2Person{$_l_Transfer}:=$_at_PrintOption2Val{$_l_Transfer}{7}
									End if 
									If (Size of array:C274($_at_PrintOption2Val{$_l_Transfer})>=8)
										$_at_PrintOption2Email{$_l_Transfer}:=$_at_PrintOption2Val{$_l_Transfer}{8}
									End if 
									
									
								End for 
								
								
								
								
								
								If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
									For ($_l_Index; 1; $_l_ArrayRows)
										If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
											ARRAY TEXT:C222($_at_Print1D; 0)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_Print1D; $_l_Offset)
											
											//BLOB TO VARIABLE(SR_ptr_BLOBToLoadFrom->;$_at_Print1D;$_l_Offset)
											COPY ARRAY:C226($_at_Print1D; $_at_PrintOption3{$_l_Index})
											
										End if 
									End for 
									ARRAY TEXT:C222($_at_PrintOption3_1D; Size of array:C274($_at_PrintOption1))
									
									
									If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
										For ($_l_Index; 1; $_l_ArrayRows)
											If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
												ARRAY TEXT:C222($_at_Print1D; 0)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_Print1D; $_l_Offset)
												
												COPY ARRAY:C226($_at_Print1D; $_at_PrintOption3Role{$_l_Index})
											End if 
										End for 
										ARRAY TEXT:C222($_at_PrintOption3Email; Size of array:C274($_at_PrintOption1))  //this is one value per report
										ARRAY TEXT:C222($_at_PrintOption3Cont; Size of array:C274($_at_PrintOption1))  //this is one value per report
										ARRAY TEXT:C222($_at_PrintOption3Role_1D; Size of array:C274($_at_PrintOption1))  //this is one value per report
										ARRAY TEXT:C222($_at_PrintOption3Pers; Size of array:C274($_at_PrintOption1))  //this is one value per report
										For ($_l_Transfer; 1; Size of array:C274($_at_PrintOption3Role))
											If (Size of array:C274($_at_PrintOption3Role{$_l_Transfer})>=4)
												$_at_PrintOption3Role_1D{$_l_Transfer}:=$_at_PrintOption3Role{$_l_Transfer}{4}
											End if 
											If (Size of array:C274($_at_PrintOption3Role{$_l_Transfer})>=7)
												$_at_PrintOption3Cont{$_l_Transfer}:=$_at_PrintOption3Role{$_l_Transfer}{7}
											End if 
											If (Size of array:C274($_at_PrintOption3Role{$_l_Transfer})>=8)
												$_at_PrintOption3Pers{$_l_Transfer}:=$_at_PrintOption3Role{$_l_Transfer}{8}
											End if 
											If (Size of array:C274($_at_PrintOption3Role{$_l_Transfer})>=9)
												$_at_PrintOption3Email{$_l_Transfer}:=$_at_PrintOption3Role{$_l_Transfer}{9}
											End if 
										End for 
										
										
										
										
										
										If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
											For ($_l_Index; 1; $_l_ArrayRows)
												If ($_l_Offset<($_l_SizeofBlob)) & (OK=1)
													ARRAY TEXT:C222($_at_Print1D; 0)
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_Print1D; $_l_Offset)
													COPY ARRAY:C226($_at_Print1D; $_at_PrintOption4{$_l_Index})
												End if 
											End for 
										End if 
										ARRAY TEXT:C222($_at_PrintOption4_1D; Size of array:C274($_at_PrintOption1))
										
									End if 
									
								End if 
							End if 
						End if 
					End if 
					
					
				End if 
			End if 
		End if 
		
		
	End if 
	//
	///
Else 
	$_obj_ReportPreferences:=[PREFERENCES:116]DataObject:8
	OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_Properties; $_al_PropertyTypes)
	If (Find in array:C230($_at_Properties; "ReportNames")>0)
		OB GET ARRAY:C1229($_obj_ReportPreferences; "ReportNames"; $_at_ReportNames)
	Else 
		ARRAY TEXT:C222($_at_ReportNames; 0)
	End if 
	If (Find in array:C230($_at_Properties; "UseStandardSR")>0)
		OB GET ARRAY:C1229($_obj_ReportPreferences; "UseStandardSR"; $_al_UseStandardSR)  //this is one value per report
	Else 
		ARRAY LONGINT:C221($_al_UseStandardSR; 0)
	End if 
	If (Find in array:C230($_at_Properties; "OverRideSR")>0)
		OB GET ARRAY:C1229($_obj_ReportPreferences; "OverRideSR"; $_al_OverRideSR)  //this is one value per report
	Else 
		ARRAY LONGINT:C221($_al_OverRideSR; 0)
	End if 
	
	OB GET ARRAY:C1229($_obj_ReportPreferences; "PrintOption"; $_at_PrintOption1_1D)  //this is one value per report. Preferred way to generate report
	//OB GET ARRAY($_obj_ReportPreferences
	OB GET ARRAY:C1229($_obj_ReportPreferences; "ToPerson"; $_at_PrintOption2_1D)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "ToPersonEmailValue"; $_at_PrintOption2Email)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "ToPersonContValue"; $_at_PrintOption2Cont)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "ToPersonRoleValue"; $_at_PrintOption2Role)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "ToPersonPersonValue"; $_at_PrintOption2Person)  //this is one value per report
	
	OB GET ARRAY:C1229($_obj_ReportPreferences; "AltToPerson"; $_at_PrintOption3_1D)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "AltToPersonEmailValue"; $_at_PrintOption3Email)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "AltToPersonContValue"; $_at_PrintOption3Cont)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "AltToPersonRoleValue"; $_at_PrintOption3Role_1D)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "AltToPersonPersonValue"; $_at_PrintOption3Pers)  //this is one value per report
	
	//OB GET ARRAY($_obj_ReportPreferences;"AltToPersonPersonValue";$_at_PrintOption3Pers)  //this is one value per report
	OB GET ARRAY:C1229($_obj_ReportPreferences; "AltToPerson2"; $_at_PrintOption4_1D)
	OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentNaming"; $_at_OutputDocumentNames)
	OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentFrom"; $_at_OutputDocumentFrom)
	OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentSubject"; $_at_OutputDocumentSubject)
	OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentBody"; $_at_OutputDocumentBody)
	$_l_Size:=Size of array:C274($_at_ReportNames)
	ARRAY TEXT:C222($_at_ReportNames; $_l_Size)  //√
	ARRAY LONGINT:C221($_al_UseStandardSR; $_l_Size)  //v
	ARRAY LONGINT:C221($_al_OverRideSR; $_l_Size)  //√
	ARRAY TEXT:C222($_at_PrintOption1; $_l_Size; 0)
	ARRAY TEXT:C222($_at_PrintOption1_1D; $_l_Size)
	
	ARRAY TEXT:C222($_at_PrintOption2; $_l_Size; 0)
	ARRAY TEXT:C222($_at_PrintOption2Val; $_l_Size; 0)  //2D array Not going to be used now...
	ARRAY TEXT:C222($_at_PrintOption3; $_l_Size; 0)
	ARRAY TEXT:C222($_at_PrintOption3Role; $_l_Size; 0)
	ARRAY TEXT:C222($_at_PrintOption4; $_l_Size; 0)
	ARRAY TEXT:C222($_at_PrintOption4_1D; $_l_Size)
	
	//OB GET ARRAY($_obj_ReportPreferences
	ARRAY TEXT:C222($_at_PrintOption2Email; $_l_Size)
	ARRAY TEXT:C222($_at_PrintOption2Email; $_l_Size)  //this is one value per report
	ARRAY TEXT:C222($_at_PrintOption2Cont; $_l_Size)  //this is one value per report
	ARRAY TEXT:C222($_at_PrintOption2Role; $_l_Size)  //this is one value per report
	ARRAY TEXT:C222($_at_PrintOption2Person; $_l_Size)  //this is one value per report
	
	ARRAY TEXT:C222($_at_PrintOption3Email; $_l_Size)  //this is one value per report
	ARRAY TEXT:C222($_at_PrintOption3Cont; $_l_Size)  //this is one value per report
	ARRAY TEXT:C222($_at_PrintOption3_1D; $_l_Size)
	
	ARRAY TEXT:C222($_at_PrintOption3Role_1D; $_l_Size)
	ARRAY TEXT:C222($_at_PrintOption3Pers; $_l_Size)  //this is one value per report
	
	ARRAY TEXT:C222($_at_OutputDocumentNames; $_l_Size)
	ARRAY TEXT:C222($_at_OutputDocumentFrom; $_l_Size)
	ARRAY TEXT:C222($_at_OutputDocumentSubject; $_l_Size)
	ARRAY TEXT:C222($_at_OutputDocumentBody; $_l_Size)
	
	
	//OB Get($_obj_ReportPreferences;"AltToPerson2";$_al_OverRideSR)
End if 

//Now either way we have the values loaded
$_l_IndexRow:=Find in array:C230($_at_ReportNames; $_t_ReportPrefCodeStr)
If ($_l_IndexRow<0)
	$_l_NewElement:=Size of array:C274($_at_ReportNames)+1
	INSERT IN ARRAY:C227($_at_ReportNames; $_l_NewElement; 1)  //√
	INSERT IN ARRAY:C227($_al_UseStandardSR; $_l_NewElement; 1)  //v
	INSERT IN ARRAY:C227($_al_OverRideSR; $_l_NewElement; 1)  //√
	INSERT IN ARRAY:C227($_at_PrintOption1; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_PrintOption1_1D; $_l_NewElement; 1)
	
	INSERT IN ARRAY:C227($_at_PrintOption2; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_PrintOption2Val; $_l_NewElement; 1)  //2D array Not going to be used now...
	INSERT IN ARRAY:C227($_at_PrintOption3; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_PrintOption3Role; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_PrintOption4; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_PrintOption4_1D; $_l_NewElement; 1)
	
	//OB GET ARRAY($_obj_ReportPreferences
	INSERT IN ARRAY:C227($_at_PrintOption2_1D; 1)
	INSERT IN ARRAY:C227($_at_PrintOption2Email; $_l_NewElement; 1)  //this is one value per report
	INSERT IN ARRAY:C227($_at_PrintOption2Cont; $_l_NewElement; 1)  //this is one value per report
	INSERT IN ARRAY:C227($_at_PrintOption2Role; $_l_NewElement; 1)  //this is one value per report
	INSERT IN ARRAY:C227($_at_PrintOption2Person; $_l_NewElement; 1)  //this is one value per report
	
	INSERT IN ARRAY:C227($_at_PrintOption3Email; $_l_NewElement; 1)  //this is one value per report
	INSERT IN ARRAY:C227($_at_PrintOption3Cont; $_l_NewElement; 1)  //this is one value per report
	INSERT IN ARRAY:C227($_at_PrintOption3_1D; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_PrintOption3Role_1D; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_PrintOption3Pers; $_l_NewElement; 1)  //this is one value per report
	
	INSERT IN ARRAY:C227($_at_OutputDocumentNames; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_OutputDocumentFrom; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_OutputDocumentSubject; $_l_NewElement; 1)
	INSERT IN ARRAY:C227($_at_OutputDocumentBody; $_l_NewElement; 1)
	
	
	
	
	
	///
	$_l_IndexRow:=$_l_NewElement
End if 
TRACE:C157
//*****************************************************************************
$_at_ReportNames{$_l_IndexRow}:=$_t_ReportPrefCodeStr
If (Size of array:C274($_ptr_PrefsToSave->)>0)
	$_ptr_Pref:=$_ptr_PrefsToSave->{1}
	$_al_UseStandardSR{$_l_IndexRow}:=$_ptr_Pref->
	If (Size of array:C274($_ptr_PrefsToSave->)>1)
		$_ptr_Pref:=$_ptr_PrefsToSave->{2}
		$_al_OverRideSR{$_l_IndexRow}:=$_ptr_Pref->
		
		//ng Not sure this was ever correct!!!
		If (Size of array:C274($_ptr_PrefsToSave->)>2)
			$_ptr_toArray:=$_ptr_PrefsToSave->{3}
			$_t_SeletedValue:=$_ptr_toArray->{$_ptr_toArray->}
			$_at_PrintOption1_1D{$_l_IndexRow}:=$_t_SeletedValue
			
			//COPY ARRAY($_ptr_toArray->;$_at_PrintOption1{$_l_IndexRow})
			If (Size of array:C274($_ptr_PrefsToSave->)>3)
				$_ptr_toArray:=$_ptr_PrefsToSave->{4}
				$_t_SeletedValue:=$_ptr_toArray->{$_ptr_toArray->}
				$_at_PrintOption2_1D{$_l_IndexRow}:=$_t_SeletedValue
				
				//COPY ARRAY($_ptr_toArray->;$_at_PrintOption2{$_l_IndexRow})
				If (Size of array:C274($_ptr_PrefsToSave->)>4)
					$_ptr_toEmail:=$_ptr_PrefsToSave->{5}  ///neeed to check this now..
					$_at_PrintOption2Email{$_l_IndexRow}:=$_ptr_toEmail->
					If (Size of array:C274($_ptr_PrefsToSave->)>5)
						$_ptr_toCont:=$_ptr_PrefsToSave->{6}  ///neeed to check this now..
						$_at_PrintOption2Cont{$_l_IndexRow}:=$_ptr_toCont->
						If (Size of array:C274($_ptr_PrefsToSave->)>6)
							$_ptr_toRole:=$_ptr_PrefsToSave->{7}  ///neeed to check this now..
							$_at_PrintOption2Role{$_l_IndexRow}:=$_ptr_toRole->
							If (Size of array:C274($_ptr_PrefsToSave->)>7)
								$_ptr_toPerson:=$_ptr_PrefsToSave->{8}  ///neeed to check this now..
								$_at_PrintOption2Person{$_l_IndexRow}:=$_ptr_toPerson->
								If (Size of array:C274($_ptr_PrefsToSave->)>8)
									$_ptr_ALttoArray:=$_ptr_PrefsToSave->{9}
									$_t_SeletedValue:=$_ptr_ALttoArray->{$_ptr_ALttoArray->}
									$_at_PrintOption3_1D{$_l_IndexRow}:=$_t_SeletedValue
									If (Size of array:C274($_ptr_PrefsToSave->)>9)
										$_ptr_AlttoEmail:=$_ptr_PrefsToSave->{10}  ///neeed to check this now..
										$_at_PrintOption3Email{$_l_IndexRow}:=$_ptr_AlttoEmail->
										If (Size of array:C274($_ptr_PrefsToSave->)>10)
											$_ptr_AlttoCont:=$_ptr_PrefsToSave->{11}  ///neeed to check this now..
											$_at_PrintOption3Cont{$_l_IndexRow}:=$_ptr_AlttoCont->
											If (Size of array:C274($_ptr_PrefsToSave->)>11)
												$_ptr_AlttoRole:=$_ptr_PrefsToSave->{12}  ///neeed to check this now..
												//$_t_SeletedValue:=$_ptr_AlttoRole->{$_ptr_AlttoRole->}
												//$_at_PrintOption3Role{$_l_IndexRow}:=$_ptr_AlttoRole->
												$_at_PrintOption3Role_1D{$_l_IndexRow}:=$_ptr_AlttoRole->
												If (Size of array:C274($_ptr_PrefsToSave->)>12)
													
													$_ptr_AlttoPers:=$_ptr_PrefsToSave->{13}  ///neeed to check this now..
													$_at_PrintOption3Pers{$_l_IndexRow}:=$_ptr_AlttoPers->
													If (Size of array:C274($_ptr_PrefsToSave->)>13)
														
														
														$_ptr_toArray:=$_ptr_PrefsToSave->{14}
														$_t_SeletedValue:=$_ptr_toArray->{$_ptr_toArray->}
														$_at_PrintOption4_1D{$_l_IndexRow}:=$_t_SeletedValue
														If (Size of array:C274($_ptr_PrefsToSave->)>14)
															
															$_ptr_DocumentName:=$_ptr_PrefsToSave->{15}  ///neeed to check this now..
															$_at_OutputDocumentNames{$_l_IndexRow}:=$_ptr_DocumentName->
															If (Size of array:C274($_ptr_PrefsToSave->)>15)
																$_ptr_DocumentTo:=$_ptr_PrefsToSave->{16}  ///neeed to check this now..
																$_at_OutputDocumentFrom{$_l_IndexRow}:=$_ptr_DocumentTo->
																If (Size of array:C274($_ptr_PrefsToSave->)>16)
																	$_ptr_DocumentSubject:=$_ptr_PrefsToSave->{17}  ///neeed to check this now..
																	$_at_OutputDocumentSubject{$_l_IndexRow}:=$_ptr_DocumentSubject->
																	If (Size of array:C274($_ptr_PrefsToSave->)>17)
																		$_ptr_DocumentBody:=$_ptr_PrefsToSave->{18}  ///neeed to check this now..
																		$_at_OutputDocumentBody{$_l_IndexRow}:=$_ptr_DocumentBody->
																	End if 
																End if 
															End if 
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
//INSERT IN ARRAY($_at_OutputDocumentSubject;$_l_NewElement;1)
//INSERT IN ARRAY($_at_OutputDocumentBody;$_l_NewElement;1)

//COPY ARRAY($_ptr_toArray->;$_at_PrintOption2Val{$_l_IndexRow})
//$_ptr_toArray:=$_ptr_PrefsToSave->{6}
//COPY ARRAY($_ptr_toArray->;$_at_PrintOption3{$_l_IndexRow})
//$_ptr_toArray:=$_ptr_PrefsToSave->{7}
//COPY ARRAY($_ptr_toArray->;$_at_PrintOption3Role{$_l_IndexRow})
//$_ptr_toArray:=$_ptr_PrefsToSave->{8}
//COPY ARRAY($_ptr_toArray->;$_at_PrintOption4{$_l_IndexRow})
If (False:C215)
	
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	[PREFERENCES:116]IDNumber:1:=$_l_PreferencesID
	[PREFERENCES:116]Pref_OwnerTable:3:=$4
	[PREFERENCES:116]Pref_OwnerID:4:=$5
	
	//
	VARIABLE TO BLOB:C532($_at_ReportNames; [PREFERENCES:116]DataBlob:2; *)  //Added 18/11/08 v631b120i -kmw
	VARIABLE TO BLOB:C532($_al_UseStandardSR; [PREFERENCES:116]DataBlob:2; *)  //Added 18/11/08 v631b120i -kmw
	VARIABLE TO BLOB:C532($_al_OverRideSR; [PREFERENCES:116]DataBlob:2; *)
	
	$_l_ArrayRows:=Size of array:C274($_al_OverRideSR)
	For ($_l_Index; 1; $_l_ArrayRows)
		ARRAY TEXT:C222($_at_Print1D; 0)
		COPY ARRAY:C226($_at_PrintOption1{$_l_Index}; $_at_Print1D)
		VARIABLE TO BLOB:C532($_at_Print1D; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; $_l_ArrayRows)
		ARRAY TEXT:C222($_at_Print1D; 0)
		COPY ARRAY:C226($_at_PrintOption2{$_l_Index}; $_at_Print1D)
		VARIABLE TO BLOB:C532($_at_Print1D; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; $_l_ArrayRows)
		ARRAY TEXT:C222($_at_Print1D; 0)
		COPY ARRAY:C226($_at_PrintOption2Val{$_l_Index}; $_at_Print1D)
		VARIABLE TO BLOB:C532($_at_Print1D; [PREFERENCES:116]DataBlob:2; *)
	End for 
	
	
	For ($_l_Index; 1; $_l_ArrayRows)
		ARRAY TEXT:C222($_at_Print1D; 0)
		COPY ARRAY:C226($_at_PrintOption3{$_l_Index}; $_at_Print1D)
		VARIABLE TO BLOB:C532($_at_Print1D; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; $_l_ArrayRows)
		ARRAY TEXT:C222($_at_Print1D; 0)
		COPY ARRAY:C226($_at_PrintOption3Role{$_l_Index}; $_at_Print1D)
		VARIABLE TO BLOB:C532($_at_Print1D; [PREFERENCES:116]DataBlob:2; *)
	End for 
	
	
	For ($_l_Index; 1; $_l_ArrayRows)
		ARRAY TEXT:C222($_at_Print1D; 0)
		COPY ARRAY:C226($_at_PrintOption4{$_l_Index}; $_at_Print1D)
		VARIABLE TO BLOB:C532($_at_Print1D; [PREFERENCES:116]DataBlob:2; *)
	End for 
Else 
	//OB GET PROPERTY NAMES([PREFERENCES]DataObject;$_at_Properties;$_al_PropertyTypes)
	$_l_Size:=Size of array:C274($_at_ReportNames)
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "ReportNames"; $_at_ReportNames)
	Else 
		ARRAY TEXT:C222($_at_ReportNames; 0)
	End if 
	If (Size of array:C274($_al_UseStandardSR)#$_l_Size)
		ARRAY LONGINT:C221($_al_UseStandardSR; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "UseStandardSR"; $_al_UseStandardSR)  //this is one value per report
	End if 
	If (Size of array:C274($_al_OverRideSR)#$_l_Size)
		ARRAY LONGINT:C221($_al_OverRideSR; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "OverRideSR"; $_al_OverRideSR)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption1_1D)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption1_1D; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "PrintOption"; $_at_PrintOption1_1D)  //this is one value per report. Preferred way to generate report
	End if 
	If (Size of array:C274($_at_PrintOption2_1D)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption2_1D; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "ToPerson"; $_at_PrintOption2_1D)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption2Email)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption2Email; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "ToPersonEmailValue"; $_at_PrintOption2Email)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption2Cont)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption2Cont; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "ToPersonContValue"; $_at_PrintOption2Cont)  //this is one value per report
		
	End if 
	If (Size of array:C274($_at_PrintOption2Role)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption2Role; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "ToPersonRoleValue"; $_at_PrintOption2Role)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption2Person)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption2Person; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "ToPersonPersonValue"; $_at_PrintOption2Person)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption3_1D)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption3_1D; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "AltToPerson"; $_at_PrintOption3_1D)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption3Email)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption3Email; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "AltToPersonEmailValue"; $_at_PrintOption3Email)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption3Cont)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption3Cont; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "AltToPersonContValue"; $_at_PrintOption3Cont)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption3Role_1D)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption3Role_1D; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "AltToPersonRoleValue"; $_at_PrintOption3Role_1D)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption3Pers)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption3Pers; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "AltToPersonPersonValue"; $_at_PrintOption3Pers)  //this is one value per report
	End if 
	If (Size of array:C274($_at_PrintOption4_1D)#$_l_Size)
		ARRAY TEXT:C222($_at_PrintOption4_1D; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "AltToPerson2"; $_at_PrintOption4_1D)
	End if 
	If (Size of array:C274($_at_OutputDocumentNames)#$_l_Size)
		ARRAY TEXT:C222($_at_OutputDocumentNames; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "DocumentNaming"; $_at_OutputDocumentNames)
	End if 
	If (Size of array:C274($_at_OutputDocumentFrom)#$_l_Size)
		ARRAY TEXT:C222($_at_OutputDocumentFrom; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "DocumentFrom"; $_at_OutputDocumentFrom)
	End if 
	If (Size of array:C274($_at_OutputDocumentSubject)#$_l_Size)
		ARRAY TEXT:C222($_at_OutputDocumentSubject; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "DocumentSubject"; $_at_OutputDocumentSubject)
	End if 
	If (Size of array:C274($_at_OutputDocumentBody)#$_l_Size)
		ARRAY TEXT:C222($_at_OutputDocumentBody; $_l_Size)
	End if 
	If ($_l_Size>0)
		OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "DocumentBody"; $_at_OutputDocumentBody)
	End if 
	
	
End if 

DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID; *)
QUERY:C277([PREFERENCES:116];  & [PREFERENCES:116]Pref_OwnerTable:3=$4; *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$5)



CLEAR SEMAPHORE:C144("EditReportPrefs")  //ADDED kmw 03/03/09 v631b120o -NOT SURE WHY THIS WAS MISSING OR HOW I FORGOT THIS????  In any regard- this should probably be replaced with a more contextual semaphore name (perhaps based on the Preference name) - as it's probably currently a choke point.
ERR_MethodTrackerReturn("Reports_PrefsSaveNEW"; $_t_oldMethodName)
