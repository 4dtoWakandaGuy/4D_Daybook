//%attributes = {}
If (False:C215)
	//Project Method Name:      UPG_ConvertDocTemplates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPG_ConvertDocTemplates")
//this method will ensure that all templates are tagged

QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR"+"@")
//these are superreport templates
DB_lockFile(->[DOCUMENTS:7])
APPLY TO SELECTION:C70([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14:=SuperReportReport Template)

AA_CheckFileUnlockedByTableNUM(Table:C252(->[DOCUMENTS:7]))
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="WSR"+"@")
DB_lockFile(->[DOCUMENTS:7])
APPLY TO SELECTION:C70([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14:=SuperReportReport Template)

AA_CheckFileUnlockedByTableNUM(Table:C252(->[DOCUMENTS:7]))
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="PSR"+"@")
DB_lockFile(->[DOCUMENTS:7])
APPLY TO SELECTION:C70([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14:=SuperReportReport Template)

AA_CheckFileUnlockedByTableNUM(Table:C252(->[DOCUMENTS:7]))
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214; *)
QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Class:14=0)
DB_lockFile(->[DOCUMENTS:7])
APPLY TO SELECTION:C70([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14:=4D Write Letter Template)

AA_CheckFileUnlockedByTableNUM(Table:C252(->[DOCUMENTS:7]))

QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15#"")
For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
	If ([DIARY:12]Document_Code:15#"")
		RELATE ONE:C42([DIARY:12]Document_Code:15)
		If (Records in selection:C76([DOCUMENTS:7])=1) & ([DOCUMENTS:7]Document_Class:14=0)
			[DOCUMENTS:7]Document_Class:14:=4D Write Letter
			DB_SaveRecord(->[DOCUMENTS:7])
		End if 
	End if 
	NEXT RECORD:C51([DIARY:12])
End for 
ERR_MethodTrackerReturn("UPG_ConvertDocTemplates"; $_t_oldMethodName)
