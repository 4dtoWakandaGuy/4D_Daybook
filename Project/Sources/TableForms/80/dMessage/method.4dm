If (False:C215)
	//Table Form Method Name: [SCRIPTS]dMessage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_CharacterIndex; $_l_CRCount; $_l_event; $_l_Height; $_l_LineLength; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ScreenHeight; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_PICTURE:C286(<>DB_Pic_CoLogo; MES_P_Graphic_Logo)
	C_TEXT:C284($_t_oldMethodName; vMtitle4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SCRIPTS].dMessage"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Picture size:C356(<>DB_Pic_CoLogo)>0)
			MES_P_Graphic_Logo:=<>DB_Pic_CoLogo
		Else 
			
			//GET PICTURE FROM LIBRARY(15513; MES_P_Graphic_Logo)
			MES_P_Graphic_Logo:=Get_Picture(15513)
			
		End if 
		
		$_l_CRCount:=2
		$_l_LineLength:=0
		If (vMtitle4#"")
			For ($_l_CharacterIndex; 1; Length:C16(vMtitle4))
				If ((vMtitle4[[$_l_CharacterIndex]])=Char:C90(13)) | ((vMtitle4[[$_l_CharacterIndex]])=Char:C90(10))
					$_l_CRCount:=$_l_CRCount+1
					$_l_LineLength:=0
				Else 
					$_l_LineLength:=$_l_LineLength+1
				End if 
				If ($_l_LineLength>=30)
					$_l_CRCount:=$_l_CRCount+1
					$_l_LineLength:=0
				End if 
			End for 
		End if 
		If ($_l_CRCount<4)
			$_l_CRCount:=4
		End if 
		If ($_l_CRCount>100)
			$_l_CRCount:=100
		End if 
		$_l_Height:=($_l_CRCount*13)+44
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		//GET OBJECT RECT(*;"oTextSurround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oTextSurround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;($_l_WindowHeight-2);*)
		//GET OBJECT RECT(*;"oTextBox";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oTextBox";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;($_l_WindowHeight-9;*)
		//GET OBJECT RECT(*;"oBackGround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oBackGround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;(($_l_windowTop+$_l_Height)-25);*)
		
		$_l_ScreenHeight:=Screen height:C188-$_l_windowTop
		If ($_l_Height>($_l_ScreenHeight-10))
			$_l_Height:=$_l_ScreenHeight-10
		End if 
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_windowTop+$_l_Height)
		OBJECT GET COORDINATES:C663(*; "oTextBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oTextBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; (($_l_windowTop+$_l_Height)-$_l_ObjectTop); *)
		REDRAW:C174(vMtitle4)
		//GET OBJECT RECT(*;"ookButton";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oTextBox";$_l_ObjectLeft;(($_l_windowTop+$_l_Height));$_l_ObjectRight;(($_l_windowTop+$_l_Height));*)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[SCRIPTS:80])
		
		
		
	: ($_l_event=On Activate:K2:9)
		//OpenHelp (Table(->[MACROS]);"dMessage")
		$_l_CRCount:=2
		$_l_LineLength:=0
		If (vMtitle4#"")
			For ($_l_CharacterIndex; 1; Length:C16(vMtitle4))
				If ((vMtitle4[[$_l_CharacterIndex]])=Char:C90(13)) | ((vMtitle4[[$_l_CharacterIndex]])=Char:C90(10))
					$_l_CRCount:=$_l_CRCount+1
					$_l_LineLength:=0
				Else 
					$_l_LineLength:=$_l_LineLength+1
				End if 
				If ($_l_LineLength>=30)
					$_l_CRCount:=$_l_CRCount+1
					$_l_LineLength:=0
				End if 
			End for 
		End if 
		If ($_l_CRCount<4)
			$_l_CRCount:=4
		End if 
		If ($_l_CRCount>100)
			$_l_CRCount:=100
		End if 
		$_l_Height:=($_l_CRCount*13)+44
		
		//GET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowRight;$_l_WindowBottom)
		//GET OBJECT RECT(*;"oTextSurround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oTextSurround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;(($_l_windowTop+$_l_Height)-2);*)`
		//GET OBJECT RECT(*;"oTextBox";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oTextBox";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;($_l_windowTop+$_l_Height)-9;*)
		//GET OBJECT RECT(*;"oBackGround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(*;"oBackGround";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;(($_l_windowTop+$_l_Height)-25);*)
		$_l_ScreenHeight:=Screen height:C188-$_l_windowTop
		If ($_l_Height>($_l_ScreenHeight-10))
			$_l_Height:=$_l_ScreenHeight-10
		End if 
		//SET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowRight;$_l_windowTop+$_l_Height)
		//TRACE
		REDRAW:C174(vMtitle4)
		
End case 
ERR_MethodTrackerReturn("FM:dMessage"; $_t_oldMethodName)
