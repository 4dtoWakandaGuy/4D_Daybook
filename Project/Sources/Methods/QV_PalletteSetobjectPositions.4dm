//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_PalletteSetobjectPositions
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
	C_LONGINT:C283($_l_CurrentFormPage; $_l_Height; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectTop2; $_l_Width; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_PalletteSetobjectPositions")
//NG I have created this method to set object positions on the information palette
//this is so that on Page_3 we can resize the list box area rather than the heirarchical list
If (Count parameters:C259>=1)
	$_l_CurrentFormPage:=$1
Else 
	$_l_CurrentFormPage:=FORM Get current page:C276
End if 
If ($_l_CurrentFormPage=3)
	
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_Width:=$_l_WindowRight-$_l_WindowLeft
	$_l_Height:=$_l_WindowBottom-$_l_WindowTop
	If (($_l_WindowBottom-$_l_WindowTop)>414)
		OBJECT GET COORDINATES:C663(*; "oInfoGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oInfoGroupBox"; $_l_ObjectLeft; 47; $_l_ObjectRight; 277; *)
		
		OBJECT GET COORDINATES:C663(*; "oHLInfolist"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oHLInfolist"; $_l_ObjectLeft; 71; $_l_ObjectRight; 227; *)
		
		OBJECT GET COORDINATES:C663(*; "oFilterGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oFilterGroupBox"; $_l_ObjectLeft; 230; $_l_ObjectRight; 227; *)
		
		OBJECT GET COORDINATES:C663(*; "oShowAllBut"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oShowAllBut"; $_l_ObjectLeft; 248; $_l_ObjectRight; 266; *)
		
		OBJECT GET COORDINATES:C663(*; "oFilterGroups"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oFilterGroups"; $_l_ObjectLeft; 249; $_l_ObjectRight; 265; *)
		//``
		OBJECT GET COORDINATES:C663(*; "oExpandAll"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oExpandAll"; $_l_ObjectLeft; 230; $_l_ObjectRight; 247; *)
		
		OBJECT GET COORDINATES:C663(*; "ocollapseall"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "ocollapseall"; $_l_ObjectLeft; 250; $_l_ObjectRight; 268; *)
		
		OBJECT GET COORDINATES:C663(*; "oInfoGroupLabel1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oInfoGroupLabel1"; $_l_ObjectLeft; 288; $_l_ObjectRight; 301; *)
		
		OBJECT GET COORDINATES:C663(*; "oInfoGroupName1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oInfoGroupName1"; $_l_ObjectLeft; 284; $_l_ObjectRight; 296; *)
		
		OBJECT GET COORDINATES:C663(*; "oinfogrouppopup1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oinfogrouppopup1"; $_l_ObjectLeft; 282; $_l_ObjectRight; 297; *)
		OBJECT MOVE:C664(*; "oPopUpPict"; $_l_ObjectLeft; 282; $_l_ObjectRight; 297; *)
		OBJECT GET COORDINATES:C663(*; "oListBox1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oListBox1"; $_l_ObjectLeft; 305; $_l_ObjectRight; ($_l_Height-27); *)
	Else 
		
	End if 
Else 
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_Width:=$_l_WindowRight-$_l_WindowLeft
	$_l_Height:=$_l_WindowBottom-$_l_WindowTop
	OBJECT GET COORDINATES:C663(*; "oInfoGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectBottom2:=$_l_Height-(414-277)
	OBJECT MOVE:C664(*; "oInfoGroupBox"; $_l_ObjectLeft; 47; $_l_ObjectRight; $_l_ObjectBottom2; *)
	
	OBJECT GET COORDINATES:C663(*; "oHLInfolist"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectBottom2:=$_l_Height-(414-226)
	
	OBJECT MOVE:C664(*; "oHLInfolist"; $_l_ObjectLeft; 71; $_l_ObjectRight; $_l_ObjectBottom2; *)
	
	OBJECT GET COORDINATES:C663(*; "oFilterGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectTop2:=$_l_Height-(414-230)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(*; "oFilterGroupBox"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
	
	OBJECT GET COORDINATES:C663(*; "oShowAllBut"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectTop2:=$_l_Height-(414-248)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	
	OBJECT MOVE:C664(*; "oShowAllBut"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
	
	OBJECT GET COORDINATES:C663(*; "oFilterGroups"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectTop2:=$_l_Height-(414-249)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	
	OBJECT MOVE:C664(*; "oFilterGroups"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
	//``
	OBJECT GET COORDINATES:C663(*; "oExpandAll"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectTop2:=$_l_Height-(414-230)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(*; "oExpandAll"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
	
	OBJECT GET COORDINATES:C663(*; "ocollapseall"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectTop2:=$_l_Height-(414-250)
	$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
	OBJECT MOVE:C664(*; "ocollapseall"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
	//``````
	If (False:C215)
		$_l_ObjectTop2:=$_l_Height-(414-283)
		OBJECT GET COORDINATES:C663(*; "oInfoGroupLabel1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "oInfoGroupLabel1"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
		
		OBJECT GET COORDINATES:C663(*; "oInfoGroupName1"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "oInfoGroupName1"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
		
		OBJECT GET COORDINATES:C663(*; "oinfogrouppopup1"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom)
		
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "oinfogrouppopup1"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
		OBJECT MOVE:C664(*; "oPopUpPict"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; ($_l_ObjectTop2+$_l_ObjectHeight); *)
		
		OBJECT GET COORDINATES:C663(*; "oListBox1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=392-305
		OBJECT MOVE:C664(*; "oListBox1"; $_l_ObjectLeft; ($_l_Height-27)-$_l_ObjectHeight; $_l_ObjectRight; ($_l_Height-27); *)
	End if 
	
End if 
//Note that this only gets called on resize if the page no =3
//it is called when going to that page and when leaving the page-it does not need to be called on other pages
ERR_MethodTrackerReturn("QV_PalletteSetobjectPositions"; $_t_oldMethodName)
