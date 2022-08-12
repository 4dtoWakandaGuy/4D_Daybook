//%attributes = {}

If (False:C215)
	//Project Method Name:      Doc_userIn13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_abo_EmailPrefs;0)
	ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
	//ARRAY TEXT(DOC_at_DocumentType;0)
	//ARRAY TEXT(DOC_at_Prefix1;0)
	//ARRAY TEXT(DOC_at_Prefix2;0)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	C_BOOLEAN:C305(DB_bo_DocPrefsLoaded)
	C_LONGINT:C283(DOC_l_docDoEmail; DOC_l_DocDoPrint)
	C_TEXT:C284($_t_oldMethodName; REP_t_CurrentSRDocReport)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_userIn13")

If (Not:C34(DB_bo_DocPrefsLoaded))
	ARRAY TEXT:C222(DOC_at_DocumentType; 5)
	ARRAY BOOLEAN:C223(DOC_abo_EmailPrefs; 0)
	ARRAY TEXT:C222(DOC_at_Prefix1; 6)
	ARRAY TEXT:C222(DOC_at_Prefix2; 2)
	DocReportEmailResetValues
	
	$_t_oldMethodName:=ERR_MethodTracker("Doc_userIn13")
	
	Doc_userGetReportTypes(->DOC_at_DocumentType)
	
	DOC_at_Prefix1{1}:="DDMMYY"
	DOC_at_Prefix1{2}:="MMDDYY"
	DOC_at_Prefix1{3}:="YYMMDD"
	DOC_at_Prefix1{4}:="MMYY"
	DOC_at_Prefix1{5}:="YYMM"
	DOC_at_Prefix1{6}:="Month"
	
	SORT ARRAY:C229(DOC_at_Prefix1)
	
	INSERT IN ARRAY:C227(DOC_at_Prefix1; 1; 1)
	DOC_at_Prefix1{1}:="None"
	DOC_at_Prefix1:=1
	
	DOC_at_Prefix2{1}:="Company code"
	DOC_at_Prefix2{2}:="Contact code"
	
	SORT ARRAY:C229(DOC_at_Prefix2)
	
	INSERT IN ARRAY:C227(DOC_at_Prefix2; 1; 1)
	DOC_at_Prefix2{1}:="None"
	DOC_at_Prefix2:=1
	
	DOC_l_DocDoPrint:=1
	DOC_l_docDoEmail:=0
	
	Doc_userPreferencesLoad
	
	Doc_currentPrefsLoad
	
	UserIn13_document_setInterface
	If (Size of array:C274(REP_at_DocReportTo)>0)
		REP_t_CurrentSRDocReport:=REP_at_DocReportTo{REP_at_DocReportTo}  //Added 17/11/08 v631b120i -kmw
		ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
		Reports_PrefsLoadNEW(REP_t_CurrentSRDocReport; "REPORT"; ->$_aptr_PrefsToLoad; False:C215; Table:C252(->[DOCUMENTS:7]); 0)  //Added 02/12/08 v631b120i -kmw
	End if 
	Reports_PrefsSetVisibility(SR_at_EmailPrintOption1; SR_at_EmailPrintOption2; SR_at_EmailPrintOption3)
	DB_bo_DocPrefsLoaded:=True:C214
End if 
ERR_MethodTrackerReturn("Doc_userIn13"; $_t_oldMethodName)
