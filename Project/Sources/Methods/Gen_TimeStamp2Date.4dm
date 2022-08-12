//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_TimeStamp2Date
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_TimeStamp2Date")
//$1=longint time date stamp
//Pass this 2 pointers=$2=pointer to field or var to put date in
//$3=pointer to field or var for time
// Gen_TimeStamp2Date($1;$DateVar;$TimeVar) : =>$1 ; <=$DateVar;<=$TimeVar
If (Count parameters:C259>=3)
	$2->:=!1999-12-30!+($1\(24*60*60))
	$3->:=Time:C179(Time string:C180($1%(24*60*60)))
End if 
ERR_MethodTrackerReturn("Gen_TimeStamp2Date"; $_t_oldMethodName)