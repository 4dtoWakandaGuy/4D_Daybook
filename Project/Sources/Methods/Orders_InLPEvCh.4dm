//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPEvCh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2009 13:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($3)
	C_BOOLEAN:C305($_bo_OnScreenAlert; $2; $_bo_OnScreenAlert; $2)
	C_LONGINT:C283($_l_OK)
	C_POINTER:C301($3; $1)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_oldMethodName; $_t_OrderCode; $_t_CompanyCode; $_t_ContactCode; $_t_oldMethodName; $_t_OrderCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPDEvCh")

If (Count parameters:C259>=2)
	$_bo_OnScreenAlert:=$2
Else 
	$_bo_OnScreenAlert:=True:C214
End if 

DB_SaveRecord(->[ORDERS:24])
AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
$_t_CompanyCode:=[ORDERS:24]Company_Code:1
$_t_ContactCode:=[ORDERS:24]Contact_Code:2
$_t_OrderCode:=[ORDERS:24]Order_Code:3
CUT NAMED SELECTION:C334([ORDERS:24]; "$Sel")
QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$_t_CompanyCode; *)
QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Contact_Code:2=$_t_ContactCode; *)

QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Order_Code:3#$_t_OrderCode)
OK:=1
If (Records in selection:C76([ORDERS:24])>0)
	If ($_bo_OnScreenAlert)
		Gen_Confirm("There is already an Order in the system for this Company, Contact and Event"+Char:C90(13)+"Do you want to delete this one and transfer to the other, or to try again?"; "Try again"; "Transfer")
		If (OK=1)
			USE NAMED SELECTION:C332("$Sel")
			$1->:=""
			REJECT:C38($1->)
		Else 
			CUT NAMED SELECTION:C334([ORDERS:24]; "$Sel")
			If (($_t_OrderCode#"") & (Character code:C91(Substring:C12($_t_OrderCode; Length:C16($_t_OrderCode); 1))#64))
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
				$_l_OK:=DB_DeletionControl(->[ORDERS:24]; "Orders_InLPevCh")
				If ($_l_OK=1)
					DELETE RECORD:C58([ORDERS:24])
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
					DELETE SELECTION:C66([ORDER_ITEMS:25])
				End if 
			End if 
			USE NAMED SELECTION:C332("$Sel")
			Orders_InLPB
		End if 
		OK:=0
	Else 
		If (Count parameters:C259>=3)
			If ($3->="")
				$3->:="There is already an Order in the system for this Company, Contact and Event"
			Else 
				$3->:=$3->+Char:C90(13)+"There is already an Order in the system for this Company, Contact and Event"
			End if 
		End if 
	End if 
	
	
Else 
	USE NAMED SELECTION:C332("$Sel")
End if 
ERR_MethodTrackerReturn("Orders_InLPDEvCh"; $_t_oldMethodName)

