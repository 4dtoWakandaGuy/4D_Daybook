//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_SetobjectPositionRelativity
	//------------------ Method Notes ------------------
	//In $1 pass a pointer to an object-this is the obect that the second object will be set relative to, if the object is for instance a label pass the name of the object in $3
	//in $2 pass a pointer to the object you want to set the postion or pass the name in $4
	//$5= positioning source type thse are the types
	//1 To the right of TOPS ALIGNED
	//2 below LEFT ALIGNE
	//3 above LET ALIGNED
	//4 To the left of TOPS ALIGNED
	//5 inside
	//6 Outside
	//v
	//7 to th right of-keep oject vertical position same
	// 8 below keep the horizontal position the same
	//9 Above keep the horizontal position the same
	//10 left of keep vertical the same
	//11 right of bottom aligned
	//12 below right aligned
	//13 above right alighned
	//14 left of bottom aligned
	
	//$6 Sizing option
	//1 keep  height and width same
	//2 make width same as source obect  (Height does not change) use $7 as the run around(distance inside or outside is $5=5 or 6) else $7 is the distance between objects
	//4 make height same as source object (Width does not change) use $7 as the run around(distance inside or outside is $5=5 or 6) else $7 is the distance between objects
	//6 make height and width same as source-use $7 as the run around(distance inside or outside is $5=5 or 6) else $7 is the distance between objects
	//8 set the height based on the window size
	//16 Set the Width using the form size rather than the object size-$7 is the disance inside or outside or between the objects and $8 is the disctance inside the left or right of the page.-
	//32 set the height using the form size rather than object size--$7 is the disance inside or outside or between the objects and $8 is the disctance inside the top or bottomrof the page.-
	//------------------ Revision Control ----------------
	//Date Created: 10/03/2010 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_NewTargetBottom; $_l_NewTargetBottom2; $_l_NewTargetLeft; $_l_NewTargetRight; $_l_NewTargetTop; $_l_ScreenHeight; $_l_ScreenWidth; $_l_SourceObjectHeight; $_l_SourceObjectLeft; $_l_SourceObjectRight; $_l_SourceObjectTop)
	C_LONGINT:C283($_l_SourceWidth; $_l_SourcObjectBottom; $_l_TargetHeight; $_l_TargetObjectBottom; $_l_TargetObjectLeft; $_l_TargetObjectRight; $_l_TargetObjectTop; $_l_TargetObjectWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop)
	C_POINTER:C301($_ptr_ReferenceObjectPointer; $_ptr_TargetObjectPointer; $1; $2)
	C_REAL:C285($5; $6; $7; $8)
	C_TEXT:C284($_t_oldMethodName; $_t_ReferenceObjectName; $_t_TargetObjectName; $3; $4; Gen_t_TestMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_SetobjectPositionRelativity")
$_ptr_ReferenceObjectPointer:=$1
$_ptr_TargetObjectPointer:=$2
$_t_ReferenceObjectName:=$3
$_t_TargetObjectName:=$4
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
If ($3#"")
	OBJECT GET COORDINATES:C663(*; $3; $_l_SourceObjectLeft; $_l_SourceObjectTop; $_l_SourceObjectRight; $_l_SourcObjectBottom)
Else 
	OBJECT GET COORDINATES:C663($1->; $_l_SourceObjectLeft; $_l_SourceObjectTop; $_l_SourceObjectRight; $_l_SourcObjectBottom)
End if 
If ($4#"")
	OBJECT GET COORDINATES:C663(*; $4; $_l_TargetObjectLeft; $_l_TargetObjectTop; $_l_TargetObjectRight; $_l_TargetObjectBottom)
Else 
	OBJECT GET COORDINATES:C663($2->; $_l_TargetObjectLeft; $_l_TargetObjectTop; $_l_TargetObjectRight; $_l_TargetObjectBottom)
End if 
$_l_TargetObjectWidth:=$_l_TargetObjectRight-$_l_TargetObjectLeft
$_l_TargetHeight:=$_l_TargetObjectBottom-$_l_TargetObjectTop
$_l_SourceWidth:=$_l_SourceObjectRight-$_l_SourceObjectLeft
$_l_SourceObjectHeight:=$_l_SourcObjectBottom-$_l_SourceObjectTop
Gen_t_TestMessage:=""  //use this to know what it is set to
Case of 
	: ($5=1) | ($5=-1)  // `To the right of top aligned
		$_l_NewTargetLeft:=$_l_SourceObjectRight+$7
		Gen_t_TestMessage:="To the right-top aligned"
		If ($5<0)
			$_l_TargetObjectWidth:=$_l_TargetObjectRight-$_l_NewTargetLeft
		End if 
		
		Case of 
			: ($6=0) | ($6=1)  //Keep size same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourceObjectTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourceObjectTop+$_l_TargetHeight; *)
				End if 
			: ($6=2)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourceObjectTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourceObjectTop+$_l_TargetHeight; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourceObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				End if 
		End case 
	: ($5=2)  // `Below=left aligned
		Gen_t_TestMessage:="Below Left aligned"
		$_l_NewTargetTop:=$_l_SourcObjectBottom+$7
		Case of 
			: ($6=0) | ($6=1)  //keep size of object same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetTop; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				End if 
		End case 
		
		
	: ($5=3)  // `above
		Gen_t_TestMessage:="Above-left Aligned"
		$_l_NewTargetBottom:=$_l_SourceObjectTop-$7
		Case of 
			: ($6=0) | ($6=1)  //Keep size the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom2; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				End if 
		End case 
		
	: ($5=4) | ($5=--4)
		
		// `left of
		Gen_t_TestMessage:="To the Left of top aligned"
		$_l_NewTargetRight:=$_l_SourceObjectLeft-$7
		If ($5<0)
			$_l_TargetObjectWidth:=$_l_NewTargetRight-$_l_TargetObjectLeft
		End if 
		Case of 
			: ($6=0) | ($6=1)  //Keep size the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_TargetHeight; *)
				Else 
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_TargetHeight; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_TargetHeight; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				Else 
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				Else 
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_SourceObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				Else 
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourceObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
				End if 
				
		End case 
		
	: ($5=5)
		// inside
		Gen_t_TestMessage:="Inside"
		//$7 is the distance inside(Horzontal/vertical) and if $8 is passed that is the Vertical/horizontal) except where sizing is to screen widtch where it means inside the form width or height
		Case of 
			: ($6=0) | ($6=1) | ($6=6) | ($6=7)  //Keep size the same well actually no-the  height and width are dictated by the size of the source object
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Horizontal and vertical inset"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft+$7
				$_l_NewTargetRight:=$_l_SourceObjectRight-$7
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop+$8
						$_l_NewTargetBottom:=$_l_SourcObjectBottom-$8
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop+$7
						$_l_NewTargetBottom:=$_l_SourcObjectBottom-$7
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop+$7
					$_l_NewTargetBottom:=$_l_SourcObjectBottom-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
					
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
				End if 
			: ($6=2)  //Make width the same as the source object-leave the height alone in this case it is source - distance right get inset
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Horizontal inset vertical size not changed"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft+$7
				$_l_NewTargetRight:=$_l_SourceObjectRight-$7
				
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop+$8
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop+$7
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop+$7
					$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
					
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"vertical inset horizontal not changed"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft+$7
				$_l_NewTargetRight:=$_l_NewTargetLeft+$_l_TargetObjectWidth
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop+$8
						$_l_NewTargetBottom:=$_l_SourcObjectBottom-$8
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop+$7
						$_l_NewTargetBottom:=$_l_SourcObjectBottom-$7
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop+$7
					$_l_NewTargetBottom:=$_l_SourcObjectBottom-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
					
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				$_l_NewTargetLeft:=$_l_SourceObjectLeft+$7
				$_l_NewTargetRight:=$_l_SourceObjectRight-$7
				$_l_NewTargetTop:=$_l_TargetObjectTop+$7
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Horizontal inset vertical size not changed"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft+$7
				$_l_NewTargetRight:=$_l_SourceObjectRight-$7
				
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop+$8
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop+$7
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop+$7
					$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
					
					
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
					
				End if 
		End case 
	: ($5=6)  // outside- 8 in $5 will inset at top and  goto bottom of page
		Gen_t_TestMessage:="Outside"
		//$7 is the distance inside(Horzontal/vertical) and if $8 is passed that is the Vertical/horizontal) except where sizing is to screen widtch where it means inside the form width or height
		Case of 
			: ($6=0) | ($6=1) | ($6=6) | ($6=7)  //Keep size the same well actually no in this case because the size is dictacted by the source object
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Horizontal and vertical outside"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft-$7
				$_l_NewTargetRight:=$_l_SourceObjectRight+$7
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop-$8
						$_l_NewTargetBottom:=$_l_SourcObjectBottom+$8
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop-$7
						$_l_NewTargetBottom:=$_l_SourcObjectBottom+$7
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop-$7
					$_l_NewTargetBottom:=$_l_SourcObjectBottom+$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone in this case it is source - distance right get inset- height is not set
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Horizontal outside vertical not changed"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft-$7
				$_l_NewTargetRight:=$_l_SourceObjectRight+$7
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop-$8
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop-$7
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop-$7
					$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
					
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"vertical outside-Horizontal not changed"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft-$7
				$_l_NewTargetRight:=$_l_NewTargetLeft+$_l_TargetObjectWidth
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop-$8
						$_l_NewTargetBottom:=$_l_SourcObjectBottom+$8
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop-$7
						$_l_NewTargetBottom:=$_l_SourcObjectBottom+$7
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop-$7
					$_l_NewTargetBottom:=$_l_SourcObjectBottom+$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
					
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
					
				End if 
				
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Horizontal outside vertical not changed"
				$_l_NewTargetLeft:=$_l_SourceObjectLeft-$7
				$_l_NewTargetRight:=$_l_SourceObjectRight+$7
				If (Count parameters:C259>=8)
					If ($8#0)
						$_l_NewTargetTop:=$_l_SourceObjectTop-$8
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					Else 
						$_l_NewTargetTop:=$_l_SourceObjectTop-$7
						$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
					End if 
				Else 
					$_l_NewTargetTop:=$_l_SourceObjectTop-$7
					$_l_NewTargetBottom:=$_l_NewTargetTop+$_l_TargetHeight
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
					
					
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_NewTargetTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
					
				End if 
				
		End case 
	: ($5=7)  // `To the right no vertical alignment
		Gen_t_TestMessage:="To the right no vertical alignment"
		$_l_NewTargetLeft:=$_l_SourceObjectRight+$7
		Case of 
			: ($6=0) | ($6=1)  //Keep size same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_TargetObjectTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_TargetObjectTop+$_l_TargetHeight; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_TargetObjectTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_TargetObjectTop+$_l_TargetHeight; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_TargetObjectTop; $_l_NewTargetLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				End if 
		End case 
	: ($5=8)  // `Below=no horizontal alignment
		Gen_t_TestMessage:="Below no horizontal alignment"
		$_l_NewTargetTop:=$_l_SourcObjectBottom+$7
		Case of 
			: ($6=0) | ($6=1)  //keep size of object same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetTop; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				End if 
		End case 
		
		
	: ($5=9)  // `above no HOrixzontal alignment
		Gen_t_TestMessage:="Above  no horizontal alignment"
		$_l_NewTargetBottom:=$_l_SourceObjectTop-$7
		Case of 
			: ($6=0) | ($6=1)  //Keep size the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone=note this would overlap!!
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom2; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_TargetObjectLeft; $_l_NewTargetBottom-$_l_TargetHeight; $_l_TargetObjectLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				End if 
		End case 
		
	: ($5=10)  // `left of no vertical alignment
		Gen_t_TestMessage:="Left of no vertical alignment"
		$_l_NewTargetRight:=$_l_SourceObjectLeft-$7
		Case of 
			: ($6=0) | ($6=1)  //Keep size the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_TargetHeight; *)
				End if 
				
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_TargetHeight; *)
				End if 
				
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_TargetObjectTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_TargetObjectTop; $_l_NewTargetRight; $_l_NewTargetBottom2; *)
				End if 
		End case 
		
	: ($5=11)  // `To the right of BOTTOM aligned if $6=8 thenit wont be bottom aligned!
		Gen_t_TestMessage:="To the right bottom aligned"
		$_l_NewTargetLeft:=$_l_SourceObjectRight+$7
		Case of 
			: ($6=0) | ($6=1)  //Keep size same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourcObjectBottom; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourcObjectBottom; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_SourcObjectBottom; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetLeft+$_l_SourceWidth; $_l_SourcObjectBottom; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_TargetObjectWidth; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetLeft; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetLeft+$_l_SourceWidth; $_l_NewTargetBottom2; *)
				End if 
				
		End case 
	: ($5=12)  // `Below=RIGHT aligned
		Gen_t_TestMessage:="Below Right aligned aligned"
		$_l_NewTargetTop:=$_l_SourcObjectBottom+$7
		Case of 
			: ($6=0) | ($6=1)  //keep size of object same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_TargetHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_TargetHeight; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetTop+$_l_SourceObjectHeight; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetTop; $_l_SourceObjectRight; $_l_NewTargetBottom2; *)
				End if 
		End case 
		
		
	: ($5=13)  // `above Right alignet
		Gen_t_TestMessage:="Above right  aligned"
		$_l_NewTargetBottom:=$_l_SourceObjectTop-$7
		Case of 
			: ($6=0) | ($6=1)  //Keep size the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_SourceWidth; $_l_NewTargetBottom-$_l_SourceObjectHeight; $_l_SourceObjectRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=8)  // bottom is Relative to bottom of page- -top is left alone
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom2; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom2:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+" Same width as object and BottomTobottomofscreent"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom2; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_SourceObjectRight-$_l_TargetObjectWidth; $_l_NewTargetBottom-$_l_TargetHeight; $_l_SourceObjectRight; $_l_NewTargetBottom2; *)
				End if 
		End case 
		
		
	: ($5=14)  // `left of bottom aligned
		Gen_t_TestMessage:="To the left bottom aligned"
		$_l_NewTargetRight:=$_l_SourceObjectLeft-$7
		Case of 
			: ($6=0) | ($6=1)  //Keep size the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Size not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				End if 
			: ($6=2) | ($6=3)  //Make width the same as the source object-leave the height alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"WIdth matching height not Changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				End if 
			: ($6=4) | ($6=5)  //Make Height the same as the source object-leave the width alone
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width not changed"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				End if 
			: ($6=6) | ($6=7)  //Make height the same and width the same
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"Height to match source object width to match source object"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourcObjectBottom-$_l_SourceObjectHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				End if 
			: ($6=8) | ($6=9)  // bottom is Relative to bottom of page- -top is left alone
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+"BottomTobottomofscreent"
				
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=10) | ($6=11) | ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				$_l_ScreenHeight:=$_l_WindowBottom-$_l_WindowTop
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetBottom:=$_l_ScreenHeight-$8
					Else 
						$_l_NewTargetBottom:=$_l_ScreenHeight-$7
					End if 
				Else 
					$_l_NewTargetBottom:=$_l_ScreenHeight-$7
				End if 
				Gen_t_TestMessage:=Gen_t_TestMessage+" "+" Same width as object and BottomTobottomofscreent"
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_SourceWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_NewTargetBottom; *)
				End if 
			: ($6=12) | ($6=13) | ($6=14) | ($6=15)  //to bottom of screen +Make width the same as the source object-
				//not relevant as all set the height to the same as the source and the 8 overrides it.
			: ($6=16)  //set width to width of form
				$_l_ScreenWidth:=$_l_WindowRight-$_l_WindowLeft
				If (Count parameters:C259>=8)
					If ($8>0)
						$_l_NewTargetRight:=$_l_ScreenWidth-$8
					Else 
						$_l_NewTargetRight:=$_l_ScreenWidth-$7
					End if 
				Else 
					$_l_NewTargetRight:=$_l_ScreenWidth-$7
				End if 
				If ($4#"")
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object name"
					OBJECT MOVE:C664(*; $4; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				Else 
					Gen_t_TestMessage:=Gen_t_TestMessage+" "+"using object Pointer"
					OBJECT MOVE:C664($2->; $_l_NewTargetRight-$_l_TargetObjectWidth; $_l_SourcObjectBottom-$_l_TargetHeight; $_l_NewTargetRight; $_l_SourcObjectBottom; *)
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("Gen_SetobjectPositionRelativity"; $_t_oldMethodName)