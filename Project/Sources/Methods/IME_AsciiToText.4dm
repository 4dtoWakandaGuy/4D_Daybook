//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_AsciiToText
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
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_AsciiToText")
//IME_AsciiToText
//Rollo 12/23/99


If (Count parameters:C259>0)
	
	$_t_Input:=STR_StripNonNum($1)
	
	If ($_t_Input#"")  //Rollo 9/1/2000 - if not got numbers, is DANGEROUS to go through the below
		
		$_t_Output:=""
		
		For ($_l_Index; 1; Length:C16($_t_Input); 3)
			$_t_Output:=Char:C90(Num:C11(Substring:C12($_t_Input; $_l_Index; 3)))+$_t_Output
		End for 
		
		$0:=$_t_Output
		
	Else 
		
		$0:=$1
		
	End if 
	
Else 
	
	$0:=""
	
End if 
ERR_MethodTrackerReturn("IME_AsciiToText"; $_t_oldMethodName)