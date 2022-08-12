If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.Variable6
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
	C_DATE:C307($_d_StartDate; $_d_StartDate1)
	C_LONGINT:C283($_l_DateIndex; $_l_Event)
	C_TEXT:C284($_t_Month; $_t_oldMethodName; $_t_Year; CCM_t_StartDate)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable6"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
		
	: ($_l_Event=On Data Change:K2:15)
		$_t_Month:=Substring:C12(CCM_t_StartDate; 1; 2)
		$_t_Year:=Substring:C12(CCM_t_StartDate; 3; 2)
		[xCreditCardDetails:132]StartDate:7:=Date:C102("01/01/"+$_t_Year)
		$_d_StartDate:=[xCreditCardDetails:132]StartDate:7
		For ($_l_DateIndex; 1; 365; 27)
			If ((Month of:C24($_d_StartDate))<Num:C11($_t_Month))
				$_d_StartDate:=[xCreditCardDetails:132]StartDate:7+$_l_DateIndex
			Else 
				$_l_DateIndex:=366
			End if 
		End for 
		$_d_StartDate1:=$_d_StartDate
		Repeat 
			$_d_StartDate:=$_d_StartDate-1
		Until (Month of:C24($_d_StartDate)#Month of:C24($_d_StartDate1))
		[xCreditCardDetails:132]StartDate:7:=$_d_StartDate+1
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Variable6"; $_t_oldMethodName)
