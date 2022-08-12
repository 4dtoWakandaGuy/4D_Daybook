//%attributes = {}

If (False:C215)
	//Project Method Name:      Startup_GLOBMod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Real1)
	//C_UNKNOWN(a01Real2)
	//C_UNKNOWN(a01Stri1)
	//C_UNKNOWN(a01Stri2)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Column; $_l_Index; $_l_Row; $_l_SizeOfArray; $1; $2)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_GLOBMod")

//NG this method was a call back method for the area list area on the form [companies]dOpening_Bal
$_t_oldMethodName:=ERR_MethodTracker("Startup_GLOBMod")
//NG SEPTEMBER 2006--ACTUALLY THIS METHOD IS NO LONGER CALLED

//_GetCurrCell (GEN_lb_ItemsArea;$_l_Column;$_l_Row)

LISTBOX GET CELL POSITION:C971(GEN_lb_ItemsArea; $_l_Column; $_l_Row)

If (($_l_Column<5) & ($_l_Row<=Size of array:C274(a01Stri1)))
	Case of 
		: ($_l_Column=1)
			RemoveLeadTr(Uppercase:C13(a01Stri1{$_l_Row}); ->a01Stri1{$_l_Row})
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=a01Stri1{$_l_Row})
			If (Records in selection:C76([ACCOUNTS:32])=0)
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=a01Stri1{$_l_Row}+"@")
			End if 
			a01Stri1{$_l_Row}:=[ACCOUNTS:32]Account_Code:2
			a01Stri2{$_l_Row}:=[ACCOUNTS:32]Account_Name:3
			//AL_UpdateArrays (GEN_lb_ItemsArea;-2)
		: ($_l_Column=2)
			RemoveLeadTr(a01Stri2{$_l_Row}; ->a01Stri2{$_l_Row})
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Name:3=a01Stri2{$_l_Row})
			If (Records in selection:C76([ACCOUNTS:32])=0)
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Name:3=a01Stri2{$_l_Row}+"@")
			End if 
			a01Stri2{$_l_Row}:=[ACCOUNTS:32]Account_Name:3
			a01Stri1{$_l_Row}:=[ACCOUNTS:32]Account_Code:2
			//AL_UpdateArrays (GEN_lb_ItemsArea;-2)
		: (($_l_Column=3) | ($_l_Column=4))
			If ((a01Real1{$_l_Row}#0) & (a01Real2{$_l_Row}#0))
				Gen_Alert("You may only have either a Debit figure or a Credit figure - not both"; "Try again")
				If ($_l_Column=3)
					a01Real1{$_l_Row}:=0
				Else 
					a01Real2{$_l_Row}:=0
				End if 
			End if 
			$_l_SizeOfArray:=Size of array:C274(a01Real1)
			vT1:=0
			vT2:=0
			For ($_l_Index; 1; $_l_SizeOfArray)
				vT1:=vT1+a01Real1{$_l_Index}
				vT2:=vT2+a01Real2{$_l_Index}
			End for 
			ARRAY TEXT:C222($_at_Columns; 3)
			ARRAY TEXT:C222($_at_Values; 3)
			ARRAY TEXT:C222($_at_Formats; 3)
			$_at_Columns{1}:="Account balances Total"
			$_at_Values{1}:="Difference: "+String:C10(Round:C94((vT1-vT2); 2))
			$_at_Formats{1}:="|Accounts"
			$_at_Columns{2}:="TOtal Debits"
			$_at_Values{2}:=String:C10(vT1)
			$_at_Formats{2}:="|Accounts"
			$_at_Columns{3}:="Total Credits"
			$_at_Values{3}:=String:C10(vT2)
			$_at_Formats{3}:="|Accounts"
			//LB_SetFooters (->GEN_lb_ItemsArea;->$_at_Columns;->$_at_Values;->$_at_Formats)
			
			//AL_UpdateArrays (GEN_lb_ItemsArea;$_l_SizeOfArray)
	End case 
End if 
$0:=True:C214
ERR_MethodTrackerReturn("Startup_GLOBMod"; $_t_oldMethodName)
