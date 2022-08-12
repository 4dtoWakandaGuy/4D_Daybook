//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      String_EqualCaseSensitively
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_StringsAreEqual; $0)
	C_LONGINT:C283($_l_ErrorCode; $_l_Index; $_l_StringLength; $_t_baseAscii; $_t_comparisonAscii)
	C_TEXT:C284($_t_comparisonString; $_t_IncomingString; $_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("String_EqualCaseSensitively")

If (False:C215)
	String_EqualCaseSensitively
	
	//// This routine performs a native, case-senstive comparison
	//// of two alphas.
	
	//// Adapted from XmlPath_AlphasAreEqual in 4D Technical Note 05-41
	//// "Case-Sensitive Operations in 4th Dimension"0
	
End if 


$_bo_StringsAreEqual:=False:C215

//// The following Case checks that the inputs are complete and valid.
$_l_ErrorCode:=0
Case of 
	: (Count parameters:C259#2)
		$_l_ErrorCode:=1  //// Incorrect parameter list.
		
	: ((Type:C295($1)#Is string var:K8:2) & (Type:C295($1)#Is text:K8:3) & (Type:C295($1)#Is alpha field:K8:1))
		$_l_ErrorCode:=2  //// $1 is not a string.
		
	: ((Type:C295($2)#Is string var:K8:2) & (Type:C295($2)#Is text:K8:3) & (Type:C295($2)#Is alpha field:K8:1))
		$_l_ErrorCode:=3  //// $2 is not a BLOB.
		
	Else   //// Assign parameters and read necessary values.
		$_t_IncomingString:=$1
		$_t_comparisonString:=$2
		
		$_l_StringLength:=Length:C16($_t_IncomingString)
		
End case 


If ($_l_ErrorCode=0)
	
	//// The inputs have already be pre-tested above,
	//// so the code below doesn't have to get cluttered
	//// up with error testing. This is good as it is already
	//// complex enough structurally.
	
	Case of 
		: ($_l_StringLength#(Length:C16($_t_comparisonString)))  //// Lengths are different, they must be dfifferent.
			$_bo_StringsAreEqual:=False:C215
			
		: ($_t_IncomingString="")  //// The Strings are both empty.
			$_bo_StringsAreEqual:=True:C214
			
		Else   //// Do a byte-by-byte comparison.
			
			
			$_l_StringLength:=Length:C16($_t_IncomingString)
			$_l_Index:=1  //// Strings are not empty, based on the second case test above.
			
			
			$_bo_Continue:=True:C214
			$_bo_StringsAreEqual:=True:C214
			
			While ($_bo_Continue)
				$_t_baseAscii:=Character code:C91($_t_IncomingString[[$_l_Index]])
				$_t_comparisonAscii:=Character code:C91($_t_comparisonString[[$_l_Index]])
				
				If ($_t_baseAscii=$_t_comparisonAscii)  //// Equal: continue examination
					$_l_Index:=$_l_Index+1  //// Set counter for next character in string
					
					If ($_l_Index>$_l_StringLength)  //// The counter is now larger than the string so stop.
						$_bo_Continue:=False:C215
					End if 
					
				Else   //// Not equal: stop examination
					$_bo_StringsAreEqual:=False:C215
					$_bo_Continue:=False:C215
				End if 
				
			End while 
			
	End case 
	
End if 

//// The errors set above can be dealt with here. Instead, the result is set to False
//// The result is really ambiguous. I'm defaulting to 'unequal'. Really, these are errors.
//// You may want to change this function to return a code instead of a Boolean
//// so that errors can be recognized. This routine is already doing all of the
//// necessary error checking.
If ($_l_ErrorCode#0)
	$_bo_StringsAreEqual:=False:C215
End if 

$0:=$_bo_StringsAreEqual

//// End of method.
ERR_MethodTrackerReturn("String_EqualCaseSensitively"; $_t_oldMethodName)
