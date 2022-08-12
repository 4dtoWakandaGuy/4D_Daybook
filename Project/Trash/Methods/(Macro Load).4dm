//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macro Load
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 10:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_RecordsinSelection; $I)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro Load")
READ ONLY:C145([SCRIPTS:80])
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
$_l_RecordsinSelection:=Records in selection:C76([SCRIPTS:80])
Array_LCx($_l_RecordsinSelection)
ORDER BY:C49([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1; >)
FIRST RECORD:C50([SCRIPTS:80])
$i:=1
While (Not:C34(End selection:C36([SCRIPTS:80])))
	GEN_at_RecordCode{$i}:=""
	GEN_at_Name{$i}:=[SCRIPTS:80]Script_Name:2
	GEN_at_Identity{$i}:=[SCRIPTS:80]Script_Code:1
	$i:=$i+1
	NEXT RECORD:C51([SCRIPTS:80])
End while 
ERR_MethodTrackerReturn("Macro Load"; $_t_oldMethodName)
