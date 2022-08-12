//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Search
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>StartProc; $Show; IME_bo_IsInternetManager; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; $Keys; WIN_l_CurrentWinRef; xNext)
	C_TEXT:C284(<>KEYS; $_t_oldMethodName; $0; $1; $2; $3; $4; $5; $6; DB_t_CallOnCloseorSave; vConfirm)
	C_TEXT:C284(vRequest)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Search")
If (<>Keys="§M")
	OK:=1
	xNext:=1
	$0:=""
Else 
	If (<>Keys="§A")
		OK:=1
		xNext:=0
		$0:=""
	Else 
		vConfirm:=$1
		vRequest:=$2
		$Show:=True:C214
		$Show:=Not:C34(IME_bo_IsInternetManager)  //$Show:=True `Wed, Feb 21, 2007 balinderwalia: changed
		If (<>Keys#"")
			If (Character code:C91(Substring:C12(<>Keys; 1; 1))=8)
				<>Keys:=Substring:C12(<>Keys; 2; 30)
				vRequest:=""
			End if 
			$Keys:=Character code:C91(Substring:C12(<>Keys; Length:C16(<>Keys); 1))
			If (($Keys=13) | ($Keys=9) | ($Keys=3))
				$Show:=False:C215
				If (Length:C16(<>Keys)>1)
					vRequest:="<>"+Substring:C12(<>Keys; 1; Length:C16(<>Keys)-1)
				End if 
			Else 
				vRequest:="<>"+<>Keys
			End if 
		End if 
		
		If ($Show)
			DB_t_CallOnCloseorSave:=""
			Open_AnyTypeWindow(100; 320; 5; $3)
			DIALOG:C40([COMPANIES:2]; "dSearch")
			$_l_OK:=OK
			//OK:=1
			CLOSE WINDOW:C154
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
			
			If ($_l_OK=0)
				vRequest:=""
			End if 
		Else 
			If (Character code:C91(Substring:C12(vRequest; 1; 1))=215)
				vRequest:=Substring:C12(vRequest; 2; 32000)
			End if 
			xNext:=0
			OK:=1
		End if 
		$0:=Str_StripDel(Substring:C12(vRequest; 1; 51))
	End if 
End if 
<>StartProc:=False:C215
<>Keys:=""
ERR_MethodTrackerReturn("Gen_Search"; $_t_oldMethodName)