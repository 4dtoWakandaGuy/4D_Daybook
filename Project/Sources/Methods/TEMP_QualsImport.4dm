//%attributes = {}
If (False:C215)
	//Project Method Name:      TEMP_QualsImport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_TableCount; 0)
	C_BOOLEAN:C305($_bo_ExitLoop; $_bo_Ok)
	C_LONGINT:C283($_l_Index; $_l_RecordNumber; $_l_ScreenCentre; $_l_TableCount; $_l_TableNumber; $_l_TIckCount; $_l_WIndowBottom; $_l_WIndowReference; $_l_WIndowRight; $_l_WIndowTop; $_l_CurrentWinRefOLD)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_CarriageReturn; $_t_oldMethodName; $_t_TableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TEMP_QualsImport")

$_t_CarriageReturn:=Char:C90(13)

CONFIRM:C162("OK to import and replace records")
If (OK=1)
	
	$_l_ScreenCentre:=(Screen width:C187-420)/2
	$_l_WIndowRight:=$_l_ScreenCentre+420
	$_l_WIndowTop:=(Screen height:C188-230)/2
	$_l_WIndowBottom:=$_l_WIndowTop+230
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	$_l_WIndowReference:=Open window:C153($_l_ScreenCentre; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom; 4; "Import records")
	WIN_l_CurrentWinRef:=$_l_WIndowReference
	$_l_TableCount:=Get last table number:C254
	ARRAY LONGINT:C221($_al_TableCount; 3)
	$_al_TableCount{1}:=55
	$_al_TableCount{2}:=95
	$_al_TableCount{3}:=111
	For ($_l_Index; 1; Size of array:C274($_al_TableCount))
		If (Is table number valid:C999($_l_Index))
			$_l_TableNumber:=$_al_TableCount{$_l_Index}
			ERASE WINDOW:C160
			$_t_TableName:="TBL"+String:C10($_l_TableNumber; "000")+".txt"
			$_ptr_Table:=Table:C252($_l_TableNumber)
			GOTO XY:C161(3; 2)
			MESSAGE:C88("Opening "+$_t_TableName+" data-file ..."+$_t_CarriageReturn)
			SET CHANNEL:C77(11)
			SET CHANNEL:C77(10; $_t_TableName)
			If (OK=1)
				GOTO XY:C161(3; 4)
				MESSAGE:C88("Importing data for "+Table name:C256($_l_TableNumber))
				If (OK=1)
					If (OK=1)
						$_bo_Ok:=True:C214
						ALL RECORDS:C47($_ptr_Table->)
						DELETE SELECTION:C66($_ptr_Table->)
						$_l_RecordNumber:=0
						$_l_TIckCount:=((Current time:C178*1)*60)
						$_bo_ExitLoop:=False:C215
						$_l_RecordNumber:=0
						Repeat 
							//  For ($_l_RecordNumber;1;$_l_RecordsInSelection)
							RECEIVE RECORD:C79(Table:C252($_l_TableNumber)->)
							$_bo_Ok:=(OK=1)
							$_l_RecordNumber:=$_l_RecordNumber+1
							If ($_bo_Ok)
								GOTO XY:C161(3; 6)
								MESSAGE:C88("Saving record "+String:C10($_l_RecordNumber)+" in file.")
								GOTO XY:C161(3; 10)
								DB_SaveRecord(Table:C252($_l_TableNumber))
							Else 
								$_bo_ExitLoop:=True:C214
							End if 
							UNLOAD RECORD:C212(Table:C252($_l_TableNumber)->)
						Until ($_bo_ExitLoop)
						
					End if 
				End if 
			End if 
			SET CHANNEL:C77(11)
			UNLOAD RECORD:C212($_ptr_Table->)
			REDUCE SELECTION:C351($_ptr_Table->; 0)
		End if 
	End for 
	UPD_CheckQualities
	
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
ERR_MethodTrackerReturn("TEMP_QualsImport"; $_t_oldMethodName)