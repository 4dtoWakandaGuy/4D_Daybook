//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/02/2012 20:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	C_BOOLEAN:C305(<>SelOr; $_bo_FromWebFind; $2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(<>AutoProc; <>MENU_l_BarModule; vOrd; vProcaMod; xNext)
	C_TEXT:C284(<>OrderCode; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; $Title; VSELPREV)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_Sel")
//Orders_Sel

//Rollo 23//2004
//modified to work from web request without interface
If (Count parameters:C259>0)
	$_t_Search:=$1
	$_bo_FromWebFind:=True:C214
	vSelPrev:=""
	xNext:=0
	OK:=1
Else 
	$_bo_FromWebFind:=False:C215
End if 


vOrd:=1
If (vSelPrev="•FSC")
	Orders_SelP
Else 
	
	If ($_bo_FromWebFind)
		
		If (<>OrderCode#"")
			$_t_Search:="Order: "+<>OrderCode
		Else 
			
			$_t_Search:=""
			
		End if 
		
	Else 
		If (<>OrderCode#"")
			$_t_Search:="Order: "+<>OrderCode
		Else 
			
			
			
			$_t_Search:=""
			
		End if 
		
	End if 
	If (vProcaMod=13)
		$Title:=Term_OrdWT("Find in SalesBook")
	Else 
		$Title:="Find Sales Orders"
	End if 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:="Order: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	End if 
	
	
	$_t_Search:=Gen_SearchA("Company, Contact or Order Code to find:"; vSelPrev; $Title; $_t_Search; Sel_ContCode; Sel_CompCode)
	
	
	If (OK=1)
		If (xNext=0)
			vSelPrev:=$_t_Search
			If (<>AutoProc=987654321)
				<>AutoProc:=0
				USE NAMED SELECTION:C332("◊IA")
				$_t_Search:="◊IA"
			Else 
				If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
					ALL RECORDS:C47([ORDERS:24])  //NG added the specific here
				Else 
					If ($_t_Search="PO: @") | ($_t_Search="Purchase order: @")
						If ($_t_Search="PO: @")
							$_t_Search:=Substring:C12($_t_Search; Length:C16("PO: ")+1)
							
						Else 
							$_t_Search:=Substring:C12($_t_Search; Length:C16("Purchase order: ")+1)
						End if 
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=$_t_Search)
						DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
						QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
					Else 
						
						
						If ($_t_Search="Company: @")
							$_t_Search:=Substring:C12($_t_Search; 10; 32000)
							QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$_t_Search)
						Else 
							If ($_t_Search="Contact: @")
								$_t_Search:=Substring:C12($_t_Search; 10; 32000)
								QUERY:C277([ORDERS:24]; [ORDERS:24]Contact_Code:2=$_t_Search)
							Else 
								If ($_t_Search="Order: @")
									$_t_Search:=Substring:C12($_t_Search; 8; 32000)
									QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_Search)
								Else 
									$_t_SearchAt:=Sel_AtSign($_t_Search)
									Sel_NoAtAt3(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2; $_t_Search; $_t_SearchAt)
									SelOr_1(->[ORDERS:24])
									If ((Records in selection:C76([ORDERS:24])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
										CompCont_Proj($_t_SearchAt; ->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
										SelOr_3(->[ORDERS:24])
									End if 
								End if 
							End if 
						End if 
						
					End if 
				End if 
			End if 
			Sel_FindMy(->[ORDERS:24]; ->[ORDERS:24]Person:5; ->[ORDERS:24]Taken_By:17)
			If (<>MENU_l_BarModule=10)
				QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Type:43="EVENT")
			End if 
		Else 
			Orders_SelP
		End if 
	Else 
		vOrd:=0
	End if 
End if 
ERR_MethodTrackerReturn("Orders_Sel"; $_t_oldMethodName)
