//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      States Start
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: States Start
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_Index; $_l_SizeOfArray; $_l_TableNumber)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States Start")
If (Count parameters:C259>=2)
	$_l_TableNumber:=Table:C252($2)
Else 
	$_l_TableNumber:=Table:C252($1)
End if 
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
$_l_SizeOfArray:=Size of array:C274(<>SYS_at_RecStateCodes{$_l_TableNumber})

If ($_l_SizeOfArray>0)
	$_l_Index:=1
	While ($_l_Index<=$_l_SizeOfArray)
		
		IDLE:C311  // 7/04/03 pb
		If (Size of array:C274(<>SYS_at_RecStateCodes{$_l_TableNumber})>=$_l_Index)  //NG october 2004 modified
			If (<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_Index}%2=1)
				$1->:=("0"*(3-Length:C16(String:C10($_l_TableNumber))))+String:C10($_l_TableNumber)+<>SYS_at_RecStateCodes{$_l_TableNumber}{$_l_Index}
				$_l_Index:=$_l_SizeOfArray+1
				
			Else 
				
				$_l_Index:=$_l_Index+1
			End if 
		Else 
			$_l_Index:=$_l_SizeOfArray+1
			$1->:="Unknown"
		End if 
		DelayTicks(10)
	End while 
	// States_CUArr ($1)
End if 
ERR_MethodTrackerReturn("States Start"; $_t_oldMethodName)
