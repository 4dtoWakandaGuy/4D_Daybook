//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Replace Length
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
	C_LONGINT:C283($_l_Centre; $_l_HalfLength; $_l_LengthNumber; $2)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Replace Length")

If ($2>0)
	$1:=" "+Substring:C12($1; 1; $2-2)+" "
	Case of 
		: (($3="") | ($3="L"))
			$1:=$1+(" "*($2-Length:C16($1)))
		: ($3="R")
			$1:=(" "*($2-Length:C16($1)))+$1
		: ($3="C")
			$_l_LengthNumber:=$2-Length:C16($1)
			$_l_HalfLength:=Int:C8($_l_LengthNumber/2)
			$_l_Centre:=$2-$_l_HalfLength
			$1:=(" "*($_l_HalfLength))+$1+(" "*($_l_Centre))
	End case 
End if 
$0:=$1
ERR_MethodTrackerReturn("Replace Length"; $_t_oldMethodName)
