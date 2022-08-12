//%attributes = {}
If (False:C215)
	//Project Method Name:      TBL_EXPORT
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
	//ARRAY LONGINT(<>DB_al_TriggerTable;0)
	C_LONGINT:C283($_l_AverageSeconds; $_l_NextSequenceNumber; $_l_RecordNumber; $_l_RecordsInSelection; $_l_ScreenCentre; $_l_TableCount; $_l_TableNumber; $_l_TickCount; $_l_WIndowBottom; $_l_WIndowReference; $_l_WIndowRight)
	C_LONGINT:C283($_l_WIndowTop; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_CarriageReturn; $_t_oldMethodName; $_t_TableName; $data_patname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TBL_EXPORT")
//TBL_EXPORT
$_t_CarriageReturn:=Char:C90(13)
CONFIRM:C162("OK to export records (in 4D format) for ALL tables ?")
If (OK=1)
	$_l_ScreenCentre:=(Screen width:C187-420)/2
	$_l_WIndowRight:=$_l_ScreenCentre+420
	$_l_WIndowTop:=(Screen height:C188-230)/2
	$_l_WIndowBottom:=$_l_WIndowTop+230
	$_l_WIndowReference:=Open window:C153($_l_ScreenCentre; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom; -1984; "Export records")
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=$_l_WIndowReference
	$_l_TableCount:=Get last table number:C254
	
	
	For ($_l_TableNumber; 1; $_l_TableCount)
		If (Is table number valid:C999($_l_TableNumber))
			
			ERASE WINDOW:C160
			$_t_TableName:="TBL"+String:C10($_l_TableNumber; "000")+".txt"
			$_ptr_Table:=Table:C252($_l_TableNumber)
			
			GOTO XY:C161(3; 2)
			MESSAGE:C88("Opening "+$_t_TableName+" data-file ..."+$_t_CarriageReturn)
			
			
			SET CHANNEL:C77(11)
			SET CHANNEL:C77(10; $_t_TableName)
			If (OK=1)
				
				GOTO XY:C161(3; 4)
				MESSAGE:C88("Exporting data for "+Table name:C256($_l_TableNumber))
				If (Size of array:C274(<>DB_al_TriggerTable)<$_l_TableNumber)
					ARRAY LONGINT:C221(<>DB_al_TriggerTable; $_l_TableNumber)
				End if 
				
				<>DB_al_TriggerTable{$_l_TableNumber}:=-1
				ALL RECORDS:C47($_ptr_Table->)
				
				$_l_RecordsInSelection:=Records in selection:C76($_ptr_Table->)
				SEND VARIABLE:C80($_l_RecordsInSelection)
				
				$_l_NextSequenceNumber:=Sequence number:C244($_ptr_Table->)
				SEND VARIABLE:C80($_l_NextSequenceNumber)
				
				FIRST RECORD:C50($_ptr_Table->)
				
				$_l_TickCount:=Tickcount:C458
				For ($_l_RecordNumber; 1; $_l_RecordsInSelection)
					GOTO XY:C161(3; 6)
					MESSAGE:C88("Sending "+String:C10($_l_RecordNumber)+" of "+String:C10($_l_RecordsInSelection))
					GOTO XY:C161(3; 10)
					
					$_l_AverageSeconds:=Int:C8((Tickcount:C458-$_l_TickCount)/$_l_RecordNumber*($_l_RecordsInSelection-$_l_RecordNumber)/60)
					MESSAGE:C88("Time to go is approx. "+String:C10($_l_AverageSeconds)+" seconds ...")
					
					SEND RECORD:C78($_ptr_Table->)
					NEXT RECORD:C51($_ptr_Table->)
					
				End for 
				SET CHANNEL:C77(11)
				
				UNLOAD RECORD:C212($_ptr_Table->)
				REDUCE SELECTION:C351($_ptr_Table->; 0)
				<>DB_al_TriggerTable{$_l_TableNumber}:=0
			End if 
		End if 
	End for 
	
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
ERR_MethodTrackerReturn("TBL_EXPORT"; $_t_oldMethodName)