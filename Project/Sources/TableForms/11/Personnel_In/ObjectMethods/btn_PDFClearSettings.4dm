If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.btn_PDFClearSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PDS_at_DaybookUsers;0)
	//ARRAY TEXT(PDF_at_995DocsDirPath;0)
	//Array Text(PDF_at_MachineNames;0)
	//ARRAY BOOLEAN(PDF_abo_MachineIsWindows;0)
	//ARRAY TEXT(DOC_at_PDF995Path;0)
	C_TEXT:C284($_t_oldMethodName; PDF_t_995DocDirPath; DOC_t_PDF995Path)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.btn_PDFClearSettings"; Form event code:C388)
//
//Button added 28/10/08 v631b120b -kmw
//
ARRAY TEXT:C222(DOC_at_PDF995Path; 0)
ARRAY TEXT:C222(PDF_at_995DocsDirPath; 0)
ARRAY TEXT:C222(PDF_at_MachineNames; 0)
ARRAY TEXT:C222(PDS_at_DaybookUsers; 0)
ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; 0)
DOC_at_PDF995Path:=0
PDF_at_995DocsDirPath:=0
PDF_at_MachineNames:=0
PDS_at_DaybookUsers:=0
PDF_abo_MachineIsWindows:=0
//
DOC_t_PDF995Path:=""
PDF_t_995DocDirPath:=""
//
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.btn_PDFClearSettings"; $_t_oldMethodName)