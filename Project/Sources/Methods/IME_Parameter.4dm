//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_Parameter
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
	C_LONGINT:C283($_l_AddChars; $_l_AmpersandPos; $_l_AmpersandPos2; $_r_Number)
	C_TEXT:C284($_t_oldMethodName; $_t_Source; $0; $1; viSearch)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Parameter")
//IME_Parameter
//C_TEXT($1)
//C_TEXT($0)
//$0:=IME_Parameter2($1)

//IME_Parameter2
// combined into 1 method 22/04/02 pb

$0:=""
If ($1="#@")
	$_r_Number:=Num:C11(Substring:C12($1; 2; 99))
	If ($_r_Number>0)
		$_l_AmpersandPos:=Position:C15("&"; viSearch)
		If ($_l_AmpersandPos=0)
			If ($_r_Number=1)
				$0:=Substring:C12(viSearch; 1; Length:C16(viSearch))
			End if 
		Else 
			If ($_r_Number=1)
				$0:=Substring:C12(viSearch; 1; $_l_AmpersandPos-1)
			Else 
				$_t_Source:=Substring:C12(viSearch; $_l_AmpersandPos+1; Length:C16(viSearch))
				$_l_AmpersandPos:=Position:C15("&"; $_t_Source)
				$_l_AmpersandPos2:=2
				While (($_l_AmpersandPos>0) & ($_l_AmpersandPos2#$_r_Number))
					IDLE:C311  // 7/04/03 pb
					$_t_Source:=Substring:C12($_t_Source; $_l_AmpersandPos+1; Length:C16($_t_Source))
					$_l_AmpersandPos:=Position:C15("&"; $_t_Source)
					$_l_AmpersandPos2:=$_l_AmpersandPos2+1
				End while 
				If ($_l_AmpersandPos2=$_r_Number)
					If ($_l_AmpersandPos>0)
						$0:=Substring:C12($_t_Source; 1; $_l_AmpersandPos-1)
					Else 
						$0:=$_t_Source
					End if 
				End if 
			End if 
		End if 
	End if 
Else 
	
	$_l_AmpersandPos:=Position:C15($1; viSearch)
	If ($_l_AmpersandPos>1)  //Rollo 15/10/2004 - if the string isn't at the beginning, require an &
		$_l_AmpersandPos:=Position:C15(("&"+$1); viSearch)
		$_l_AddChars:=2
	Else 
		$_l_AddChars:=1
	End if 
	
	If ($_l_AmpersandPos>0)
		$_t_Source:=Substring:C12(viSearch; $_l_AmpersandPos+$_l_AddChars+Length:C16($1))
		$_l_AmpersandPos2:=Position:C15("&"; $_t_Source)
		If ($_l_AmpersandPos2>0)
			$0:=Substring:C12($_t_Source; 1; $_l_AmpersandPos2-1)
		Else 
			$0:=$_t_Source
		End if 
		$_t_Source:=Substring:C12($0; 1; 1)
		If (($_t_Source="#") | ($_t_Source=">") | ($_t_Source="<") | ($_t_Source="="))
			$0:=Substring:C12($0; 2)
		End if 
	End if 
End if 
If ($0#"")
	If (Character code:C91(Substring:C12($0; 1; 1))=34)
		If (Character code:C91(Substring:C12($0; Length:C16($0); 1))=34)
			$0:=Substring:C12($0; 2; Length:C16($0)-2)
		Else 
			$0:=Substring:C12($0; 2; Length:C16($0)-1)
		End if 
	End if 
	$0:=Replace string:C233($0; "*"; "@")
End if 
ERR_MethodTrackerReturn("IME_Parameter"; $_t_oldMethodName)