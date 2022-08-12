//%attributes = {}
If (False:C215)
	//Project Method Name:      vT2array
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
	C_BOOLEAN:C305($_bo_UsingLineMax)
	C_LONGINT:C283($_l_EolPosition; $_l_index; $_l_Length; $_l_LineMax; $_l_NextElement; $3)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_AddtoText; $_t_Line; $_t_oldMethodName; $_t_Text; $2; Vt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("vT2array")
//this method will create a text array
//each element of the array will contain text to fit on one line
$_l_NextElement:=0
If (Count parameters:C259>=3)
	If (Vt#"")
		
		$_t_Text:=Vt
		//calculate the amount of text that can fit on the line
		//but I dont have current tools for doing that
		Case of 
			: ($3<=12)  //allow 38 chars per line
				$_l_LineMax:=60
			Else 
				//allow 30
				$_l_LineMax:=30
		End case 
		$_l_Length:=Int:C8(Length:C16(vt)/$_l_LineMax)
		ARRAY TEXT:C222($1->; $_l_Length)  //rough size
		$_l_NextElement:=0
		Repeat 
			$_l_EolPosition:=Position:C15(Char:C90(13); $_t_Text)
			If ($_l_EolPosition=0) | ($_l_EolPosition>$_l_LineMax)
				$_t_Line:=Substring:C12($_t_Text; 1; $_l_LineMax)
				$_t_Text:=Substring:C12($_t_Text; $_l_LineMax+1; Length:C16($_t_Text))
				
				$_bo_UsingLineMax:=True:C214
			Else 
				$_t_Line:=Substring:C12($_t_Text; 1; $_l_EolPosition-1)
				$_t_Text:=Substring:C12($_t_Text; $_l_EolPosition+1; Length:C16($_t_Text))
				$_bo_UsingLineMax:=False:C215
			End if 
			If ($_t_Text#"")
				If ($_bo_UsingLineMax)
					//if text were empty there would no point in doing the next bit
					If ($_t_Text[[1]]=" ")
						//the next character is a space so we can break here
						$_l_NextElement:=$_l_NextElement+1
						If ($_l_NextElement>Size of array:C274($1->))
							INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 100)
						End if 
						$1->{$_l_NextElement}:=$_t_Line
					Else 
						//we have to work back to a space
						For ($_l_index; Length:C16($_t_Line); 1; -1)
							If ($_t_Line[[$_l_index]]=" ")
								$_t_AddtoText:=Substring:C12($_t_Line; $_l_index; Length:C16($_t_Line))
								$_t_Line:=Substring:C12($_t_Line; 1; $_l_index-1)
								$_t_Text:=$_t_AddtoText+$_t_Text
								$_l_index:=0
							End if 
						End for 
						$_l_NextElement:=$_l_NextElement+1
						If ($_l_NextElement>Size of array:C274($1->))
							INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 100)
						End if 
						$1->{$_l_NextElement}:=$_t_Line
					End if 
				Else 
					$_l_NextElement:=$_l_NextElement+1
					If ($_l_NextElement>Size of array:C274($1->))
						INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 100)
					End if 
					$1->{$_l_NextElement}:=$_t_Line
				End if 
			Else 
				$_l_NextElement:=$_l_NextElement+1
				If ($_l_NextElement>Size of array:C274($1->))
					INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 100)
				End if 
				$1->{$_l_NextElement}:=$_t_Line
			End if 
		Until ($_t_Text="")
		
		
		
	End if 
End if 
ARRAY TEXT:C222($1->; $_l_NextElement)
ERR_MethodTrackerReturn("vT2array"; $_t_oldMethodName)