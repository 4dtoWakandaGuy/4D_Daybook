If (False:C215)
	//Table Form Method Name: [COMPANIES]dConfirm3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2013 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_AlertReply; DB_bo_AlertTimeOut; DB_bo_NoLoad; GEN_bo_ShowOption)
	C_LONGINT:C283($_l_CancelBottom; $_l_CancelLeft; $_l_CancelRight; $_l_CancelTop; $_l_CharacterPosition; $_l_ConfirmBottom; $_l_CurrentHeight; $_l_Distance; $_l_event; $_l_HeightNeeded; $_l_Length1)
	C_LONGINT:C283($_l_Length2; $_l_Length3; $_l_MaxLineLength; $_l_NewHeight; $_l_NewTop; $_l_NextLeft; $_l_NumberOfCarriageReturns; $_l_NumberOfSoftReturns; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3)
	C_LONGINT:C283($_l_ObjectBottom4; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_OKBottom; $_l_OKLeft; $_l_OKRight; $_l_OKTop; $_l_TestIndex; $_l_TotalWidth; $_l_WidthRequired)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop; B_CheckHideWarning; DB_l_FormTImeCalled; DB_l_SetTimeOut; GEn_l_PictureID; xCancel; xnext)
	C_LONGINT:C283(xOK)
	C_PICTURE:C286(Gen_pic_Confirm)
	C_REAL:C285($_l_CancelBestHeight; $_l_CancelBestWidth; $_l_NextBestHeight; $_l_NextBestWidth; $_l_OKBestHeight; $_l_okBestWidth)
	C_TEXT:C284(<>ButtCanc; <>ButtNext; <>ButtOK; $_t_Confirm; $_t_oldMethodName; $_t_ThisLine; vConfirm; vConfirmBigMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dConfirm3"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Timer:K2:25)
		SHOW PROCESS:C325(Current process:C322)
		If (Frontmost process:C327(*)#Current process:C322)
			SPLASH_HIDE
			BRING TO FRONT:C326(Current process:C322)
		End if 
		If (DB_bo_AlertTimeOut)
			
			
			If ((BP_Timestamp-DB_l_FormTImeCalled)>=DB_l_SetTimeOut)
				DB_bo_AlertReply:=True:C214  // this is set so the system knows it auto cancelled
				CANCEL:C270
			End if 
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		GEn_l_PictureID:=22538
		//GET PICTURE FROM LIBRARY(GEn_l_PictureID; Gen_pic_Confirm)
		Gen_pic_Confirm:=Get_Picture(GEn_l_PictureID)
		OpenHelp(Table:C252(->[COMPANIES:2]); "dConfirm3")
		SET TIMER:C645(120)
		DB_l_FormTImeCalled:=BP_Timestamp
		B_CheckHideWarning:=0
		If (Not:C34(GEN_bo_ShowOption))
			//dont show the hide warning
			OBJECT SET VISIBLE:C603(B_CheckHideWarning; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(B_CheckHideWarning; True:C214)
		End if 
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
		End if 
		If (<>ButtCanc#"")
			OBJECT SET TITLE:C194(xCancel; <>ButtCanc)
		End if 
		If (<>ButtNext#"")
			OBJECT SET TITLE:C194(xNext; <>ButtNext)
		End if 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Confirm"; 0)
		End if 
		If (Length:C16(<>ButtCanc)>8)
			$_l_Length1:=102+(3*((Length:C16(<>ButtCanc))-8))
		Else 
			$_l_Length1:=102
		End if 
		If (Length:C16(<>ButtNext)>8)
			$_l_Length2:=102+(3*((Length:C16(<>ButtNext))-8))
		Else 
			$_l_Length2:=102
		End if 
		If (Length:C16(<>ButtOK)>8)
			$_l_Length3:=102+(3*((Length:C16(<>ButtOK))-8))
		Else 
			$_l_Length3:=102
		End if 
		
		OBJECT GET BEST SIZE:C717(xCancel; $_l_CancelBestWidth; $_l_CancelBestHeight)
		OBJECT GET BEST SIZE:C717(xnext; $_l_NextBestWidth; $_l_NextBestHeight)
		OBJECT GET BEST SIZE:C717(xOK; $_l_okBestWidth; $_l_OKBestHeight)
		
		If ($_l_NextBestWidth<$_l_CancelBestWidth)
			$_l_NextBestWidth:=$_l_CancelBestWidth
		Else 
			$_l_CancelBestWidth:=$_l_NextBestWidth
		End if 
		OBJECT GET BEST SIZE:C717(xOK; $_l_okBestWidth; $_l_OKBestHeight)
		If ($_l_okBestWidth<$_l_CancelBestWidth)
			$_l_okBestWidth:=$_l_CancelBestWidth
		Else 
			$_l_CancelBestWidth:=$_l_okBestWidth
		End if 
		$_l_WidthRequired:=24+($_l_CancelBestWidth*3)+10
		
		
		$_l_TotalWidth:=$_l_Length1+8+$_l_Length2+8+$_l_Length3+8+8
		If ($_l_WidthRequired>$_l_TotalWidth)
			$_l_TotalWidth:=$_l_WidthRequired
			OBJECT GET COORDINATES:C663(xCancel; $_l_CancelLeft; $_l_CancelTop; $_l_CancelRight; $_l_CancelBottom)
			OBJECT MOVE:C664(xCancel; $_l_CancelLeft; $_l_CancelTop; $_l_CancelLeft+$_l_CancelBestWidth; $_l_CancelBottom; *)
			$_l_NextLeft:=$_l_CancelLeft+$_l_CancelBestWidth+12
			OBJECT MOVE:C664(xnext; $_l_NextLeft; $_l_CancelTop; $_l_NextLeft+$_l_CancelBestWidth; $_l_CancelBottom; *)
			$_l_NextLeft:=$_l_NextLeft+$_l_CancelBestWidth+12
			OBJECT MOVE:C664(xOK; $_l_NextLeft; $_l_CancelTop; $_l_NextLeft+$_l_CancelBestWidth; $_l_CancelBottom; *)
		End if 
		$_l_NumberOfCarriageReturns:=STR_CountStr(vConfirm; Char:C90(13))
		$_l_NumberOfSoftReturns:=STR_CountStr(vConfirm; Char:C90(10))
		If (Length:C16(vConfirm)>100) | ($_l_NumberOfCarriageReturns>4) | (True:C214)
			$_l_MaxLineLength:=45
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
				$_l_NumberOfCarriageReturns:=Length:C16(VConfirm)/$_l_MaxLineLength
			End if 
			
			//SET VISIBLE(vConfirmBigMessage;True)
			$_l_HeightNeeded:=($_l_NumberOfCarriageReturns*20)+12
			If ($_l_HeightNeeded<100)  //This height is for the object
				$_l_HeightNeeded:=100
			End if 
			
			OBJECT GET COORDINATES:C663(Vconfirm; $_l_ObjectLeft; $_l_WindowTop; $_l_ObjectRight; $_l_ObjectBottom)
			If ($_l_TotalWidth>(162*2))
				WS_AutoscreenSize(2; (252-110); $_l_TotalWidth)
			Else 
				$_l_TotalWidth:=162
				WS_AutoscreenSize(2; (252-110); $_l_TotalWidth)
			End if 
			
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			$_l_CurrentHeight:=($_l_WindowBottom-$_l_WindowTop)-69
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))
			
			OBJECT SET VISIBLE:C603(vConfirmBigMessage; False:C215)
			$_l_Distance:=141-89
			$_l_WindowHeight:=($_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))-$_l_WindowTop
			$_l_ConfirmBottom:=$_l_WindowHeight-$_l_Distance
			$_l_ObjectBottom:=Gen_SetObjectPosition(->Vconfirm; 10; 0; $_l_WindowHeight-$_l_Distance)
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("ocheckbox1"; $_l_ObjectBottom+5)
			$_l_ObjectBottom3:=Gen_SetobjectPositionByname("oButton1"; $_l_WindowHeight-2)
			$_l_ObjectBottom4:=Gen_SetobjectPositionByname("oButton2"; $_l_ObjectBottom2+5)
			$_l_ObjectBottom4:=Gen_SetobjectPositionByname("oButton3"; $_l_ObjectBottom2+5)
			$_l_ObjectBottom4:=Gen_SetobjectPositionByname("oButton4"; $_l_ObjectBottom2+5)
			$_l_ObjectBottom3:=Gen_SetobjectPositionByname("oButton5"; $_l_WindowHeight-2)
			If (False:C215)
				OBJECT GET COORDINATES:C663(*; "oButtonOK"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_NewHeight:=$_l_ObjectBottom-$_l_ObjectTop
				$_l_WindowHeight:=($_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))-$_l_WindowTop
				$_l_NewTop:=$_l_WindowHeight-((140-124)+$_l_NewHeight)
				$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButtonOK"; $_l_NewTop)
				$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButtonCancel"; $_l_NewTop)
				
				//MOVE OBJECT(*;"oButtonOK";$_l_ObjectLeft;$_l_NewTop;$_l_ObjectRight;($_l_NewTop+$_l_NewHeight);*)
				$_l_OKLeft:=$_l_ObjectLeft
				$_l_OKTop:=$_l_NewTop
				$_l_OKRight:=$_l_ObjectRight
				$_l_OKBottom:=($_l_NewTop+$_l_NewHeight)
				//GET OBJECT RECT(*;"oButtonCancel";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
				//MOVE OBJECT(*;"oButtonCancel";$_l_ObjectLeft;$_l_NewTop;$_l_ObjectRight;($_l_NewTop+$_l_NewHeight);*)
				//GET OBJECT RECT(*;"oCheckBoxWarning";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
				$_l_NewHeight:=$_l_ObjectBottom-$_l_ObjectTop
				$_l_NewTop:=$_l_WindowHeight-((140-98)+$_l_NewHeight)
				//MOVE OBJECT(*;"oCheckBoxWarning";$_l_ObjectLeft;$_l_NewTop;$_l_ObjectRight;($_l_NewTop+$_l_NewHeight);*)
				$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oCheckBoxWarning"; $_l_ObjectBottom+5)
			End if 
		Else 
			If ($_l_TotalWidth>(162*2))
				WS_AutoscreenSize(2; (252-110); $_l_TotalWidth)
			End if 
		End if 
		
		//GET WINDOW RECT($_l_WindowLeft;$_l_WindowTop;$_l_WindowRIght;$_l_WindowBottom)
		//GET OBJECT RECT(xCancel;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//Gen_SetObjectPosition (->xCancel;0;0;0;$_l_ObjectLeft+$_l_Length1)
		
		//MOVE OBJECT(xCancel;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectLeft+$_l_Length1;$_l_ObjectBottom;*)
		//Gen_SetobjectPositionRelativity (->xCancel;->xNext;"";"";1;1;4)
		//Gen_SetobjectPositionRelativity (->xNext;->xOK;"";"";1;1;4)
		
		//;0;0;$_l_ObjectLeft+$_l_Length1)
		
		//MOVE OBJECT(xNext;$_l_NextLeft;$_l_ObjectTop;$_l_NextLeft+$_l_Length2;$_l_ObjectBottom;*)
		//$_l_NextLeft:=$_l_NextLeft+$_l_Length2+4`
		//GET OBJECT RECT(xOK;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
		//MOVE OBJECT(xOK;$_l_NextLeft;$_l_ObjectTop;$_l_NextLeft+$_l_Length3;$_l_ObjectBottom;*)
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:dConfirm3"; $_t_oldMethodName)
