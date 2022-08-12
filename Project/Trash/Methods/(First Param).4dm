//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      First Param
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/06/2012 12:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BracketClose; $_l_BracketOpen; $_l_CharIndex; $_l_CharPosition; $_l_CharPosition2; $_l_Index)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_Input; $_t_InputCopy; $_t_oldMethodName; $0; $1; $t; vMTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("First Param")
//First Param
$_t_Input:=$1
$_l_CharPosition:=Position:C15("("; $_t_Input)
If ($_l_CharPosition=0)
	$0:=""
Else 
	$_l_CharPosition2:=Position:C15(";"; $_t_Input)
	If ($_l_CharPosition2=0)
		If (Substring:C12($_t_Input; Length:C16($_t_Input); 1)=")")
			$_l_CharPosition2:=Length:C16($_t_Input)
			For ($_l_Index; 1; $_l_CharPosition2-1)
				Case of 
					: (Substring:C12($_t_InputCopy; $_l_Index; 1)="(")
						$_l_BracketOpen:=$_l_BracketOpen+1
					: (Substring:C12($_t_InputCopy; $_l_Index; 1)=")")
						$_l_BracketClose:=$_l_BracketClose+1
				End case 
			End for 
			If ($_l_BracketOpen#$_l_BracketClose)
				Case of 
					: ($_l_BracketOpen=($_l_BracketClose+1))
						$_t_Input:=$_t_Input+")"
						$_l_CharPosition2:=Length:C16($_t_Input)
					: ($_l_BracketOpen=($_l_BracketClose-1))
						$_t_Input:="("+$_t_Input
						$_l_CharPosition2:=Length:C16($_t_Input)
				End case 
			End if 
		Else 
			$_l_CharPosition2:=0
		End if 
	Else 
		
		$_l_BracketOpen:=1
		$_l_BracketClose:=0
		$_t_InputCopy:=$_t_Input
		While ($_l_BracketOpen#$_l_BracketClose)
			IDLE:C311  // 03/04/03 pb
			//restore it if the parameter includes a ;
			$_l_CharIndex:=Length:C16($_t_InputCopy)
			$_l_BracketOpen:=0
			$_l_BracketClose:=0
			
			For ($_l_Index; $_l_CharPosition+1; $_l_CharPosition2-1)
				Case of 
					: (Substring:C12($_t_InputCopy; $_l_Index; 1)="(")
						$_l_BracketOpen:=$_l_BracketOpen+1
					: (Substring:C12($_t_InputCopy; $_l_Index; 1)=")")
						$_l_BracketClose:=$_l_BracketClose+1
				End case 
			End for 
			If ($_l_BracketOpen#$_l_BracketClose)
				Case of 
					: ($_l_BracketOpen=($_l_BracketClose+1))
						$_t_Input:=Substring:C12($_t_InputCopy; 1; $_l_CharPosition2-1)+");"+Substring:C12($_t_InputCopy; $_l_CharPosition2+1)
						$_l_BracketClose:=$_l_BracketClose+1
						$_l_CharPosition2:=$_l_CharPosition2+1
						$_l_CharPosition2:=Position:C15(";"; $_t_Input)
					: ($_l_BracketOpen=($_l_BracketClose-1))
						$_t_Input:="("+Substring:C12($_t_InputCopy; 1; $_l_CharPosition2-1)+";"+Substring:C12($_t_InputCopy; $_l_CharPosition2+1)
						$_l_BracketOpen:=$_l_BracketOpen+1
						$_l_CharPosition2:=$_l_CharPosition2+1
						$_l_CharPosition2:=Position:C15(";"; $_t_Input)
				End case 
			End if 
			
			If ($_l_BracketOpen#$_l_BracketClose)
				
				
				$_t_InputCopy:=Substring:C12($_t_InputCopy; 1; $_l_CharPosition2-1)+Char:C90(255)+Substring:C12($_t_InputCopy; $_l_CharPosition2+1)
				$_l_CharPosition2:=Position:C15(";"; $_t_InputCopy)
				If ($_l_CharPosition2=0)
					If (Substring:C12($_t_InputCopy; Length:C16($_t_InputCopy); 1)=")")
						$_l_CharPosition2:=Length:C16($_t_InputCopy)
					Else 
						$_l_CharPosition2:=0
					End if 
					$_l_BracketOpen:=$_l_BracketClose
				End if 
			End if 
			
		End while 
		
	End if 
	If ($_l_CharPosition2=0)
		$0:=""
	Else 
		$0:=Substring:C12($_t_Input; $_l_CharPosition+1; $_l_CharPosition2-$_l_CharPosition-1)
		If (Count parameters:C259<2)  // NG modified Jan 30th to enable the calling methods to use a local variable(passed as a pointer in $2)
			vMTitle2:=Substring:C12($_t_Input; 1; $_l_CharPosition)+Substring:C12($_t_Input; $_l_CharPosition2+Num:C11(Substring:C12($_t_Input; $_l_CharPosition2; 1)=";"); 32000)
		Else 
			$2->:=Substring:C12($_t_Input; 1; $_l_CharPosition)+Substring:C12($_t_Input; $_l_CharPosition2+Num:C11(Substring:C12($_t_Input; $_l_CharPosition2; 1)=";"); 32000)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("First Param"; $_t_oldMethodName)