If (False:C215)
	//object Name: [ORDERS]Orders_In.oHorEnclosureSplitter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/06/2009 17:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ButtonHeight; $_l_event; $_l_Gap; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom5; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3)
	C_LONGINT:C283($_l_ObjectLeft5; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectRight5; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectTop4; $_l_ObjectTop5; $_l_ObjectWith)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; bPrintAuths; bVoid; xApply)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oHorEnclosureSplitter"; Form event code:C388)
//THIS SHOULD MOVE THE CC AUTH AREA!
//Here we work different
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (False:C215)
			
			
			OBJECT GET COORDINATES:C663(*; "oComment2Splitter"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectTop3:=$_l_ObjectTop2  //to keep this simple to read
			
			OBJECT GET COORDINATES:C663(*; "oEnclosureSplitter"; $_l_ObjectLeft3; $_l_ObjectTop4; $_l_ObjectRight3; $_l_ObjectBottom3)
			$_l_ObjectWith:=$_l_ObjectRight3-$_l_ObjectLeft3
			OBJECT MOVE:C664(*; "oEnclosureSplitter"; $_l_ObjectLeft3; $_l_ObjectTop4; $_l_ObjectRight3; $_l_ObjectTop3; *)
			OBJECT GET COORDINATES:C663(*; "oComments2"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oComments2"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectTop3-5; *)
			OBJECT GET COORDINATES:C663(*; "oEnclosures"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oEnclosures"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectTop3-5; *)
			
			//now set the other objects around that
			$_l_ObjectBottom3:=$_l_ObjectBottom2
			OBJECT GET COORDINATES:C663(*; "oCardObjectbox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oListBoxAuths"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			$_l_Gap:=$_l_ObjectTop2-$_l_ObjectTop  //Distance beetween top of CC auth list box and the surrounding box
			
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
			If ($_l_ObjectBottom>($_l_WindowHeight-20))
				$_l_ObjectBottom:=$_l_WindowHeight-20
			End if 
			If ($_l_ObjectBottom2>($_l_ObjectBottom-20))
				$_l_ObjectBottom2:=$_l_ObjectBottom-20
				$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			End if 
			$_l_Gap:=18
			OBJECT MOVE:C664(*; "oCardObjectbox"; $_l_ObjectLeft; $_l_ObjectTop3+5; $_l_ObjectRight; $_l_ObjectBottom; *)
			$_l_ObjectBottom3:=$_l_ObjectBottom-25
			OBJECT MOVE:C664(*; "oListBoxAuths"; $_l_ObjectLeft2; (($_l_ObjectTop3+5)+$_l_Gap); $_l_ObjectRight2; $_l_ObjectBottom3; *)
			//$_l_ObjectBottom3:=(($_l_ObjectTop3+5)+$_l_Gap)+$_l_ObjectHeight
			OBJECT GET COORDINATES:C663(bPrintAuths; $_l_ObjectLeft5; $_l_ObjectTop5; $_l_ObjectRight5; $_l_ObjectBottom5)
			$_l_ButtonHeight:=$_l_ObjectBottom5-$_l_ObjectTop5
			OBJECT MOVE:C664(bPrintAuths; $_l_ObjectLeft5; ($_l_ObjectBottom3+5); $_l_ObjectRight5; ($_l_ObjectBottom3+5)+$_l_ButtonHeight; *)
			OBJECT GET COORDINATES:C663(bVoid; $_l_ObjectLeft5; $_l_ObjectTop5; $_l_ObjectRight5; $_l_ObjectBottom5)
			$_l_ButtonHeight:=$_l_ObjectBottom5-$_l_ObjectTop5
			OBJECT MOVE:C664(bVoid; $_l_ObjectLeft5; ($_l_ObjectBottom3+5); $_l_ObjectRight5; ($_l_ObjectBottom3+5)+$_l_ButtonHeight; *)
			OBJECT GET COORDINATES:C663(xApply; $_l_ObjectLeft5; $_l_ObjectTop5; $_l_ObjectRight5; $_l_ObjectBottom5)
			$_l_ButtonHeight:=$_l_ObjectBottom5-$_l_ObjectTop5
			OBJECT MOVE:C664(xApply; $_l_ObjectLeft5; ($_l_ObjectBottom3+5); $_l_ObjectRight5; ($_l_ObjectBottom3+5)+$_l_ButtonHeight; *)
			OBJECT MOVE:C664(*; "oCardLabel"; $_l_ObjectRight5+5; ($_l_ObjectBottom3+5); $_l_ObjectRight5+90; ($_l_ObjectBottom3+5)+13; *)
			OBJECT MOVE:C664([ORDERS:24]Credit_Card_No:49; $_l_ObjectRight5+95; ($_l_ObjectBottom3+5); $_l_ObjectRight-5; ($_l_ObjectBottom3+5)+13; *)
		End if 
		ORD_SetFormObjects(204)
		
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.oHorEnclosureSplitter"; $_t_oldMethodName)
