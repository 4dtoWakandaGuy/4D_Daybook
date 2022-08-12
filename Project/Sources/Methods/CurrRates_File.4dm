//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRates_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 12:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $1)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vJ; vOrd; vProcaMod)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("CurrRates_File")

FORM SET INPUT:C55([CURRENCY_RATES:72]; "Rates_in")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Rates_in"
FORM SET OUTPUT:C54([CURRENCY_RATES:72]; "Rates_Out")
WIN_t_CurrentOutputform:="Rates_Out"
vJ:=1
vProcaMod:=Module_MultiCurrency

MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(vProcaMod)
$0:=True:C214  // added NG June 2004
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Multi-Currency Module"; "Cancel")
	vOrd:=0
	OK:=0
	//ABORT ` removed NG June 2004
	$0:=False:C215  // added NG June 2004
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([CURRENCY_RATES:72])
	End if 
	If (Count parameters:C259>=1)
		If ($1=True:C214)
			$0:=True:C214
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("CurrRates_File"; $_t_oldMethodName)