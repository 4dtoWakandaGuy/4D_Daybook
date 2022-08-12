//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Join_SelFastSub
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
	C_POINTER:C301($1; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Join_SelFastSub")

CREATE EMPTY SET:C140($3->; "Extra")
FIRST RECORD:C50($1->)
While (Not:C34(End selection:C36($1->)))
	_O_ALL SUBRECORDS:C109($5->)
	While (Not:C34(_O_End subselection:C37($5->)))
		RELATE ONE:C42($2->)
		ADD TO SET:C119($3->; "Extra")
		_O_NEXT SUBRECORD:C62($5->)
	End while 
	NEXT RECORD:C51($1->)
End while 
USE SET:C118("Extra")
ERR_MethodTrackerReturn("Join_SelFastSub"; $_t_oldMethodName)