//%attributes = {}

If (False:C215)
	//Database Method Name:      WF_LaunchCompanionWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WatchProcess; $1; SD2_l_Callingprocess)
	C_TEXT:C284($_T_ActionText; $_t_CampaignDocument; $_t_DiaryCOde; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("WF_LaunchCompanionWindow")
//this method will launch another process with some information in-when the calling process is closes then this closes

$_l_WatchProcess:=$1
$_t_DiaryCOde:=$2
QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCOde)
If (Not:C34(UTIL_isUUIDNil([DIARY:12]CampaignUUID:80)))
	QUERY:C277([WORKFLOW_Campaign:209]; [WORKFLOW_Campaign:209]UUID:1=[DIARY:12]CampaignUUID:80)
	$_t_CampaignDocument:=[WORKFLOW_CONTROL:51]Document_Code:8
End if 
If ($_t_CampaignDocument#"")
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_CampaignDocument)
	If (Records in selection:C76([DOCUMENTS:7])=1)
	Else 
	End if 
Else 
	SD2_l_Callingprocess:=$_l_WatchProcess
	$_T_ActionText:=[DIARY:12]Action_Details:10
	Open window:C153(0; 0; 0; 0; -Palette window:K34:3)
	DIALOG:C40([DIARY:12]; "ActionCompanion")
End if 
ERR_MethodTrackerReturn("WF_LaunchCompanionWindow"; $_t_oldMethodName)