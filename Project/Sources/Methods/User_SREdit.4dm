//%attributes = {}
If (False:C215)
	//Project Method Name:      User_SREdit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: User_SREdit
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_HideDisabledReports; $_bo_NoForms; $1; $2)
	C_LONGINT:C283($_l_AddMode; $_l_S1; $_l_S2; $_l_S3; s1; s2; s3; vAdd; vNo)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284(<>SYS_t_PlatformSetting; $_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_SREdit")
//User_SREdit
If (Count parameters:C259>0)
	$_bo_NoForms:=$1
Else 
	$_bo_NoForms:=False:C215
End if 

If (Count parameters:C259>1)
	$_bo_HideDisabledReports:=$2
Else 
	$_bo_HideDisabledReports:=False:C215
End if 
If ($_bo_NoForms=False:C215)  //bwalia 200610016 added to just load super reports without any windows
	$_l_S1:=s1
	$_l_S2:=s2
	$_l_S3:=s3
	READ WRITE:C146([DOCUMENTS:7])
	FORM SET INPUT:C55([DOCUMENTS:7]; "Report_in")
	WIN_t_CurrentInputForm:="Report_in"
	FORM SET OUTPUT:C54([DOCUMENTS:7]; "Reports_Out")
	WIN_t_CurrentOutputform:="Reports_Out"
	vFilePtr:=->[USER:15]
	$_l_AddMode:=vAdd
	Userset_Empty(->[DOCUMENTS:7])
End if 

QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR @"; *)
QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1=<>SYS_t_PlatformSetting+"SR @"; *)
QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1=" SR @"; *)
QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1=<>SYS_t_PlatformSetting+" SR @")

vNo:=Records in selection:C76([DOCUMENTS:7])

If (vNo=0)
	Reports_FormCr
	READ WRITE:C146([DOCUMENTS:7])
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR @"; *)
	QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1=<>SYS_t_PlatformSetting+"SR @"; *)
	QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1=" SR @"; *)
	QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1=<>SYS_t_PlatformSetting+" SR @")
	vNo:=Records in selection:C76([DOCUMENTS:7])
End if 
If ($_bo_HideDisabledReports)
	QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1#"SR •@"; *)
	QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#<>SYS_t_PlatformSetting+"SR •@"; *)
	QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#" SR •@"; *)
	QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#<>SYS_t_PlatformSetting+" SR •@")
	vNo:=Records in selection:C76([DOCUMENTS:7])
End if 


If ($_bo_NoForms=False:C215)
	
	//Open_Pro_Window ("View SuperReports";0;1;->[DOCUMENTS];WIN_t_CurrentOutputform)
	//vAdd:=0
	//C_TEXT(WIN_t_CurrentOutputform)
	//FS_SetFormSort (WIN_t_CurrentOutputform)
	
	//WIn_SetFormSize (1;->[DOCUMENTS];WIN_t_CurrentOutputform)
	//MODIFY SELECTION([DOCUMENTS];*)
	//Close_ProWin
	//vAdd:=$_l_AddMode
	DBI_MenuDisplayRecords("DocumentsReportTemplates")
	
	s1:=$_l_S1
	s2:=$_l_S2
	s3:=$_l_S3
End if 
ERR_MethodTrackerReturn("User_SREdit"; $_t_oldMethodName)
