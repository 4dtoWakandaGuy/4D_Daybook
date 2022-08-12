//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/06/2010 21:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; $_bo_Filters; $2; SRCH_bo_AutoSearch)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vIn; xNext)
	C_TEXT:C284(<>AutoFile; <>JobCode; <>OrderCode; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Sel")
//Invoices_Sel

vIn:=1
If (vSelPrev="•FSC")
	Invoices_SelP
Else 
	
	$_t_Search:=""
	
	If ($_t_Search="")
		Case of 
			: ((<>AutoFind) & (<>AutoFile="Orders") & (<>OrderCode#""))
				$_t_Search:="Order: "+<>OrderCode
			: ((<>AutoFind) & (<>AutoFile="Jobs") & (<>JobCode#""))
				$_t_Search:="Job: "+<>JobCode
		End case 
	End if 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:="Invoice: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	End if 
	
	If (DB_t_CurrentFormUsage#"Statement")
		$_t_Search:=Gen_SearchA("Number, Company or Date:"; vSelPrev; Term_SLPLWT("Find Sales Ledger Transactions"); $_t_Search; (Sel_CompCode*(Num:C11((DB_t_CurrentFormUsage#"AD") & (DB_t_CurrentFormUsage#"AA")))); "")
		If (OK=1)
			If (xNext=0)
				$_bo_Filters:=Invoices_Sel2($_t_Search)
				If ($_bo_Filters)
					If ((DB_t_CurrentFormUsage="Pay") | (DB_t_CurrentFormUsage="AD") | (DB_t_CurrentFormUsage="AA"))
						If (DB_t_CurrentFormUsage#"AA")
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
						End if 
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=<>DB_d_CurrentDate)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#1)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=2; *)
						QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=3; *)
						QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
					End if 
				End if 
			Else 
				Invoices_SelP
			End if 
		Else 
			vin:=0
		End if 
	Else 
		Invoices_SelP
	End if 
End if 
ERR_MethodTrackerReturn("Invoices_Sel"; $_t_oldMethodName)