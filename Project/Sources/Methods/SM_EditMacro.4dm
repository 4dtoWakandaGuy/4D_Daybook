//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_EditMacro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 13:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SM AutoSearch)
	//ARRAY LONGINT(SM_al_QueryIDreturns;0)
	//ARRAY LONGINT(SM_al_SearchIDParameters;0)
	//ARRAY LONGINT(SM_al_SearchIDParameters2;0)
	//ARRAY LONGINT(SM_al_SearchRET_IDParameters;0)
	//ARRAY LONGINT(SM_al_SearchRET_IDParameters2;0)
	C_LONGINT:C283($_l_CallBackProcess; $_l_CharacterPosition; $_l_CurrentRow; $_l_Listindex; $_l_ParametersIndex; $_l_SMTableNumber; $_l_TableContext; $1; $5; SM_l_ShowScripts)
	C_TEXT:C284($_t_ElementSTR; $_t_oldMethodName; $_t_SMUser; $_t_String; $2; $3; $4; $6; SM_t_ScriptCode; SM_t_ScriptName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_EditMacro")
//this method will create/edit a Auto query macro
// at the end it calls the process back with an event(the process being the set manager
//it has to be done in a process becaue otherwise cannot type in the window
If (Count parameters:C259>=4)
	Start_Process
	$_l_CallBackProcess:=$1
	SM_t_ScriptCode:=$2
	SM_t_ScriptName:=$3
	$_t_SMUser:=$4
	$_l_SMTableNumber:=$5
	READ WRITE:C146([SCRIPTS:80])
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SM_t_ScriptCode)
	
	If (Records in selection:C76([SCRIPTS:80])=0)
		CREATE RECORD:C68([SCRIPTS:80])
		[SCRIPTS:80]Script_Code:1:=SM_t_ScriptCode
		[SCRIPTS:80]Script_Name:2:=SM_t_ScriptName
		[SCRIPTS:80]Person:5:=$_t_SMUser
		[SCRIPTS:80]Table_Number:8:=$_l_SMTableNumber
		[SCRIPTS:80]Script_Class:11:=SM AutoSearch
		$_l_TableContext:=0
		If (Count parameters:C259>=6)
			Case of 
				: ($6="Subscription Billing") | ($6="Subscription Renewals") | ($6="Subscriptions Deliver")
					$_l_TableContext:=Table:C252(->[SUBSCRIPTIONS:93])
					
			End case 
			SM_CreateAutoSearch($_l_SMTableNumber; $_l_TableContext; $6)
		Else 
			SM_CreateAutoSearch($_l_SMTableNumber)
			
		End if 
		$_t_String:=""
		If (Size of array:C274(SM_al_QueryIDreturns)>0)
			For ($_l_Listindex; 1; Size of array:C274(SM_al_QueryIDreturns))
				$_t_String:=$_t_String+String:C10(SM_al_QueryIDreturns{$_l_Listindex})
				If ($_l_Listindex<Size of array:C274(SM_al_QueryIDreturns))
					$_t_String:=$_t_String+";"
				End if 
				
			End for 
			[SCRIPTS:80]Recording_Text:4:="SM_AutoSearchByID("+$_t_String+")"
			DB_SaveRecord(->[SCRIPTS:80])
		End if 
	Else 
		$_t_String:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "SM_AutosearchbyID("; "")
		ARRAY LONGINT:C221(SM_al_SearchIDParameters; 99)
		$_l_CurrentRow:=0
		Repeat 
			$_l_CharacterPosition:=Position:C15(";"; $_t_String)
			$_t_ElementSTR:=""
			If ($_l_CharacterPosition>0)
				$_t_ElementSTR:=Substring:C12($_t_String; 1; $_l_CharacterPosition-1)
				$_t_String:=Substring:C12($_t_String; $_l_CharacterPosition+1; Length:C16($_t_String))
			Else 
				$_l_CharacterPosition:=Position:C15(")"; $_t_String)
				$_t_ElementSTR:=Substring:C12($_t_String; 1; $_l_CharacterPosition-1)
				$_t_String:=""
				$_l_CharacterPosition:=0
			End if 
			If ($_t_ElementSTR#"")
				$_l_CurrentRow:=$_l_CurrentRow+1
				If ($_l_CurrentRow>Size of array:C274(SM_al_SearchIDParameters))
					INSERT IN ARRAY:C227(SM_al_SearchIDParameters; Size of array:C274(SM_al_SearchIDParameters)+1; 99)
					
				End if 
				SM_al_SearchIDParameters{$_l_CurrentRow}:=Num:C11($_t_ElementSTR)
				
			End if 
		Until ($_l_CharacterPosition=0)
		
		ARRAY LONGINT:C221(SM_al_SearchIDParameters; $_l_CurrentRow)
		ARRAY LONGINT:C221(SM_al_SearchRET_IDParameters; $_l_CurrentRow)
		For ($_l_ParametersIndex; 1; Size of array:C274(SM_al_SearchIDParameters))
			ARRAY LONGINT:C221(SM_al_SearchIDParameters2; 1)
			ARRAY LONGINT:C221(SM_al_SearchRET_IDParameters2; 1)
			SM_al_SearchIDParameters2{1}:=SM_al_SearchIDParameters{$_l_ParametersIndex}
			SM_L_AutoSearchbyID(2; ->SM_al_SearchIDParameters2; ->SM_al_SearchIDParameters2)
			SM_al_SearchRET_IDParameters{$_l_ParametersIndex}:=SM_al_SearchIDParameters2{1}
		End for 
		If (Size of array:C274(SM_al_SearchRET_IDParameters)>0)
			For ($_l_Listindex; 1; Size of array:C274(SM_al_SearchRET_IDParameters))
				$_t_String:=String:C10(SM_al_SearchRET_IDParameters{$_l_Listindex})
				If ($_l_Listindex<Size of array:C274(SM_al_SearchRET_IDParameters))
					$_t_String:=$_t_String+";"
				End if 
				
			End for 
			[SCRIPTS:80]Recording_Text:4:="SM_AutoSearchByID("+$_t_String+")"
			DB_SaveRecord(->[SCRIPTS:80])
		End if 
		
		
	End if 
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; SM_l_ShowScripts; 3)
	Process_End
	
	POST OUTSIDE CALL:C329($_l_CallBackProcess)
	
End if 
ERR_MethodTrackerReturn("SM_EditMacro"; $_t_oldMethodName)
