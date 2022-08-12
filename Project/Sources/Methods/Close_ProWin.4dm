//%attributes = {}
If (False:C215)
	//Project Method Name:      Close_ProWin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 15:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>PRC_abo_FirstWindow;0)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY LONGINT(<>PRC_al_UniqueID;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY LONGINT(<>WIN_al_WindowID;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_BOOLEAN:C305(<>ProcInited; Proc_bo_IgnoreCalledBy; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CurrentWindowRef; $_l_CurrentWindowRow; $_l_NextWindowID; $_l_Repeats; $_l_Retries; $_l_WindowID; $_l_WindowReferenceRow; $_l_WindowRow; icancel; vProc)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Close_ProWin")


//Close_ProWin
If (Not:C34(<>ProcInited))
	$_l_Retries:=0
	While (Semaphore:C143("$InitingProcs"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(6*$_l_Retries)
	End while 
	If (Not:C34(<>ProcInited))
		ARRAY BOOLEAN:C223(<>PRC_abo_FirstWindow; 0)
		ARRAY LONGINT:C221(<>PRC_al_ProcessNum; 0)
		ARRAY TEXT:C222(<>PRC_at_ProcessName; 0)
		//ARRAY INTEGER(◊aProcMess;$1)
		ARRAY LONGINT:C221(<>PRC_al_ProcessCalledBy; 0)
		ARRAY LONGINT:C221(<>PRC_al_WindowReference; 0)
		ARRAY LONGINT:C221(<>PRC_al_UniqueID; 0)
		ARRAY LONGINT:C221(<>PRC_al_ProcessState; 0)
		<>ProcInited:=True:C214
	End if 
	CLEAR SEMAPHORE:C144("$InitingProcs")
	
End if 
If (vProc>0)
	$_l_CurrentWindowRef:=WIN_l_CurrentWinRef  // Frontmost window
	If (Count parameters:C259>=1)
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $1)
	End if 
	
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	//WS_KEEPFOCUS
	
	If (icancel=1)
		icancel:=0
	End if 
	$_l_Retries:=0
	While (Semaphore:C143("$ProcArr"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End while 
	$_l_CurrentWindowRow:=Find in array:C230(<>WIN_al_WindowID; $_l_CurrentWindowRef)
	If ($_l_CurrentWindowRow>0)
		//$_t_oldMethodName2:=ERR_MethodTracker ("Close_ProWin $_l_CurrentWindowRow >0")
		$_l_WindowID:=<>WIN_al_WindowID{$_l_CurrentWindowRow}
		<>WIN_al_WindowID{$_l_CurrentWindowRow}:=0
		
		
		//◊PRC_abo_FirstWindow{$_l_CurrentWindowRow}:=False
		$_l_WindowRow:=Find in array:C230(<>PRC_al_WindowReference; $_l_WindowID)
		If ($_l_WindowRow>0)
			<>PRC_al_ProcessCalledBy{$_l_WindowRow}:=0
			<>PRC_abo_FirstWindow{$_l_WindowRow}:=False:C215
			<>PRC_al_WindowReference{$_l_WindowRow}:=0
			If ($_l_CurrentWindowRow=1)
				$_l_CurrentWindowRow:=Size of array:C274(<>WIN_al_WindowID)+1
			End if 
			$_l_Repeats:=0
			Repeat 
				//$_t_oldMethodName2:=ERR_MethodTracker ("Repeat a $_l_CurrentWindowRow+"+String($_l_CurrentWindowRow))
				
				If ($_l_CurrentWindowRow>1)
					$_l_Retries:=0
					
					Repeat 
						//$_t_oldMethodName2:=ERR_MethodTracker ("Repeat B $_l_CurrentWindowRow+"+String($_l_CurrentWindowRow))
						If ($_l_CurrentWindowRow>1)
							$_l_NextWindowID:=<>WIN_al_WindowID{$_l_CurrentWindowRow-1}
							If ($_l_NextWindowID=0)
								$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
							End if 
						Else 
							$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
						End if 
						
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>99)
							ALERT:C41("Stopped at Close_ProWin 12")
						End if 
					Until ($_l_NextWindowID#0) | ($_l_CurrentWindowRow<=0)
					If ($_l_CurrentWindowRow>0)
						$_l_WindowRow:=Find in array:C230(<>PRC_al_WindowReference; $_l_NextWindowID)
						If ($_l_WindowRow>0)
							If (<>PRC_al_ProcessState{$_l_WindowRow}>=0) & (<>PRC_al_WindowReference{$_l_WindowRow}#0)
								//$_t_oldMethodName2:=ERR_MethodTracker ("Bring to fron process+"+Process_Name (◊PRC_al_ProcessNum{$_l_WindowRow}))
								
								BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_WindowRow})
								$_l_CurrentWindowRow:=0
							Else 
								$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
							End if 
						Else 
							$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
						End if 
					Else 
						
					End if 
				Else 
					$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
				End if 
				$_l_Repeats:=$_l_Repeats+1
				If ($_l_Repeats>99)
					ALERT:C41("Stopped at Close_ProWin 13")
				End if 
				
			Until ($_l_CurrentWindowRow<=0)
		Else 
			Repeat 
				If ($_l_CurrentWindowRow>1)
					Repeat 
						If ($_l_CurrentWindowRow>1)
							$_l_NextWindowID:=<>WIN_al_WindowID{$_l_CurrentWindowRow-1}
							If ($_l_NextWindowID=0)
								$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
							End if 
						Else 
							$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
						End if 
						
					Until ($_l_NextWindowID#0) | ($_l_CurrentWindowRow<=0)
					If ($_l_CurrentWindowRow>0)
						$_l_WindowRow:=Find in array:C230(<>PRC_al_WindowReference; $_l_NextWindowID)
						If ($_l_WindowRow>0)
							If (<>PRC_al_ProcessState{$_l_WindowRow}>=0) & (<>PRC_al_WindowReference{$_l_WindowRow}#0)
								
								BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_WindowRow})
								$_l_CurrentWindowRow:=0
							Else 
								$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
							End if 
						Else 
							$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
						End if 
					Else 
						
					End if 
				Else 
					$_l_CurrentWindowRow:=$_l_CurrentWindowRow-1
				End if 
			Until ($_l_CurrentWindowRow<=0)
			
		End if 
	End if 
	CLEAR SEMAPHORE:C144("$ProcArr")
End if 
ERR_MethodTrackerReturn("Close_ProWin"; $_t_oldMethodName)