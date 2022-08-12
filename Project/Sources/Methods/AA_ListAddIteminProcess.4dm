//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ListAddIteminProcess
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(WS_bo_ListItemComplete)
	C_LONGINT:C283($_l_CallBackProcess; $_l_CurrentWinRefOLD; $_l_ListOwnerID; $_l_ProcessState; $_l_ProcessTime; $2; $3; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_ListItemaddedID)
	C_TEXT:C284($_t_DefaultListName; $_t_oldMethodName; $_t_ProcessName; $1)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_ListAddIteminProcess")


If (Count parameters:C259>=1)
	$_t_DefaultListName:=$1
	If (Count parameters:C259>=2)
		$_l_CallBackProcess:=$2
	End if 
	If (Count parameters:C259>=3)
		$_l_ListOwnerID:=$3
	End if 
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_DefaultListName)
	If ($_l_ListOwnerID#0)
		QUERY SELECTION:C341([X_LISTS:111]; [X_LISTS:111]x_ListDataOwnerID:7=$_l_ListOwnerID)
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(0; 0; 0; 0; 8)
	DIALOG:C40([X_LISTS:111]; "Display_LIST_Dialogue")
	//ADD RECORD([X_Lists];*)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If ($_l_CallBackProcess>0)
		PROCESS PROPERTIES:C336($_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
		If ($_l_ProcessState>=0)  // 30/05/02 pb
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; WS_l_ListItemaddedID; WS_l_ListItemaddedID)
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; WS_bo_ListItemComplete; True:C214)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AA_ListAddIteminProcess"; $_t_oldMethodName)
