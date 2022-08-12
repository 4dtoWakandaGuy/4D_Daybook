//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView ArFi
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
	//ARRAY TEXT(SV_at_TableFindCodes;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//Array LONGINT(SV_al_TableNumber;0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView ArFi")
ARRAY TEXT:C222(DB_at_TableName; $1)
ARRAY LONGINT:C221(SV_al_TableNumber; $1)
ARRAY TEXT:C222(SV_at_TableFindCodes; $1)
ERR_MethodTrackerReturn("StatsView ArFi"; $_t_oldMethodName)