//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsLoadNEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsLoadNEW
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
	ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
	ARRAY POINTER:C280($_aptr_PrefsToLoad2; 0)
	ARRAY TEXT:C222($_at_DocumentNames; 0)
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
	ARRAY TEXT:C222($_at_Temp; 0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2Roles;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Roles;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	//ARRAY TEXT(SR_at_PreferencesName;0)
	//ARRAY TEXT(SR_at_TempTextOfBLOB;0)
	//ARRAY TEXT(SR_t_EmailPrintOption2Role;0)
	//ARRAY TEXT(SR_t_EmailPrintOption3Role;0)
	C_BLOB:C604(SR_blb_TempPrefBLOB)
	C_BOOLEAN:C305($_bo_LoadFromBlob; $_bo_LoadFromTemp; $_bo_ReportSettingLevelJustChang; $4)
	C_LONGINT:C283($_l_CountReports; $_l_Index; $_l_Offset; $_l_PreferencesID; $_l_PreferencesRow; $_l_PrefLoadedCorrectly; $_l_ReportRow; $_l_Row; $_l_SelectedROw; $_l_SizeofBlob; $_l_Transfer)
	C_LONGINT:C283($5; $6; SR_l_CompPrevOverrideSR; SR_l_CompPrevUseStandardSR; SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_OBJECT:C1216($_obj_ReportPreferences)
	C_POINTER:C301($_ptr_BlobtoLoad; $_ptr_MailOption; $_ptr_PointertoArray; $_ptr_PointertoVar; $_ptr_Prefs2ToLoad; $_ptr_PrefsToLoad; $_ptr_PrefsToLoad2; $_ptr_ThisPrefsToLoad; $3)
	C_TEXT:C284($_t_contactOption; $_t_EMailOption; $_t_oldMethodName; $_t_PreferencesName; $_t_PrintOption; $_t_ReportPrefCodeStr; $_t_ReportPrefCompDocStr; $_t_ReportPrefDocCodeStr; $_t_ReportPrefLevelType; $1; $2)
	C_TEXT:C284(REP_t_CurrentSRDocReport; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsLoadNEW")


//Added 13/11/08 v631b120g -kmw


//TRACE

//If (Count parameters>=2)  //Modified NG
If (Count parameters:C259>0)
	$_t_ReportPrefCodeStr:=$1
Else 
	$_t_ReportPrefCodeStr:=[DOCUMENTS:7]Document_Code:1  //Default to assuming have been passed a report code
End if 
If ($_t_ReportPrefCodeStr="")
	$_t_ReportPrefCodeStr:=REP_t_CurrentSRDocReport
End if 
If (Count parameters:C259>1)
	$_t_ReportPrefLevelType:=$2  //Pass either "REPORT" or "COMPANY" to specify what table code you have passed and to determine what level of report pref is being loaded
Else 
	$_t_ReportPrefLevelType:="REPORT"  //Default to assuming either have been passed a report code or nothing at all in which case we have already defaulted to assuming the code to use is the current document code
End if 


//C_TEXT($SR_S40_ReportPrefInternalRptStr)  `Added internal RPT handling 14/11/08 v631b120i -kmw
$_t_ReportPrefDocCodeStr:=""
$_t_ReportPrefCompDocStr:=""

//$SR_S40_ReportPrefInternalRptStr:=""  `Added internal RPT handling 14/11/08 v631b120i -kmw


//********************* Added selective pref loading 19/11/08 v631b120i -kmw *********************
If (Count parameters:C259>2)  //Have been passed a pointer to an array of pointers, each element of which points to either the var that should be loaded into (THESE NEED TO BE IN CORRECT ORDER) or else is a null pointer indicating that we are not loading that particular pref
	If (Size of array:C274($3->)>0)  //NG Modification
		$_ptr_PrefsToLoad:=$3
	Else 
		Reports_PrefsDeclareDefaults
		
		//
		//ARRAY POINTER($_aptr_PrefsToLoad;8)
		//$_aptr_PrefsToLoad{1}:=->SR_l_CompSettingsUseStandardSR
		//$_aptr_PrefsToLoad{2}:=->SR_l_CompSettingsOverrideSR
		//$_aptr_PrefsToLoad{3}:=->SR_at_EmailPrintOption1
		//$_aptr_PrefsToLoad{4}:=->SR_at_EmailPrintOption2
		//************ Changed to array of values 20/02/09 -kmw ************
		//$_ptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
		//$_aptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
		//********************************************************************
		//$_aptr_PrefsToLoad{6}:=->SR_at_EmailPrintOption3
		//************ Changed to array of values 20/02/09 -kmw ************
		//$_ptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
		//$_aptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
		//********************************************************************
		//$_aptr_PrefsToLoad{8}:=->SR_at_EmailPrintOption4
		Reports_PrefsDeclareDefaults
		
		Reports_BuildArrayofElements(->$_aptr_PrefsToLoad; ->SR_l_CompPrevUseStandardSR; ->SR_l_CompPrevUseStandardSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
		
		$_ptr_PrefsToLoad:=->$_aptr_PrefsToLoad
		
	End if 
Else   //Assume loading prefs into default vars
	
	
	
	//
	//ARRAY POINTER($_aptr_PrefsToLoad;8)
	//$_aptr_PrefsToLoad{1}:=->SR_l_CompSettingsUseStandardSR
	//$_aptr_PrefsToLoad{2}:=->SR_l_CompSettingsOverrideSR
	//$_aptr_PrefsToLoad{3}:=->SR_at_EmailPrintOption1
	//$_aptr_PrefsToLoad{4}:=->SR_at_EmailPrintOption2
	//************ Changed to array of values 20/02/09 -kmw ************
	//$_ptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
	//$_aptr_PrefsToLoad{5}:=->SR_t_EmailPrintOption2Role
	//********************************************************************
	//$_aptr_PrefsToLoad{6}:=->SR_at_EmailPrintOption3
	//************ Changed to array of values 20/02/09 -kmw ************
	//$_ptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
	//$_aptr_PrefsToLoad{7}:=->SR_t_EmailPrintOption3Role
	//********************************************************************
	//$_aptr_PrefsToLoad{8}:=->SR_at_EmailPrintOption4
	Reports_BuildArrayofElements(->$_aptr_PrefsToLoad; ->SR_l_CompPrevUseStandardSR; ->SR_l_CompPrevUseStandardSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
	
	$_ptr_PrefsToLoad:=->$_aptr_PrefsToLoad
End if 
//****************************************************************************************************

Case of 
	: ($_t_ReportPrefLevelType="REPORT")
		$_t_ReportPrefDocCodeStr:=$_t_ReportPrefCodeStr
		If ($_t_ReportPrefDocCodeStr#"")
			$_t_PreferencesName:="SR_REPORT_"+$_t_ReportPrefDocCodeStr
			$_l_Offset:=0
		Else 
			$_t_PreferencesName:="SR_REPORT_"
			$_l_Offset:=0
		End if 
		
	: ($_t_ReportPrefLevelType="COMPANY REPORT")
		$_t_ReportPrefCompDocStr:=$_t_ReportPrefCodeStr
		If ($_t_ReportPrefCompDocStr#"")
			$_t_PreferencesName:=$_t_ReportPrefCompDocStr
			$_l_Offset:=0
		Else 
			$_t_PreferencesName:=""
			$_l_Offset:=0
		End if 
		
		//: ($_t_ReportPrefLevelType="INTERNAL")  `Added internal RPT handling 14/11/08 v631b120i -kmw
		//$SR_S40_ReportPrefInternalRptStr:=$_t_ReportPrefCodeStr
		//If ($SR_S40_ReportPrefInternalRptStr#"")
		//$_t_PreferencesName:="INTERNAL_"+$SR_S40_ReportPrefInternalRptStr
		//$_l_Offset:=0
		//End if
		
		
	Else 
		Gen_Alert("Bad param passed to method Reports_PrefsLoadNEW. Contact developer.")
End case 


//*************************************** added 28/11/08 v631b120i -kmw ***************************************
Reports_PrefsDeclareTemps

$_bo_LoadFromTemp:=False:C215


$_l_PreferencesRow:=Find in array:C230(SR_at_PreferencesName; $_t_PreferencesName)
If ($_l_PreferencesRow>0)
	$_bo_LoadFromTemp:=True:C214
	SET BLOB SIZE:C606(SR_blb_TempPrefBLOB; 0)
	TEXT TO BLOB:C554(SR_at_TempTextOfBLOB{$_l_PreferencesRow}; SR_blb_TempPrefBLOB; Mac text without length:K22:10)
	$_ptr_BlobtoLoad:=->SR_blb_TempPrefBLOB
Else 
	$_ptr_BlobtoLoad:=->[PREFERENCES:116]DataBlob:2
End if 
//******************************************************************************************************************


While (Semaphore:C143("EditReportPrefs"))  //NOTE: kmw 03/03/09 v631b120o - This should probably be replaced with a more contextual semaphore name (perhaps based on the Preference name) - as it's probably currently a choke point.
	DelayTicks
End while 

$_l_PreferencesID:=PREF_GetPreferenceID("Report Print Preferences")

READ ONLY:C145([PREFERENCES:116])

If (Count parameters:C259>=6)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID; *)
	
	QUERY:C277([PREFERENCES:116];  & [PREFERENCES:116]Pref_OwnerTable:3=$5; *)
	QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$6)
Else 
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID)
End if 
//TRACE
If (Records in selection:C76([PREFERENCES:116])=0) & ($_bo_LoadFromTemp=False:C215)  //if there is no existing preference record yet
	Case of 
		: ($_t_ReportPrefLevelType="COMPANY REPORT")  //if the level of the preference record we were trying to load was a company one then try loading a report level one instead (to use as the default for the company level one)
			//CLEAR SEMAPHORE("EditSynchro")  `drop the semaphore so don't block ourselves when we iterate into ourselves....actually this needless as it will be in same process...commented out
			//Reports_PrefsLoadNEW ("REPORT")
			
			//TRACE  `not sure REP_t_CurrentSRDocReport var always set
			//$SR_RemCompSettingsUseStandardSR:=SR_l_CompSettingsUseStandardSR
			//$SR_RemCompSettingsOverrideSR:=SR_l_CompSettingsOverrideSR
			
			//******************************** Added 02/12/08 -kmw ********************************
			//We couldn't find the company level pref in temp pref and we couldn't find it as a saved pref...
			//...as mentioned above we are therefore goign to load report level pref instead...
			//...However, this means we should indicate that this is a report level pref.
			//....The only exception being if the user has deliberately selected Company level prfer yet there...
			//...was non in existence yet....in this case we still use the report level pref...
			//...but we indictae it as being a company level pref - which will also mean if it gets saved...
			//...that these settings (and/lor any changes to them) will get saved at company level.
			$_bo_ReportSettingLevelJustChang:=False:C215
			If (Count parameters:C259>3)
				$_bo_ReportSettingLevelJustChang:=$4
				If ($_bo_ReportSettingLevelJustChang=False:C215)
					SR_l_CompSettingsUseStandardSR:=1
					SR_l_CompPrevUseStandardSR:=1
					SR_l_CompSettingsOverrideSR:=0
					SR_l_CompPrevOverrideSR:=0
				End if 
			End if 
			//*****************************************************************************************
			
			ARRAY POINTER:C280($_aptr_PrefsToLoad2; 0)
			ARRAY POINTER:C280($_aptr_PrefsToLoad2; 8)
			//$_ptr_PrefsToLoad{1}:=->SR_l_CompSettingsUseStandardSR
			//$_ptr_PrefsToLoad{2}:=->SR_l_CompSettingsOverrideSR
			$_aptr_PrefsToLoad2{3}:=$_ptr_PrefsToLoad->{3}
			$_aptr_PrefsToLoad2{4}:=$_ptr_PrefsToLoad->{4}
			$_aptr_PrefsToLoad2{5}:=$_ptr_PrefsToLoad->{5}
			$_aptr_PrefsToLoad2{6}:=$_ptr_PrefsToLoad->{6}
			$_aptr_PrefsToLoad2{7}:=$_ptr_PrefsToLoad->{7}
			$_aptr_PrefsToLoad2{8}:=$_ptr_PrefsToLoad->{8}
			$_ptr_PrefsToLoad2:=->$_aptr_PrefsToLoad2
			Reports_PrefsLoadNEW($_t_ReportPrefCodeStr; "REPORT"; $_ptr_PrefsToLoad2; False:C215; Table:C252(->[DOCUMENTS:7]); 0)  //Load report level prefs instead
			//Reports_PrefsLoadNEW (REP_t_CurrentSRDocReport;"REPORT";$_ptr_PrefsToLoad)
			//SR_l_CompSettingsUseStandardSR:=$SR_RemCompSettingsUseStandardSR
			//SR_l_CompSettingsOverrideSR:=$SR_RemCompSettingsOverrideSR
			
			//While (Semaphore("EditSynchro"))
			//DelayTicks
			//End while
			//   $_l_PrefLoadedCorrectly:=1
			$_l_PrefLoadedCorrectly:=1
		: ($_t_ReportPrefLevelType="REPORT")  //if the level of the preference record we were trying to load was already a report level one then just load the defaults
			Reports_PrefsSetDefaults  //this sets the values of the popup
			$_l_PrefLoadedCorrectly:=1
			//
		Else   //shouldn't happen but load some defaults anyway just in case
			Reports_PrefsSetDefaults
			$_l_PrefLoadedCorrectly:=1
			
	End case 
Else 
	$_l_PrefLoadedCorrectly:=0
	
	$_l_offset:=0
	
	//NG The preferences are being changed so there is one preference per company, and one for ALL the report
	//This means that the format of the blob is changed there is an index array of report names
	//Then for each row of the report names there is an array of the settings
	//so the ROWS are stored in 2D Arrays
	ARRAY TEXT:C222($_at_ReportNames; 0)
	ARRAY LONGINT:C221($_al_UseStandardSR; 0)  //This is a one dimensional array of longints
	ARRAY LONGINT:C221($_al_OverRideSR; 0)
	ARRAY TEXT:C222($_at_PrintOption1; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption2; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption2Val; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption3; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption3Role; 0; 0)
	ARRAY TEXT:C222($_at_PrintOption4; 0; 0)
	//the preference contains the values for all reports-not individual ones for companies
	//the problem is the code here seems to be trying to load the popup values as well as the selected value
	C_OBJECT:C1216($_obj_ReportPreferences)
	//TRACE
	OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_Properties; $_al_PropertyTypes)
	If (Find in array:C230($_at_Properties; "ReportNames")<0)
		
		$_l_SizeofBlob:=BLOB size:C605($_ptr_BlobtoLoad->)  //changed to use pointer 28/11/08 v631b120i -kmw
		If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
			BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_at_ReportNames; $_l_offset)
			If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
				BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_al_UseStandardSR; $_l_offset)
				If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
					BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_al_OverRideSR; $_l_offset)
					$_l_CountReports:=Size of array:C274($_at_ReportNames)
					ARRAY TEXT:C222($_at_PrintOption1; $_l_CountReports; 0)
					ARRAY TEXT:C222($_at_PrintOption2; $_l_CountReports; 0)
					ARRAY TEXT:C222($_at_PrintOption2Val; $_l_CountReports; 0)
					
					ARRAY TEXT:C222($_at_PrintOption3; $_l_CountReports; 0)
					ARRAY TEXT:C222($_at_PrintOption3Role; $_l_CountReports; 0)
					ARRAY TEXT:C222($_at_PrintOption4; $_l_CountReports; 0)
					If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
						
						For ($_l_Index; 1; $_l_CountReports)
							If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
								ARRAY TEXT:C222($_at_Print1D; 0)
								BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_at_Print1D; $_l_offset)
								COPY ARRAY:C226($_at_Print1D; $_at_PrintOption1{$_l_Index})
							End if 
						End for 
						ARRAY TEXT:C222($_at_PrintOption1_1D; Size of array:C274($_at_PrintOption1))
						//The point here is that above we were storing all values-but what it the selected preference?
						
						
						If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
							For ($_l_Index; 1; $_l_CountReports)
								If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
									ARRAY TEXT:C222($_at_Print1D; 0)
									BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_at_Print1D; $_l_offset)
									COPY ARRAY:C226($_at_Print1D; $_at_PrintOption2{$_l_Index})
								End if 
							End for 
							ARRAY TEXT:C222($_at_PrintOption2_1D; Size of array:C274($_at_PrintOption1))
							//The point here is that above we were storing all values-but what it the selected preference?
							
							If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
								
								For ($_l_Index; 1; $_l_CountReports)
									If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
										ARRAY TEXT:C222($_at_Print1D; 0)
										BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_at_Print1D; $_l_offset)
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
								
								
								
								If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
									For ($_l_Index; 1; $_l_CountReports)
										If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
											ARRAY TEXT:C222($_at_Print1D; 0)
											BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_at_Print1D; $_l_offset)
											COPY ARRAY:C226($_at_Print1D; $_at_PrintOption3{$_l_Index})
											
										End if 
									End for 
									ARRAY TEXT:C222($_at_PrintOption3_1D; Size of array:C274($_at_PrintOption1))
									
									If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
										For ($_l_Index; 1; $_l_CountReports)
											If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
												ARRAY TEXT:C222($_at_Print1D; 0)
												BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_at_Print1D; $_l_offset)
												
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
										
										
										
										If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
											For ($_l_Index; 1; $_l_CountReports)
												If ($_l_offset<($_l_SizeofBlob)) & (OK=1)
													ARRAY TEXT:C222($_at_Print1D; 0)
													BLOB TO VARIABLE:C533($_ptr_BlobtoLoad->; $_at_Print1D; $_l_offset)
													COPY ARRAY:C226($_at_Print1D; $_at_PrintOption4{$_l_Index})
												End if 
											End for 
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
		$_bo_LoadFromBlob:=True:C214
	Else 
		$_bo_LoadFromBlob:=False:C215
		$_obj_ReportPreferences:=[PREFERENCES:116]DataObject:8
		
		OB GET ARRAY:C1229($_obj_ReportPreferences; "ReportNames"; $_at_ReportNames)
		OB GET ARRAY:C1229($_obj_ReportPreferences; "UseStandardSR"; $_al_UseStandardSR)  //this is one value per report
		OB GET ARRAY:C1229($_obj_ReportPreferences; "OverRideSR"; $_al_OverRideSR)  //this is one value per report
		OB GET ARRAY:C1229($_obj_ReportPreferences; "PrintOption"; $_at_PrintOption1_1D)  //this is one value per report
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
		
		OB GET ARRAY:C1229($_obj_ReportPreferences; "AltToPerson2"; $_at_PrintOption4_1D)
		
		OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentNaming"; $_at_OutputDocumentNames)
		OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentFrom"; $_at_OutputDocumentFrom)
		OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentSubject"; $_at_OutputDocumentSubject)
		OB GET ARRAY:C1229($_obj_ReportPreferences; "DocumentBody"; $_at_OutputDocumentBody)
		
	End if 
	///TRACE
	
	$_l_ReportRow:=Find in array:C230($_at_ReportNames; $_t_ReportPrefCodeStr)
	If ($_l_ReportRow>0)
		If ($_t_ReportPrefLevelType="REPORT")
			If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{1})))  //use standard sr
				$_ptr_ThisPrefsToLoad:=$_ptr_PrefsToLoad->{1}
				$_al_UseStandardSR{$_l_ReportRow}:=$_ptr_ThisPrefsToLoad->
			End if 
		End if 
		
		If ($_t_ReportPrefLevelType="COMPANY REPORT")
			If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{2})))  //override st
				$_ptr_ThisPrefsToLoad:=$_ptr_PrefsToLoad->{2}
				$_al_OverRideSR{$_l_ReportRow}:=$_ptr_ThisPrefsToLoad->
			End if 
		End if 
		
		//Reports_PrefsDeclareDefaults 
		If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{3})))  //print option 1
			$_ptr_PointertoArray:=$_ptr_PrefsToLoad->{3}
			Reports_PrefsSetDefaults($_ptr_PointertoArray)
			If (Size of array:C274($_at_PrintOption1_1D)>=$_l_ReportRow) & ($_bo_LoadFromBlob=False:C215)
				
				
				$_t_PrintOption:=$_at_PrintOption1_1D{$_l_ReportRow}
				If ($_t_PrintOption#"")
					$_l_Row:=Find in array:C230($_ptr_PointertoArray->; $_t_PrintOption)
					If ($_l_Row>0)
						$_ptr_PointertoArray->:=$_l_Row
					Else 
						$_ptr_PointertoArray->:=0
					End if 
				Else 
					$_ptr_PointertoArray->:=0
					
				End if 
			Else 
				If (Size of array:C274($_at_PrintOption1)>=$_l_ReportRow)
					If (Size of array:C274($_at_PrintOption1{$_l_ReportRow})>0)
						//NO we do not overwrite the popup values-but what is the selected value
						COPY ARRAY:C226($_at_PrintOption1{$_l_ReportRow}; $_at_Temp)
						$_l_SelectedROw:=$_at_Temp
						$_ptr_PointertoArray->:=$_at_Temp
						///COPY ARRAY($_at_PrintOption1;$_ptr_PointertoArray->)
					Else 
						$_ptr_PointertoArray->:=0
					End if 
				Else 
					$_ptr_PointertoArray->:=0
				End if 
			End if 
		End if 
		
		If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{4})))  //emailprintoption2
			$_ptr_PointertoArray:=$_ptr_PrefsToLoad->{4}
			Reports_PrefsSetDefaults($_ptr_PointertoArray)
			If (Size of array:C274($_at_PrintOption2_1D)>=$_l_ReportRow) & ($_bo_LoadFromBlob=False:C215)
				
				$_t_PrintOption:=$_at_PrintOption2_1D{$_l_ReportRow}
				If ($_t_PrintOption#"")
					$_l_Row:=Find in array:C230($_ptr_PointertoArray->; $_t_PrintOption)
					If ($_l_Row>0)
						$_ptr_PointertoArray->:=$_l_Row
					Else 
						$_ptr_PointertoArray->:=0
					End if 
				Else 
					$_ptr_PointertoArray->:=0
					
				End if 
			Else 
				If (Size of array:C274($_at_PrintOption2)>=$_l_ReportRow)
					If (Size of array:C274($_at_PrintOption2{$_l_ReportRow})>0)
						//COPY ARRAY($_at_PrintOption2{$_l_ReportRow};$_ptr_PointertoArray->)
						COPY ARRAY:C226($_at_PrintOption2{$_l_ReportRow}; $_at_Temp)
						$_l_SelectedROw:=$_at_Temp
						$_ptr_PointertoArray->:=$_at_Temp
					Else 
						$_ptr_PointertoArray->:=0
					End if 
				Else 
					$_ptr_PointertoArray->:=0
				End if 
			End if 
		End if 
		//TRACE
		
		If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{5})))  //SR_t_EmailPrintOption2Email print value 2-could be. role a contact or an email-multiple values depending on what emailprintoption2 is
			If (Size of array:C274($_at_PrintOption2Email)>=$_l_ReportRow) & ($_bo_LoadFromBlob=False:C215)
				$_ptr_MailOption:=$_ptr_PrefsToLoad->{5}
				$_t_EMailOption:=$_at_PrintOption2Email{$_l_ReportRow}
				$_ptr_MailOption->:=$_t_EMailOption
				
			Else 
				//this is the old pref so its all in one
				If (Size of array:C274($_at_PrintOption2val)>=$_l_ReportRow)
					If (Size of array:C274($_at_PrintOption2Val{$_l_ReportRow})>0)
						
						//COPY ARRAY($_at_PrintOption2Val{$_l_ReportRow};$_ptr_PointertoArray->)
						COPY ARRAY:C226($_at_PrintOption2Val{$_l_ReportRow}; $_at_Temp)
						$_l_SelectedROw:=$_at_Temp
						$_ptr_PointertoArray->:=$_at_Temp
					Else 
						$_ptr_PointertoArray->:=0
					End if 
					$_ptr_PointertoArray->:=0
				End if 
				
			End if 
		End if 
		//TRACE
		If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{6})))  //SR_t_EmailPrintOption2Cont_Print value 2-could be. role a contact or an email-multiple values depending on what emailprintoption2 is
			If (Size of array:C274($_at_PrintOption2Email)>=$_l_ReportRow) & ($_bo_LoadFromBlob=False:C215)
				///$_ptr_MailOption:=$_ptr_PrefsToLoad->{6}
				$_t_contactOption:=$_at_PrintOption2Cont{$_l_ReportRow}
				$_ptr_MailOption->:=$_t_contactOption
				
			Else 
				//this is the old pref so its all in one
				If (Size of array:C274($_at_PrintOption2val)>=$_l_ReportRow)
					If (Size of array:C274($_at_PrintOption2Val{$_l_ReportRow})>0)
						
						//COPY ARRAY($_at_PrintOption2Val{$_l_ReportRow};$_ptr_PointertoArray->)
						COPY ARRAY:C226($_at_PrintOption2Val{$_l_ReportRow}; $_at_Temp)
						$_l_SelectedROw:=$_at_Temp
						$_ptr_PointertoArray->:=$_at_Temp
					Else 
						$_ptr_PointertoArray->:=0
					End if 
					$_ptr_PointertoArray->:=0
				End if 
				
			End if 
		End if 
		If (False:C215)
			If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{6})))  //print option 3
				$_ptr_PointertoArray:=$_ptr_PrefsToLoad->{6}
				Reports_PrefsSetDefaults($_ptr_PointertoArray)
				If (Size of array:C274($_at_PrintOption4_1D)>=$_l_ReportRow)
					
					$_t_PrintOption:=$_at_PrintOption4_1D{$_l_ReportRow}
					If ($_t_PrintOption#"")
						$_l_Row:=Find in array:C230($_ptr_PointertoArray->; $_t_PrintOption)
						If ($_l_Row>0)
							$_ptr_PointertoArray->:=$_l_Row
						Else 
							$_ptr_PointertoArray->:=0
						End if 
					Else 
						$_ptr_PointertoArray->:=0
						
					End if 
				Else 
					If (Size of array:C274($_at_PrintOption3)>=Size of array:C274($_l_ReportRow))
						If (Size of array:C274($_at_PrintOption3{$_l_ReportRow})>0)
							COPY ARRAY:C226($_at_PrintOption3{$_l_ReportRow}; $_at_Temp)
							$_l_SelectedROw:=$_at_Temp
							$_ptr_PointertoArray->:=$_at_Temp
						Else 
							$_ptr_PointertoArray->:=0
						End if 
					Else 
						$_ptr_PointertoArray->:=0
					End if 
				End if 
			End if 
			//TRACE
			
			If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{7})))  //Added selective pref loading 19/11/08 v631b120i -kmw
				$_ptr_PointertoArray:=$_ptr_PrefsToLoad->{7}
				Reports_PrefsSetDefaults($_ptr_PointertoArray)
				
				If (Size of array:C274($_at_PrintOption3Role{$_l_ReportRow})>0)
					
					//COPY ARRAY($_at_PrintOption3Role{$_l_ReportRow};$_ptr_PointertoArray->)
					COPY ARRAY:C226($_at_PrintOption3Role{$_l_ReportRow}; $_at_Temp)
					$_l_SelectedROw:=$_at_Temp
					$_ptr_PointertoArray->:=$_at_Temp
				Else 
					$_ptr_PointertoArray->:=0
				End if 
				
			End if 
		End if 
		If (Not:C34(Is nil pointer:C315($_ptr_PrefsToLoad->{8})))  //Added selective pref loading 19/11/08 v631b120i -kmw
			$_ptr_PointertoVar:=$_ptr_PrefsToLoad->{8}
			If (Size of array:C274($_at_PrintOption4_1D)>=$_l_ReportRow) & ($_bo_LoadFromBlob=False:C215)
				
				//$_ptr_MailOption:=$_ptr_PrefsToLoad->{8}
				$_t_contactOption:=$_at_PrintOption4_1D{$_l_ReportRow}
				$_ptr_MailOption->:=$_t_contactOption
				
				
			Else 
				If (Size of array:C274($_at_PrintOption4{$_l_ReportRow})>0)
					
					//COPY ARRAY($_at_PrintOption4{$_l_ReportRow};$_ptr_PointertoArray->)
					COPY ARRAY:C226($_at_PrintOption4{$_l_ReportRow}; $_at_Temp)
					$_l_SelectedROw:=$_at_Temp
					$_ptr_PointertoVar->:=$_at_Temp{$_l_SelectedROw}
				Else 
					$_ptr_PointertoVar->:=""
				End if 
				$_ptr_PointertoVar->:=""
			End if 
		End if 
		
		If (OK=1)
			$_l_PrefLoadedCorrectly:=1
		Else 
			
		End if 
		
	Else 
		Reports_PrefsSetDefaults(->SR_l_CompSettingsOverrideSR)
		Reports_PrefsSetDefaults(->SR_at_EmailPrintOption1)
		Reports_PrefsSetDefaults(->SR_at_EmailPrintOption2)
		//************ Changed to array of values 20/02/09 -kmw ************
		//Reports_PrefsSetDefaults (->SR_t_EmailPrintOption2Role)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Email)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Cont)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Role)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption2Pers)
		
		//********************************************************************
		Reports_PrefsSetDefaults(->SR_at_EmailPrintOption3)
		//************ Changed to array of values 20/02/09 -kmw ************
		//Reports_PrefsSetDefaults (->SR_t_EmailPrintOption3Role)
		//Reports_PrefsSetDefaults (->SR_at_EmailPrintOption3Roles)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Email)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Cont)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Role)
		Reports_PrefsSetDefaults(->SR_t_EmailPrintOption3Pers)
		
		//********************************************************************
		Reports_PrefsSetDefaults(->SR_at_EmailPrintOption4)
		
		$_l_PrefLoadedCorrectly:=1
	End if 
	
	
	
	
	Case of 
		: ($_l_PrefLoadedCorrectly=-1)
			Gen_Alert("Problem loading "+$_t_ReportPrefLevelType+" level print/email preferences. Default preferences used.")
		: ($_l_PrefLoadedCorrectly=0)
			Gen_Alert("Problem loading "+$_t_ReportPrefLevelType+" level print/email preferences. Some default preferences used.")
		Else 
			//blob loaded fine...do nothing
	End case 
End if 


Reports_PrefArraysToFormVars  //Added 23/02/09 v631b120o -kmw (unfortunately, calling this in here makes it less generic than I oringally intended - but easiest way to ensure form vars and pref arrays are bound)

CLEAR SEMAPHORE:C144("EditReportPrefs")  //NOTE: kmw 03/03/09 v631b120o - This should probably be replaced with a more contextual semaphore name (perhaps based on the Preference name) - as it's probably currently a choke point.
ERR_MethodTrackerReturn("Reports_PrefsLoadNEW"; $_t_oldMethodName)
