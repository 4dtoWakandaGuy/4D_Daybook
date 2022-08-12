If (False:C215)
	//Table Form Method Name: [COMPANIES]dConfirm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 17:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>_bo_NoAutoScripts; DB_bo_AlertReply; DB_bo_AlertTimeOut; DB_bo_NoLoad; GEN_bo_ShowOption)
	C_LONGINT:C283($_l_ButtonWIdth; $_l_ButtonWIdth2; $_l_CharacterPosition; $_l_ConfirmBottom; $_l_CurrentHeight; $_l_DIfference; $_l_event; $_l_Height; $_l_HeightNeeded; $_l_MaxLineLength; $_l_NewTop)
	C_LONGINT:C283($_l_Nul; $_l_NumberOfCarriageReturns; $_l_NumberOfSoftReturns; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectTop2; $_l_OKBottom; $_l_OKLeft)
	C_LONGINT:C283($_l_OkRIght; $_l_OKTop; $_l_TestIndex; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; B_CheckHideWarning; DB_l_FormTImeCalled)
	C_LONGINT:C283(DB_l_SetTimeOut; GEn_l_PictureID)
	C_PICTURE:C286(Gen_pic_Confirm)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_Confirm; $_t_oldMethodName; $_t_ThisLine; vConfirm; vConfirmBigMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dConfirm"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Timer:K2:25)
		
		SHOW PROCESS:C325(Current process:C322)
		If (Frontmost process:C327(*)#Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
		End if 
		
		If (DB_bo_AlertTimeOut)
			
			
			If ((BP_Timestamp-DB_l_FormTImeCalled)>=DB_l_SetTimeOut)
				DB_bo_AlertReply:=True:C214  // this is set so the system knows it auto cancelled
				CANCEL:C270
			End if 
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		
		GEn_l_PictureID:=22538
		//GET PICTURE FROM LIBRARY(GEn_l_PictureID; Gen_pic_Confirm)
		Gen_pic_Confirm:=Get_Picture(GEn_l_PictureID)
		$_l_OKLeft:=0
		$_l_OKTop:=0
		$_l_OkRIght:=0
		$_l_OKBottom:=0
		//OpenHelp (Table(->[COMPANIES]);"dConfirm")
		
		//************** added 04/04/08 -kmw ************
		//added to allow more details in error messages
		vConfirmBigMessage:=vConfirm  //always set just in case for some reason vBigConfirmMessage gets displayed (and so obsures nomral vConfirm) when it shouldn't
		
		$_l_NumberOfCarriageReturns:=STR_CountStr(vConfirm; Char:C90(13))
		$_l_NumberOfSoftReturns:=STR_CountStr(vConfirm; Char:C90(10))
		If (Length:C16(vConfirm)>100) | ($_l_NumberOfCarriageReturns>4) | (True:C214)
			$_l_MaxLineLength:=35
			If ($_l_NumberOfCarriageReturns>0)
				
				$_t_Confirm:=vConfirm
				For ($_l_TestIndex; 1; $_l_NumberOfCarriageReturns)
					
					$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_Confirm)
					If ($_l_CharacterPosition>0)
						$_t_ThisLine:=Substring:C12($_t_Confirm; 1; $_l_CharacterPosition-1)
						$_t_Confirm:=Substring:C12($_t_Confirm; $_l_CharacterPosition+1; Length:C16($_t_Confirm))
						
						Repeat 
							If (Length:C16($_t_ThisLine)>$_l_MaxLineLength)
								$_l_NumberOfCarriageReturns:=$_l_NumberOfCarriageReturns+1
								$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_MaxLineLength+1; Length:C16($_t_ThisLine))
							Else 
								$_t_ThisLine:=""
								
							End if 
							
						Until (Length:C16($_t_ThisLine)=0)
						
					End if 
				End for 
				If (Length:C16($_t_Confirm)>0)
					Repeat 
						If (Length:C16($_t_Confirm)>$_l_MaxLineLength)
							$_l_NumberOfCarriageReturns:=$_l_NumberOfCarriageReturns+1
							$_t_Confirm:=Substring:C12($_t_Confirm; $_l_MaxLineLength+1; Length:C16($_t_Confirm))
						Else 
							$_t_Confirm:=""
							
						End if 
						
					Until (Length:C16($_t_Confirm)=0)
					
				End if 
				
			Else 
				//no carriage returns
				$_l_NumberOfCarriageReturns:=Length:C16(VConfirm)/35
			End if 
			
			//SET VISIBLE(vConfirmBigMessage;True)
			$_l_HeightNeeded:=($_l_NumberOfCarriageReturns*20)+12
			If ($_l_HeightNeeded<100)  //This height is for the object
				$_l_HeightNeeded:=100
			End if 
			
			OBJECT GET COORDINATES:C663(Vconfirm; $_l_ObjectLeft; $_l_WindowTop; $_l_ObjectRight; $_l_ObjectBottom)
			
			WS_AutoscreenSize(3; 140; $_l_ObjectRight+10)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_CurrentHeight:=($_l_WindowBottom-$_l_WindowTop)-69
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))
			
			OBJECT SET VISIBLE:C603(vConfirmBigMessage; False:C215)
			$_l_WindowHeight:=($_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))-$_l_WindowTop
			$_l_ConfirmBottom:=$_l_WindowHeight-87
			//GET OBJECT RECT(vConfirm;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			//MOVE OBJECT(vConfirm;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectTop+$_l_ConfirmBottom;*)
			$_l_ObjectBottom:=Gen_SetObjectPosition(->Vconfirm; 0; 0; $_l_WindowHeight-87)
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButton1"; $_l_ObjectBottom+5)
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButton2"; $_l_ObjectBottom+5)
			//GET OBJECT RECT(*;"oButton1";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			//MOVE OBJECT(*;"oButton1";$_l_ObjectLeft;$_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded);$_l_ObjectRight;$_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded);*)
			//GET OBJECT RECT(*;"oButton2";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
			//MOVE OBJECT(*;"oButton2";$_l_ObjectLeft;$_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded);$_l_ObjectRight;$_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded);*)
			OBJECT GET COORDINATES:C663(*; "oButtonOK"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
			$_l_WindowHeight:=($_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))-$_l_WindowTop
			$_l_NewTop:=$_l_WindowHeight-((140-124)+$_l_Height)
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButtonOK"; $_l_NewTop)
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButtonCancel"; $_l_NewTop)
			
			//MOVE OBJECT(*;"oButtonOK";$_l_ObjectLeft;$_l_NewTop;$_l_ObjectRight;($_l_NewTop+$_l_Height);*)
			$_l_OKLeft:=$_l_ObjectLeft
			$_l_OKTop:=$_l_NewTop
			$_l_OkRIght:=$_l_ObjectRight
			$_l_OKBottom:=($_l_NewTop+$_l_Height)
			OBJECT GET COORDINATES:C663(*; "oButtonCancel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			//MOVE OBJECT(*;"oButtonCancel";$_l_ObjectLeft;$_l_NewTop;$_l_ObjectRight;($_l_NewTop+$_l_Height);*)
			OBJECT GET COORDINATES:C663(*; "oCheckBoxWarning"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_Height:=$_l_ObjectBottom-$_l_ObjectTop
			$_l_NewTop:=$_l_WindowHeight-((140-98)+$_l_Height)
			OBJECT MOVE:C664(*; "oCheckBoxWarning"; $_l_ObjectLeft; $_l_NewTop; $_l_ObjectRight; ($_l_NewTop+$_l_Height); *)
			//$_l_ObjectBottom2:=Gen_SetobjectPositionByname ("oCheckBoxWarning";$_l_ObjectBottom+5)
			
		Else 
			OBJECT SET VISIBLE:C603(vConfirmBigMessage; False:C215)
			WS_AutoscreenSize(3; 140; 314)
		End if 
		//****************************************************
		
		SET TIMER:C645(120)
		DB_l_FormTImeCalled:=BP_Timestamp
		SPLASH_HIDE
		
		
		
		B_CheckHideWarning:=0
		If (Not:C34(GEN_bo_ShowOption))
			//dont show the hide warning
			OBJECT SET VISIBLE:C603(B_CheckHideWarning; False:C215)
		Else 
			FORM GOTO PAGE:C247(2)
		End if 
		$_l_ButtonWIdth:=0
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
			If (Length:C16(<>ButtOK)>8)
				$_l_ButtonWIdth:=10*Length:C16(<>ButtOK)
				
			End if 
		End if 
		If (<>ButtCanc#"")
			OBJECT SET TITLE:C194(xCancel; <>ButtCanc)
			If (Length:C16(<>ButtCanc)>8)
				$_l_ButtonWIdth2:=10*Length:C16(<>ButtCanc)
				If ($_l_ButtonWIdth2>$_l_ButtonWIdth)
					$_l_ButtonWIdth:=$_l_ButtonWIdth2
				End if 
			End if 
		End if 
		If ($_l_ButtonWIdth>0)
			If ($_l_OKLeft=0)
				OBJECT GET COORDINATES:C663(*; "oButtonOK"; $_l_OKLeft; $_l_OKTop; $_l_OkRIght; $_l_OKBottom)
				
			End if 
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
			If (($_l_ButtonWIdth*2+20)>$_l_WindowWidth)
				$_l_ButtonWIdth:=($_l_WindowWidth-10)/2
			End if 
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButtonOK"; 0; ($_l_WindowWidth-10)-$_l_ButtonWIdth; 0; $_l_WindowWidth-10)
			
			$_l_Nul:=0
			Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oButtonOK"; "oButtonCancel"; 4; 2; 5)
			
			//MOVE OBJECT(*;"oButtonOK";$_l_OkRIght-$_l_ButtonWIdth;$_l_OKTop;$_l_OkRIght;$_l_OKBottom;*)
			//MOVE OBJECT(*;"oButtonCancel";(($_l_OkRIght-$_l_ButtonWIdth)-10)-$_l_ButtonWIdth;$_l_OKTop;($_l_OkRIght-$_l_ButtonWIdth)-10;$_l_OKBottom;*)
			If (((($_l_OkRIght-$_l_ButtonWIdth)-10)-$_l_ButtonWIdth)<0)
				$_l_DIfference:=0-((($_l_OkRIght-$_l_ButtonWIdth)-10)-$_l_ButtonWIdth)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight+$_l_DIfference; $_l_WindowBottom)
			End if 
		End if 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		OBJECT GET COORDINATES:C663(*; "oButtonOK"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET COORDINATES:C663(vConfirm; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight; $_l_ObjectBottom2)
		Gen_SetObjectPosition(->vConfirm; 21; $_l_ObjectLeft; $_l_ObjectTop-5; $_l_ObjectRight)
		
		If (<>_bo_NoAutoScripts=False:C215)
			//PLAY("Daybook Confirm"; 0)
		End if 
		//GET PICTURE FROM LIBRARY(GEn_l_PictureID; Gen_pic_Confirm)
		Gen_pic_Confirm:=Get_Picture(GEn_l_PictureID)
		INT_SetDialog(True:C214)
		
		
End case 

ERR_MethodTrackerReturn("FM [COMPANIES]dConfirm"; $_t_oldMethodName)
