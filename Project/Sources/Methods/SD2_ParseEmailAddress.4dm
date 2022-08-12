//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ParseEmailAddress
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
	C_LONGINT:C283($_l_CharacterPosition)
	C_POINTER:C301($_ptr_Address; $_ptr_Name; $2; $3)
	C_TEXT:C284($_t_FullAddress; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ParseEmailAddress")

If (Count parameters:C259>=3)
	$_t_FullAddress:=$1
	$_ptr_Name:=$2
	$_ptr_Address:=$3
	
	$_l_CharacterPosition:=Position:C15("<"; $_t_FullAddress)
	
	If ($_l_CharacterPosition=0)
		// If there is no "<" character, then all we have is the email address.
		$_ptr_Name->:=""
		$_ptr_Address->:=$_t_FullAddress
		
	Else 
		$_ptr_Name->:=Substring:C12($_t_FullAddress; 1; ($_l_CharacterPosition-2))
		$_ptr_Name->:=Replace string:C233($_ptr_Name->; Char:C90(Double quote:K15:41); "")  // Get rid of the quotes.
		$_ptr_Address->:=Substring:C12($_t_FullAddress; ($_l_CharacterPosition+1))
		$_ptr_Address->:=Replace string:C233($_ptr_Address->; ">"; "")  // Get rid of ending ">".
	End if 
End if 
ERR_MethodTrackerReturn("SD2_ParseEmailAddress"; $_t_oldMethodName)
