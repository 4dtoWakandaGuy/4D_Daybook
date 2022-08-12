//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrConv_Convert
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(255;aPrevEvent2;0)
	//ARRAY TEXT(255;aPrevTypeC;0)
	//ARRAY DATE(aPrevEventDate;0)
	//ARRAY REAL(GEN_ar_Value;0)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_Date; $_d_Date2; $_d_PreviousEventDate; $2; SRCH_d_EntryDateFrom)
	C_LONGINT:C283($_l_ArrayPosition; $_l_index; ch0; ch1; ch2; r1)
	C_REAL:C285($_r_Total; $0; $1)
	C_TEXT:C284($_t_DateString; $_t_EndDateString; $_t_oldMethodName; $3; vCallCode; ACC_t_CurrencyCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrConv_Convert")
//CurrConv_Convert


$0:=$1

If ((r1=1) & (vCallCode#""))
	Case of 
			
		: (ch0=1)
			//if only one currency to check against
			If (ACC_t_CurrencyCode#"")
				Calc_BalArr
				If ((ACC_t_CurrencyCode#vCallCode) & (Records in selection:C76([CURRENCY_RATES:72])>0))
					If ([CURRENCY_RATES:72]Currency_From:1=ACC_t_CurrencyCode)
						$0:=Gen_Round(($0*[CURRENCY_RATES:72]Rate:3); 2; 2)
					Else 
						$0:=Gen_Round(($0/[CURRENCY_RATES:72]Rate:3); 2; 2)
					End if 
				End if 
			Else 
				$_l_ArrayPosition:=Find in array:C230(aPrevTypeC; $3)
				If ($_l_ArrayPosition>0)
					If ($3#vCallCode)
						$0:=Gen_Round(($0*GEN_ar_Value{$_l_ArrayPosition}); 2; 2)
					End if 
				End if 
			End if 
			
		: (ch1=1)
			$0:=0
			
		: (ch2=1)
			$0:=0
			
			$_d_Date:=$2
			If ($_d_Date<!1990-01-01!)
				$_d_Date:=<>DB_d_CurrentDate
			End if 
			$_t_DateString:=Date_YYYYMMDD($_d_Date)
			$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; $_t_DateString+$3)
			If ($_l_ArrayPosition>0)
				$0:=Gen_Round(($0+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
			Else 
				$_l_index:=1
				If (Size of array:C274(aPrevEvent2)>0)
					$_d_PreviousEventDate:=aPrevEventDate{1}
					$_d_Date2:=$_d_Date-$_l_index
					$_t_DateString:=Date_YYYYMMDD($_d_Date-$_l_index)
					If ($_d_Date2<$_d_PreviousEventDate)
						$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; "@"+$3)
						If ($_l_ArrayPosition>0)
							$0:=Gen_Round(($0+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
						Else 
							$0:=Gen_Round(($0+$_r_Total); 2; 2)
						End if 
					Else 
						While ((Date:C102($_t_DateString)>=$_d_PreviousEventDate) & ($_l_ArrayPosition=-1))
							IDLE:C311  // 03/04/03 pb
							$_t_DateString:=Date_YYYYMMDD($_d_Date-$_l_index)
							$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; $_t_DateString+$3)
							$_l_index:=$_l_index+1
						End while 
						If ($_l_ArrayPosition>0)
							$0:=Gen_Round(($0+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
						Else 
							$_l_index:=1
							If ($_d_Date<SRCH_d_EntryDateFrom)
								$_d_Date:=SRCH_d_EntryDateFrom
							End if 
							$_t_EndDateString:=Date_YYYYMMDD(<>DB_d_CurrentDate)
							While (($_t_DateString<=$_t_EndDateString) & ($_l_ArrayPosition=-1))
								IDLE:C311  // 03/04/03 pb
								$_t_DateString:=Date_YYYYMMDD($_d_Date+$_l_index)
								$_l_ArrayPosition:=Find in array:C230(aPrevEvent2; $_t_DateString+$3)
								$_l_index:=$_l_index+1
							End while 
							If ($_l_ArrayPosition>0)
								$0:=Gen_Round(($0+($_r_Total*GEN_ar_Value{$_l_ArrayPosition})); 2; 2)
							Else 
								$0:=Gen_Round(($0+$_r_Total); 2; 2)
							End if 
						End if 
					End if 
				Else 
					$0:=Gen_Round(($0+$_r_Total); 2; 2)
				End if 
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("CurrConv_Convert"; $_t_oldMethodName)