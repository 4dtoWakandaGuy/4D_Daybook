//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRates_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(aPrevTypeC;0)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_CurrencyRow; $_l_Index; vJ; xNext)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrRates_Sel")
//CurrRates_Sel

vJ:=1
If (vSelPrev="•FSC")
	CurrRates_SelP
Else 
	$_t_Search:="Most Recent"
	$_t_Search:=Gen_SearchA("Currency From, Date or Type to find:"; vSelPrev; "Find Currency Rates"; $_t_Search; ""; "")
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
				ALL RECORDS:C47([CURRENCY_RATES:72])
			Else 
				If ($_t_Search="Most Recent")
					// SEARCH([CURRENCIES];[CURRENCIES]Currency Code#◊BaseCurr)
					ALL RECORDS:C47([CURRENCIES:71])  //you now WANT to include same curr cos of auto Bank Charges
					//  ALL RECORDS([CURRENCY RATES])
					CREATE EMPTY SET:C140([CURRENCY_RATES:72]; "Extra")
					ARRAY TEXT:C222(aPrevTypeC; Records in selection:C76([CURRENCIES:71]))
					SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; aPrevTypeC)
					QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=<>SYS_t_BaseCurrency; *)
					QUERY:C277([CURRENCY_RATES:72];  | ; [CURRENCY_RATES:72]Currency_To:2=<>SYS_t_BaseCurrency)
					MESSAGES OFF:C175
					ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
					MESSAGES ON:C181
					FIRST RECORD:C50([CURRENCY_RATES:72])
					$_l_Index:=0
					While ((Not:C34(End selection:C36([CURRENCY_RATES:72]))) & ($_l_Index<=Size of array:C274(aPrevTypeC)))
						If ([CURRENCY_RATES:72]Currency_From:1=<>SYS_t_BaseCurrency)
							$_l_CurrencyRow:=Find in array:C230(aPrevTypeC; [CURRENCY_RATES:72]Currency_To:2)
						Else 
							$_l_CurrencyRow:=Find in array:C230(aPrevTypeC; [CURRENCY_RATES:72]Currency_From:1)
						End if 
						If ($_l_CurrencyRow>0)
							ADD TO SET:C119([CURRENCY_RATES:72]; "Extra")
							aPrevTypeC{$_l_CurrencyRow}:=""
							$_l_Index:=$_l_Index+1
						End if 
						NEXT RECORD:C51([CURRENCY_RATES:72])
					End while 
					USE SET:C118("Extra")
				Else 
					$_t_SearchAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[CURRENCY_RATES:72]; ->[CURRENCY_RATES:72]Currency_From:1; $_t_Search; $_t_SearchAt)
					If (Records in selection:C76([CURRENCY_RATES:72])=0)
						Sel_NoAtAt(->[CURRENCY_RATES:72]; ->[CURRENCY_RATES:72]Rate_Type:5; $_t_Search; $_t_SearchAt)
						If (Records in selection:C76([CURRENCY_RATES:72])=0)
							$_d_Date:=Date:C102($_t_Search)
							QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4=$_d_Date)
						End if 
					End if 
				End if 
			End if 
		Else 
			CurrRates_SelP
		End if 
	Else 
		vJ:=0
	End if 
End if 
ERR_MethodTrackerReturn("CurrRates_Sel"; $_t_oldMethodName)