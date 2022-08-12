//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_StripNonNum
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
	C_LONGINT:C283($i; $iAsciiCode; $iLength)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $_t_Text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_StripNonNum")
//STR_StripNonNum

//Inputs:
//$1:  Text - String to remove all non-number characters
//Ouptuts:
//$0:  Text - String of Only Numbers

//Modification History:

//11/2/98 S. Frey - rewrote this method for optimization!
//4/21/99 Rollo  - allow periods!


If (Count parameters:C259=1)
	
	$_t_Text:=$1
	$iLength:=Length:C16($_t_Text)
	$i:=1
	
	If ($_t_Text#"")
		
		If (True:C214)
			
			For ($i; $iLength; 1; -1)
				
				IDLE:C311
				
				$iAsciiCode:=Character code:C91($_t_Text[[$i]])
				
				Case of 
					: ($iAsciiCode>57)  //this is most likely the case
						$_t_Text[[$i]]:="*"
					: (($iAsciiCode<48) & ($iAsciiCode#46) & ($iAsciiCode#45))  //Rollo 8/13/99 - allow periods! - AND allow negative numbers!
						$_t_Text[[$i]]:="*"
				End case 
				
			End for 
			
		Else 
			
			While ($i<=$iLength)
				IDLE:C311
				$iAsciiCode:=Character code:C91($_t_Text[[$i]])
				If ((Not:C34(($iAsciiCode>47) & ($iAsciiCode<58))) & ($iAsciiCode#45))  //Rollo 8/12/99 - was not allowing negative numbers!
					$_t_Text:=Substring:C12($_t_Text; 1; $i-1)+"*"+Substring:C12($_t_Text; $i+1)
				End if 
				$i:=$i+1
			End while 
			
		End if 
		
		$0:=Replace string:C233($_t_Text; "*"; "")
		
	Else 
		$0:=""
	End if 
	
Else 
	$0:=""
End if 
//end
ERR_MethodTrackerReturn("STR_StripNonNum"; $_t_oldMethodName)