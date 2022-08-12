//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_MultiOwnerList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($3; SD3_bo_FloatingDiarydisplayed)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $2; SD_l_Defaultuser; SD2_l_CallBackProcessID; SD2_l_UseProcessArrays; SD3_l_FloatingDiaryList; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_MultiOwnerList")
//This method will put a multiple diary owne list on the screen



SD2_l_UseProcessArrays:=0
SD2_l_CallBackProcessID:=0
If (Count parameters:C259>=2)
	SD2_l_CallBackProcessID:=$2
End if 
If (Count parameters:C259>=3)
	
	SD2_l_UseProcessArrays:=Num:C11($3)
End if 

READ ONLY:C145(*)
//NG modified to set all to read only, was
//locking records
//ARRAY LONGINT(◊SD_l_COMBINEGROUPDIARIES;0)
//ARRAY LONGINT(◊SD_l_COMBINEPERSONDIARIES;0)
//ARRAY LONGINT(◊SD_l_COMBINERESOURCEDIARIES;0)

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
SD_GetGroups([PERSONNEL:11]Personnel_ID:48)
SD_l_Defaultuser:=[PERSONNEL:11]Personnel_ID:48
SD3_bo_FloatingDiarydisplayed:=True:C214
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(65; 65; 65; 65; 1990; "Diaries"; "SD_MultiOwnerClose")
SET WINDOW TITLE:C213("Diaries")
DIALOG:C40([USER:15]; "SD_MultDiary")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
//ARRAY LONGINT(◊SD_l_COMBINEGROUPDIARIES;0)
//ARRAY LONGINT(◊SD_l_COMBINEPERSONDIARIES;0)
//ARRAY LONGINT(◊SD_l_COMBINERESOURCEDIARIES;0)

SD3_l_FloatingDiaryList:=0
SD3_bo_FloatingDiarydisplayed:=False:C215
ERR_MethodTrackerReturn("SD_MultiOwnerList"; $_t_oldMethodName)
