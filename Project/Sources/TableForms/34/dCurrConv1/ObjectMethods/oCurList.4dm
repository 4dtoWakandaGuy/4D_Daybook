If (False:C215)
	//object Method Name: Object Name:      [ACCOUNT_BALANCES].dCurrConv1.oCurList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 17:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUR_lb_CurrencyList;0)
	//ARRAY BOOLEAN(CURR_abo_CurrencySelect;0)
	//ARRAY LONGINT(Curr_al_Currency;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dCurrConv1.oCurList"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedRow>0)
			$_l_SelectedColumn:=LB_GetColumn(->CUR_lb_CurrencyList; $_t_VariableName)
			Curr_al_Currency{$_l_SelectedRow}:=Abs:C99(Curr_al_Currency{$_l_SelectedRow}-1)
			CURR_abo_CurrencySelect{$_l_SelectedRow}:=(Curr_al_Currency{$_l_SelectedRow}=1)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dCurrConv1.oCurList"; $_t_oldMethodName)
