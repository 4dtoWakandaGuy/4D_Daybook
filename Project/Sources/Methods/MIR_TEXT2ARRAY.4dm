//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_TEXT2ARRAY
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
	C_LONGINT:C283($LCurrentElement; $LLengthDelimiter; $LPosition; $LSizeOfArray)
	C_POINTER:C301($2; $pArray)
	C_TEXT:C284($_t_oldMethodName; $1; $3; $tDelimiter; $tText2Parse)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_TEXT2ARRAY")

// Purpose: Converts a piece of text into an array

// Declare parameters

// Declare local variables

If (Count parameters:C259=2)
	$tDelimiter:=" "
Else 
	$tDelimiter:=$3
End if 

If ($1#"")
	$LSizeOfArray:=Size of array:C274($2->)
	$LCurrentElement:=1
	$tText2Parse:=$1
	$LLengthDelimiter:=Length:C16($tDelimiter)
	
	$LPosition:=Position:C15($tDelimiter; $tText2Parse)
	While ($LPosition>0)
		If ($LCurrentElement>=$LSizeOfArray)
			INSERT IN ARRAY:C227($2->; $LCurrentElement+1; 1)
		End if 
		$2->{$LCurrentElement}:=Substring:C12($tText2Parse; 1; $LPosition-1)
		$tText2Parse:=Substring:C12($tText2Parse; $LPosition+$LLengthDelimiter)
		$LCurrentElement:=$LCurrentElement+1
		$LPosition:=Position:C15($tDelimiter; $tText2Parse)
	End while 
	If ($LCurrentElement>=$LSizeOfArray)
		INSERT IN ARRAY:C227($2->; $LCurrentElement+1; 1)
	End if 
	$2->{$LCurrentElement}:=$tText2Parse
	
	If ($LCurrentElement<$LSizeOfArray)  //If the array had more than the number of elements created
		DELETE FROM ARRAY:C228($2->; $LCurrentElement+1; $LSizeOfArray-$LCurrentElement)  //delete the excess
	End if 
End if 
ERR_MethodTrackerReturn("MIR_TEXT2ARRAY"; $_t_oldMethodName)