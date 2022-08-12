//%attributes = {}
If (False:C215)
	//Project Method Name:      TBL_IMPORT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TriggerTable;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_AverageSeconds; $_l_CurrentWinRefOLD; $_l_MessageCounter; $_l_NextSequenceNumber; $_l_RecordNumber; $_l_RecordsInSelection; $_l_RecordsToGo; $_l_ScreenCentre; $_l_SecondsToGo; $_l_TableCount; $_l_TableNumber)
	C_LONGINT:C283($_l_TicksElapsed; $_l_TicksStart; $_l_TIcksToGo; $_l_WIndowBottom; $_l_WIndowReference; $_l_WIndowRight; $_l_WIndowTop; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_CarriageReturn; $_t_documentPath; $_t_oldMethodName; $_t_TableName)
	C_TIME:C306($_ti_StartTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TBL_IMPORT")

$_t_CarriageReturn:=Char:C90(13)

CONFIRM:C162("OK to import and replace records in ALL tables?")
If (OK=1)
	$_t_documentPath:=DB_SelectDocument(""; "TEXT"; "Select the file containing the contacts"; 0)
	If (OK=1)
		$_t_documentPath:=PathFromPathName($_t_documentPath)
		
		$_l_ScreenCentre:=(Screen width:C187-420)/2
		$_l_WIndowRight:=$_l_ScreenCentre+420
		$_l_WIndowTop:=(Screen height:C188-230)/2
		$_l_WIndowBottom:=$_l_WIndowTop+230
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		
		$_l_WIndowReference:=Open window:C153($_l_ScreenCentre; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom; 4; "Import records")
		WIN_l_CurrentWinRef:=$_l_WIndowReference
		$_l_TableCount:=Get last table number:C254
		
		For ($_l_TableNumber; 1; $_l_TableCount)
			If (Is table number valid:C999($_l_TableNumber))
				ERASE WINDOW:C160
				$_t_TableName:="TBL"+String:C10($_l_TableNumber; "000")+".txt"
				$_ptr_Table:=Table:C252($_l_TableNumber)
				If (Size of array:C274(<>DB_al_TriggerTable)<$_l_TableNumber)
					ARRAY LONGINT:C221(<>DB_al_TriggerTable; $_l_TableNumber)
				End if 
				<>DB_al_TriggerTable{$_l_TableNumber}:=-1
				GOTO XY:C161(3; 2)
				MESSAGE:C88("Opening "+$_t_TableName+" data-file ..."+$_t_CarriageReturn)
				
				SET CHANNEL:C77(11)
				SET CHANNEL:C77(10; $_t_TableName)
				If (OK=1)
					GOTO XY:C161(3; 4)
					MESSAGE:C88("Importing data for "+Table name:C256($_l_TableNumber))
					
					RECEIVE VARIABLE:C81($_l_RecordsInSelection)
					If (OK=1)
						RECEIVE VARIABLE:C81($_l_NextSequenceNumber)
						If (OK=1)
							$_bo_OK:=True:C214
							
							ALL RECORDS:C47($_ptr_Table->)
							DELETE SELECTION:C66($_ptr_Table->)
							
							$_l_RecordNumber:=0
							$_l_TicksStart:=Tickcount:C458
							$_ti_StartTime:=Current time:C178(*)*1
							$_l_MessageCounter:=0
							For ($_l_RecordNumber; 1; $_l_RecordsInSelection)
								RECEIVE RECORD:C79(Table:C252($_l_TableNumber)->)
								$_bo_OK:=(OK=1)
								If ($_bo_OK)
									GOTO XY:C161(3; 6)
									MESSAGE:C88("Saving record "+String:C10($_l_RecordNumber)+" of "+String:C10($_l_RecordsInSelection)+" in file.")
									$_l_MessageCounter:=$_l_MessageCounter+1
									If ($_l_MessageCounter>=10)
										If (($_l_MessageCounter/10)=(Int:C8($_l_MessageCounter/10)))
											$_l_TicksElapsed:=Tickcount:C458-$_l_TicksStart
											$_l_AverageSeconds:=$_l_RecordNumber/$_l_TicksElapsed
											$_l_RecordsToGo:=$_l_RecordsInSelection-$_l_RecordNumber
											$_l_TIcksToGo:=$_l_RecordsToGo*$_l_AverageSeconds
											$_l_SecondsToGo:=Int:C8($_l_TIcksToGo/60)
											
											$_l_AverageSeconds:=Int:C8((Tickcount:C458-$_l_TicksStart)/$_l_RecordNumber*($_l_RecordsInSelection-$_l_RecordNumber)/60)
											//GOTO XY(3;10)
											//MESSAGE("Time to go is approx. "+String($_l_AverageSeconds)+" seconds ...")
											GOTO XY:C161(3; 10)
											MESSAGE:C88("Time to go is approx. "+String:C10($_l_SecondsToGo)+" seconds ...")
											
											$_l_MessageCounter:=0
										End if 
									End if 
									DB_SaveRecord(Table:C252($_l_TableNumber); False:C215)
								End if 
								UNLOAD RECORD:C212(Table:C252($_l_TableNumber)->)
							End for 
						End if 
					End if 
				End if 
				SET CHANNEL:C77(11)
				<>DB_al_TriggerTable{$_l_TableNumber}:=0
				UNLOAD RECORD:C212($_ptr_Table->)
				REDUCE SELECTION:C351($_ptr_Table->; 0)
				
				//  While (Sequence number($_ptr_Table->)<$_l_NextSequenceNumber)
				//WE DONT NEED TO DO THIS
				//BECAUSE NOWHERE USES SEQUENCE NUMBERS NOW
				//CREATE RECORD($_ptr_Table->)
				//  DB_SaveRecord($_ptr_Table)
				// DELETE RECORD($_ptr_Table->)
				// End while
			End if 
			
		End for 
		
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
End if 
ERR_MethodTrackerReturn("TBL_IMPORT"; $_t_oldMethodName)
