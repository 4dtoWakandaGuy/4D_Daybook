//%attributes = {}
If (False:C215)
	//Project Method Name:      Execute_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $0)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Execute_File")

//Execute_File

$0:=True:C214  //Added NG June 2004
$_bo_OK:=True:C214  //Added NG June 2004
Case of 
	: ($1="JobStages_File")
		$0:=JobStages_File
		
	: ($1="Macros_File")
		$0:=Macros_File
		
	: ($1="Projects_File")
		$0:=Projects_File
	: ($1="Qualities_File")
		$0:=Qualities_File
	: ($1="Country_File")
		$0:=Country_File
	: ($1="Stock_File")
		$0:=Stock_File
	: ($1="Letters_File")
		$0:=Letters_File
	: ($1="Companies_File")
		Companies_File
	: ($1="Contacts_File")
		Contacts_File
	: ($1="Diary_File")
		$_bo_OK:=Diary_File
	: ($1="Orders_File")
		$_bo_OK:=Orders_File
		//: ($1="SuperDiary_File")
	: ($1="Diary_Mod_NEW")
		$_bo_OK:=SuperDiary_File
	: ($1="Products_File")
		Products_File
		
	: ($1="Calls_File")  // added NG June 2004
		$_bo_OK:=Calls_File
	: ($1="Contracts_File")  // added NG June 2004
		$_bo_OK:=Contracts_File
	: ($1="Diary_File2")  // added NG June 2004
		$_bo_OK:=Diary_File2
	: ($1="CurrRates_File")  // added NG June 2004
		$_bo_OK:=CurrRates_File
		
	: ($1="Currency_File")
		$_bo_OK:=Currency_File
	: ($1="PurchOrd_File")
		$_bo_OK:=PurchOrd_File
	: ($1="PriceT_File")
		$_bo_OK:=PriceT_File
	: ($1="Sources_File")
		$_bo_OK:=Sources_File
	: ($1="Invoices_File")
		$_bo_OK:=Invoices_File
	: ($1="JobPers_File")
		$_bo_OK:=JobPers_File
	: ($1="Jobs_File")
		$_bo_OK:=Jobs_File
	: ($1="Table_Setup")
		If (Count parameters:C259>=2)
			$_l_TableNumber:=Table:C252($2)
			$_bo_OK:=Table_Setup($_l_TableNumber)
			
		End if 
	Else 
		//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1)
		//EXECUTE FORMULA($1)
		$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($1)
		EXECUTE METHOD:C1007($_t_ExecuteMethodName)
		
		
End case 
$0:=$_bo_OK  //Added NG June 2004
ERR_MethodTrackerReturn("Execute_File"; $_t_oldMethodName)