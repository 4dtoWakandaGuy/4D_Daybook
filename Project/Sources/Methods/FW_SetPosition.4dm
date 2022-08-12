//%attributes = {}
If (False:C215)
	//Project Method Name:      FW_SetPosition
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 13:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CRCount; $_l_ImageWidth; $_l_MoveOnDown; $_l_MoveOnUp; $_l_RecordLength; $_l_SetWindowTop; $_l_Windowbottom; $_l_Windowleft; $_l_Windowright; $_l_WindowTop; FW_l_ColumnLeft)
	C_LONGINT:C283(FW_l_ColumnRight; FW_l_CurrentCellFieldNumber; FW_l_CUrrentTable; FW_l_FloatType; FW_l_MouseTop)
	C_PICTURE:C286(DB_pi_Picture)
	C_POINTER:C301($_Ptr_Field; $_ptr_Table)
	C_REAL:C285($_r_Percentage; $_r_Ratio)
	C_TEXT:C284($_t_oldMethodName; $_t_PositionSTR; $_t_RecordText; DB_t_RecordText; FW_T_CurrentLeftRight; FW_T_CurrentOffset)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FW_SetPosition")

GET WINDOW RECT:C443($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom)
FW_T_CurrentOffset:=""
//FW_T_CurrentLeftRight:=""
$_ptr_Table:=Table:C252(FW_l_CUrrentTable)
If (FW_l_FloatType=Is picture:K8:10)  //Picture
	
	FORM GOTO PAGE:C247(1)
	$_Ptr_Field:=Field:C253(FW_l_CUrrentTable; FW_l_CurrentCellFieldNumber)
	DB_pi_Picture:=$_Ptr_Field->
	
	//here set the sizing
	//we want to make sure we size this correctly
	//$_l_MouseX:=FW_l_MouseLeft
	//$_l_Windowleft:=100
	//$_l_Windowright:=400
	//$_l_WindowTop:=500
	//$_l_Windowbottom:=800
	PICTURE PROPERTIES:C457(DB_pi_Picture; $_l_ImageWidth; $_l_ImageWidth)
	$_l_SetWindowTop:=FW_l_MouseTop
	If ($_l_ImageWidth>0) & ($_l_ImageWidth>0)
		If (FW_T_CurrentLeftRight="")
			If ((Screen width:C187-FW_l_ColumnRight)>=FW_l_ColumnLeft)
				//most space on right
				FW_T_CurrentLeftRight:="RIGHT"
			Else 
				FW_T_CurrentLeftRight:="LEFT"
			End if 
		End if 
		If ($_l_ImageWidth>(Screen height:C188-10))
			$_r_Ratio:=(Screen height:C188-10)/($_l_ImageWidth-10)
			$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
			$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
		End if 
		//FW_T_CurrentLeftRight:="RIGHT"
		If (FW_T_CurrentLeftRight="") | (FW_T_CurrentLeftRight="RIGHT")  //it is positioned on the right so keep it there if we can
			//positioned on right keep it ther if poss
			
			
			Case of 
				: (FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10)  //Will fit on right without resizing
					
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
				: ((FW_l_ColumnRight+($_l_ImageWidth/2))<(Screen width:C187-10))  //will require resizing but less than 50%
					If ((FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10))
						
						$_r_Ratio:=(Screen width:C187-(FW_l_ColumnRight+10))/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				: (((FW_l_ColumnLeft))>((Screen width:C187-FW_l_ColumnRight)))  //&  (True)  //Will move to left on left without resizing
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						$_r_Ratio:=(FW_l_ColumnLeft-10)/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					FW_T_CurrentLeftRight:="LEFT"
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				Else 
					//have to keep on right
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						
						$_r_Ratio:=(Screen width:C187-(FW_l_ColumnRight+10))/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
					
			End case 
		Else 
			//it is on the left so keep it there if we can
			Case of 
				: (FW_l_ColumnLeft-$_l_ImageWidth)>(10)  //Will fit on right without resizing
					
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
				: ((FW_l_ColumnLeft-($_l_ImageWidth/2))>(10))  //will require resizing but less than 50%
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						
						$_r_Ratio:=(FW_l_ColumnLeft-10)/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				: (FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10)  //&  (True)  //Will move to left on Right without resizing
					If ((FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10))
						
						$_r_Ratio:=(Screen width:C187-(FW_l_ColumnRight+10))/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					FW_T_CurrentLeftRight:="RIGHT"
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				Else 
					//have to keep on left
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						
						$_r_Ratio:=(FW_l_ColumnLeft-10)/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
					
			End case 
		End if 
		
		//FW_T_CurrentLeftRight:="LEFT"
		Case of 
			: (FW_T_CurrentLeftRight="RIGHT")
				SET WINDOW RECT:C444(FW_l_ColumnRight; $_l_SetWindowTop; (FW_l_ColumnRight+$_l_ImageWidth); ($_l_SetWindowTop+$_l_ImageWidth))
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				SET WINDOW RECT:C444(FW_l_ColumnRight; $_l_SetWindowTop; (FW_l_ColumnRight+$_l_ImageWidth); ($_l_SetWindowTop+$_l_ImageWidth))
				$_t_PositionSTR:=String:C10($_l_WindowLeft)+","+String:C10($_l_WindowTop)+","+String:C10($_l_WindowRight)+","+String:C10($_l_WindowBottom)
			: (FW_T_CurrentLeftRight="LEFT")
				SET WINDOW RECT:C444(FW_l_ColumnLeft-$_l_ImageWidth; $_l_SetWindowTop; (FW_l_ColumnLeft); ($_l_SetWindowTop+$_l_ImageWidth))
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				SET WINDOW RECT:C444(FW_l_ColumnLeft-$_l_ImageWidth; $_l_SetWindowTop; (FW_l_ColumnLeft); ($_l_SetWindowTop+$_l_ImageWidth))
				$_t_PositionSTR:=String:C10($_l_WindowLeft)+","+String:C10($_l_WindowTop)+","+String:C10($_l_WindowRight)+","+String:C10($_l_WindowBottom)
				
		End case 
		SHOW PROCESS:C325(Current process:C322)
		SHOW WINDOW:C435
	Else 
		HIDE PROCESS:C324(Current process:C322)
	End if 
Else 
	//it it text
	
	FORM GOTO PAGE:C247(2)
	$_Ptr_Field:=Field:C253(FW_l_CUrrentTable; FW_l_CurrentCellFieldNumber)
	DB_t_RecordText:=$_Ptr_Field->
	$_l_ImageWidth:=300
	$_l_RecordLength:=Length:C16(DB_t_RecordText)
	$_t_RecordText:=Replace string:C233(DB_t_RecordText; Char:C90(13); "")
	$_l_CRCount:=$_l_RecordLength-Length:C16($_t_RecordText)
	$_l_ImageWidth:=(16*($_l_CRCount+1))+18
	If (DB_t_RecordText#"")
		$_l_SetWindowTop:=FW_l_MouseTop
		If (FW_T_CurrentLeftRight="")
			If ((Screen width:C187-FW_l_ColumnRight)>=FW_l_ColumnLeft)
				//most space on right
				FW_T_CurrentLeftRight:="RIGHT"
			Else 
				FW_T_CurrentLeftRight:="LEFT"
			End if 
		End if 
		
		If ($_l_ImageWidth>(Screen height:C188-10))
			$_r_Ratio:=(Screen height:C188-10)/($_l_ImageWidth-10)
			$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
			//$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
		End if 
		//FW_T_CurrentLeftRight:="RIGHT"
		If (FW_T_CurrentLeftRight="") | (FW_T_CurrentLeftRight="RIGHT")  //it is positioned on the right so keep it there if we can
			//positioned on right keep it ther if poss
			
			
			Case of 
				: (FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10)  //Will fit on right without resizing
					
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
				: ((FW_l_ColumnRight+($_l_ImageWidth/2))<(Screen width:C187-10))  //will require resizing but less than 50%
					If ((FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10))
						
						$_r_Ratio:=(Screen width:C187-(FW_l_ColumnRight+10))/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						// $_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				: (((FW_l_ColumnLeft))>((Screen width:C187-FW_l_ColumnRight)))  //&  (True)  //Will move to left on left without resizing
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						$_r_Ratio:=(FW_l_ColumnLeft-10)/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						//$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					FW_T_CurrentLeftRight:="LEFT"
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				Else 
					//have to keep on right
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						
						$_r_Ratio:=(Screen width:C187-(FW_l_ColumnRight+10))/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						//$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
					
			End case 
		Else 
			//it is on the left so keep it there if we can
			Case of 
				: (FW_l_ColumnLeft-$_l_ImageWidth)>(10)  //Will fit on right without resizing
					
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
				: ((FW_l_ColumnLeft-($_l_ImageWidth/2))>(10))  //will require resizing but less than 50%
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						
						$_r_Ratio:=(FW_l_ColumnLeft-10)/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						//$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				: (FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10)  //&  (True)  //Will move to left on Right without resizing
					If ((FW_l_ColumnRight+$_l_ImageWidth)<(Screen width:C187-10))
						
						$_r_Ratio:=(Screen width:C187-(FW_l_ColumnRight+10))/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						//$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					FW_T_CurrentLeftRight:="RIGHT"
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
				Else 
					//have to keep on left
					If ((FW_l_ColumnLeft-$_l_ImageWidth)<(10))
						
						$_r_Ratio:=(FW_l_ColumnLeft-10)/($_l_ImageWidth-10)
						$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
						//$_l_ImageWidth:=$_l_ImageWidth*$_r_Ratio
					End if 
					If (FW_T_CurrentOffset="BOTTOM") | (FW_T_CurrentOffset="")
						
						If ((FW_l_MouseTop+$_l_ImageWidth)<((Screen height:C188-10)))
							$_l_SetWindowTop:=FW_l_MouseTop
						Else 
							$_l_MoveOnUp:=(FW_l_MouseTop+$_l_ImageWidth)-(Screen height:C188-10)
							$_r_Percentage:=100/($_l_ImageWidth/$_l_MoveOnUp)
							$_l_MoveOnUp:=$_l_MoveOnUp+(($_l_ImageWidth/100)*$_r_Percentage)
							
							If ($_l_MoveOnUp>($_l_ImageWidth))
								
								FW_T_CurrentOffset:="TOP"
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
							Else 
								$_l_SetWindowTop:=FW_l_MouseTop-$_l_MoveOnUp
								FW_T_CurrentOffset:="BOTTOM"
							End if 
						End if 
					Else 
						//CURRENT ALIGN TOP
						If ((FW_l_MouseTop-$_l_ImageWidth)>(10))
							//window will fit at top
							FW_T_CurrentOffset:="TOP"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth
						Else 
							$_l_MoveOnDown:=Abs:C99((FW_l_MouseTop-10)-($_l_ImageWidth))
							//move to bottom
							FW_T_CurrentOffset:="BOTTOM"
							$_l_SetWindowTop:=FW_l_MouseTop-$_l_ImageWidth+$_l_MoveOnDown
							
							
						End if 
					End if 
					
					
			End case 
		End if 
		
		//FW_T_CurrentLeftRight:="LEFT"
		Case of 
			: (FW_T_CurrentLeftRight="RIGHT")
				SET WINDOW RECT:C444(FW_l_ColumnRight; $_l_SetWindowTop; (FW_l_ColumnRight+$_l_ImageWidth); ($_l_SetWindowTop+$_l_ImageWidth))
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				SET WINDOW RECT:C444(FW_l_ColumnRight; $_l_SetWindowTop; (FW_l_ColumnRight+$_l_ImageWidth); ($_l_SetWindowTop+$_l_ImageWidth))
				$_t_PositionSTR:=String:C10($_l_WindowLeft)+","+String:C10($_l_WindowTop)+","+String:C10($_l_WindowRight)+","+String:C10($_l_WindowBottom)
			: (FW_T_CurrentLeftRight="LEFT")
				SET WINDOW RECT:C444(FW_l_ColumnLeft-$_l_ImageWidth; $_l_SetWindowTop; (FW_l_ColumnLeft); ($_l_SetWindowTop+$_l_ImageWidth))
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				SET WINDOW RECT:C444(FW_l_ColumnLeft-$_l_ImageWidth; $_l_SetWindowTop; (FW_l_ColumnLeft); ($_l_SetWindowTop+$_l_ImageWidth))
				$_t_PositionSTR:=String:C10($_l_WindowLeft)+","+String:C10($_l_WindowTop)+","+String:C10($_l_WindowRight)+","+String:C10($_l_WindowBottom)
				
		End case 
		SHOW PROCESS:C325(Current process:C322)
		SHOW WINDOW:C435
	Else 
		HIDE PROCESS:C324(Current process:C322)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("FW_SetPosition"; $_t_oldMethodName)