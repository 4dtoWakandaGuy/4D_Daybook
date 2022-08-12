//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_PalletteSetObjects
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Prod_PalletteSetObjects`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; PROD_bo_ViewExpand)
	C_LONGINT:C283($_l_ButtonsTop; $_l_CurrentFormPage; $_l_NewObjectLeft; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $_l_TopofProductArea; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; $1; vrow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_PalletteSetObjects")
If (Count parameters:C259>=1)
	$_l_CurrentFormPage:=$1
Else 
	$_l_CurrentFormPage:=FORM Get current page:C276
End if 


Case of 
	: ($_l_CurrentFormPage=2) | (PROD_bo_ViewExpand=False:C215)
		//PROD_bo_WinObjectsSet:=True
		//Prod_PalletteSetObjects (False)
		//GET OBJECT RECT(*;"oCloseWindow";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oCloseWindow";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;(590-10);*)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		OBJECT GET COORDINATES:C663(*; "oCloseWindow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=(($_l_WindowWidth-10)-$_l_ObjectWidth)
		OBJECT MOVE:C664(*; "oCloseWindow"; $_l_NewObjectLeft; (($_l_WindowHeight-10)-$_l_ObjectHeight); $_l_NewObjectLeft+$_l_ObjectWidth; ($_l_WindowHeight-10); *)
		OBJECT GET COORDINATES:C663(*; "oCopyQuantities"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=($_l_NewObjectLeft-10)-$_l_ObjectWidth
		OBJECT MOVE:C664(*; "oCopyQuantities"; $_l_NewObjectLeft; (($_l_WindowHeight-10)-$_l_ObjectHeight); $_l_NewObjectLeft+$_l_ObjectWidth; ($_l_WindowHeight-10); *)
		OBJECT GET COORDINATES:C663(*; "oCopyhighlight"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=($_l_NewObjectLeft-10)-$_l_ObjectWidth
		OBJECT MOVE:C664(*; "oCopyhighlight"; $_l_NewObjectLeft; (($_l_WindowHeight-10)-$_l_ObjectHeight); $_l_NewObjectLeft+$_l_ObjectWidth; ($_l_WindowHeight-10); *)
		$_l_ButtonsTop:=(($_l_WindowHeight-10)-$_l_ObjectHeight)
		OBJECT GET COORDINATES:C663(*; "oPicKey"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "oPicKey"; $_l_ObjectLeft; $_l_ButtonsTop; $_l_ObjectRight; $_l_ButtonsTop+$_l_ObjectHeight; *)
		OBJECT MOVE:C664(*; "oButtonKey"; $_l_ObjectLeft; $_l_ButtonsTop; $_l_ObjectRight; $_l_ButtonsTop+$_l_ObjectHeight; *)
		OBJECT GET COORDINATES:C663(*; "oCAT"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=($_l_NewObjectLeft-10)-$_l_ObjectWidth
		OBJECT MOVE:C664(*; "oCAT"; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-10; ($_l_ButtonsTop-10); *)
		
		//MOVE OBJECT(*;"oCloseWindow";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;(590-10);*)
	: ($_l_CurrentFormPage=1) | (PROD_bo_ViewExpand=True:C214)
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		$_l_TopofProductArea:=$_l_WindowHeight-(582-333)
		$_l_WindowHeight:=$_l_TopofProductArea
		//```
		//$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		//$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		OBJECT GET COORDINATES:C663(*; "oCloseWindow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=(($_l_WindowWidth-10)-$_l_ObjectWidth)
		OBJECT MOVE:C664(*; "oCloseWindow"; $_l_NewObjectLeft; (($_l_WindowHeight-10)-$_l_ObjectHeight); $_l_NewObjectLeft+$_l_ObjectWidth; ($_l_WindowHeight-10); *)
		OBJECT GET COORDINATES:C663(*; "oCopyQuantities"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=($_l_NewObjectLeft-10)-$_l_ObjectWidth
		OBJECT MOVE:C664(*; "oCopyQuantities"; $_l_NewObjectLeft; (($_l_WindowHeight-10)-$_l_ObjectHeight); $_l_NewObjectLeft+$_l_ObjectWidth; ($_l_WindowHeight-10); *)
		OBJECT GET COORDINATES:C663(*; "oCopyhighlight"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=($_l_NewObjectLeft-10)-$_l_ObjectWidth
		OBJECT MOVE:C664(*; "oCopyhighlight"; $_l_NewObjectLeft; (($_l_WindowHeight-10)-$_l_ObjectHeight); $_l_NewObjectLeft+$_l_ObjectWidth; ($_l_WindowHeight-10); *)
		$_l_ButtonsTop:=(($_l_WindowHeight-10)-$_l_ObjectHeight)
		OBJECT GET COORDINATES:C663(*; "oPicKey"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		OBJECT MOVE:C664(*; "oPicKey"; $_l_ObjectLeft; $_l_ButtonsTop; $_l_ObjectRight; $_l_ButtonsTop+$_l_ObjectHeight; *)
		OBJECT MOVE:C664(*; "oButtonKey"; $_l_ObjectLeft; $_l_ButtonsTop; $_l_ObjectRight; $_l_ButtonsTop+$_l_ObjectHeight; *)
		OBJECT GET COORDINATES:C663(*; "oCAT"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=($_l_NewObjectLeft-10)-$_l_ObjectWidth
		OBJECT MOVE:C664(*; "oCAT"; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-10; ($_l_ButtonsTop-10); *)
		OBJECT GET COORDINATES:C663(*; "oStock"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oStock"; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
		OBJECT GET COORDINATES:C663(*; "oPROD_T_DetailProductextbut"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		$_l_NewObjectLeft:=(($_l_WindowWidth-10)-$_l_ObjectWidth)
		OBJECT MOVE:C664(*; "oPROD_T_DetailProductextbut"; $_l_NewObjectLeft; $_l_ObjectTop; $_l_NewObjectLeft+$_l_ObjectWidth; $_l_ObjectBottom; *)
		
End case 
ERR_MethodTrackerReturn("Prod_PalletteSetObjects"; $_t_oldMethodName)
