//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalRepTit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 15:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; ch0; ch1; ch2; r1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $1; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; vAnalCodeT; vCallCode; vText; vTitle3; vTitle4; vType_)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalRepTit")
If (vText#"")
	vTitle4:="Layer: "+vText+"   "
End if 
If ((ACC_t_AnalysisCodeFrom#"") | (vAnalCodeT#""))
	vTitle4:=vTitle4+"Analysis: "+ACC_t_AnalysisCodeFrom+" to "+vAnalCodeT
Else 
	vTitle4:=vTitle4+"All Analyses"
End if 
If (Count parameters:C259=0)
	If (ACC_t_CurrencyCode="")
		vTitle3:="All Currencies"
	Else 
		vTitle3:="Currency: "+ACC_t_CurrencyCode
	End if 
	If ((r1=1) & (vCallCode#""))
		vTitle3:=vTitle3+"    Converted to "+vCallCode
		Case of 
			: (ch0=1)
				vTitle3:=vTitle3+" at current rates"
			: (ch1=1)
				vTitle3:=vTitle3+" at average rates"
			: (ch2=1)
				vTitle3:=vTitle3+" at rate as posted"
		End case 
		If ((vType_#"") & (vType_#"*Any*"))
			vTitle3:=vTitle3+" ("+vType_+")"
		End if 
	Else 
		vTitle3:=vTitle3+"    (Not Converted)"
	End if 
Else 
	
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
		
		If (Count parameters:C259>=2)
			Case of 
				: (Size of array:C274($2->)>1)
					//more than one currency
					If (Size of array:C274($2->)=Records in table:C83([CURRENCIES:71]))
						vTitle3:="All Currencies "
					Else 
						vTitle3:="Currencies:"
						For ($_l_Index; 1; Size of array:C274($2->))
							vTitle3:=vTitle3+" "+$2->{$_l_Index}
							If ($_l_Index<Size of array:C274($2->))
								vTitle3:=vTitle3+","
							End if 
						End for 
					End if 
					vTitle3:=vTitle3+" Converted to "+$1
				: (Size of array:C274($2->)=1)
					If ($2->{1}=$1)
						vTitle3:="Currency: "+$2->{1}+" Not Converted"
					Else 
						VTitle3:="Currency: "+$2->{1}+" Converted to "+$1
					End if 
				Else 
					vTitle3:=""
			End case 
		Else 
			VTitle3:=""
		End if 
		
	Else 
		Vtitle3:=""
	End if 
	
End if 

Date_Time
ERR_MethodTrackerReturn("Acc_BalRepTit"; $_t_oldMethodName)
