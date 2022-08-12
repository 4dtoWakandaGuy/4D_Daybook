//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_LoadCardNumber
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
	C_LONGINT:C283($_l_Index; $_l_Security)
	C_TEXT:C284($_t_NameOnCard; $_t_oldMethodName; $0; CC_T_CCX99999999999)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_LoadCardNumber")
//NG this method will load a card number from the encrypted field(of the current record)
//

CC_T_CCX99999999999:=""
CCM_DecryptCardNumber  //Note this does not return a value it sets a specific variable
$_t_NameOnCard:=CCM_DecryptCardName
//Only display the number if....security--actually only the last 4 digits
$_l_Security:=4
If (Length:C16(CC_T_CCX99999999999)>0)
	For ($_l_Index; 1; Length:C16(CC_T_CCX99999999999))
		If (CC_T_CCX99999999999[[$_l_Index]]=" ")
			$_l_Security:=(Length:C16(CC_T_CCX99999999999))-$_l_Index
		End if 
	End for 
End if 

$0:=""
If (CC_T_CCX99999999999#"")
	For ($_l_Index; 1; (Length:C16(CC_T_CCX99999999999)-$_l_Security))
		If (CC_T_CCX99999999999[[$_l_Index]]#" ")
			$0:=$0+"X"
		Else 
			$0:=$0+" "
		End if 
	End for 
	
End if 
If ($_l_Security>0) & (CC_T_CCX99999999999#"")
	$0:=$0+Substring:C12(CC_T_CCX99999999999; (Length:C16(CC_T_CCX99999999999)-$_l_Security); (Length:C16(CC_T_CCX99999999999)))
End if 
ERR_MethodTrackerReturn("CCM_LoadCardNumber"; $_t_oldMethodName)