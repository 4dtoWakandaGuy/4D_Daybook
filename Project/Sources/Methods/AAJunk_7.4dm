//%attributes = {}
If (False:C215)
	//Project Method Name:      AAJunk_7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/05/2010 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Type)
	C_POINTER:C301($_ptr_Value)
	C_REAL:C285(MAC_l_TYPE)
	C_TEXT:C284($_t_oldMethodName; MAC_T_TEXT; MAC_T_TEXT2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AAJunk_7")
MAC_l_TYPE:=0
//$FORMULA:="MAC_l_TYPE:="+
$_ptr_Value:=Get pointer:C304("CURRENT PROCESS")
$_l_Type:=Type:C295($_ptr_Value->)

MAC_T_TEXT:=""
EXECUTE FORMULA:C63("MAC_T_TEXT:=STRING("+"Records in selection([CONTACTS]))"+")")
MAC_l_TYPE:=Type:C295(MAC_T_TEXT)
ALERT:C41(String:C10(MAC_l_TYPE))
MAC_T_TEXT2:="HELLO"
EXECUTE FORMULA:C63("MAC_T_TEXT:=STRING("+"MAC_T_TEXT2"+")")


MAC_l_TYPE:=Type:C295(MAC_T_TEXT)
ALERT:C41(String:C10(MAC_l_TYPE))



//EXECUTE FORMULA(
//
ERR_MethodTrackerReturn("AAJunk_7"; $_t_oldMethodName)