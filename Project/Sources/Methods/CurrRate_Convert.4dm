//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRate_Convert
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $1; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrRate_Convert")
DB_t_Methodname:=Current method name:C684
If (Records in selection:C76([CURRENCY_RATES:72])>0)
	If (GenValidatePointer($2))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
		If ([CURRENCY_RATES:72]Currency_From:1=$1)
			$2->:=Round:C94(($2->*[CURRENCY_RATES:72]Rate:3); 2)
		Else 
			$2->:=Round:C94(($2->/[CURRENCY_RATES:72]Rate:3); 2)
		End if 
	End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
	
End if 
ERR_MethodTrackerReturn("CurrRate_Convert"; $_t_oldMethodName)