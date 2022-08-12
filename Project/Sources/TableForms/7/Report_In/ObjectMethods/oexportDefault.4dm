If (False:C215)
	//object Name: [DOCUMENTS]Report_in.oexportDefault
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/01/2014 23:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableNumber; $_l_Version)
	C_TEXT:C284($_t_oldMethodName; $_t_ReportName; $_t_ResourcesPath; $_t_Version)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS]Report_in.oexportDefault"; Form event code:C388)

$_t_ReportName:=[DOCUMENTS:7]Document_Code:1
$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
$_t_ResourcesPath:=$_t_ResourcesPath+"Default_Reports"+Folder separator:K24:12
$_t_ResourcesPath:=$_t_ResourcesPath+$_t_ReportName+".txt"
SET CHANNEL:C77(10; $_t_ResourcesPath)
$_l_TableNumber:=[DOCUMENTS:7]Table_Number:11
$_t_Version:="1.0"
SEND VARIABLE:C80($_l_TableNumber)
SEND VARIABLE:C80($_t_Version)
SEND RECORD:C78([DOCUMENTS:7])
SET CHANNEL:C77(11)
ERR_MethodTrackerReturn("OBJ Report_in.oexportDefault"; $_t_oldMethodName)