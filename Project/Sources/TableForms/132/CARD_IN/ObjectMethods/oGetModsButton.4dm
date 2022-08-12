If (False:C215)
	//object Name: [xCreditCardDetails]CARD IN.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_offset)
	C_TEXT:C284($_t_oldMethodName; CCM_T_History)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable12"; Form event code:C388)
If (User in group:C338(Current user:C182; "administrator"))
	$_l_offset:=0
	CCM_T_History:=BLOB to text:C555([xCreditCardDetails:132]ModificationDetails:16; 3; $_l_offset)
	FORM GOTO PAGE:C247(2)
	
	
Else 
	Gen_Alert("You must be an administrator to view the history of this record")
End if 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Variable12"; $_t_oldMethodName)
