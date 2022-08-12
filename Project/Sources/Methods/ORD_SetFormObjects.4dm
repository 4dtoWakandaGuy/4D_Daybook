//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_SetFormObjects
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:                                         12/08/2010 18:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ORD_at_AuthStatus;0)
	//ARRAY TEXT(ORD_at_OrdersTab;0)
	C_BOOLEAN:C305($_bo_HideAuths)
	C_LONGINT:C283($_l_AuthButtonLeft; $_l_AuthButtonRight; $_l_bestHeight; $_l_bestWidth; $_l_CardAuthsBottom; $_l_CardAuthsLeft; $_l_CardAuthsRight; $_l_CardAuthsTop; $_l_CardBoxBottom; $_l_CardBoxLeft; $_l_CardBoxRight)
	C_LONGINT:C283($_l_CardBoxTop; $_l_CardSplitterBottom; $_l_CardSplitterLeft; $_l_CardSplitterRight; $_l_CardSplitterTop; $_l_CCNoBoLeft; $_l_CCnoBoxRight; $_l_CCnoLabelLeft; $_l_CCnoLabelRight; $_l_CharacterPosition; $_l_CommentEndBottom)
	C_LONGINT:C283($_l_CommentEndLeft; $_l_CommentEndRight; $_l_CommentEndTop; $_l_Comments2Left; $_l_CommentsBottom; $_l_CommentsHeight; $_l_CommentsLeft; $_l_CommentSplitterBottom; $_l_CommentSplitterLeft; $_l_CommentSplitterRight; $_l_CommentsRight)
	C_LONGINT:C283($_l_CommentsSplitterTop; $_l_CommentsTop; $_l_ComRight; $_l_EncBottom; $_l_EncLabelBottom; $_l_EncLabelLeft; $_l_EncLabelRight; $_l_EncLabeltop; $_l_EncLeft; $_l_EnclosuresBottom; $_l_EnclosuresHeight)
	C_LONGINT:C283($_l_EnclosuresLabelBottom; $_l_EnclosuresLabelTop; $_l_EnclosuresTop; $_l_EncRight; $_l_EncSplitBottom; $_l_EncSplitLeft; $_l_EncSplitRight; $_l_EncSplitTop; $_l_EncTop; $_l_ExtentRight; $_l_Gap)
	C_LONGINT:C283($_l_GapAllowingMaxForEnc; $_l_GapAllowingMinForEnc; $_l_GapForComments; $_l_HeightNeeded; $_l_Lines; $_l_Max; $_l_MaxEnclosures; $_l_MaxLineLength; $_l_MinEnclosures; $_l_NumberOfCarriageReturns; $_l_NumberOfSoftReturns)
	C_LONGINT:C283($_l_PrintBoxBottom; $_l_PrintBoxHeight; $_l_PrintBoxLeft; $_l_PrintBoxRight; $_l_PrintBoxTop; $_l_PrintButtonLeft; $_l_PrintButtonRight; $_l_SetAuthListBottom; $_l_SetAuthListTop; $_l_SetCardAuthsBoxBottom; $_l_SetCardAuthsBoxHeight)
	C_LONGINT:C283($_l_SizeNeeded; $_l_SplitterBottom; $_l_SplitterHeight; $_l_TabBoxBottom; $_l_TabBoxLeft; $_l_TabBoxRight; $_l_TabBoxTop; $_l_TestLinesIndex; $_l_TotalCommentsWidth; $_l_VoidButtonLeft; $_l_VoidButtonRight)
	C_LONGINT:C283($_l_Windowbottom; $_l_WindowHeight; $_l_Windowleft; $_l_Windowright; $_l_WindowTop; $_l_WindowWidth; $1; bPrintAuths; bvoid)
	C_TEXT:C284($_t_CommentsText; $_t_Confirm; $_t_EnclosuresText; $_t_oldMethodName; $_t_ThisLine; VConfirm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_SetFormObjects")
If (Count parameters:C259>=1)
	Case of 
		: ($1=201)  //& (False)  `Page change
			
			GET WINDOW RECT:C443($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom)
			$_l_WindowHeight:=$_l_Windowbottom-$_l_WindowTop
			$_l_WindowWidth:=$_l_Windowright-$_l_Windowleft
			OBJECT GET COORDINATES:C663(*; "oCardObjectbox"; $_l_CardBoxLeft; $_l_CardBoxTop; $_l_CardBoxRight; $_l_CardBoxBottom)
			OBJECT GET COORDINATES:C663(*; "oListBoxAuths"; $_l_CardAuthsLeft; $_l_CardAuthsTop; $_l_CardAuthsRight; $_l_CardAuthsBottom)
			OBJECT GET COORDINATES:C663(*; "oOrdersCommentsField"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom)
			
			OBJECT GET COORDINATES:C663(*; "oHorEnclosureSplitter"; $_l_EncSplitLeft; $_l_EncSplitTop; $_l_EncSplitRight; $_l_EncSplitBottom)
			OBJECT GET COORDINATES:C663(*; "oEnclosureLabel"; $_l_EncLabelLeft; $_l_EncLabeltop; $_l_EncLabelRight; $_l_EncLabelBottom)
			OBJECT GET COORDINATES:C663(*; "oEnclosures"; $_l_EncLeft; $_l_EncTop; $_l_EncRight; $_l_EncBottom)
			$_l_ComRight:=$_l_Windowright
			$_l_ExtentRight:=$_l_Windowright
			
			//TRACE
			If (Size of array:C274(ORD_at_AuthStatus)>4)
				$_l_SizeNeeded:=(Size of array:C274(ORD_at_AuthStatus)*16)+16
				Case of 
					: ($_l_SizeNeeded<=16)  //no objects
						$_l_SizeNeeded:=80  //one object
						
						
					: ($_l_SizeNeeded>((10*16)+16))
						$_l_SizeNeeded:=(16*10)+16
				End case 
			Else 
				If (Size of array:C274(ORD_at_AuthStatus)=0)
					$_bo_HideAuths:=True:C214
					$_l_SizeNeeded:=0
				Else 
					$_l_SizeNeeded:=80  //one object
					
				End if 
			End if 
			$_l_SetCardAuthsBoxBottom:=($_l_WindowHeight-30)-(580-546)
			$_l_SetCardAuthsBoxHeight:=$_l_SizeNeeded+(436-419)+(546-505)+10
			If ($_l_SizeNeeded>0)
				OBJECT SET VISIBLE:C603(*; "oListBoxAuths"; True:C214)
				//OBJECT SET VISIBLE(oCardObjectbox;True)
				OBJECT SET VISIBLE:C603(bPrintAuths; True:C214)
				OBJECT SET VISIBLE:C603(bvoid; True:C214)
				//$_l_SetAuthListBottom:=0
				//$_l_SetAuthListTop:=0
				$_l_SetAuthListBottom:=$_l_SetCardAuthsBoxBottom-(546-505)
				$_l_SetAuthListTop:=$_l_SetAuthListBottom-($_l_SizeNeeded)
			Else 
				
				OBJECT SET VISIBLE:C603(*; "oListBoxAuths"; False:C215)
				//OBJECT SET VISIBLE(oCardObjectbox;False)
				OBJECT SET VISIBLE:C603(bPrintAuths; False:C215)
				OBJECT SET VISIBLE:C603(bvoid; False:C215)
				//$_l_SetCardAuthsBoxHeight:=(546-511)
				
			End if 
			OBJECT MOVE:C664(*; "oCardObjectbox"; 9; ($_l_SetCardAuthsBoxBottom-$_l_SetCardAuthsBoxHeight); $_l_WindowWidth-9; $_l_SetCardAuthsBoxBottom; *)
			$_l_CCnoBoxRight:=($_l_WindowWidth-9)-9
			$_l_CCNoBoLeft:=$_l_CCnoBoxRight-69
			OBJECT MOVE:C664(*; "oCCno"; $_l_CCNoBoLeft; $_l_SetCardAuthsBoxBottom-(546-515); $_l_CCnoBoxRight; $_l_SetCardAuthsBoxBottom-(546-529); *)
			$_l_CCnoLabelRight:=$_l_CCNoBoLeft-9
			$_l_CCnoLabelLeft:=$_l_CCnoLabelRight-90
			OBJECT MOVE:C664(*; "oCardLabel"; $_l_CCnoLabelLeft; $_l_SetCardAuthsBoxBottom-(546-515); $_l_CCnoLabelRight; $_l_SetCardAuthsBoxBottom-(546-529); *)
			OBJECT SET VISIBLE:C603(*; "oAuthorizePayment"; True:C214)
			$_l_AuthButtonRight:=$_l_CCnoLabelLeft-9
			$_l_AuthButtonLeft:=$_l_AuthButtonRight-141
			OBJECT MOVE:C664(*; "oAuthorizePayment"; $_l_AuthButtonLeft; $_l_SetCardAuthsBoxBottom-(546-512); $_l_AuthButtonRight; $_l_SetCardAuthsBoxBottom-(546-531); *)
			If ($_l_SizeNeeded>0)
				
				$_l_PrintButtonLeft:=9+9
				$_l_PrintButtonRight:=$_l_PrintButtonLeft+96
				OBJECT MOVE:C664(*; "oPrintAuths"; $_l_PrintButtonLeft; $_l_SetCardAuthsBoxBottom-(546-512); $_l_PrintButtonRight; $_l_SetCardAuthsBoxBottom-(546-531); *)
				$_l_VoidButtonLeft:=$_l_PrintButtonRight+9
				$_l_VoidButtonRight:=$_l_VoidButtonLeft+96
				OBJECT MOVE:C664(*; "oVoidAuths"; $_l_VoidButtonLeft; $_l_SetCardAuthsBoxBottom-(546-512); $_l_VoidButtonRight; $_l_SetCardAuthsBoxBottom-(546-531); *)
				OBJECT MOVE:C664(*; "oListBoxAuths"; 11; $_l_SetAuthListTop; $_l_WindowWidth-18; $_l_SetAuthListBottom; *)
			Else 
				OBJECT SET VISIBLE:C603(*; "oPrintAuths"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oVoidAuths"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListBoxAuths"; False:C215)
				
				
			End if 
			$_l_SplitterBottom:=($_l_SetCardAuthsBoxBottom-$_l_SetCardAuthsBoxHeight)-10
			$_l_SplitterHeight:=3  //$_l_EncSplitBottom-$_l_EncSplitTop
			
			OBJECT MOVE:C664(*; "oHorEnclosureSplitter"; 5; $_l_SplitterBottom-$_l_SplitterHeight; $_l_WindowWidth-9; $_l_SplitterBottom; *)
			
			$_t_EnclosuresText:=[ORDERS:24]Enclosures:21
			If ($_t_EnclosuresText#"")
				$_l_MinEnclosures:=47
				$_l_MaxEnclosures:=100
			Else 
				$_l_MaxEnclosures:=47
				$_l_MinEnclosures:=30
			End if 
			$_t_CommentsText:=[ORDERS:24]Comments:14
			If ($_t_CommentsText#"")
				$_l_NumberOfCarriageReturns:=STR_CountStr($_t_CommentsText; Char:C90(13))
				$_l_NumberOfSoftReturns:=STR_CountStr($_t_CommentsText; Char:C90(10))
				$_l_Lines:=$_l_NumberOfCarriageReturns+$_l_NumberOfSoftReturns+1
				$_l_MaxLineLength:=70
				If ($_l_NumberOfCarriageReturns>0)
					
					$_t_Confirm:=$_t_CommentsText
					For ($_l_TestLinesIndex; 1; $_l_NumberOfCarriageReturns)
						
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
				If ($_l_HeightNeeded<47)  //This height is for the object
					
					$_l_CommentsHeight:=47
					$_l_Gap:=($_l_SplitterBottom-$_l_SplitterHeight)-$_l_CommentsTop
					$_l_GapAllowingMaxForEnc:=$_l_Gap-$_l_MaxEnclosures
					If ($_l_GapAllowingMaxForEnc>$_l_CommentsHeight)
						$_l_CommentsHeight:=$_l_GapAllowingMaxForEnc
					End if 
					
				Else 
					$_l_CommentsHeight:=$_l_HeightNeeded
				End if 
				
				
			Else 
				$_l_CommentsHeight:=30
				$_l_Gap:=($_l_SplitterBottom-$_l_SplitterHeight)-$_l_CommentsTop
				$_l_GapAllowingMaxForEnc:=$_l_Gap-$_l_MaxEnclosures
				If ($_l_GapAllowingMaxForEnc>$_l_CommentsHeight)
					$_l_CommentsHeight:=$_l_GapAllowingMaxForEnc
				End if 
			End if 
			$_l_Gap:=($_l_SplitterBottom-$_l_SplitterHeight)-$_l_CommentsTop
			$_l_GapAllowingMinForEnc:=$_l_Gap-$_l_MinEnclosures
			If ($_l_GapAllowingMinForEnc<$_l_CommentsHeight)
				$_l_CommentsHeight:=$_l_GapAllowingMinForEnc
			End if 
			$_l_GapForComments:=$_l_CommentsTop+$_l_CommentsHeight+10
			$_l_Max:=$_l_Gap-$_l_GapForComments
			
			
			//zIf ($_l_Gap<$_l_CommentsHeight)
			If ($_t_EnclosuresText#"")
				$_l_NumberOfCarriageReturns:=STR_CountStr($_t_EnclosuresText; Char:C90(13))
				$_l_NumberOfSoftReturns:=STR_CountStr($_t_EnclosuresText; Char:C90(10))
				$_l_Lines:=$_l_NumberOfCarriageReturns+$_l_NumberOfSoftReturns+1
				$_l_EnclosuresHeight:=$_l_Lines*15
				If ($_l_EnclosuresHeight>$_l_Max)
					$_l_EnclosuresHeight:=$_l_Max
				End if 
			Else 
				$_l_EnclosuresHeight:=30
			End if 
			$_l_TotalCommentsWidth:=(($_l_WindowWidth-$_l_CommentsLeft)-9)-$_l_CommentsLeft
			OBJECT GET BEST SIZE:C717(*; "oComments2Label"; $_l_bestWidth; $_l_bestHeight)
			OBJECT MOVE:C664(*; "oComments2Label"; ($_l_TotalCommentsWidth/2)+20; $_l_CommentsTop; ((($_l_TotalCommentsWidth/2)+20)+$_l_bestWidth); $_l_CommentsTop+$_l_bestHeight; *)
			$_l_Comments2Left:=((($_l_TotalCommentsWidth/2)+20)+$_l_bestWidth)
			
			
			OBJECT MOVE:C664(*; "oOrdersCommentsField1"; $_l_Comments2Left+5; $_l_CommentsTop; ($_l_WindowWidth-$_l_CommentsLeft)-9; $_l_CommentsTop+$_l_CommentsHeight; *)
			
			
			
			
			
			OBJECT MOVE:C664(*; "oOrdersCommentsField"; $_l_CommentsLeft; $_l_CommentsTop; ($_l_TotalCommentsWidth/2)-10; $_l_CommentsTop+$_l_CommentsHeight; *)
			$_l_CommentsSplitterTop:=$_l_CommentsTop+$_l_CommentsHeight+5  //OBJECT GET COORDINATES(*;"oOrdersCommentsField";$_l_CommentsLeft;$_l_CommentsTop;$_l_CommentsRight;$_l_CommentsBottom)
			
			
			OBJECT MOVE:C664(*; "oCommentSplitHor1"; 5; $_l_CommentsSplitterTop; ($_l_WindowWidth)-9; $_l_CommentsSplitterTop+3; *)
			
			$_l_EnclosuresBottom:=$_l_SplitterBottom-10
			$_l_EnclosuresTop:=$_l_CommentsSplitterTop+5
			$_l_EnclosuresLabelTop:=$_l_EnclosuresTop
			$_l_EnclosuresLabelBottom:=$_l_EnclosuresLabelTop+15
			OBJECT MOVE:C664(*; "oEnclosureLabel"; 31; $_l_EnclosuresLabelTop; 31+85; $_l_EnclosuresLabelBottom; *)
			OBJECT MOVE:C664(*; "oEnclosures"; $_l_CommentsLeft; $_l_EnclosuresTop; ($_l_WindowWidth-$_l_CommentsLeft)-9; $_l_EnclosuresBottom; *)
			OBJECT GET COORDINATES:C663(ORD_at_OrdersTab; $_l_TabBoxLeft; $_l_TabBoxTop; $_l_TabBoxRight; $_l_TabBoxBottom)
			OBJECT MOVE:C664(ORD_at_OrdersTab; $_l_TabBoxLeft; $_l_TabBoxTop; ($_l_WindowWidth)-5; $_l_TabBoxBottom; *)
			//OBJECT GET COORDINATES(*;"oComments1Label";$CommentsLabel1Left;$CommentsLabel1Top;
			
			
			OBJECT GET COORDINATES:C663(*; "oPrintCommentsCheckBox"; $_l_PrintBoxLeft; $_l_PrintBoxTop; $_l_PrintBoxRight; $_l_PrintBoxBottom)
			$_l_PrintBoxHeight:=$_l_PrintBoxBottom-$_l_PrintBoxTop
			OBJECT MOVE:C664(*; "oPrintCommentsCheckBox"; $_l_PrintBoxLeft; ($_l_CommentsSplitterTop-5)-$_l_PrintBoxHeight; $_l_PrintBoxRight; ($_l_CommentsSplitterTop-5); *)
		: ($1=202)  // /moving the oOrderPeriodSplitter
			GET WINDOW RECT:C443($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom)
			$_l_WindowHeight:=$_l_Windowbottom-$_l_WindowTop
			$_l_WindowWidth:=$_l_Windowright-$_l_Windowleft
			$_l_Comments2Left:=0
			$_l_bestHeight:=0
			$_l_bestWidth:=0
			
			OBJECT GET COORDINATES:C663(*; "oOrderPeriodSplitter"; $_l_CommentSplitterLeft; $_l_CommentsSplitterTop; $_l_CommentSplitterRight; $_l_CommentSplitterBottom)
			OBJECT GET COORDINATES:C663(*; "oCommentSplitHor1"; $_l_CommentEndLeft; $_l_CommentEndTop; $_l_CommentEndRight; $_l_CommentEndBottom)
			
			
			OBJECT GET COORDINATES:C663(*; "oOrdersCommentsField"; $_l_CommentsLeft; $_l_CommentsTop; $_l_CommentsRight; $_l_CommentsBottom)
			$_l_CommentsHeight:=($_l_CommentEndTop-$_l_CommentSplitterBottom)-8
			
			$_l_CommentsTop:=$_l_CommentSplitterBottom+5
			$_l_TotalCommentsWidth:=(($_l_WindowWidth-$_l_CommentsLeft)-9)-$_l_CommentsLeft
			OBJECT GET BEST SIZE:C717(*; "oComments2Label"; $_l_bestWidth; $_l_bestHeight)
			OBJECT MOVE:C664(*; "oComments2Label"; ($_l_TotalCommentsWidth/2)+20; $_l_CommentsTop; ((($_l_TotalCommentsWidth/2)+20)+$_l_bestWidth); $_l_CommentsTop+$_l_bestHeight; *)
			$_l_Comments2Left:=((($_l_TotalCommentsWidth/2)+20)+$_l_bestWidth)
			
			
			OBJECT MOVE:C664(*; "oOrdersCommentsField1"; $_l_Comments2Left+5; $_l_CommentsTop; ($_l_WindowWidth-$_l_CommentsLeft)-9; $_l_CommentsTop+$_l_CommentsHeight; *)
			
			
			
			
			
			OBJECT MOVE:C664(*; "oOrdersCommentsField"; $_l_CommentsLeft; $_l_CommentsTop; ($_l_TotalCommentsWidth/2)-10; $_l_CommentsTop+$_l_CommentsHeight; *)
			$_l_CommentsSplitterTop:=$_l_CommentsTop+$_l_CommentsHeight+5  //OBJECT GET COORDINATES(*;"oOrdersCommentsField";$_l_CommentsLeft;$_l_CommentsTop;$_l_CommentsRight;$_l_CommentsBottom)
			
			
			
			
			
			
			
			
			
			
			OBJECT GET COORDINATES:C663(ORD_at_OrdersTab; $_l_TabBoxLeft; $_l_TabBoxTop; $_l_TabBoxRight; $_l_TabBoxBottom)
			OBJECT MOVE:C664(ORD_at_OrdersTab; $_l_TabBoxLeft; $_l_TabBoxTop; ($_l_WindowWidth)-5; $_l_TabBoxBottom; *)
			
			
			
			OBJECT GET COORDINATES:C663(*; "oPrintCommentsCheckBox"; $_l_PrintBoxLeft; $_l_PrintBoxTop; $_l_PrintBoxRight; $_l_PrintBoxBottom)
			$_l_PrintBoxHeight:=$_l_PrintBoxBottom-$_l_PrintBoxTop
			OBJECT MOVE:C664(*; "oPrintCommentsCheckBox"; $_l_PrintBoxLeft; ($_l_CommentsSplitterTop-5)-$_l_PrintBoxHeight; $_l_PrintBoxRight; ($_l_CommentsSplitterTop-5); *)
		: ($1=204)
			OBJECT GET COORDINATES:C663(*; "oHorEnclosureSplitter"; $_l_CardSplitterLeft; $_l_CardSplitterTop; $_l_CardSplitterRight; $_l_CardSplitterBottom)
			OBJECT GET COORDINATES:C663(*; "oListBoxAuths"; $_l_CardAuthsLeft; $_l_CardAuthsTop; $_l_CardAuthsRight; $_l_CardAuthsBottom)
			OBJECT MOVE:C664(*; "oListBoxAuths"; $_l_CardAuthsLeft; $_l_CardSplitterTop+30; $_l_CardAuthsRight; $_l_CardAuthsBottom; *)
			
			
			
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("ORD_SetFormObjects"; $_t_oldMethodName)
