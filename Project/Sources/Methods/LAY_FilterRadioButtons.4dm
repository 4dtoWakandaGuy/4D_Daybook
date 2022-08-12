//%attributes = {}

If (False:C215)
	//Database Method Name:      LAY_FilterRadioButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_BalanceSheet; ACC_l_ProfitSheet; ALL_l_Both; CO_l_Both; CO_l_COMPANY; CO_l_PRIVATEADDRESS; CONT_l_Both; CONT_l_CLosed; CONT_l_Open)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LAY_FilterRadioButtons")

If (Count parameters:C259>=1)
	Case of 
		: ($1=->CO_l_PRIVATEADDRESS)
			If (CO_l_PRIVATEADDRESS=1)
				CO_l_Both:=0
				CO_l_COMPANY:=0
			Else 
				CO_l_Both:=0
				CO_l_COMPANY:=1
			End if 
		: ($1=->CO_l_Both)
			If (CO_l_Both=1)
				CO_l_PRIVATEADDRESS:=0
				CO_l_COMPANY:=0
			Else 
				CO_l_PRIVATEADDRESS:=0
				CO_l_COMPANY:=1
			End if 
		: ($1=->CO_l_COMPANY)
			If (CO_l_COMPANY=1)
				CO_l_PRIVATEADDRESS:=0
				CO_l_Both:=0
			Else 
				CO_l_PRIVATEADDRESS:=1
				CO_l_Both:=0
			End if 
		: ($1=->ALL_l_Both)
			If (ALL_l_Both=1)
				ACC_l_ProfitSheet:=0
				ACC_l_BalanceSheet:=0
			Else 
				ACC_l_ProfitSheet:=1
				ACC_l_BalanceSheet:=0
			End if 
		: ($1=->ACC_l_ProfitSheet)
			If (ACC_l_ProfitSheet=1)
				ALL_l_Both:=0
				ACC_l_BalanceSheet:=0
			Else 
				ALL_l_Both:=0
				ACC_l_BalanceSheet:=1
				
			End if 
		: ($1=->ACC_l_BalanceSheet)
			If (ACC_l_BalanceSheet=1)
				ALL_l_Both:=0
				ACC_l_ProfitSheet:=0
			Else 
				ALL_l_Both:=0
				ACC_l_ProfitSheet:=1
			End if 
		: ($1=->CONT_l_Both)
			If (CONT_l_Both=1)
				CONT_l_Open:=0
				CONT_l_CLosed:=0
			Else 
				CONT_l_Open:=1
				CONT_l_Closed:=0
			End if 
		: ($1=->CONT_l_Open)
			If (CONT_l_Open=1)
				CONT_l_Both:=0
				CONT_l_Closed:=0
			Else 
				CONT_l_Both:=0
				CONT_l_Closed:=1
				
			End if 
		: ($1=->CONT_l_Closed)
			If (CONT_l_Closed=1)
				CONT_l_Both:=0
				CONT_l_Open:=0
			Else 
				CONT_l_Both:=0
				CONT_l_Open:=1
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("LAY_FilterRadioButtons"; $_t_oldMethodName)