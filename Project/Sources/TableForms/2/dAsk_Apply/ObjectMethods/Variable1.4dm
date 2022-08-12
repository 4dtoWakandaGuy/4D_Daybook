If (False:C215)
	//object Name: [COMPANIES]dAsk_Apply.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/08/2012 17:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWidth; $_l_Size; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; $_l_WindowWidth; s1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Apply.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (s1=1)
			
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_Size:=(Size of array:C274(SVS_at_PreviewTypeN)*18)+60
			If ($_l_Size>((Screen height:C188-$_l_windowTop)-20))
				$_l_Size:=((Screen height:C188-$_l_windowTop)-20)
			End if 
			If ($_l_Size<180)
				$_l_Size:=180
			End if 
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+(120+100+275+190); $_l_windowTop+$_l_Size)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			OBJECT GET COORDINATES:C663(*; "oGroupBoxP2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(*; "oGroupBoxP2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-100; $_l_ObjectTop+($_l_Size-17); *)
			//``
			OBJECT GET COORDINATES:C663(*; "oLBFIeldNames"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(*; "oLBFIeldNames"; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowWidth-110; $_l_ObjectTop+($_l_Size-65); *)
			//`
			
			OBJECT GET COORDINATES:C663(*; "oGoBack"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
			$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
			$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
			OBJECT MOVE:C664(*; "oGoBack"; ($_l_WindowWidth-10)-$_l_ObjectWidth; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
			OBJECT GET COORDINATES:C663(*; "oCancel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			
			OBJECT MOVE:C664(*; "oCancel"; ($_l_WindowWidth-10)-$_l_ObjectWidth; ($_l_WindowHeight-35)-$_l_ObjectHeight; ($_l_WindowWidth-10); ($_l_WindowHeight-35); *)
			
			OBJECT GET COORDINATES:C663(*; "oAccept"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			
			OBJECT MOVE:C664(*; "oAccept"; ($_l_WindowWidth-10)-$_l_ObjectWidth; ($_l_WindowHeight-10)-$_l_ObjectHeight; $_l_WindowWidth-10; $_l_WindowHeight-10; *)
			
			
			FORM GOTO PAGE:C247(2)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Apply.Variable1"; $_t_oldMethodName)
