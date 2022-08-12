//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImShowAr
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
	//Array TEXT(GEN_at_Name;0)
	//Array TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ImShowAr")
Array_LCx(Records in selection:C76([PERSONNEL:11]))
$i:=1
FIRST RECORD:C50([PERSONNEL:11])
While (Not:C34(End selection:C36([PERSONNEL:11])))
	GEN_at_RecordCode{$i}:=[PERSONNEL:11]Initials:1
	GEN_at_Name{$i}:=""
	$i:=$i+1
	NEXT RECORD:C51([PERSONNEL:11])
End while 
ERR_MethodTrackerReturn("Remote_ImShowAr"; $_t_oldMethodName)