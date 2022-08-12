//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 21:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Filter; $2; SRCH_bo_AutoSearch)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vPu; xNext)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; VSELPREV)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases Sel")
//Purchases Sel

vPu:=1
If (vSelPrev="•FSC")
	Purchases_SelP
Else 
	
	$_t_Search:=""
	
	If (Count parameters:C259>=1)
		$_t_Search:="Purchase Invoice: "+$1
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	
	If (1=1)  //(DB_t_CurrentFormUsage#"AC") & (DB_t_CurrentFormUsage#"Pay"))
		$_t_Search:=Gen_SearchA("Purchase Code, Inv_No or Company:"; vSelPrev; Term_SLPLWT("Find Purchase Ledger Transactions"); $_t_Search; (Sel_CompCode*(Num:C11((DB_t_CurrentFormUsage#"AC") & (DB_t_CurrentFormUsage#"AA")))); "")
		If (OK=1)
			If (xNext=0)
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				$_bo_Filter:=Purchases_sel2($_t_Search)
				If ($_bo_Filter)
					If (($_t_CurrentFormUsage="Pay") | ($_t_CurrentFormUsage="AC") | ($_t_CurrentFormUsage="AA"))
						If ($_t_CurrentFormUsage#"AA")
							QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0)
						End if 
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Invoice_Date:5<=<>DB_d_CurrentDate)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=1; *)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=2; *)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=3; *)
						QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
					End if 
				End if 
				
			Else 
				Purchases_SelP
			End if 
		Else 
			vPu:=0
		End if 
	Else 
		Purchases_SelP
	End if 
End if 
ERR_MethodTrackerReturn("Purchases Sel"; $_t_oldMethodName)
