//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZRecord_EditLst
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2012 12:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CalledFrom; $_l_EditProcess; $0; $1; vRecNo)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptCode; $_t_TableName; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZRecord_EditLst")
//ZRecord_EditLst
//C_LONGINT(<>SCPT_l_RecordEdit)
//C_TEXT($_t_ScriptCode)
//If (<>SCPT_l_RecordEdit>0)
//CALL PROCESS(<>SCPT_l_RecordEdit)
//BRING TO FRONT(<>SCPT_l_RecordEdit)
//Else
$_t_TableName:=""
If (Count parameters:C259=0)
	$_l_CalledFrom:=Current process:C322
	$_t_ScriptCode:=[SCRIPTS:80]Script_Code:1
	vRecNo:=Record number:C243([SCRIPTS:80])
Else 
	$_l_CalledFrom:=$1
	$_t_ScriptCode:=$2
	If (Count parameters:C259>=3)
		$_t_TableName:=$3
	End if 
End if 
If ($_t_TableName#"")
	$_l_EditProcess:=New process:C317("Record_EditLst"; DB_ProcessMemoryinit(2); $_t_ScriptCode; $_t_ScriptCode; $_l_CalledFrom; $_t_TableName)
Else 
	$_l_EditProcess:=New process:C317("Record_EditLst"; DB_ProcessMemoryinit(2); $_t_ScriptCode; $_t_ScriptCode; $_l_CalledFrom)
End if 
If ($_l_EditProcess>0)
	Process_StartAr($_l_EditProcess; "Edit Macro")
End if 
$0:=$_l_EditProcess
ERR_MethodTrackerReturn("ZRecord_EditLst"; $_t_oldMethodName)