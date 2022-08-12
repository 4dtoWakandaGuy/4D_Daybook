If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.Variable7
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
	C_DATE:C307($_d_EndDate; $_d_EndDate1)
	C_LONGINT:C283($_l_DateIndex; $_l_Event)
	C_TEXT:C284($_t_Month; $_t_oldMethodName; $_t_Year; CCM_t_EndDate)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable7"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
		
	: ($_l_Event=On Data Change:K2:15)
		$_t_Month:=Substring:C12(CCM_t_EndDate; 1; 2)
		$_t_Year:=Substring:C12(CCM_t_EndDate; 3; 2)
		[xCreditCardDetails:132]EndDate:8:=Date:C102("01/01/"+$_t_Year)
		$_d_EndDate:=[xCreditCardDetails:132]EndDate:8
		For ($_l_DateIndex; 1; 365; 27)
			If ((Month of:C24($_d_EndDate))<Num:C11($_t_Month))
				$_d_EndDate:=[xCreditCardDetails:132]EndDate:8+$_l_DateIndex
			Else 
				$_l_DateIndex:=366
			End if 
		End for 
		$_d_EndDate1:=$_d_EndDate
		Repeat 
			$_d_EndDate:=$_d_EndDate+1
		Until (Month of:C24($_d_EndDate)#Month of:C24($_d_EndDate1))
		[xCreditCardDetails:132]EndDate:8:=$_d_EndDate-1
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Variable7"; $_t_oldMethodName)
