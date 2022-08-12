//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalInBudget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 15:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AddRecordMode; $_l_OK; Vadd; vNo)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalInBudget")
//xNew AccBal
DB_t_CurrentFormUsage:="Budget"

FORM SET INPUT:C55([ACCOUNT_BALANCES:34]; "AccBal_in")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="AccBal_in"
CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
$_l_AddRecordMode:=Vadd
$_l_OK:=OK
vAdd:=1
OK:=1
While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
	ADD RECORD:C56([ACCOUNT_BALANCES:34]; *)
	ADD TO SET:C119([ACCOUNT_BALANCES:34]; "Master")
	Gen_InOne
End while 
Ok:=$_l_OK
Vadd:=$_l_AddRecordMode
USE SET:C118("Master")
vNo:=Records in selection:C76([ACCOUNT_BALANCES:34])
ERR_MethodTrackerReturn("ACC_BalInBudget"; $_t_oldMethodName)
