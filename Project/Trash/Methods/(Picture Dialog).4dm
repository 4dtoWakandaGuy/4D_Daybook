//%attributes = {}
If (False:C215)
	//Project Method Name:      Picture Dialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4; $Screen; vText; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Picture Dialog")
$Screen:=""
QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$1)
If (Records in selection:C76([PICTURES:85])>0)
	If ($2="Picture Name")
		vTitle:=[PICTURES:85]Picture_Name:2
	Else 
		vTitle:=$2
	End if 
	If (Count parameters:C259>2)
		vText:=$3
		If (Count parameters:C259>3)
			If ($4="13")
				$Screen:="13"
			End if 
		End if 
	Else 
		vText:=""
	End if 
	If ($Screen="13")
		Open_Any_Window(413; 575)
	Else 
		Open_Any_Window(302; 450)
	End if 
	DIALOG:C40([PICTURES:85]; "dPicture"+$Screen)
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
Else 
	Gen_Alert("Picture not found")
End if 
ERR_MethodTrackerReturn("Picture Dialog"; $_t_oldMethodName)