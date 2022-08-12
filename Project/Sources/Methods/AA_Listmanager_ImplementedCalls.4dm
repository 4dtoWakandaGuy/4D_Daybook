//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_Listmanager_ImplementedCalls
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 13:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_Listmanager_ImplementedCalls")
//this is the hardcoded bit of the list manager
//action  codes-as many as you like
//just add them in here
//what we are trying to do here is define lots and lots of things we might want fr
//from a property

If (Count parameters:C259>=2)
	ARRAY TEXT:C222($1->; 13)
	ARRAY LONGINT:C221($2->; 13)
	If (Count parameters:C259>=3)
		ARRAY TEXT:C222($3->; 13)
	End if 
	
	//the text array contains any message associated
	//there is no particular order to these
	$1->{1}:="Record Access by Administrator"
	$2->{1}:=100
	If (Count parameters:C259>=3)
		$3->{1}:="Contact your Administrator to have this record updated"
	End if 
	$1->{2}:="Record Access by All Users"
	$2->{2}:=101
	//
	$1->{3}:="Record Access by Accounts Only"
	$2->{3}:=102
	If (Count parameters:C259>=3)
		$3->{3}:="Contact Accounts to have this record updated"
	End if 
	//
	$1->{4}:="Record Access by Managers Only"
	$2->{4}:=103
	If (Count parameters:C259>=3)
		$3->{4}:="Contact your Manager to have this record updated"
	End if 
	//
	$1->{5}:="Record Needs Deletion"
	$2->{5}:=104
	If (Count parameters:C259>=3)
		$3->{4}:="This record is marked for deletion"
	End if 
	
	//
	$1->{6}:="Record Needs Validation"
	$2->{6}:=105
	//
	$1->{7}:="Record is Clean"
	$2->{7}:=106
	//
	$1->{8}:="Record is New"
	$2->{8}:=107
	//
	$1->{9}:="Record is Old"
	$2->{9}:=108
	//
	$1->{10}:="Record is Dirty"
	$2->{10}:=109
	If (Count parameters:C259>=3)
		$3->{10}:="This record requires updating. Use with caution"
	End if 
	//
	$1->{11}:="Special Attention"
	$2->{11}:=110
	//
	$1->{12}:="Only Named Sales person to contact"
	$2->{12}:=111
	If (Count parameters:C259>=3)
		$3->{12}:="Only the  Designated sales person should contact this record"
	End if 
	//
	$1->{13}:="Unassigned to salesperson"
	$2->{13}:=112
	//
End if 
ERR_MethodTrackerReturn("AA_Listmanager_ImplementedCalls"; $_t_oldMethodName)
