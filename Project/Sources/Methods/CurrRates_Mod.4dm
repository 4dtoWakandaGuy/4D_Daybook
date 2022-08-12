//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRates_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/10/2012 18:47:16If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_FormDefaultHeight; $_l_FormDefaultWidth; vJ)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrRates_Mod")
If (False:C215)
	
	If (Records in table:C83([CURRENCY_RATES:72])=0)
		Gen_In("Currency Rates"; "CurrRates_File"; "Master"; ->[CURRENCY_RATES:72])
	Else 
		//NG Feb 2007 this is the only call in the system to Gen_ModAster..and it is not called(see above`
		
		Gen_ModAster("Currency Rates"; "CurrRates_File"; "Master"; ->[CURRENCY_RATES:72]; ->vJ; "CurrRates_Sel"; "Currency Rates")
	End if 
Else 
	Start_Process
	$_bo_OK:=CurrRates_File(True:C214)
	If ($_bo_OK)
		
		FORM GET PROPERTIES:C674([USER:15]; "CUR_ConversionRates"; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
		WIN_t_CurrentOutputform:="CUR_ConversionRates"
		Open_Pro_Window("Currencies"; 0; 1; ->[USER:15]; "CUR_ConversionRates"; "CUR_CLoseCurrency ")
		FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[CURRENCIES:71]))
		
		DIALOG:C40([USER:15]; "CUR_ConversionRates")
		Close_ProWin
	End if 
	Process_End
End if 
ERR_MethodTrackerReturn("CurrRates_Mod"; $_t_oldMethodName)