//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_LoadSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SM_LoadSet
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RecordNumbers; 0)
	//ARRAY LONGINT(SM_al_RecordNumbers;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	C_BOOLEAN:C305(<>Err_bo_ManualHandler; <>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; $_bo_ClearSet; $_bo_RunScript; $2; $3)
	C_LONGINT:C283(<>Err_l_NoError; $_l_CurrentWinRefOLD; $_l_offset; $_l_RecordNumber; $_l_RecordsinSelection; $_l_RecreateIndex; $_l_SetIDRow; $_l_TableContext; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; $1; $4; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_OBJECT:C1216($_obj_Scripts)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $0; SM_t_ScriptName; vMt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_LoadSet")
//Pass this method the ID of a set
//this will find out the class of the set and then either
//retreive it from the blob
//or execute the macro...or do both
//This assumes that the arrays ar
//loaded and upto date so make sure that is the case
ARRAY LONGINT:C221(SM_al_RecordNumbers; 0)

If (Count parameters:C259>=2)
	$_bo_RunScript:=$2
Else 
	$_bo_RunScript:=True:C214
End if 
If (Count parameters:C259>=3)
	$_bo_ClearSet:=$3
Else 
	$_bo_ClearSet:=False:C215
End if 
//we use a longint array to store the record numbers
//this is faster than writing a set to a doc and then reading it back in
//it is more space efficient as only the record ids included in the set are stored
//this means the set will continue to be valid(providing records dont get DELETED!
//or permanently sorted

$0:=""
If (Count parameters:C259>=1)
	$_l_SetIDRow:=Find in array:C230(SM_al_SetitemsID; $1)
	//pass False in $2 to avoid runninng the macro
	//if we are adding/intersecting etc we want to add/intersect to the main set
	//if we are going to update the list
	While (Test semaphore:C652("$SetInuse"))  // Otherwize double click CAN get an error -39
		DelayTicks(2)
	End while 
	If ($_l_SetIDRow>0)
		Case of 
			: (SM_al_SetitemsClassID{$_l_SetIDRow}=853) | ($_bo_RunScript=False:C215)
				
				//just load the set
				//Get the table number of the set and make apointer
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$1)
				$_l_offset:=0
				If (Count parameters:C259<4)
					$_l_TableContext:=SM_al_SetContextItemContextID{$_l_SetIDRow}
				Else 
					$_l_TableContext:=$4
				End if 
				$_l_TableNumber:=SM_TableFromContextID($_l_TableContext)
				$_Ptr_Table:=Table:C252($_l_TableNumber)
				If (Records in selection:C76([USER_SETS:105])>0)
					BLOB TO VARIABLE:C533([USER_SETS:105]SET_BLOB:4; SM_al_RecordNumbers; $_l_offset)
				End if 
				If (Size of array:C274(SM_al_RecordNumbers)>0) & (Not:C34($_bo_ClearSet))
					CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
					<>Err_l_NoError:=-10503  //don't report this error to the user
					CREATE SET FROM ARRAY:C641($_Ptr_Table->; SM_al_RecordNumbers; "TempSet")
					<>Err_l_NoError:=0
					If (<>Err_bo_ManualHandler)
						CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
						WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_windowTop; -1984)
						
						MESSAGE:C88("Sorry this set is damaged-Recreating Now")
						ALL RECORDS:C47($_Ptr_Table->)
						$_l_RecordsinSelection:=Records in selection:C76($_Ptr_Table->)
						ARRAY LONGINT:C221($_al_RecordNumbers; 0)
						For ($_l_RecreateIndex; 1; $_l_RecordsinSelection)
							$_l_RecordNumber:=Record number:C243($_Ptr_Table->)
							$_l_SetIDRow:=Find in array:C230(SM_al_RecordNumbers; $_l_RecordNumber)
							If ($_l_SetIDRow>0)
								APPEND TO ARRAY:C911($_al_RecordNumbers; $_l_RecordNumber)
							End if 
							NEXT RECORD:C51($_Ptr_Table->)
							
						End for 
						CLOSE WINDOW:C154
						WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
						CREATE SET FROM ARRAY:C641($_Ptr_Table->; $_al_RecordNumbers; "TempSet")
						UNLOAD RECORD:C212([USER_SETS:105])
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$1)
						SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
						VARIABLE TO BLOB:C532($_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4; *)
						SAVE RECORD:C53([USER_SETS:105])
						UNLOAD RECORD:C212([USER_SETS:105])
						
					End if 
					<>Err_bo_ManualHandler:=False:C215
					
				Else 
					CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
				End if 
				
				$0:="TempSet"
			: (SM_al_SetitemsClassID{$_l_SetIDRow}=852)
				//load then set then run the macro
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$1)
				$_l_offset:=0
				If (Count parameters:C259<4)
					$_l_TableNumber:=SM_al_SetContextItemContextID{$_l_SetIDRow}
				Else 
					$_l_TableNumber:=$4
				End if 
				$_l_TableNumber:=SM_TableFromContextID($_l_TableNumber)
				$_Ptr_Table:=Table:C252($_l_TableNumber)
				If (Records in selection:C76([USER_SETS:105])>0)
					BLOB TO VARIABLE:C533([USER_SETS:105]SET_BLOB:4; SM_al_RecordNumbers; $_l_offset)
				End if 
				If (Size of array:C274(SM_al_RecordNumbers)>0)
					
					CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
					<>Err_l_NoError:=-10503  //don't report this error to the user
					CREATE SET FROM ARRAY:C641($_Ptr_Table->; SM_al_RecordNumbers; "TempSet")
					<>Err_l_NoError:=-0  //don't report this error to the user
					If (<>Err_bo_ManualHandler)
						CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
						MESSAGE:C88("Sorry this set is damaged-Recreating Now")
						ALL RECORDS:C47($_Ptr_Table->)
						$_l_RecordsinSelection:=Records in selection:C76($_Ptr_Table->)
						ARRAY LONGINT:C221($_al_RecordNumbers; 0)
						For ($_l_RecreateIndex; 1; $_l_RecordsinSelection)
							$_l_RecordNumber:=Record number:C243($_Ptr_Table->)
							$_l_SetIDRow:=Find in array:C230(SM_al_RecordNumbers; $_l_RecordNumber)
							If ($_l_SetIDRow>0)
								APPEND TO ARRAY:C911($_al_RecordNumbers; $_l_RecordNumber)
							End if 
							NEXT RECORD:C51($_Ptr_Table->)
							
						End for 
						CREATE SET FROM ARRAY:C641($_Ptr_Table->; $_al_RecordNumbers; "TempSet")
						UNLOAD RECORD:C212([USER_SETS:105])
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$1)
						SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
						VARIABLE TO BLOB:C532($_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4; *)
						SAVE RECORD:C53([USER_SETS:105])
						UNLOAD RECORD:C212([USER_SETS:105])
						
					End if 
					<>Err_bo_ManualHandler:=False:C215
					
				Else 
					CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
				End if 
				USE SET:C118("TempSet")
				//now run the macro
				//the macro CODE is the same as the ID(except it is a string DUH)
				SM_t_ScriptName:=String:C10($1)
				If (Not:C34(<>SYS_bo_ScriptonSave))
					If (DB_GetModuleSettingByNUM(Module_Macros)>0)
						<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
					End if 
				End if 
				
				
				If (<>SYS_bo_ScriptonSave)
					
					Macro_AccType(String:C10($1); True:C214)
				End if 
				If (Records in selection:C76($_Ptr_Table->)>0)
					//if the macro is set to 'search selection'
					//then the selection will be subselection of 'tempset'
					//if not it could be anything so we should always intersect to make sure
					CREATE SET:C116($_Ptr_Table->; "TempSet2")
					INTERSECTION:C121("Tempset2"; "TempSet"; "TempSet")
					CLEAR SET:C117("TempSet2")
				Else 
					CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
				End if 
				
				$0:="TempSet"
			: (SM_al_SetitemsClassID{$_l_SetIDRow}=854)
				If (Count parameters:C259<4)
					$_l_TableNumber:=SM_al_SetContextItemContextID{$_l_SetIDRow}
				Else 
					$_l_TableNumber:=$4
				End if 
				$_l_TableNumber:=SM_TableFromContextID($_l_TableNumber)
				$_Ptr_Table:=Table:C252($_l_TableNumber)
				CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
				ALL RECORDS:C47($_Ptr_Table->)
				SM_t_ScriptName:=String:C10($1)
				If (<>SYS_bo_ScriptonSave) | (True:C214)
					$_obj_Scripts:=ds:C1482.SCRIPTS.query("Script_Code =:1"; SM_t_ScriptName)
					If ($_obj_Scripts.length>0)
						Macro_AccType(SM_t_ScriptName; True:C214; False:C215; True:C214)
					Else 
						
						Gen_Confirm("This query does not seem to exist. Do you want to recreate it?"; "Yes"; "No")
						If (OK=1)
							
						End if 
					End if 
					OK:=0
					
				End if 
				If (Records in selection:C76($_Ptr_Table->)>0)
					CREATE SET:C116($_Ptr_Table->; "TempSet2")
					UNION:C120("Tempset2"; "TempSet"; "TempSet")
					CLEAR SET:C117("TempSet2")
				Else 
					CREATE EMPTY SET:C140($_Ptr_Table->; "TempSet")
				End if 
				$0:="TempSet"
			Else 
				$0:=""
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("SM_LoadSet"; $_t_oldMethodName)
