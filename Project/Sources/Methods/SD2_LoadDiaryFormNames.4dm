//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadDiaryFormNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_RealFormPage;0)
	//ARRAY LONGINT(SD2_al_RealFormTable;0)
	//ARRAY TEXT(SD2_at_DiaryEntryForm;0)
	//ARRAY TEXT(SD2_at_FormActionCodes;0;0)
	//ARRAY TEXT(SD2_at_RealFormName;0)
	C_BOOLEAN:C305($_bo_TimeSheet)
	C_LONGINT:C283($_l_CurrentRow; $_l_TableRow)
	C_POINTER:C301($4)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryFormNames")


Case of 
	: (Count parameters:C259=0)
		ARRAY TEXT:C222(SD2_at_FormActionCodes; 0; 0)  // this dynamic array will get populated when somebody tries to load a form
		//it is to reduce the need to go through all the action codes to find which ones use a given form
		ARRAY TEXT:C222(SD2_at_DiaryEntryForm; 7)
		ARRAY TEXT:C222(SD2_at_RealFormName; 7)
		ARRAY LONGINT:C221(SD2_al_RealFormPage; 7)
		ARRAY LONGINT:C221(SD2_al_RealFormTable; 7)
		SD2_at_DiaryEntryForm{1}:="Standard Scheduled Item Entry"
		SD2_at_RealFormName{1}:="SD2_DefScheduleEntry"
		SD2_al_RealFormPage{1}:=1
		SD2_al_RealFormTable{1}:=Table:C252(->[DIARY:12])
		
		SD2_at_DiaryEntryForm{2}:="Simple Note Entry"
		SD2_at_RealFormName{2}:="SD2_SimpleEntry"
		SD2_al_RealFormPage{2}:=2
		SD2_al_RealFormTable{2}:=Table:C252(->[USER:15])
		
		SD2_at_DiaryEntryForm{3}:="Simple Contact Note Entry"
		SD2_at_RealFormName{3}:="SD2_SimpleEntry"
		SD2_al_RealFormPage{3}:=3
		SD2_al_RealFormTable{3}:=Table:C252(->[USER:15])
		
		SD2_at_DiaryEntryForm{4}:="Simple Workflow Task entry"
		SD2_at_RealFormName{4}:="SD2_SimpleEntry"
		SD2_al_RealFormPage{4}:=4
		SD2_al_RealFormTable{4}:=Table:C252(->[USER:15])
		
		
		$_l_CurrentRow:=4
		$_bo_TimeSheet:=False:C215
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_at_DiaryEntryForm{$_l_CurrentRow}:="Simple Service Call entry"
			SD2_at_RealFormName{$_l_CurrentRow}:="SD2_SimpleEntry"
			SD2_al_RealFormPage{$_l_CurrentRow}:=5
			SD2_al_RealFormTable{$_l_CurrentRow}:=Table:C252(->[USER:15])
			
			$_bo_TimeSheet:=True:C214
			$_l_CurrentRow:=$_l_CurrentRow+1
			SD2_at_DiaryEntryForm{$_l_CurrentRow}:="Simple Time Sheet entry"
			SD2_at_RealFormName{$_l_CurrentRow}:="SD2_SimpleEntry"
			SD2_al_RealFormPage{$_l_CurrentRow}:=6
			SD2_al_RealFormTable{$_l_CurrentRow}:=Table:C252(->[USER:15])
			
		End if 
		
		
		
		ARRAY TEXT:C222(SD2_at_DiaryEntryForm; $_l_CurrentRow)
		ARRAY TEXT:C222(SD2_at_RealFormName; $_l_CurrentRow)
		ARRAY LONGINT:C221(SD2_al_RealFormPage; $_l_CurrentRow)
		ARRAY LONGINT:C221(SD2_al_RealFormTable; $_l_CurrentRow)
		ARRAY TEXT:C222(SD2_at_FormActionCodes; $_l_CurrentRow; 0)  // this dynamic array will get populated when somebody tries to load a form
		//it is to reduce the need to go through all the action codes to find which ones use a given form
	: (Count parameters:C259>=3)  //$1=is a recording of a action after the event('done item') `$2=show original item `$3 current selected form name
		ARRAY TEXT:C222(SD2_at_DiaryEntryForm; 99)
		ARRAY TEXT:C222(SD2_at_RealFormName; 99)
		ARRAY LONGINT:C221(SD2_al_RealFormPage; 99)
		ARRAY LONGINT:C221(SD2_al_RealFormTable; 99)
		
		If ($2=1)  // regardless of whether recording a done item
			//ENTRY OF A DIARY 'RELATED' RECORD
			//CHECK WHICH TABLES THIS IS RELATED TO-THAT WILL ADJUST THE LIST OF AVAILABLE FORMS
			If (Size of array:C274($4->)>0)
				//ONLY SET FORMS APPLICABLE TO THOSE TABLES
				$_l_CurrentRow:=0
				$_bo_TimeSheet:=False:C215
				$_l_TableRow:=Find in array:C230($4->; Table:C252(->[JOB_STAGES:47]))
				If ($_bo_TimeSheet=False:C215)
					$_l_CurrentRow:=$_l_CurrentRow+1
					SD2_at_DiaryEntryForm{$_l_CurrentRow}:="Simple Time Sheet entry"
					SD2_at_RealFormName{$_l_CurrentRow}:="SD2_SimpleEntry"
					SD2_al_RealFormPage{$_l_CurrentRow}:=6
					SD2_al_RealFormTable{$_l_CurrentRow}:=Table:C252(->[USER:15])
					$_bo_TimeSheet:=True:C214
					
				End if 
				
				$_l_TableRow:=Find in array:C230($4->; Table:C252(->[SERVICE_CALLS:20]))
				If ($_l_TableRow>0)
					$_l_CurrentRow:=$_l_CurrentRow+1
					SD2_at_DiaryEntryForm{$_l_CurrentRow}:="Simple Service Call entry"
					SD2_at_RealFormName{$_l_CurrentRow}:="SD2_SimpleEntry"
					SD2_al_RealFormPage{$_l_CurrentRow}:=5
					SD2_al_RealFormTable{$_l_CurrentRow}:=Table:C252(->[USER:15])
					If ($_bo_TimeSheet=False:C215)
						$_bo_TimeSheet:=True:C214
						$_l_CurrentRow:=$_l_CurrentRow+1
						SD2_at_DiaryEntryForm{$_l_CurrentRow}:="Simple Time Sheet entry"
						SD2_at_RealFormName{$_l_CurrentRow}:="SD2_SimpleEntry"
						SD2_al_RealFormPage{$_l_CurrentRow}:=6
						SD2_al_RealFormTable{$_l_CurrentRow}:=Table:C252(->[USER:15])
					End if 
				End if 
			Else 
				//NO TABLES SELECTED-SET ALL
				SD2_LoadDiaryFormNames
				$_l_CurrentRow:=-1
			End if 
			
		Else 
			If ($1=1)
				//RECORDING OF A DONE ACTION
				SD2_at_DiaryEntryForm{1}:="Simple Note Entry"
				SD2_at_RealFormName{1}:="SD2_SimpleEntry"
				SD2_al_RealFormPage{1}:=2
				SD2_al_RealFormTable{1}:=Table:C252(->[USER:15])
				
				SD2_at_DiaryEntryForm{2}:="Simple Contact Note Entry"
				SD2_at_RealFormName{2}:="SD2_SimpleEntry"
				SD2_al_RealFormPage{2}:=3
				SD2_al_RealFormTable{2}:=Table:C252(->[USER:15])
				
				SD2_at_DiaryEntryForm{3}:="Simple Workflow Task entry"
				SD2_at_RealFormName{3}:="SD2_SimpleEntry"
				SD2_al_RealFormPage{3}:=4
				SD2_al_RealFormTable{3}:=Table:C252(->[USER:15])
				
				$_l_CurrentRow:=3
			Else 
				//NOT A RECORDING OF A DONE ACTION
				$_l_CurrentRow:=-1
				SD2_LoadDiaryFormNames
			End if 
			If ($_l_CurrentRow>=0)
				ARRAY TEXT:C222(SD2_at_DiaryEntryForm; $_l_CurrentRow)
				ARRAY TEXT:C222(SD2_at_RealFormName; $_l_CurrentRow)
				ARRAY LONGINT:C221(SD2_al_RealFormPage; $_l_CurrentRow)
				ARRAY LONGINT:C221(SD2_al_RealFormTable; $_l_CurrentRow)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("SD2_LoadDiaryFormNames"; $_t_oldMethodName)
