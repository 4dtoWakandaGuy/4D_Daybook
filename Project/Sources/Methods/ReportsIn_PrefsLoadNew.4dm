//%attributes = {}
If (False:C215)
	//Project Method Name:      ReportsIn_PrefsLoadNew
	//------------------ Method Notes ------------------
	//Added 17/11/08 v631b120i -kmw
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: ReportsIn_PrefsLoadNew
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	//ARRAY TEXT(IR_at_EmailPrintOption1;0)
	//ARRAY TEXT(IR_at_EmailPrintOption2;0)
	//ARRAY TEXT(IR_at_EmailPrintOption3;0)
	//ARRAY TEXT(IR_at_EmailPrintOption4;0)
	C_LONGINT:C283($_l_IRPrefLoadedCorrectly; $_l_Offset; $_l_PreferencesID; $_l_Ref; $_l_SIzeofBlob; IR_l_CompSettingsOverrideSR; IR_l_CompSettingsUseStandardSR)
	C_TEXT:C284($_t_IRReportPrefCodeStr; $_t_IRReportPrefCompDocStr; $_t_IRReportPrefDocCodeStr; $_t_IRReportPrefInternalRptStr; $_t_IRReportPrefLevelType; $_t_oldMethodName; $_t_PreferencesName; $1; $2; IR_t_EmailPrintOption1; IR_t_EmailPrintOption2)
	C_TEXT:C284(IR_t_EmailPrintOption2Role; IR_t_EmailPrintOption3; IR_t_EmailPrintOption3Role; IR_t_EmailPrintOption4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ReportsIn_PrefsLoadNew")
If (Count parameters:C259>0)
	$_t_IRReportPrefCodeStr:=$1
Else 
	//$_t_IRReportPrefCodeStr:=[DOCUMENTS]LDocument_Code  `Default to assuming have been passed a report code
	$_t_IRReportPrefCodeStr:=""
End if 


If (Count parameters:C259>1)
	$_t_IRReportPrefLevelType:=$2  //Pass either "REPORT" or "COMPANY" to specify what table code you have passed and to determine what level of report pref is being loaded
Else 
	$_t_IRReportPrefLevelType:="REPORT"  //Default to assuming either have been passed a report code or nothing at all in which case we have already defaulted to assuming the code to use is the current document code
End if 

$_t_IRReportPrefDocCodeStr:=""
$_t_IRReportPrefCompDocStr:=""
$_t_IRReportPrefInternalRptStr:=""  //Added internal RPT handling 14/11/08 v631b120i -kmw

Case of 
	: ($_t_IRReportPrefLevelType="REPORT")
		$_t_IRReportPrefDocCodeStr:=$_t_IRReportPrefCodeStr
		If ($_t_IRReportPrefDocCodeStr#"")
			$_t_PreferencesName:="IR_REPORT_"+$_t_IRReportPrefDocCodeStr
			$_l_Offset:=0
		End if 
		
	: ($_t_IRReportPrefLevelType="COMPANY REPORT")
		$_t_IRReportPrefCompDocStr:=$_t_IRReportPrefCodeStr
		If ($_t_IRReportPrefCompDocStr#"")
			$_t_PreferencesName:="IR_COMPDOC_"+$_t_IRReportPrefCompDocStr
			$_l_Offset:=0
		End if 
		
		
	Else 
		Gen_Alert("Bad param passed to method ReportsIn_PrefsLoadNEW. Contact developer.")
End case 



While (Semaphore:C143("LoadDocPrefs"))
	DelayTicks
End while 

$_l_PreferencesID:=PREF_GetPreferenceID($_t_PreferencesName)

READ ONLY:C145([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferencesID)

If (Records in selection:C76([PREFERENCES:116])=0)
	ReportsIn_PrefsSetDefaults
Else 
	$_l_IRPrefLoadedCorrectly:=0
	
	ARRAY TEXT:C222(IR_at_EmailPrintOption1; 0)
	ARRAY TEXT:C222(IR_at_EmailPrintOption2; 0)
	ARRAY TEXT:C222(IR_at_EmailPrintOption3; 0)
	ARRAY TEXT:C222(IR_at_EmailPrintOption4; 0)
	IR_t_EmailPrintOption2Role:=""
	IR_t_EmailPrintOption3Role:=""
	$_l_offset:=0
	OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_Properties; $_al_PropertyTypes)
	If (Find in array:C230($_at_Properties; "UseStandardSR")<0)  //These have not been saved in the new object area
		
		$_l_SIzeofBlob:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_l_CompSettingsUseStandardSR; $_l_offset)
			If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_l_CompSettingsOverrideSR; $_l_offset)
				If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_at_EmailPrintOption1; $_l_offset)
					IR_at_EmailPrintOption1:=1  //added kmw 26/11/08 v631b120i (ensure print is always selected for internal reports as my understanding is that we currently havn't added this ability yet)
					
					If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_at_EmailPrintOption2; $_l_offset)
						If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_t_EmailPrintOption2Role; $_l_offset)
							If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_at_EmailPrintOption3; $_l_offset)
								If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_t_EmailPrintOption3Role; $_l_offset)
									If ($_l_offset<($_l_SIzeofBlob)) & (OK=1)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; IR_at_EmailPrintOption4; $_l_offset)
										If (OK=1)
											$_l_IRPrefLoadedCorrectly:=1
										Else 
											ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption4)
										End if 
									Else 
										ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
										ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption4)
									End if 
								Else 
									ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption3)
									ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
									ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption4)
								End if 
							Else 
								ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption2Role)
								ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption3)
								ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
								ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption4)
							End if 
						Else 
							ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption2)
							ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption2Role)
							ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption3)
							ReportsIn_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
							ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption4)
						End if 
					Else 
						Reports_PrefsSetDefaults(->IR_at_EmailPrintOption1)
						Reports_PrefsSetDefaults(->IR_at_EmailPrintOption2)
						Reports_PrefsSetDefaults(->IR_t_EmailPrintOption2Role)
						Reports_PrefsSetDefaults(->IR_at_EmailPrintOption3)
						Reports_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
						Reports_PrefsSetDefaults(->IR_at_EmailPrintOption4)
					End if 
				Else 
					Reports_PrefsSetDefaults(->IR_l_CompSettingsOverrideSR)
					Reports_PrefsSetDefaults(->IR_at_EmailPrintOption1)
					Reports_PrefsSetDefaults(->IR_at_EmailPrintOption2)
					Reports_PrefsSetDefaults(->IR_t_EmailPrintOption2Role)
					Reports_PrefsSetDefaults(->IR_at_EmailPrintOption3)
					Reports_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
					Reports_PrefsSetDefaults(->IR_at_EmailPrintOption4)
				End if 
			Else 
				$_l_IRPrefLoadedCorrectly:=-1
				ReportsIn_PrefsSetDefaults
			End if 
		Else 
			$_l_IRPrefLoadedCorrectly:=-1
			ReportsIn_PrefsSetDefaults
		End if 
	Else 
		//in the case of the defaults then this is one value not one per report
		If (Find in array:C230($_at_Properties; "UseStandardSR")>0)
			
			IR_l_CompSettingsUseStandardSR:=OB Get:C1224([PREFERENCES:116]DataObject:8; "UseStandardSR")
		Else 
			ReportsIn_PrefsSetDefaults(->IR_l_CompSettingsUseStandardSR)
		End if 
		If (Find in array:C230($_at_Properties; "OverRideSR")>0)
			IR_l_CompSettingsOverrideSR:=OB Get:C1224([PREFERENCES:116]DataObject:8; "OverRideSR")
		Else 
			ReportsIn_PrefsSetDefaults(->IR_l_CompSettingsOverrideSR)
		End if 
		ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption1)
		If (Find in array:C230($_at_Properties; "PrintOption")>0)
			IR_t_EmailPrintOption1:=OB Get:C1224([PREFERENCES:116]DataObject:8; "PrintOption")  //Note this is a singular text value-the selected option-the list of values is standardised
			$_l_Ref:=Find in array:C230(IR_at_EmailPrintOption1; IR_t_EmailPrintOption1)
			If ($_l_Ref>0)
				IR_at_EmailPrintOption1:=$_l_Ref
			End if 
		End if 
		ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption2)
		If (Find in array:C230($_at_Properties; "ToPerson")>0)
			IR_t_EmailPrintOption2:=OB Get:C1224([PREFERENCES:116]DataObject:8; "ToPerson")  //Note this is a singular text value-the selected option-the list of values is standardised
			$_l_Ref:=Find in array:C230(IR_at_EmailPrintOption2; IR_t_EmailPrintOption2)
			If ($_l_Ref>0)
				IR_at_EmailPrintOption2:=$_l_Ref
			End if 
		End if 
		ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption3)
		If (Find in array:C230($_at_Properties; "AltToPerson")>0)
			IR_t_EmailPrintOption3:=OB Get:C1224([PREFERENCES:116]DataObject:8; "AltToPerson")
			$_l_Ref:=Find in array:C230(IR_at_EmailPrintOption3; IR_t_EmailPrintOption3)
			If ($_l_Ref>0)
				IR_at_EmailPrintOption3:=$_l_Ref
			End if 
		End if 
		ReportsIn_PrefsSetDefaults(->IR_at_EmailPrintOption4)
		If (Find in array:C230($_at_Properties; "AltToPerson2")>0)
			IR_t_EmailPrintOption4:=OB Get:C1224([PREFERENCES:116]DataObject:8; "AltToPerson2")
			$_l_Ref:=Find in array:C230(IR_at_EmailPrintOption4; IR_t_EmailPrintOption4)
			If ($_l_Ref>0)
				IR_at_EmailPrintOption4:=$_l_Ref
			End if 
		End if 
		If (Find in array:C230($_at_Properties; "ToPersonRole")>0)
			IR_t_EmailPrintOption2Role:=OB Get:C1224([PREFERENCES:116]DataObject:8; "ToPersonRole")
		Else 
			Reports_PrefsSetDefaults(->IR_t_EmailPrintOption2Role)
		End if 
		If (Find in array:C230($_at_Properties; "AltToPersonRole")>0)
			IR_t_EmailPrintOption3Role:=OB Get:C1224([PREFERENCES:116]DataObject:8; "AltToPersonRole")
		Else 
			Reports_PrefsSetDefaults(->IR_t_EmailPrintOption3Role)
		End if 
		$_l_IRPrefLoadedCorrectly:=1
	End if 
	
	Case of 
		: ($_l_IRPrefLoadedCorrectly=-1)
			Gen_Alert("Problem loading "+$_t_IRReportPrefLevelType+" level print/email preferences. Default preferences used.")
		: ($_l_IRPrefLoadedCorrectly=0)
			Gen_Alert("Problem loading "+$_t_IRReportPrefLevelType+" level print/email preferences. Some default preferences used.")
		Else 
			//blob loaded fine...do nothing
	End case 
End if 

CLEAR SEMAPHORE:C144("LoadDocPrefs")
ERR_MethodTrackerReturn("ReportsIn_PrefsLoadNew"; $_t_oldMethodName)
