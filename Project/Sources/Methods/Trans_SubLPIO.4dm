//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SubLPIO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 17:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_TaxName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPIO")
//Trans_SubLPIO
Check_SecTrB($1)
If (OK=1)
	$1->:=Uppercase:C13($1->)
	$_t_TaxName:=Term_VATWT("VAT")
	If ($_t_TaxName#"VAT")
		If (($1->#"S") & ($1->#"P") & ($1->#"N"))
			Gen_Alert("Must be S - Sales, P - Purchases or N - Neither"; "")
			If (Count parameters:C259=3)
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
			Else 
				RELATE ONE:C42($2->)
			End if 
			
			$1->:=[ACCOUNTS:32]IO:5
			If ($1->="")
				$1->:="N"
			End if 
		End if 
	Else 
		If (($1->#"I") & ($1->#"O") & ($1->#"N"))
			Case of 
				: (Count parameters:C259=2)
					If (Old:C35($1->)="@S")
						If (($1->#"IS") & ($1->#"OS"))
							Gen_Alert("Must be I - Input, IS - Input Suspense, O - Output,"+" OS - Ouput Suspense, or N - Neither"; "")
							
							$1->:=Old:C35($1->)
							
						Else 
							Gen_Alert("Must be I - Input, O - Output or N - Neither"; "")
							RELATE ONE:C42($2->)
							$1->:=[ACCOUNTS:32]IO:5
							If ($1->="")
								$1->:="N"
							End if 
						End if 
					End if 
				: (Count parameters:C259>2)
					If ($3="@S")
						If (($1->#"IS") & ($1->#"OS"))
							Gen_Alert("Must be I - Input, IS - Input Suspense, O - Output,"+" OS - Ouput Suspense, or N - Neither"; "")
							
							$1->:=$3
							
						Else 
							Gen_Alert("Must be I - Input, O - Output or N - Neither"; "")
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$2->)
							$1->:=[ACCOUNTS:32]IO:5
							If ($1->="")
								$1->:="N"
							End if 
						End if 
					End if 
			End case 
			
		End if 
	End if 
Else 
End if 
ERR_MethodTrackerReturn("Trans_SubLPIO"; $_t_oldMethodName)
