//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str IsARoad
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str IsARoad")
If (Count parameters:C259>=1)
	$0:=(($1="@ road") | ($1="@ lane") | ($1="@ avenue") | ($1="@ st") | ($1="@ rd") | ($1="@ street") | ($1="@ house@") | ($1="@ hse@") | ($1="@ park") | ($1="@ parade") | ($1="@ garden@") | ($1="@ gdn@") | ($1="@ cres") | ($1="@ crescent") | ($1="@ estate") | ($1="@ est") | ($1="@ way") | ($1="@ drive") | ($1="@ works") | ($1="@ building@") | ($1="@ bldg@") | ($1="@ hill") | ($1="@ row"))
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Str IsARoad"; $_t_oldMethodName)