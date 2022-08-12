//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Letter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CurrentWinRefOLD; $_l_DockSizeRight; $_l_Index; $_l_WindowLeft; $_l_WindowRight; $3; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2; vLetterCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Letter")

If ($1->#"")
	Letters_Sel2($1->)
	If (Count parameters:C259>=3)
		CREATE SET:C116([DOCUMENTS:7]; "$temp")
		CREATE EMPTY SET:C140([DOCUMENTS:7]; "$TypeMatch")
		For ($_l_Index; 3; Count parameters:C259)
			USE SET:C118("$Temp")
			QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=${$_l_Index})
			If (Records in selection:C76([DOCUMENTS:7])>0)
				CREATE SET:C116([DOCUMENTS:7]; "$Temp2")
				UNION:C120("$Temp2"; "$TypeMatch"; "$TypeMatch")
				CLEAR SET:C117("$Temp2")
			End if 
			
		End for 
		USE SET:C118("$TypeMatch")
		CLEAR SET:C117("$TypeMatch")
		CLEAR SET:C117("$Temp")
	End if 
	If (Records in selection:C76([DOCUMENTS:7])>0)
		If (Records in selection:C76([DOCUMENTS:7])=1)
			$1->:=[DOCUMENTS:7]Document_Code:1
		Else 
			vLetterCode:=""
			Check_DispNum(->[DOCUMENTS:7]; "Documents")
			If (OK=1)
				CREATE SET:C116([DOCUMENTS:7]; "Master2")
				Letters_Arr
				$_l_DockSizeRight:=INT_GetDock("R")
				$_l_WindowLeft:=(Screen width:C187-$_l_DockSizeRight)-368
				$_l_WindowRight:=(Screen width:C187-$_l_DockSizeRight)
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; <>SYS_l_WindowTop+50; $_l_WindowRight; <>SYS_l_WindowTop+261; 4; "Select a Document"; "Close_Cancel")
				DIALOG:C40([DOCUMENTS:7]; "dAsk_Letter")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
				WS_KeepFocus
				
				Array_LCx(0)
				CLEAR SET:C117("Master2")
				If (OK=0)
					GOTO OBJECT:C206($1->)
				End if 
			Else 
				GOTO OBJECT:C206($1->)
			End if 
			$1->:=vLetterCode
		End if 
		If ([DOCUMENTS:7]Document_Code:1#$1->)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$1->)
		End if 
		//  $p:=Get pointer("v"+$2)
		//   $p»:=[DOCUMENTS]Heading
	Else 
		Gen_Alert("That Document does not exist"; "Try again")
		$1->:=""
		GOTO OBJECT:C206($1->)
	End if 
Else 
	// $p:=Get pointer("v"+$2)
	//$p»:=""
End if 
ERR_MethodTrackerReturn("Check_Letter"; $_t_oldMethodName)