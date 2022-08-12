//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_RemoveLeadTrailSpace
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
	C_LONGINT:C283($i; $j; $t; $t2)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $_t_Text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_RemoveLeadTrailSpace")
//******************************************************************************
//
//Method: STR_RemoveLeadTrailSpace
//
//Written by  Rollo on 10/23/98
//
//Purpose: Remove leading & trailing spaces
//
//
//******************************************************************************
If (Count parameters:C259>=1)
	$_t_Text:=$1
	
	$i:=1
	$t:=Length:C16($_t_Text)
	$t2:=$t
	
	If ($t>0)
		
		If ($_t_Text[[1]]=" ")
			For ($j; 1; $t2)
				IDLE:C311
				If ($_t_Text[[$j]]=" ")
					$i:=$j+1
				Else 
					$j:=$t2
				End if 
			End for 
		End if 
		If ($_t_Text[[$t2]]=" ")
			For ($j; $t2; 1; -1)
				IDLE:C311
				If ($_t_Text[[$j]]=" ")
					$t:=$j-1
				Else 
					$j:=0
				End if 
			End for 
		End if 
		
		If (($i=1) & ($t=$t2))
			$0:=$_t_Text
		Else 
			$0:=Substring:C12($_t_Text; $i; $t-$i+1)
		End if 
	Else 
		$0:=$_t_Text
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("STR_RemoveLeadTrailSpace"; $_t_oldMethodName)