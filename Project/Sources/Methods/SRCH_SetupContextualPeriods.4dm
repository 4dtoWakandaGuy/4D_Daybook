//%attributes = {}
If (False:C215)
	//Project Method Name:      SRCH_SetupContextualPeriods
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/07/2012 15:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SRCH_SetupContextualPeriods")

If (Count parameters:C259>1)
	ARRAY TEXT:C222($1->; 13)
	ARRAY LONGINT:C221($2->; 13)
	$1->{1}:="Current Period"
	$2->{1}:=0
	$1->{2}:="Previous Period"
	$2->{2}:=1
	$1->{3}:="Current Period-2"
	$2->{3}:=2
	$1->{4}:="Current Period-3"
	$2->{4}:=3
	$1->{5}:="Current Period-4"
	$2->{5}:=4
	$1->{6}:="Current Period-5"
	$2->{6}:=5
	$1->{7}:="Current Period-6"
	$2->{7}:=6
	$1->{8}:="Current Period-7"
	$2->{8}:=7
	$1->{9}:="Current Period-8"
	$2->{9}:=8
	$1->{10}:="Current Period-9"
	$2->{10}:=9
	$1->{11}:="Current Period-10"
	$2->{11}:=10
	$1->{12}:="Current Period-11"
	$2->{12}:=11
	$1->{13}:="Other..."
	$2->{1}:=0
End if 
ERR_MethodTrackerReturn("SRCH_SetupContextualPeriods"; $_t_oldMethodName)