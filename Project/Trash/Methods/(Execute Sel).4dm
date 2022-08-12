//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Execute Sel
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
	C_BOOLEAN:C305($3)
	C_TEXT:C284($_t_ExecuteMethodName; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Execute Sel")

//Execute Sel
Case of 
	: ($1="Jobs_Sel")
		If (Count parameters:C259>=3)
			Jobs_Sel($2; $3)
		Else 
			Jobs_Sel
		End if 
		
	: ($1="JobStages_Sel")
		If (Count parameters:C259>=3)
			JobStages_Sel($2; $3)
		Else 
			JobStages_Sel
		End if 
	: ($1="Letter sel")
		If (Count parameters:C259>=3)
			Letters_Sel($2; $3)
		Else 
			Letters_Sel
		End if 
		
	: ($1="PriceT_Sel")
		If (Count parameters:C259>=3)
			PriceT_Sel($2; $3)
		Else 
			PriceT_Sel
		End if 
		
	: ($1="Projects_Sel")
		If (Count parameters:C259>=3)
			Projects_Sel($2; $3)
		Else 
			Projects_Sel
		End if 
		
	: ($1="Purchases_Sel")
		If (Count parameters:C259>=3)
			Purchases_Sel($2; $3)
		Else 
			Purchases_Sel
		End if 
		
	: ($1="PurchOrd_Sel")
		If (Count parameters:C259>=3)
			PurchOrd_Sel($2; $3)
		Else 
			PurchOrd_Sel
		End if 
		
	: ($1="Stock_Sel")
		If (Count parameters:C259>=3)
			Stock_Sel($2; $3)
			
		Else 
			Stock_Sel
		End if 
		
	: ($1="Invoices_Sel")
		If (Count parameters:C259>=3)
			Invoices_Sel($2; $3)
		Else 
			Invoices_Sel
		End if 
	: ($1="JobPers_Sel")
		If (Count parameters:C259>=2)
			JobPers_Sel($2; $3)
		Else 
			JobPers_Sel
		End if 
	: ($1="Comp_Sel")
		Comp_Sel
	: ($1="Cont_Sel")
		Cont_Sel
	: ($1="Cont_SelAUTO")
		If (Count parameters:C259>=2)
			Cont_SelAUTO($2)
		Else 
			Cont_Sel
		End if 
	: ($1="Diary_Sel")
		If (Count parameters:C259>=3)
			Diary_Sel($2; False:C215; $3)
			
		Else 
			Diary_Sel
		End if 
	: ($1="SuperDiary_Sel")
		SuperDiary_Sel
	: ($1="Orders_Sel")
		Orders_Sel
	: ($1="Prod_Sel")
		Prod_Sel
		
		
	: ($1="Calls_Sel")
		If (Count parameters:C259>=3)
			Calls_Sel($2; $3)
			
		Else 
			Calls_Sel
		End if 
	: ($1="Contracts_Sel")
		If (Count parameters:C259>=3)
			Contracts_Sel($2; $3)
		Else 
			Contracts_Sel
		End if 
	: ($1="SD_DiarySel")
		If (Count parameters:C259>=3)
			//create the set first
			
			SD_DiarySel
		Else 
			SD_DiarySel
		End if 
		
	Else 
		//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1)
		//EXECUTE FORMULA($1)
		$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($1)
		EXECUTE METHOD:C1007($_t_ExecuteMethodName)
End case 
ERR_MethodTrackerReturn("Execute Sel"; $_t_oldMethodName)