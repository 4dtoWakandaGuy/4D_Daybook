//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_EuroConvertor
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
	C_DATE:C307($_d_Date; $_d_Date2)
	C_LONGINT:C283($_l_Direction)
	C_REAL:C285($_r_Rate; $0; $1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_EuroConvertor")
//pass this method a Daybook currency code
//if it is a euro currency
//it will use the euro convertor routine
//else it will look for a conversion rate
$0:=0
If (Count parameters:C259>=2)
	$0:=$1
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$2)
	If ([CURRENCIES:71]EURO_DESIGNATION:7#"")
		$0:=Round:C94(Euro converter:C676($1; [CURRENCIES:71]EURO_DESIGNATION:7; Euro:K40:12); 2)
	Else 
		//we need to look for a conversion rate
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1="€")
		If (Records in selection:C76([CURRENCIES:71])=0)
			CREATE RECORD:C68([CURRENCIES:71])
			[CURRENCIES:71]Currency_Code:1:="€"
			[CURRENCIES:71]Currency_Name:2:="Euro"
			DB_SaveRecord(->[CURRENCIES:71])
			AA_CheckFileUnlocked(->[CURRENCIES:71]X_ID:3)
		End if 
		
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1="€"; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2)
		ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
		$_d_Date:=[CURRENCY_RATES:72]Date:4
		QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_To:2="€"; *)
		QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_From:1=$2)
		ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
		$_d_Date2:=[CURRENCY_RATES:72]Date:4
		Case of 
			: ($_d_Date2>$_d_Date)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_To:2="€"; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_From:1=$2)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
				$_l_Direction:=1
			: ($_d_Date2=$_d_Date)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_To:2="€"; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_From:1=$2)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
				$_l_Direction:=1
			: ($_d_Date>$_d_Date2)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1="€"; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2)
				ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
				$_l_Direction:=2
		End case 
		$_r_Rate:=[CURRENCY_RATES:72]Rate:3
		If ($_r_Rate#0)
			If ($_l_Direction=1)
				$0:=Gen_Round(($1*$_r_Rate); 2; 2)
			Else 
				$0:=Gen_Round(($1/$_r_Rate); 2; 2)
			End if 
		Else 
			$0:=0
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("WS_EuroConvertor"; $_t_oldMethodName)
