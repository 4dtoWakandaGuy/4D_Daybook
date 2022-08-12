//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ShowTel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_RecordNumber; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $1; $2; vContName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ShowTel")
If (Gen_Option=True:C214)
	Gen_ShowTelDial([COMPANIES:2]Telephone:9)
Else 
	If (Count parameters:C259=0)
		$_l_RecordNumber:=Record number:C243([COMPANIES:2])
		CUT NAMED SELECTION:C334([COMPANIES:2]; "Companies")
		If ($_l_RecordNumber>0)
			GOTO RECORD:C242([COMPANIES:2]; $_l_RecordNumber)
		End if 
		<>SYS_bo_CurrentWindowModal:=True:C214
		Open_Any_Window(210; 370)
		DIALOG:C40([CONTACTS:1]; "dShow_Tel")
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		<>SYS_bo_CurrentWindowModal:=False:C215
		USE NAMED SELECTION:C332("Companies")
		vContName:=[CONTACTS:1]Contact_Name:31
	Else 
		$_l_RecordNumber:=Record number:C243([COMPANIES:2])
		CUT NAMED SELECTION:C334([COMPANIES:2]; "Companies")
		If ($_l_RecordNumber>0)
			GOTO RECORD:C242([COMPANIES:2]; $_l_RecordNumber)
		End if 
		If ([COMPANIES:2]Company_Code:1#$1) & ($1#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
		Else 
			If ($1="")
				REDUCE SELECTION:C351([COMPANIES:2]; 0)
			End if 
			
		End if 
		If ([CONTACTS:1]Contact_Code:2#$2) & ($2#"")
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$2)
		Else 
			If ($2="")
				REDUCE SELECTION:C351([CONTACTS:1]; 0)
			End if 
		End if 
		
		
		<>SYS_bo_CurrentWindowModal:=True:C214
		Open_Any_Window(210; 370)
		DIALOG:C40([CONTACTS:1]; "dShow_Tel")
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		<>SYS_bo_CurrentWindowModal:=False:C215
		USE NAMED SELECTION:C332("Companies")
		vContName:=[CONTACTS:1]Contact_Name:31
		
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ShowTel"; $_t_oldMethodName)