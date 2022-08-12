//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev_SelLP
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
	C_LONGINT:C283($_l_MenuItem; $0; $1; vP; vPu; vTButt)
	C_POINTER:C301($4; $5)
	C_REAL:C285($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_SelLP")
If (Count parameters:C259=0)
	$_l_MenuItem:=Sel_LPmi("StockLev_SelLP")
Else 
	If ($1>0)
		$_l_MenuItem:=$1
	Else 
		$_l_MenuItem:=Sel_LPmi("StockLev_SelLP")
	End if 
	
End if 

$0:=0
If ($_l_MenuItem>0)
	Case of 
		: ($_l_MenuItem=1)
			If (Count parameters:C259<2)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PRODUCTS:9]; ->vP; ->vPu; "Prod_SelP"; "Many"; "StockLev_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_LEVELS:58]Product_Code:1)
			Else 
				If ($2=0) | ($2=2)
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PRODUCTS:9]; ->vP; ->vPu; "Prod_SelP"; "Many"; "StockLev_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_LEVELS:58]Product_Code:1; $2; $3; $4; $5)
				Else 
					//pass -1
					$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PRODUCTS:9]; ->vP; ->vPu; "Prod_SelP"; "Many"; "StockLev_SelPvs"; ""; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_LEVELS:58]Product_Code:1; -1; $3; $4; $5)
				End if 
				
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("StockLev_SelLP"; $_t_oldMethodName)
