//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrConv_Title
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; ch0; ch1; ch2; r1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $0; $1; ACC_t_CurrencyCode; vCallCode; vType_)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrConv_Title")
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
	If (ACC_t_CurrencyCode="")
		$0:="All Currencies"
	Else 
		$0:="Currency: "+ACC_t_CurrencyCode
	End if 
	If (Count parameters:C259=0)
		If ((r1=1) & (vCallCode#""))
			$0:=$0+"    Converted to "+vCallCode
			Case of 
				: (ch0=1)
					$0:=$0+" at current rates"
				: (ch1=1)
					$0:=$0+" at average rates"
				: (ch2=1)
					$0:=$0+" at rate as posted"
			End case 
			If ((vType_#"") & (vType_#"*Any*"))
				$0:=$0+" ("+vType_+")"
			End if 
		Else 
			$0:=$0+"    (Not Converted)"
		End if 
		// TRACE
	Else 
		Case of 
			: (Size of array:C274($2->)>1)
				//more than one currency
				If (Size of array:C274($2->)=Records in table:C83([CURRENCIES:71]))
					$0:="All Currencies "
				Else 
					$0:="Currencies:"
					For ($_l_Index; 1; Size of array:C274($2->))
						$0:=$0+" "+$2->{$_l_Index}
						If ($_l_Index<Size of array:C274($2->))
							$0:=$0+","
						End if 
					End for 
				End if 
				$0:=$0+" Converted to "+$1
			: (Size of array:C274($2->)=1)
				If ($2->{1}=$1)
					$0:="Currency: "+$2->{1}+" Not Converted"
				Else 
					$0:="Currency: "+$2->{1}+" Converted to "+$1
				End if 
			Else 
				$0:=""
		End case 
	End if 
	
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("CurrConv_Title"; $_t_oldMethodName)