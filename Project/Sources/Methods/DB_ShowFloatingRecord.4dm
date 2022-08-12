//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ShowFloatingRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2012 10:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>FloatingRecordProcess; $_l_RecordNumber; $_l_Row; $1; $5; $6; $7; $8; FW_l_ColumnLeft; FW_l_ColumnRight; FW_l_CurrentCellFieldNumber)
	C_LONGINT:C283(FW_l_CurrentRecord; FW_l_CUrrentTable; FW_l_FloatType; FW_l_MouseTop; FW_l_ParentProcess)
	C_POINTER:C301($_ptr_Table)
	C_REAL:C285($2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ShowFloatingRecord")

//the idea is to show either a whole record or a record portion
//this method should be passed the parent(current)process(for call back) the mouse left and the mouse top , the table number and the contents of the current cell
If (Count parameters:C259>=6)
	//TRACE
	FW_l_ParentProcess:=$1
	FW_l_ColumnLeft:=$2
	FW_l_ColumnRight:=$3
	FW_l_MouseTop:=$4
	FW_l_CUrrentTable:=$5
	FW_l_CurrentCellFieldNumber:=$6
	FW_l_FloatType:=$7  //0=None 1=Field 2=record the field float is only offered for picture and text type data
	$_l_Row:=$8
	If (FW_l_ParentProcess=Current process:C322)
		If (FW_l_FloatType>0) & ($_l_Row#0)  //only respond if the cell should show a floating window
			$_ptr_Table:=Table:C252(FW_l_CUrrentTable)
			If ($8>0)
				GOTO SELECTED RECORD:C245($_ptr_Table->; $_l_Row)
				$_l_RecordNumber:=Record number:C243($_ptr_Table->)
			Else 
				$_l_RecordNumber:=Record number:C243($_ptr_Table->)
			End if 
			
			
			If ($_l_RecordNumber>=0)
				If (<>FloatingRecordProcess=0)
					<>FloatingRecordProcess:=New process:C317("DB_ShowFloatingRecord"; 256000; "Current Record"; FW_l_ParentProcess; FW_l_ColumnLeft; FW_l_ColumnRight; FW_l_MouseTop; FW_l_CUrrentTable; FW_l_CurrentCellFieldNumber; FW_l_FloatType; $_l_RecordNumber)
					
				Else 
					//TRACE
					//HIDE PROCESS(<>FloatingRecordProcess)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_ParentProcess; FW_l_ParentProcess)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_ColumnLeft; FW_l_ColumnLeft)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_ColumnRight; FW_l_ColumnRight)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_MouseTop; FW_l_MouseTop)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_CUrrentTable; FW_l_CUrrentTable)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_CurrentCellFieldNumber; FW_l_CurrentCellFieldNumber)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_FloatType; FW_l_FloatType)
					SET PROCESS VARIABLE:C370(<>FloatingRecordProcess; FW_l_CurrentRecord; $_l_RecordNumber)
					
					RESUME PROCESS:C320(<>FloatingRecordProcess)
					POST OUTSIDE CALL:C329(<>FloatingRecordProcess)
				End if 
			Else 
				If (<>FloatingRecordProcess>0)
					HIDE PROCESS:C324(<>FloatingRecordProcess)
				End if 
			End if 
		Else 
			
			If (<>FloatingRecordProcess>0)
				HIDE PROCESS:C324(<>FloatingRecordProcess)
			End if 
		End if 
	Else 
		//$CurrentDisplayedWindowtable:=0
		FW_l_ParentProcess:=$1
		FW_l_ColumnLeft:=$2
		FW_l_ColumnRight:=$3
		FW_l_MouseTop:=$4
		FW_l_CUrrentTable:=$5
		FW_l_CurrentCellFieldNumber:=$6
		FW_l_FloatType:=$7
		FW_l_CurrentRecord:=$8
		
		Open window:C153(FW_l_ColumnRight; FW_l_MouseTop; FW_l_ColumnRight; FW_l_MouseTop; -1984)
		DIALOG:C40("DB_ShowFloatingPicture")
		<>FloatingRecordProcess:=0
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_ShowFloatingRecord"; $_t_oldMethodName)