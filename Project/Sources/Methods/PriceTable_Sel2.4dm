//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceTable_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/06/2010 11:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; vSelPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceTable_Sel2")
$_t_Search:=$1
vSelPrev:=$_t_Search
If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
	ALL RECORDS:C47([PRICE_TABLE:28])
	
Else 
	If ($_t_Search="price Code: @")
		$_l_StringLength:=Length:C16("price Code: ")+1
		$_t_Search:=Substring:C12($_t_Search; $_l_StringLength; 32000)
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2=$_t_Search)
	Else 
		If ($_t_Search="Company: @")
			$_t_Search:=Substring:C12($_t_Search; 10; 32000)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=$_t_Search)
		Else 
			$_t_SearchAt:=Sel_AtSign($_t_Search)
			Sel_NoAtAt(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Group_Code:6; $_t_Search; $_t_SearchAt)
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				Sel_NoAtAt(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Price_Code:2; $_t_Search; $_t_SearchAt)
				If (Records in selection:C76([PRICE_TABLE:28])=0)
					Sel_NoAtAt(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Product_Code:1; $_t_Search; $_t_SearchAt)
					If (Records in selection:C76([PRICE_TABLE:28])=0)
						Sel_NoAtAt(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Brand_Code:7; $_t_Search; $_t_SearchAt)
						If (Records in selection:C76([PRICE_TABLE:28])=0)
							Sel_NoAtAt(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Company_Code:8; $_t_Search; $_t_SearchAt)
							If (Records in selection:C76([PRICE_TABLE:28])=0)
								Comp_Proj($_t_SearchAt; ->[PRICE_TABLE:28]Company_Code:8)
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceTable_Sel2"; $_t_oldMethodName)
