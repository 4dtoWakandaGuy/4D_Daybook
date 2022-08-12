//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_Divider
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_TextLength; $_l_ThisCharacterCode)
	C_TEXT:C284($_t_DateString; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_Divider")

If (<>DB_d_CurrentDate=!00-00-00!)
	<>DB_d_CurrentDate:=Current date:C33(*)
End if 

$0:="/"
$_t_DateString:=String:C10(<>DB_d_CurrentDate)
$_l_TextLength:=Length:C16($_t_DateString)
$_l_Index:=1
While ($_l_Index<=$_l_TextLength)
	IDLE:C311  // 03/04/03 pb
	$_l_ThisCharacterCode:=Character code:C91(Substring:C12($_t_DateString; $_l_Index; 1))
	If (($_l_ThisCharacterCode<48) | ($_l_ThisCharacterCode>57))
		$_l_Index:=$_l_TextLength+1
		$0:=Char:C90($_l_ThisCharacterCode)
	End if 
	$_l_Index:=$_l_Index+1
End while 
ERR_MethodTrackerReturn("Date_Divider"; $_t_oldMethodName)