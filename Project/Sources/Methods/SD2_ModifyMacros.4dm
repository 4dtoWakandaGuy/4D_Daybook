//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ModifyMacros
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_mScriptEvents;0)
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY LONGINT(SD2_al_mScriptEvents;0)
	//ARRAY TEXT(SD2_at_EventNames;0)
	//ARRAY TEXT(SD2_at_mScriptCodes;0)
	//ARRAY TEXT(SD2_at_mScriptNames;0)
	C_LONGINT:C283($_l_ArraySize; $_l_CurrentElement; $_l_EventPosition; $_l_Index; SD2_l_FormEdits)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ModifyMacros")
DB_t_Methodname:=Current method name:C684
//This method allows the macros for use with this action to be configured
//$1 pointer to(array of) existing macro codes
//$2 Pointer to array(loningt) of when these are used
//$3 Pointer to array(integer) of whether standard macro is ignored
If (Count parameters:C259>=2)
	If (GenValidatePointer($1)) & (GenValidatePointer($2))
		ARRAY TEXT:C222(SD2_at_EventNames; 5)
		ARRAY LONGINT:C221(SD2_al_EventIDs; 5)
		SD2_al_EventIDs{1}:=1
		SD2_at_EventNames{1}:="on saving new"
		SD2_al_EventIDs{2}:=2
		SD2_at_EventNames{2}:="on saving existing"
		SD2_al_EventIDs{3}:=3
		SD2_at_EventNames{3}:="on opening"
		SD2_al_EventIDs{4}:=4
		SD2_at_EventNames{4}:="on setting a result code"
		ARRAY TEXT:C222(SD2_at_mScriptCodes; 0)
		ARRAY TEXT:C222(SD2_at_mScriptNames; 0)
		ARRAY TEXT:C222(SD2_at_mScriptEvents; 0)
		ARRAY LONGINT:C221(SD2_al_mScriptEvents; 0)
		$_l_ArraySize:=Size of array:C274($1->)
		ARRAY TEXT:C222(SD2_at_mScriptCodes; $_l_ArraySize)
		ARRAY TEXT:C222(SD2_at_mScriptNames; $_l_ArraySize)
		ARRAY TEXT:C222(SD2_at_mScriptEvents; $_l_ArraySize)
		ARRAY LONGINT:C221(SD2_al_mScriptEvents; $_l_ArraySize)
		For ($_l_Index; 1; Size of array:C274($1->))
			SD2_at_mScriptCodes{$_l_Index}:=$1->{$_l_Index}
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SD2_at_mScriptCodes{$_l_Index})
			SD2_at_mScriptNames{$_l_Index}:=[SCRIPTS:80]Script_Name:2
			If ($2->{$_l_Index}>0)
				$_l_EventPosition:=Find in array:C230(SD2_al_EventIDs; $2->{$_l_Index})
				SD2_at_mScriptEvents{$_l_Index}:=SD2_at_EventNames{Find in array:C230(SD2_al_EventIDs; $2->{$_l_Index})}
				SD2_al_mScriptEvents{$_l_Index}:=$2->{$_l_Index}
			End if 
			
		End for 
		SD2_l_FormEdits:=0
		Open window:C153(20; 20; 20; 20; 1)
		DIALOG:C40([USER:15]; "SD2_ActionMacroEditor")
		$_l_CurrentElement:=0
		If (SD2_l_FormEdits>0)
			For ($_l_Index; 1; Size of array:C274(SD2_al_mScriptEvents))
				$_l_CurrentElement:=$_l_CurrentElement+1
				If ($_l_CurrentElement>Size of array:C274($1->))
					INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 1)
					INSERT IN ARRAY:C227($2->; Size of array:C274($2->)+1; 1)
				End if 
				$1->{$_l_CurrentElement}:=SD2_at_mScriptCodes{$_l_Index}
				$2->{$_l_CurrentElement}:=SD2_al_mScriptEvents{$_l_Index}
			End for 
			If ($_l_CurrentElement<Size of array:C274($1->))
				DELETE FROM ARRAY:C228($1->; $_l_CurrentElement+1; ((Size of array:C274($1->))-($_l_CurrentElement+1)))
				DELETE FROM ARRAY:C228($2->; $_l_CurrentElement+1; ((Size of array:C274($2->))-($_l_CurrentElement+1)))
				
			End if 
			
		End if 
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_ModifyMacros"; $_t_oldMethodName)