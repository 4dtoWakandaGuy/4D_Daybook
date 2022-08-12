//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalBudgetCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_AnalysisCodes; 0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_PeriodID; $_l_SizeofArray; $_l_SizeofArray2; $_l_WindowReferenceRow; ch1; MOD_l_CurrentModuleAccess; vNo; WIN_l_CurrentWinRef)
	C_OBJECT:C1216($_obj_Data; $_obj_FormData; $_obj_FormDate; $_obj_NewBalances)
	C_REAL:C285($_r_Budget; vT1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; vPeriod; vT; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalBudgetCreate")
//AccBal BudCreat
If ((MOD_l_CurrentModuleAccess=2) | (MOD_l_CurrentModuleAccess=4))
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
	
	vDate:=<>DB_d_CurrentDate
	$_l_PeriodID:=Check_Period
	//vPeriod:=[PERIODS]Period_Code
	//vT:="B"
	
	//ACC_t_CurrencyCode:=""
	//vText:="A"
	//vT1:=0
	$_obj_FormData:=New object:C1471("Date"; <>DB_d_CurrentDate; "Period"; [PERIODS:33]Period_Code:1; "Layer"; "B"; "CurrencyCode"; ""; "LayerCode"; "A"; "Increment"; 0)
	ACC_BalSelelectPrevious($_obj_FormData)
	Open_AnyTypeWindow(203; 450; 5; "Create Budgets")
	DIALOG:C40([ACCOUNT_BALANCES:34]; "dAsk_Bud"; $_obj_FormData)
	$_obj_FormData.BalancesCollection:=New collection:C1472
	
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	WS_KeepFocus
	
	If (($_obj_FormData.ExitFunction="Accept") & ($_obj_FormData.LayerCode#"A"))
		Are_You_Sure
		If (OK=1)
			If (($_obj_FormData.AccountCodeFrom#"") | ($_obj_FormData.AccountCodeTo#""))
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2>=$_obj_FormData.AccountCodeFrom; *)
				QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2<=$_obj_FormData.AccountCodeTo)
			Else 
				ALL RECORDS:C47([ACCOUNTS:32])
			End if 
			While (Not:C34(End selection:C36([ACCOUNTS:32])))
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5=$_obj_FormData.LayerCode; *)
				If ($_obj_FormData.AnalysisCodeFrom#"")
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_obj_FormData.AnalysisCodeFrom; *)
				End if 
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4>=$_obj_FormData.PeriodCodeFrom; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4<=$_obj_FormData.PeriodCodeto)
				If ($_obj_FormData.CurrencyCode#"")
					If ($_obj_FormData.CurrencyCode=<>SYS_t_BaseCurrency)
						QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_obj_FormData.CurrencyCode; *)
						QUERY SELECTION:C341([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Currency_Code:6=""; *)
					Else 
						QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_obj_FormData.CurrencyCode; *)
					End if 
				End if 
				If ((Records in selection:C76([ACCOUNT_BALANCES:34])>0) | (ch1=1))
					MESSAGES OFF:C175
					ARRAY TEXT:C222($_at_AnalysisCodes; 0)
					ARRAY TEXT:C222($_at_CurrencyCodes; 0)
					DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Analysis_Code:1; $_at_AnalysisCodes)
					DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; $_at_CurrencyCodes)
					MESSAGES ON:C181
					$_l_SizeofArray:=Size of array:C274($_at_AnalysisCodes)
					$_l_SizeofArray2:=Size of array:C274($_at_CurrencyCodes)
					If (($_l_SizeofArray>1) | ($_l_SizeofArray2>1))
						COPY NAMED SELECTION:C331([ACCOUNT_BALANCES:34]; "$Copy")
						For ($_l_Index; 1; $_l_SizeofArray)
							QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1=$_at_AnalysisCodes{$_l_Index})
							COPY NAMED SELECTION:C331([ACCOUNT_BALANCES:34]; "$Copy2")
							For ($_l_Index2; 1; $_l_SizeofArray2)
								QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=$_at_CurrencyCodes{$_l_Index2})
								If ((Records in selection:C76([ACCOUNT_BALANCES:34])>0) | ($_obj_FormData.FilterinEmptyAccounts))
									$_obj_FormData.AnalysisCode:=[ACCOUNT_BALANCES:34]Analysis_Code:1
									$_r_Budget:=Sum:C1([ACCOUNT_BALANCES:34]Balance:3)/Records in selection:C76([ACCOUNT_BALANCES:34])
									$_r_Budget:=Round:C94(($_r_Budget+($_r_Budget*($_obj_FormData.Increment/100))); 2)
									$_obj_FormDate.Budget:=$_r_Budget
									$_obj_FormDate.AccountCode:=[ACCOUNTS:32]Account_Code:2
									
									Acc_BalBudCreate2($_obj_FormDate)
								End if 
								USE NAMED SELECTION:C332("$Copy2")
							End for 
							USE NAMED SELECTION:C332("$Copy")
						End for 
						CLEAR NAMED SELECTION:C333("$Copy")
						CLEAR NAMED SELECTION:C333("$Copy2")
					Else 
						$_obj_FormDate.AccountCode:=[ACCOUNTS:32]Account_Code:2
						$_obj_FormData.AnalysisCode:=[ACCOUNT_BALANCES:34]Analysis_Code:1
						$_r_Budget:=([ACCOUNT_BALANCES:34]Balance:3)
						$_r_Budget:=Round:C94(($_r_Budget+($_r_Budget*($_obj_FormData.Increment/100))); 2)
						$_obj_FormDate.Budget:=$_r_Budget
						
						Acc_BalBudCreate2($_obj_FormDate)
						
					End if 
				End if 
				NEXT RECORD:C51([ACCOUNTS:32])
			End while 
			$_obj_NewBalances:=ds:C1482.ACCOUNT_BALANCES.query("x_ID in:1"; $_obj_Data.BalancesCollection)
			USE ENTITY SELECTION:C1513($_obj_NewBalances)
			
		End if 
	End if 
	//USE SET("Master")
	vNo:=Records in selection:C76([ACCOUNT_BALANCES:34])
	
End if 
ERR_MethodTrackerReturn("Acc_BalBudgetCreate"; $_t_oldMethodName)
