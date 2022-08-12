//%attributes = {}
If (False:C215)
	//Project Method Name:      InvoiceItems_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/06/2010 21:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvoiceItems_Sel2")
$_t_Search:=$1
vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18#"")
	Else 
		If ($_t_Search="Invoice: @")
			$_t_Search:=Substring:C12($_t_Search; 8; 32000)
			QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=$_t_Search)
		Else 
			If ($_t_Search="Company: @")
				$_t_Search:=Substring:C12($_t_Search; 10; 32000)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$_t_Search)
				If (Records in selection:C76([INVOICES:39])>0)
					Project_SelFast(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES_ITEMS:161]; ->[INVOICES_ITEMS:161]INVOICES_CODE:18)
				End if 
			Else 
				$_t_SearchAt:=Sel_AtSign($_t_Search)
				Sel_NoAtAt(->[INVOICES_ITEMS:161]; ->[INVOICES_ITEMS:161]INVOICES_CODE:18; $_t_Search; $_t_SearchAt)
				If (Records in selection:C76([INVOICES:39])=0)
					Sel_NoAtAt(->[INVOICES_ITEMS:161]; ->[INVOICES_ITEMS:161]Product_Code:1; $_t_Search; $_t_SearchAt)
					If (Records in selection:C76([INVOICES:39])=0)
						Sel_NoAtAt(->[INVOICES:39]; ->[INVOICES:39]Company_Code:2; $_t_Search; $_t_SearchAt)
						If (Records in selection:C76([INVOICES:39])>0)
							Project_SelFast(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES_ITEMS:161]; ->[INVOICES_ITEMS:161]INVOICES_CODE:18)
						Else 
							CompCont_Proj($_t_SearchAt; ->[INVOICES:39]Company_Code:2; ->[INVOICES:39]Contact_Code:3)
							If (Records in selection:C76([INVOICES:39])>0)
								Project_SelFast(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES_ITEMS:161]; ->[INVOICES_ITEMS:161]INVOICES_CODE:18)
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	QUERY SELECTION:C341([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18#"")
End if 
ERR_MethodTrackerReturn("InvoiceItems_Sel2"; $_t_oldMethodName)