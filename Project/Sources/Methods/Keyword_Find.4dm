//%attributes = {}
If (False:C215)
	//Project Method Name:      Keyword_Find
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
	C_LONGINT:C283($_l_CountParameters; $0; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Keyword_Find")
//Keyword_Find


$_l_CountParameters:=Count parameters:C259
Case of 
	: ($_l_CountParameters=2)
		$0:=Keyword_Find2($1; $2; "and"; 0; 0; "")
	: ($_l_CountParameters=3)
		$0:=Keyword_Find2($1; $2; $3; 0; 0; "")
	: ($_l_CountParameters=4)
		$0:=Keyword_Find2($1; $2; $3; $4; 0; "")
	: ($_l_CountParameters=5)
		$0:=Keyword_Find2($1; $2; $3; $4; $5; "")
	Else 
		$0:=Keyword_Find2($1; $2; $3; $4; $5; $6)
End case 
ERR_MethodTrackerReturn("Keyword_Find"; $_t_oldMethodName)