//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_Prd_WIndow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_WindowTop; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_Close; $_t_oldMethodName; $_t_WindowTitle; $1; $2; DB_t_CallOnCloseorSave)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Open_Prd_WIndow")
If (Not:C34(WIN_bo_TrackerInited))
	ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
	ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
	WIN_bo_TrackerInited:=True:C214
End if 

$_l_WindowRight:=Screen width:C187-2
$_l_WindowTop:=40
$_l_WindowBottom:=236
$_l_WindowLeft:=$_l_WindowRight-370
If (Count parameters:C259>1)
	$_t_Close:=$2
	DB_t_CallOnCloseorSave:=""
	DB_bo_RecordModified:=False:C215
Else 
	$_t_Close:=""
End if 
$_t_WindowTitle:=Replace string:C233($1; "_"; " ")
$_l_WindowReference:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; -1984; $_t_WindowTitle; $_t_Close)
APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowReference)
WIN_l_CurrentWinRef:=$_l_WindowReference
ERR_MethodTrackerReturn("Open_Prd_WIndow"; $_t_oldMethodName)
