//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ListSet
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
	C_BOOLEAN:C305(<>SM_isHidden; <>SYS_bo_CurrentWindowModal; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>newSetsProcess; <>RecBarUp; $_l_CurrentTableNumber; $_l_OK; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_RecordInSelection; $_l_TableNumber; $_l_WindowReferenceRow; cEnvelopes)
	C_LONGINT:C283(cExport; cLabels; cLetters; cList; cOC; SM_l_QueryTable; vAny; vNo; vNo2; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Table; $2)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $_t_processName; $1; $Set)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ListSet")
//Gen_ListSet
$_l_CurrentTableNumber:=0
If (Count parameters:C259<2)
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
	If ($_t_MenuItemParameter#"")
		$_l_CurrentTableNumber:=Num:C11($_t_MenuItemParameter)
	End if 
Else 
	$_l_CurrentTableNumber:=Table:C252($2)
End if 

If (Macintosh option down:C545) | (Windows Alt down:C563)
	Menu_Record("Gen_ListSet"; "Set Functions ...")
	<>SYS_bo_CurrentWindowModal:=True:C214
	Open_AnyTypeWindow(196; 330; 5; "Set Functions")
	DIALOG:C40([COMPANIES:2]; "dAsk_Set")
	If (SM_l_QueryTable=0)
		SM_l_QueryTable:=$_l_CurrentTableNumber
		$_l_TableNumber:=SM_l_QueryTable
		$_l_RecordInSelection:=Records in selection:C76(Table:C252($_l_TableNumber)->)
		
		
	Else 
		$_l_TableNumber:=SM_l_QueryTable
		$_l_RecordInSelection:=Records in selection:C76(Table:C252($_l_TableNumber)->)
	End if 
	
	
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	<>SYS_bo_CurrentWindowModal:=False:C215
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	If ($_l_OK=1)
		If (Count parameters:C259=0)
			$Set:="Master"
		Else 
			$Set:=$1
		End if 
		$_ptr_Table:=Table:C252($_l_TableNumber)
		Case of 
			: (cList=1)
				Gen_Confirm("Please show me the Set to Use"; ""; "")
				If (OK=1)
					LOAD SET:C185($_ptr_Table->; $Set; "")
					If (OK=1)
						USE SET:C118($Set)
						vAny:=1
					End if 
				End if 
			: (cLetters=1)
				Gen_Confirm("Please name the Set to Save"; ""; "")
				If (OK=1)
					CREATE SET:C116($_ptr_Table->; $Set)
					SAVE SET:C184($Set; "")
				End if 
			: (cLabels=1)
				Gen_Confirm("Please show me the Set to Unite"; ""; "")
				If (OK=1)
					LOAD SET:C185($_ptr_Table->; $Set; "")
					If (OK=1)
						CREATE SET:C116($_ptr_Table->; "Extra")
						UNION:C120($Set; "Extra"; $Set)
						USE SET:C118($Set)
						vAny:=1
					End if 
				End if 
			: (cEnvelopes=1)
				Gen_Confirm("Please show me the Set to Intersect"; ""; "")
				If (OK=1)
					LOAD SET:C185($_ptr_Table->; $Set; "")
					If (OK=1)
						CREATE SET:C116($_ptr_Table->; "Extra")
						INTERSECTION:C121($Set; "Extra"; $Set)
						USE SET:C118($Set)
						vAny:=1
					End if 
				End if 
			: (cExport=1)
				Gen_Confirm("Please show me the Set to Compare"; ""; "")
				If (OK=1)
					LOAD SET:C185($_ptr_Table->; $Set; "")
					If (OK=1)
						CREATE SET:C116($_ptr_Table->; "Extra")
						DIFFERENCE:C122($Set; "Extra"; $Set)
						USE SET:C118($Set)
						vAny:=1
					End if 
				End if 
			: (cOC=1)
				Gen_Confirm("Please show me the Set to Compare"; ""; "")
				If (OK=1)
					LOAD SET:C185($_ptr_Table->; $Set; "")
					If (OK=1)
						CREATE SET:C116($_ptr_Table->; "Extra")
						DIFFERENCE:C122("Extra"; $Set; $Set)
						USE SET:C118($Set)
						vAny:=1
					End if 
				End if 
		End case 
		// If (Count parameters=0)
		//  CLEAR SET("Set")
		// End if
	End if 
	If (OK=1)
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
			: ($_l_TableNumber=Table:C252(->[DIARY:12]))
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
				QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
		End case 
		
		vNo:=Records in selection:C76($_ptr_Table->)
		
		vNo2:=0
	End if 
	
Else 
	
	//here we check if the NEW sets process if running
	PROCESS PROPERTIES:C336(<>NewSetsProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
	If ($_t_processName#"Set Manager")
		<>newSetsProcess:=0
		
	Else 
		If ($_l_ProcessState<0)
			<>newSetsProcess:=0
			
		End if 
	End if 
	
	If (<>newSetsProcess=0)
		
		If (SM_l_QueryTable=0)
			If (Is nil pointer:C315(Current default table:C363))
				SM_l_QueryTable:=1
				$_l_TableNumber:=SM_l_QueryTable
				$_l_RecordInSelection:=Records in selection:C76(Table:C252($_l_TableNumber)->)
			Else 
				$_l_TableNumber:=Table:C252(Current default table:C363)
				$_l_RecordInSelection:=Records in selection:C76
			End if 
			
		Else 
			$_l_TableNumber:=SM_l_QueryTable
			$_l_RecordInSelection:=Records in selection:C76(Table:C252($_l_TableNumber)->)
			
			
		End if 
		$_l_Process:=Current process:C322
		<>newSetsProcess:=New process:C317("Gen_SetManager"; 256000; "Set Manager"; $_l_TableNumber; $_l_RecordInSelection; $_l_Process)
		
		
	Else 
		If (SM_l_QueryTable=0)
			$_l_TableNumber:=Table:C252(Current default table:C363)
			$_l_RecordInSelection:=Records in selection:C76
			
		Else 
			$_l_TableNumber:=SM_l_QueryTable
			$_l_RecordInSelection:=Records in selection:C76(Table:C252($_l_TableNumber)->)
			
			
		End if 
		<>SM_isHidden:=False:C215
		If (SM_l_QueryTable=0)
			Out_SetManger
		Else 
			Out_SetManger(Table:C252(SM_l_QueryTable))
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("Gen_ListSet"; $_t_oldMethodName)