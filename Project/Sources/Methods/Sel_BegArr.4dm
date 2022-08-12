//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_BegArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_Index; $_l_SIzeofArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_BegArr")
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
$_l_SIzeofArray:=Size of array:C274(<>SYS_at_RecStateNames{$1})
ARRAY TEXT:C222(SYS_at_RecordStateNames; $_l_SIzeofArray)
COPY ARRAY:C226(<>SYS_at_RecStateNames{$1}; SYS_at_RecordStateNames)
ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; $_l_SIzeofArray)
For ($_l_Index; 1; $_l_SIzeofArray)
	MOD_al_ModuleAccessStatus{$_l_Index}:=0
End for 
ERR_MethodTrackerReturn("Sel_BegArr"; $_t_oldMethodName)
