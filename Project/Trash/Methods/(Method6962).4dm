//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Method6962
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/05/2013 06:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(M_Openingbalance)
	C_REAL:C285(Mi)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(Mdoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Method6962")
Mdoc:=Create document:C266(""; "TEXT")
ALL RECORDS:C47([ACC_Bank_Statements:198])
ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; [ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12; >)
M_Openingbalance:=[ACC_Bank_Statements:198]Bank_Balance:10
SEND PACKET:C103(Mdoc; "Starting Balance"+String:C10(M_Openingbalance)+Char:C90(13))
SEND PACKET:C103(Mdoc; "Tranasaction Date"+Char:C90(9)+"Debit Amount"+Char:C90(9)+"Credit AMount"+Char:C90(9)+"Recorded Balance"+Char:C90(9)+"Calculated Balance"+Char:C90(9)+"Reference"+Char:C90(9)+"Details"+Char:C90(13))

For (Mi; 1; Records in selection:C76([ACC_Bank_Statements:198]))
	If (Mi>1)
		M_Openingbalance:=ABR_CalculateBalance(->M_Openingbalance)
	End if 
	SEND PACKET:C103(Mdoc; String:C10([ACC_Bank_Statements:198]Bank_TransactionDate:5)+Char:C90(9)+String:C10([ACC_Bank_Statements:198]Bank_DebitAmount:8)+Char:C90(9)+String:C10([ACC_Bank_Statements:198]Bank_CreditAmount:9)+Char:C90(9)+String:C10([ACC_Bank_Statements:198]Bank_Balance:10)+Char:C90(9)+String:C10(M_Openingbalance)+Char:C90(9)+[ACC_Bank_Statements:198]Bank_TransactionReference:4+Char:C90(9)+[ACC_Bank_Statements:198]Bank_Transaction_Details:7+Char:C90(13))
	NEXT RECORD:C51([ACC_Bank_Statements:198])
End for 
Close_DocUMENT(Mdoc)
ERR_MethodTrackerReturn("Method6962"; $_t_oldMethodName)