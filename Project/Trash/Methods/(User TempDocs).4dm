//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User TempDocs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule; vNo)
	C_TEXT:C284($_t_oldMethodName; vComments; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User TempDocs")
//Letters_File
vT:=""
vComments:=""
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="INVOICE"; *)
QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="DELIVERY"; *)
QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="PURCHORD")
CREATE SET:C116([DOCUMENTS:7]; "Master")
vNo:=Records in selection:C76([DOCUMENTS:7])
If (vNo=0)
	//Letters_In
	DB_MenuNewRecord("DocumentsLetters")
	
Else 
	//`Open_Pro_Window ("View Documents";0;1;->[DOCUMENTS];"Reports Out")
	//C_TEXT(WIN_t_CurrentOutputform)
	//FS_SetFormSort (WIN_t_CurrentOutputform)
	//WIn_SetFormSize (1;->[DOCUMENTS];"Reports Out")
	//MODIFY SELECTION([DOCUMENTS];*)
	//Close_ProWin
	COPY NAMED SELECTION:C331([DOCUMENTS:7]; "CURRENT")
	DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[DOCUMENTS:7])); <>MENU_l_BarModule; "CURRENT")
	
End if 
ERR_MethodTrackerReturn("User TempDocs"; $_t_oldMethodName)