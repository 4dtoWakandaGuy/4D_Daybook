//%attributes = {}
If (False:C215)
	//Project Method Name:      ABR_CalculateBalance
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/02/2012 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_REAL:C285($0; ABR_R_Balance)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ABR_CalculateBalance")


Case of 
	: ([ACC_Bank_Statements:198]Bank_CreditAmount:9#0)
		$1->:=($1->)+[ACC_Bank_Statements:198]Bank_CreditAmount:9
	: ([ACC_Bank_Statements:198]Bank_DebitAmount:8#0)
		
		$1->:=($1->)-[ACC_Bank_Statements:198]Bank_DebitAmount:8
End case 
$0:=$1->
ERR_MethodTrackerReturn("ABR_CalculateBalance"; $_t_oldMethodName)