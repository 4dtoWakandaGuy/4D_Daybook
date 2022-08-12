//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/06/2010 10:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SelOr; $0)
	C_LONGINT:C283(<>AutoProc; $_l_InputLength)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchwithAt; $1; vSelPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_sel2")
$_t_Search:=$1
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
	$0:=False:C215
Else 
	vSelPrev:=$_t_Search
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([PURCHASE_INVOICES:37])
	Else 
		
		If ($_t_Search="Purchase Invoice: @")
			$_l_InputLength:=(Length:C16("Purchase Invoice: "))+1
			$_t_Search:=Substring:C12($_t_Search; $_l_InputLength; 32000)
			QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_Search)
		Else 
			If ($_t_Search="Company: @")
				$_t_Search:=Substring:C12($_t_Search; 10; 32000)
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=$_t_Search)
			Else 
				If ($_t_Search#"◊PA")
					$_t_SearchwithAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; $_t_Search; $_t_SearchwithAt)
					SelOr_1(->[PURCHASE_INVOICES:37])
					If ((Records in selection:C76([PURCHASE_INVOICES:37])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						Sel_NoAtAt(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; $_t_Search; $_t_SearchwithAt)
						SelOr_2(->[PURCHASE_INVOICES:37])
						If ((Records in selection:C76([PURCHASE_INVOICES:37])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							Sel_NoAtAt(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Company_Code:2; $_t_Search; $_t_SearchwithAt)
							SelOr_2(->[PURCHASE_INVOICES:37])
							If ((Records in selection:C76([PURCHASE_INVOICES:37])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
								Comp_Proj($_t_SearchwithAt; ->[PURCHASE_INVOICES:37]Company_Code:2)
								SelOr_3(->[PURCHASE_INVOICES:37])
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	$0:=True:C214
	
	
End if 
ERR_MethodTrackerReturn("Purchases_sel2"; $_t_oldMethodName)
