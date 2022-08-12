//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DecryptWebRef
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
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $0; $1; viSearch; vURLWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DecryptWebRef")
//IME_DecryptWebRef

//Decrypt a URL along with the Web Ref

$_t_Input:=$1

$_l_CharPosition:=Position:C15("?"; $_t_Input)
If ($_l_CharPosition>0)
	$_t_Output:=IME_Decrypt2(Substring:C12($_t_Input; 1; $_l_CharPosition-1))
	$_t_Input:=Substring:C12($_t_Input; $_l_CharPosition+1)
	
	$_l_CharPosition:=Position:C15("&"; $_t_Input)  //Rollo 8/10/2004
	If ($_l_CharPosition>0)
		viSearch:=IME_Decrypt2(Substring:C12($_t_Input; 1; $_l_CharPosition-1))+Substring:C12($_t_Input; $_l_CharPosition)
	Else 
		viSearch:=IME_Decrypt2($_t_Input)
	End if 
	
	If (viSearch="Error1")
		$_t_Output:="Error1"
	End if 
	vURLWebRef:=IME_Parameter("WebRef")
Else 
	$_t_Output:="Error1"
End if 

$0:=$_t_Output
ERR_MethodTrackerReturn("IME_DecryptWebRef"; $_t_oldMethodName)