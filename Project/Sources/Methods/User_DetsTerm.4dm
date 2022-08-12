//%attributes = {}
If (False:C215)
	//Project Method Name:      User_DetsTerm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermEst; <>TermFLN; <>TermGL; <>TermInq; <>TermInv; <>TermRP; <>TermST)
	C_TEXT:C284(<>Forename; <>Surname; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_DetsTerm")
//User_DetsTerm
READ ONLY:C145([TERMINOLOGY:75])
QUERY:C277([TERMINOLOGY:75]; [TERMINOLOGY:75]Terminology_Code:1=[USER:15]Term Code:129)
If (Records in selection:C76([TERMINOLOGY:75])=1)
	<>TermFLN:=[TERMINOLOGY:75]First_Last_Name:3
	If (<>TermFLN)
		<>Forename:="First Name"
		<>Surname:="Last Name"
	Else 
		<>Forename:="Forename"
		<>Surname:="Surname"
	End if 
	<>TermInq:=[TERMINOLOGY:75]Inquiry:4
	<>TermEst:=[TERMINOLOGY:75]Estimate:5
	<>TermInv:=[TERMINOLOGY:75]Inventory:6
	<>TermST:=[TERMINOLOGY:75]Sales_Tax:7
	<>TermGL:=[TERMINOLOGY:75]General_Ledger:8
	<>TermRP:=[TERMINOLOGY:75]Receivables_Payables:9
Else 
	<>TermFLN:=False:C215
	<>Forename:="Forename"
	<>Surname:="Surname"
	<>TermInq:=False:C215
	<>TermEst:=False:C215
	<>TermInv:=False:C215
	<>TermST:=False:C215
	<>TermGL:=False:C215
	<>TermRP:=False:C215
End if 
UNLOAD RECORD:C212([TERMINOLOGY:75])
ERR_MethodTrackerReturn("User_DetsTerm"; $_t_oldMethodName)