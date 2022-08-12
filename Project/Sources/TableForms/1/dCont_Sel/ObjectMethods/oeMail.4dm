If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oeMail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharPosition; $_l_CharPosition2; $_l_CharPosition3; $_l_CharPosition4)
	C_TEXT:C284($_t_oldMethodName; vAccName; vAccount; vemail)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oeMail"; Form event code:C388)
$_l_CharPosition:=Position:C15(Char:C90(64); vemail; *)
Case of 
	: (vemail="")
		vAccName:=""
		vAccount:=""
		
	: ($_l_CharPosition>0)
		vAccName:=Substring:C12(vEmail; 1; $_l_CharPosition-1)
		vAccount:=Substring:C12(vEmail; $_l_CharPosition+1)
	Else 
		$_l_CharPosition:=Position:C15("."; vemail; *)
		If ($_l_CharPosition=0)
			vAccName:=vEmail
			vAccount:=""
		Else 
			$_l_CharPosition:=Position:C15(".co."; vemail; *)
			$_l_CharPosition2:=Position:C15(".com"; vemail; *)
			$_l_CharPosition3:=Position:C15(".org"; vemail; *)
			$_l_CharPosition4:=Position:C15(".net"; vemail; *)
			If ($_l_CharPosition>0) | ($_l_CharPosition2>0) | ($_l_CharPosition3>0) | ($_l_CharPosition4>0)
				vAccName:=""
				vAccount:=Vemail
			Else 
				vAccName:=vEmail
				vAccount:=""
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oeMail"; $_t_oldMethodName)
