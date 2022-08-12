//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter Files
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
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//Array LONGINT(<>DB_al_TableNums;0)
	C_LONGINT:C283($j)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter Files")
If (<>DB_at_TableNames=0)
	<>DB_at_TableNames:=1
End if 
ARRAY TEXT:C222(<>SYS_at_CurrentTableFieldNames; Get last field number:C255(<>DB_at_TableNames))
For ($j; 1; Get last field number:C255(<>DB_al_TableNums{<>DB_at_TableNames}))
	<>SYS_at_CurrentTableFieldNames{$j}:=Field name:C257(<>DB_al_TableNums{<>DB_at_TableNames}; $j)
End for 
If (Size of array:C274(<>SYS_at_CurrentTableFieldNames)>0)
	<>SYS_at_CurrentTableFieldNames:=1
Else 
	<>SYS_at_CurrentTableFieldNames:=0
End if 
ERR_MethodTrackerReturn("Letter Files"; $_t_oldMethodName)