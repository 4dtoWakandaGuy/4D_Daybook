//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup OBLPA
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
	//C_UNKNOWN(a01Stri1)
	C_LONGINT:C283(xNext)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName; vPeriod; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup OBLPA")
If (vPeriod="")
	Gen_Alert("Please first specify the posting Period"; "Try again")
Else 
	If (Size of array:C274(a01Stri1)=0)
		Gen_Confirm("You have not entered any Opening Balances.  "+"Would you like to mark this Ledger as 'In progress' before continuing?"; "In progress"; "Try again")
		If (OK=1)
			xNext:=1
			ACCEPT:C269
		End if 
	Else 
		
		If (vTitle="Gene@")
			
			If (vT1#vT2)
				Gen_Confirm("Would you like to mark these Opening Balances as 'In Progress'?"+Char:C90(13)+Char:C90(13)+"Note that for the Opening Balances to be 'Complete', the figures "+"at the base of the Debit and Credit columns must be identical."; "In progress"; "Try again")
				If (OK=1)
					xNext:=1
					ACCEPT:C269
				End if 
			Else 
				Gen_Confirm3("Are the Opening Balances 'Complete' and ready to be posted?"+Char:C90(13)+Char:C90(13)+"Choose 'In progress' if you would like to return to complete the entries at a "+"later date, which you can do from the Data Manager Utilities menu."; "Complete"; "Try again"; "In progress")
				If (OK=1)
					ACCEPT:C269
				End if 
			End if 
			
		Else 
			
			Gen_Confirm3("Are the Opening Balances 'Complete' and ready to be posted?"+Char:C90(13)+Char:C90(13)+"Choose 'In progress' if you would like to return to complete the entries at a "+"later date, which you can do from the Data Manager Utilities menu."; "Complete"; "Try again"; "In progress")
			If (OK=1)
				ACCEPT:C269
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Startup OBLPA"; $_t_oldMethodName)