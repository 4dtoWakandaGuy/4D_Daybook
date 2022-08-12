//%attributes = {}
If (False:C215)
	//Project Method Name:      PRT_DymoSelectLabel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/05/2012 14:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DymoPaths; 0)
	ARRAY TEXT:C222($_at_MachineNames; 0)
	//ARRAY TEXT(PRT_at_DymoDocTemplates;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_MachineRow; $_l_offset; $_l_PreferenceID)
	C_TEXT:C284($_t_DymoPath; $_t_MachineName; $_t_oldMethodName; $_t_SelectedLabel; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRT_DymoSelectLabel")
//TRACE
$_l_PreferenceID:=PREF_GetPreferenceID("Dymo Labels")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
$_t_MachineName:=Current machine:C483
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
	
	SAVE RECORD:C53([PREFERENCES:116])
End if 
$_l_offset:=0
ARRAY TEXT:C222($_at_DymoPaths; 0)
ARRAY TEXT:C222($_at_MachineNames; 0)

BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_DymoPaths; $_l_offset)
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_MachineNames; $_l_offset)
If (Size of array:C274($_at_DymoPaths)>0)
	$_l_MachineRow:=Find in array:C230($_at_MachineNames; $_t_MachineName)
	If ($_l_MachineRow>0)
		$_t_DymoPath:=$_at_DymoPaths{$_l_MachineRow}
	End if 
End if 
If ($_t_DymoPath#"")
	If (Not:C34(Test path name:C476($_t_DymoPath)=Is a folder:K24:2))
		$_t_DymoPath:=""
	End if 
End if 

If ($_t_DymoPath="")
	While (Semaphore:C143("DymoSetup"))
		DelayTicks(10)
		
	End while 
	$_t_DymoPath:=Select folder:C670("Select Folder Containing Dymo Label Templates")
	If ($_t_DymoPath#"")
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
		$_l_MachineRow:=Find in array:C230($_at_MachineNames; $_t_MachineName)
		If ($_l_MachineRow<0)
			APPEND TO ARRAY:C911($_at_DymoPaths; $_t_DymoPath)
			APPEND TO ARRAY:C911($_at_MachineNames; $_t_MachineName)
			
		Else 
			$_at_DymoPaths{$_l_MachineRow}:=$_t_DymoPath
		End if 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532($_at_DymoPaths; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_at_MachineNames; [PREFERENCES:116]DataBlob:2; *)
		SAVE RECORD:C53([PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	CLEAR SEMAPHORE:C144("DymoSetup")
End if 
//TRACE
//Folder separator:=DB_DirSymbol 
If ($_t_DymoPath#"")
	DOCUMENT LIST:C474($_t_DymoPath; PRT_at_DymoDocTemplates)
	For ($_l_Index; Size of array:C274(PRT_at_DymoDocTemplates); 1; -1)
		$_l_CharacterPosition:=Position:C15(".Label"; PRT_at_DymoDocTemplates{$_l_Index})
		If ($_l_CharacterPosition=0)
			DELETE FROM ARRAY:C228(PRT_at_DymoDocTemplates; $_l_Index)
		End if 
	End for 
End if 
If (Count parameters:C259=0)
	
	$_t_SelectedLabel:=Gen_RequestWithList("Select The Label To Use"; ""; "Select"; "Cancel"; 0; 0; "Dymo Label Templates"; 0; "PRT_at_DymoDocTemplates")
	If ($_t_SelectedLabel#"")
		$0:=$_t_DymoPath+Folder separator:K24:12+$_t_SelectedLabel
	Else 
		$0:=""
	End if 
Else 
	//this call is to load the templates
	
	$0:=""
End if 
ERR_MethodTrackerReturn("PRT_DymoSelectLabel"; $_t_oldMethodName)
