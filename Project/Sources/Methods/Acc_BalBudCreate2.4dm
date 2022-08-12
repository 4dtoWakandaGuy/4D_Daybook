//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalBudCreate2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_AccountBalance; $_obj_Data; $1)
	C_REAL:C285($_r_Budget; vT1)
	C_TEXT:C284($_t_AccountCode; $_t_AnalysisCode; $_t_Budget; $_t_CurrencyCode; $_t_Layer; $_t_oldMethodName; $_t_Period; $_t_SemaphoreID; vPeriod; vT)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Acc_BalBudCreate2")

If (Count parameters:C259>=1)
	$_obj_Data:=$1
	$_t_Period:=$_obj_Data.Period
	$_t_Layer:=$_obj_Data.LayerCode
	$_t_AnalysisCode:=$_obj_Data.AnalysisCode
	$_t_CurrencyCode:=$_obj_Data.CurrencyCode
	$_t_Budget:=$_obj_Data.Budget
	$_t_AccountCode:=$_obj_Data.AccountCode
Else 
	$_t_Period:=VPeriod
	$_t_Layer:=VT
	$_t_AnalysisCode:=[ACCOUNT_BALANCES:34]Analysis_Code:1
	$_t_CurrencyCode:=[ACCOUNT_BALANCES:34]Currency_Code:6
	If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
		$_r_Budget:=Sum:C1([ACCOUNT_BALANCES:34]Balance:3)/Records in selection:C76([ACCOUNT_BALANCES:34])
		$_r_Budget:=Round:C94(($_r_Budget+($_r_Budget*(vT1/100))); 2)
	Else 
		$_r_Budget:=0
	End if 
	$_t_AccountCode:=[ACCOUNTS:32]Account_Code:2
End if 

$_t_SemaphoreID:=$_t_AccountCode
While (Semaphore:C143("UPDATEBALANCE"+$_t_SemaphoreID))
	DelayTicks
End while 
If (Count parameters:C259>=1)
	$_obj_AccountBalance:=ds:C1482.ACCOUNT_BALANCES.new()
	$_obj_AccountBalance.Account_Code:=$_t_AccountCode
	$_obj_AccountBalance.Balance:=$_r_Budget
	$_obj_AccountBalance.Period_Code:=$_t_Period
	$_obj_AccountBalance.Layer_Code:=$_t_Layer
	$_obj_AccountBalance.Analysis_Code:=$_t_AnalysisCode
	$_obj_AccountBalance.Currency_Code:=$_t_CurrencyCode
	DB_SaveEntity($_obj_AccountBalance)
	$_obj_Data.BalancesCollection.push($_obj_AccountBalance.x_ID)
	
	
Else 
	CREATE RECORD:C68([ACCOUNT_BALANCES:34])
	[ACCOUNT_BALANCES:34]Account_Code:2:=$_t_AccountCode
	[ACCOUNT_BALANCES:34]Balance:3:=$_r_Budget
	[ACCOUNT_BALANCES:34]Period_Code:4:=$_t_Period
	[ACCOUNT_BALANCES:34]Layer_Code:5:=$_t_Layer
	[ACCOUNT_BALANCES:34]Analysis_Code:1:=$_t_AnalysisCode
	[ACCOUNT_BALANCES:34]Currency_Code:6:=$_t_CurrencyCode
	DB_SaveRecord(->[ACCOUNT_BALANCES:34])
	AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
	CLEAR SEMAPHORE:C144("UPDATEBALANCE"+$_t_SemaphoreID)
	
	ADD TO SET:C119([ACCOUNT_BALANCES:34]; "Master")
End if 
ERR_MethodTrackerReturn("Acc_BalBudCreate2"; $_t_oldMethodName)
