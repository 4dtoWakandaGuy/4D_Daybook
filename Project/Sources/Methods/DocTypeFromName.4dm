//%attributes = {}
If (False:C215)
	//Project Method Name:      DocTypeFromName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 13:31`Method: DocTypeFromName
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($viChar; $viLen; $viPos)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $Symbol)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DocTypeFromName")

//this method will extract a document type from a name
If (Is Windows:C1573)
	
	$Symbol:="."
	
	
Else 
	$Symbol:="."
End if 

$viLen:=Length:C16($1)
$viPos:=0
For ($viChar; $viLen; 1; -1)
	If (Character code:C91($1[[$viChar]])=Character code:C91($Symbol))
		$viPos:=$viChar
		$viChar:=0
	End if 
End for 
If ($viPos>0)
	$0:=Substring:C12($1; $viPos+1)
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("DocTypeFromName"; $_t_oldMethodName)